$(function() {	
    $(".heading:eq(0)").css("display", "block");
    $(".heading:eq(1)").css("display", "none");
    $(".heading:eq(2)").css("display", "none");
    $(".more_intro").click(function() {
        if ($(this).parent().next(".heading").length > "0") {
            $(this).parent().next(".heading").show();
            $(this).parent().hide();
        } else {
            $(this).parent().hide();
            $(".heading").first().show();
        }
    });
    $("span[id=hidetop]").click(function() {
        $("#headcon").toggle("slow", function() {
            if ($("span[id=hidetop]").text() == "+Canvas") {
                $("span[id=hidetop]").text("-Canvas");
            } else {
                $("span[id=hidetop]").text("+Canvas");
            }
        });
    });
    var a = $("#boxer").children().length;
    $("input[name=nextinline]").val(a - 1);
    $("#updatemsg").html("Standby");
    $("#thoughts").html(", Total Thoughts: " + a);
    $("#boxer").sortable({
        update: function() {
            var b = $("#boxer").sortable("serialize");
            $.ajax({
                type: "get",
                url: "/process-sortable.php",
                dataType: "json",
                data: b,
                success: function() {
                    $("#updatemsg").html("Order Changed!");
                }
            });
        }
    });
    $("#boxer").disableSelection();
    $("#footer").click(function() {
        $("#footer").hide();
        $("#feed1").toggle();
    });
    $("#header").click(function() {
        var b = "/";
        $(location).attr("href", b);
    });
    $("#clicktocreate").click(function() {
        $("#inputer").show();
    });
    $("#boxer img").live("click", function() {
        deletepost($(this).attr("name"));
    });
    $("#tedit").click(function() {
        $(this).hide();
        var b = $("#list_title").val();        
        if (b == "Untitled List") {
            $("#list_title").val("");
        }
        $("#list_title,#lbut").toggle();
    });
    $("#lbut").click(function() {
        $("#action_load").show();
        var c = $("#list_title").val();
        if (c === "") {
            c = "clear";
        }
        var b = $("input[name='sid'][type='hidden']").val();
        $.ajax({
            type: "post",
            url: "/posts_in.php",
            dataType: "json",
            data: "&ltitle=" + c + "&sid=" + b,
            success: function(e) {
                $("#updatemsg").html("List Title Updated!");
                $("#list_title,#lbut").hide();
                $("#tedit").show();
                if (c == "clear") {
                    $("#ltitle_display").html("Untitled List");
                } else {
                    $("#ltitle_display").html(c);
                }
                $("#action_load").hide();
            },
            error: function(e){
                
                console.log(e);
            }
        });
        return false;
    });
    $("#postentry").submit(function() {
		
        var b = $("#tittle_ent").val();
        $("#action_load").show();
        if (b.length <= 2) {
            alert("Enter More Text!");
            return false;
        } else {
            if (b.length > 65) {
                alert("Enter Less Text!");
                return false;
            } else {			
			    $.ajax({
                    type: "post",
                    url: "/posts_in.php",
                    dataType: "json",
                    data: $("#postentry").serialize(),
                    success: function(e) {
                        var d = e[0];
                        var f = e[1];
                        $("<div></div>").attr("id", "post_" + f).addClass("boxee").html(d).appendTo("#boxer");
                        $('<div class="icon"><img src="/img/page-text-delete-icon.png" name="' + f + '"></div>').attr({
                            id: "postchk" + f
                        }).appendTo("#post_" + f);
                        $("#starthere").hide();
                        $("#tittle_ent").val("").focus();
                        $("#updatemsg").html("Added");
                        var c = $("#boxer").children().length;
                        $("#thoughts").html(", Total Thoughts: " + c);
                        $("#action_load").hide();
                    },
                    error: function(e){
                        console.log(e);
                    }
                });
                return false;
            }
        }
    });
    $("#savebut").click(function() {
  
        $.ajax({
            type: "post",
            url: "/posts_in.php",
            dataType: "json",
            data: $("#postentry").serialize() + "&save=" + true,
            success: function(d) {
                var b = d[0];
                var c = b + "/";
                $(location).attr("href", c);
            }
        });
        return false;
    });
});
var str;

function removepostview(d) {
    var c = document.getElementById("post_" + d);
    c.parentNode.removeChild(c);
	var b = [];
    b[0] = "Wohoo!";
    b[1] = "Oh Yeah";
    b[2] = "Gone Honey Gone!";
    b[3] = "Hayyhaaaa";
    b[4] = "One More and Maybe I Stop?";
    b[5] = "Yeeeeeeeeeeeees";
    b[6] = "Well done I know I'm good!";
    var a = Math.floor(7 * Math.random());
    $("#deletemsg").html(", " + b[a]).fadeIn(3000);
}

function deletepost(d) {
    var b;
    if (window.XMLHttpRequest) {
        b = new XMLHttpRequest();
    } else {
        b = new ActiveXObject("Microsoft.XMLHTTP");
    }
    var a = document.getElementById("post_" + d).value;
    if (a === "" & !b) {
        document.getElementById("updatemsg").innerHTML = "fields is empty";
    } else {
        b.onreadystatechange = function() {
            if (b.readyState == 4) {
                removepostview(d);
                $("#tittle_ent").val("").focus();
            } else {
                if (b.readyState == 2) {}
            }
        };
        var c = Math.random() * 999999999;
        url = "/posts_in.php?q=" + d + "&rand=" + c;
        b.open("GET", url, true);
        b.send(null);
    }
}