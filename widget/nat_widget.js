(function() {


var jQuery;

//console.log(location.hostname);

/******** Load jQuery if not present *********/
if (window.jQuery === undefined || window.jQuery.fn.jquery !== '1.11.1') {
    var script_tag = document.createElement('script');
    script_tag.setAttribute("type","text/javascript");
    script_tag.setAttribute("src",
        //"//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js");
        "jquery.min.js");
    if (script_tag.readyState) {
      script_tag.onreadystatechange = function () { // For old versions of IE
          if (this.readyState == 'complete' || this.readyState == 'loaded') {
              scriptLoadHandler();
          }          
      };
    } else {
      script_tag.onload = scriptLoadHandler;
    }
    // Try to find the head, otherwise default to the documentElement
    (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(script_tag);
} else {
    // The jQuery version on the window is the one we want to use
    jQuery = window.jQuery;
    main();     
}

/******** Called once jQuery has loaded ******/
function scriptLoadHandler() {
    // Restore $ and window.jQuery to their previous values and store the
    // new jQuery in our local jQuery variable
    jQuery = window.jQuery.noConflict(true);
    // Call our main function
    main();         
}


function scroll_lead($){
    var expires;

    // Fire up the second box
    setTimeout(
        function () {
        jQuery('#nat-widget-pop').show();
    }, 5000); 
      
    function createCookie(name,value,days) {
        if (days){
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        expires = ''; 
        expires=date;
    }else {
        value = '';
        // var date = new Date();
        // var minutes = 1;
        // date.setTime(date.getTime() + (minutes * 60 * 1000));
        expires = date;}

   
    document.cookie = name+"=" + value + "; expires=" + expires + "; path=/";
    }

    function readCookie(name) {
    var nameEQ = escape(name) + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) === 0)
            return unescape(c.substring(nameEQ.length,c.length));
    }
    return null;
    }

    // set up default options 
    var defaults = {
        direction:      'up',
        speed_up:       500,
        speed_down:     500,
        percent:        20
    };

    
    var the_box = this.selector;

    $(window).scroll(function() {

        var window_height = $(window).height();   // browser viewport - no used
        var document_height = $(document).height(); // height of HTML document
        var hide_lead;
        var scrollTop = $(window).scrollTop();
        var scrollPercent = (scrollTop / (document_height-window_height)) * 100;        
      
        $.each($('#nat-widget'), function(index, value) {

            //grab the id of the box
            var the_name = $(this).attr('id');
            //grab the cookie for the box, does it exist?
            var hideBoxcookie = readCookie(the_name);
            var clickedBoxcookie = readCookie('nw-clicked');
            var direction = 'up';

            switch(direction){
                case 'up':   direction = 'slideDown';
                break;

                case 'down':  direction = 'slideUp';
                break;
            }

            if(!hideBoxcookie&&!clickedBoxcookie){ //if cookie is not set
                if( scrollPercent > defaults.percent ){ //slides up
                    $('#'+the_name)[direction](defaults.speed_up);
                }
            }

        });

        // For Development
        $('#removecookie').click(function(event){            

            createCookie('nat-widget','true',-1);            
            event.preventDefault();
        });

        $('#removecookie2').click(function(event){   

            createCookie('nw-clicked','true',-1);            
            event.preventDefault();
        });

        // Call to Action Button
        $(document).on("click","#nw-engage",function(e){

            //e.preventDefault();            
            createCookie('nw-clicked',1,1);
        });

        // Call to Action Button
        $(document).on("click","#nw-sec-cta-b",function(e){

            //e.preventDefault();            
            createCookie('nw-clicked',1,1);
        });


        // User Action - Close Widget, Expires Next Day
        $('.nat-widget-close').click(function(e){
            var the_box_name = $(this).closest('#nat-widget').attr('id');

            createCookie(the_box_name,1,1);
            $(this).closest('#nat-widget').hide();
        });

    });
}



function urldecode(str) {
   return decodeURIComponent((str+'').replace(/\+/g, '%20'));
}


function main() { 
    jQuery(document).ready(function($) {

        $(document.body).append('<div id="nat-widget"></div>');

        // /******* Load CSS *******/
        var css_link = $("<link>", { 
            rel: "stylesheet", 
            type: "text/css", 
            href: "http://localhost/projects/mis/nat_widget/style.css" 
        });
        css_link.appendTo('head');  

        /******* Load HTML *******/
        var jsonp_url = "http://localhost/projects/mis/nat_widget/data.php?callback=?";
        $.getJSON(jsonp_url, null, function(data) {
          $('#nat-widget').html(urldecode(data.html));
        });

        scroll_lead($);
    });
}


})();


