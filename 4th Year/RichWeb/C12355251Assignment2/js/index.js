/*
	Student Number : C12355251
	Student Name   : Rónán Dillon
*/


//Allows use of isMobile.any() for a case when a user is using a mobile. 
var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iPhone: function() {
        return navigator.userAgent.match(/iPhone/i);
    },
	iPod: function() {
        return navigator.userAgent.match(/iPod/i);
    },
	iPad: function() {
        return navigator.userAgent.match(/iPad/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iPhone() || isMobile.iPod() || isMobile.iPad() || isMobile.Opera() || isMobile.Windows());
    }
// Reference : http://community.zmags.com/articles/API/Handling-Mobile-Devices
};

//Function for using bootstrap for the layout of the webpage. 
/*function bootstrapLayout(main,mobile)
{
console.log("hello")
   if( isMobile.any() ) {
		document.write('<div class="col-sm-'+mobile+' col-md-'+mobile+' col-lg-'+mobile+' col-xs-'+mobile+' ">');
   }
   else
   {
		document.write('<div class="col-sm-'+main+' col-md-'+main+' col-lg-'+main+' col-xs-'+mobile+' ">');
   }
 }
*/


$( document ).ready(function() {
    $("#index3").hide();
});

