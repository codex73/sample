    //A little Jquery Fun

    $(function(){

        //Hide all paragraphs but the first one, mini slideshow!
        $(".heading:eq(0)").css("display", "block");        
        $(".heading:eq(1)").css("display", "none");        
        $(".heading:eq(2)").css("display", "none");     

        //On heading title, we toggle it's first sibling   
        $(".more_intro").click(function(){            
            if($(this).parent().next('.heading').length>'0'){
                $(this).parent().next('.heading').show();
                $(this).parent().hide();
            }else{                
                $(this).parent().hide();
                $('.heading').first().show();
            }            
        });
        
        //Hides the top portion of the page "+Canvas"
        $("span[id=hidetop]").click(function(){
            $('#headcon').toggle('slow', function() {
                // Animation complete.
                if($("span[id=hidetop]").text() == '+Canvas'){
                    $("span[id=hidetop]").text('-Canvas');}
                else{$("span[id=hidetop]").text('+Canvas');}
              });             
        });
        
        //Determine the amount next order available for a note
        var nextinline  = $("#boxer").children().length;
        
        //Substract 1 to accomodate array starting in 0 count      
        $('input[name=nextinline]').val(nextinline-1);
        
        //Clear Message Box Panel   
        $("#updatemsg").html('Standby');
      
        //Add amount of boxes count to info box      
        $("#thoughts").html(', Total Thoughts: '+nextinline);
        
        //Add sortable to notes, update database on order change
  		$("#boxer").sortable({
            update : function () { 
              var order = $('#boxer').sortable('serialize');              
              $.ajax({
                    type:'get',
                    url: '/process-sortable.php',
                    dataType: "json",
                    data: order,
                    success: function(){$("#updatemsg").html('Order Changed!');}
                    });
              }            
        });
                  
        //Disable ability to select the parent DIV
  		$( "#boxer" ).disableSelection();            
        
        $("#footer").click(function(){
            $("#footer").hide();
            $("#feed1").toggle();
        });
        
        $("#header").click(function(){
            var url = "/";
            $(location).attr('href',url);            
        });
        
        $("#clicktocreate").click(function(){            
            $("#inputer").show();
        });
        
        $("#boxer img").live("click", function(){
          deletepost($(this).attr("name"));
        });
        
        //Open Title Edit Box
        $('#tedit').click(function(){
            $(this).hide();
            
            var curtitle = $('#list_title').val();
            
            //Check if the list hasn't been titled, return an empty box then.
            if(curtitle == 'Untitled List'){
                $('#list_title').val('');
            }
            
            $('#list_title,#lbut').toggle(); 
            
        });
        
        //List Title Update        
        $('#lbut').click(function(){           
            
            // Put an animated GIF image insight of content
            $("#action_load").show();
            
            var curtitle = $('#list_title').val();           
            
            //console.log(curtitle);
            
            if(curtitle==""){curtitle = 'clear';}
            
            var sid = $("input[name='sid'][type='hidden']").val();
            //alert(sid);            
            
                $.ajax({
                        type:'post',
                        url: '/posts_in.php',
                        dataType: "json",
                        data: "&ltitle=" +curtitle + "&sid=" + sid,
                        success: function(){
                            $("#updatemsg").html('List Title Updated!');
                            $('#list_title,#lbut').hide();
                            $('#tedit').show();
                            
                            if(curtitle=='clear'){
                                    $('#ltitle_display').html('Untitled List'); 
                                }else
                                {
                                    $('#ltitle_display').html(curtitle);  
                                }
                            
                            $("#action_load").hide();
                                                         
                            }
                });

           
            return false;
        });
                
        
        //Add Notes
        $('#postentry').submit(function() {
          var tyu = $('#tittle_ent').val();           
          
          // Put an animated GIF image insight of content
          $("#action_load").show();
          
          if(tyu.length <= 2)
            {alert('Enter More Text!'); return false;}
            else if(tyu.length > 65)
            {alert('Enter Less Text!'); return false;}            
            else
            {
                $.ajax({
                    type:'post',
                    url: '/posts_in.php',
                    dataType: "json",
                    data: $("#postentry").serialize(),
                    success:function(data){
                        var tittle = data[0];
                        var id= data[1];
                        $('<div></div>').attr('id','post_'+id).addClass('boxee').html(tittle).appendTo('#boxer');                        
                        $('<div class="icon"><img src="/img/page-text-delete-icon.png" name="'+id+'"></div>').attr({id:'postchk'+id}).appendTo('#post_'+id);
                        
                        $('#starthere').hide();
                                                
                        $('#tittle_ent').val('').focus();
                        
                        //Message Box Panel - Update 
                        $("#updatemsg").html('Added');
                        
                        //Determine the amount of notes left
                        var next5  = $("#boxer").children().length;                        
                        
                        //Replace count of left overs
                        $('#thoughts').html(', Total Thoughts: '+next5);
                        
                        //alert(data[1]);
                        //console.log(data[0]); //normal write
                        //console.dir(data); //object output
                        
                        $("#action_load").hide();
                    }
                });                
                return false;
            }
        });
        
        $('#savebut').click(function() {
            $.ajax({
                type:'post',
                url: '/posts_in.php',
                dataType: "json",
                data: $("#postentry").serialize() + "&save=" + true,
                success:function(data){
                    var listid = data[0];
                    var url = listid + "/";
                    $(location).attr('href',url);
                }
            });
            return false;
        });              
        
    });

    var str; 
    function removepostview(str){
         var e= document.getElementById('post_'+str);
            e.parentNode.removeChild(e);            
            var r_text = new Array ();
            r_text[0] = "Wohoo!";
            r_text[1] = "Oh Yeah";
            r_text[2] = "Gone Honey Gone!";
            r_text[3] = "Hayyhaaaa";
            r_text[4] = "One More and Maybe I Stop?";
            r_text[5] = "Yeeeeeeeeeeeees";
            r_text[6] = "Well done I know I'm good!";
            var i = Math.floor(7*Math.random());
  
            $("#deletemsg").html(', '+r_text[i]).fadeIn(3000);
            
            /*
            setTimeout(function() {                
                $('#info').show();
                $('#info').fadeOut('fast');
            }, 1000); // <-- time in milliseconds
            */
    }   
    
    //Some old Ajax code reused.... Yikes...! Need to replace....
    function deletepost(str)
    {
        /*Determine How the Object will be built based on browser.*/
        var http;
        if (window.XMLHttpRequest)
          {// code for IE7+, Firefox, Chrome, Opera, Safari
          http=new XMLHttpRequest();
          }
        else
          {// code for IE6, IE5
          http=new ActiveXObject("Microsoft.XMLHTTP");
          }
     
        var postnum = document.getElementById('post_'+str).value;

        if (postnum == ""&!http) {
            document.getElementById('updatemsg').innerHTML = "fields is empty";
        }
        else {
            http.onreadystatechange = function(){
                if (http.readyState == 4) {
                    //document.getElementById('updatemsg').innerHTML = "";
                    //document.getElementById('updatemsg').innerHTML = http.responseText;
                    //remove element after response success
                    removepostview(str);
                    $('#tittle_ent').val('').focus();                    
                }
                else if (http.readyState == 2) {
                    //document.getElementById('info').innerHTML = "working on it!";                    
                }
            }
            var rand = Math.random() * 999999999;
            url = "/posts_in.php?q=" + str + "&rand=" + rand;
            //url = "posts_in.php?q=" + user + "&pass=" + pass + "&id_field=" + id + "&rand=" + rand;
            http.open("GET", url, true);
            http.send(null);
    }
    
    }