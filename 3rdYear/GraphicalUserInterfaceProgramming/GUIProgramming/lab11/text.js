$("h1").css("color", "yellow");
$("p").css("color","pink");
$("p").first().css("text-decoration","underline");
$("ul").css("color","green");
$("ul").css("border","red","1px","solid");
$("head").css("font-weight","thin");
$("blockquote").css("font-style","italic");


$(document).ready(function(){
$("#submit").click(function(){
 $("#name").text("Welcome  " + $("#first").val() + "  " + $("#surname").val());
 $("#name").fadeOut(2000);
 
});
});

$("#one").slideUp(2000);
$("#one").slideDown(2000);
//$("#two").animate((capacity: 3,color: 'red')5000);