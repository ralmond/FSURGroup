/* ensure any open panels are closed before showing selected */
$('.fsu-utilities').on('show.bs.collapse', function () {
	$('.fsu-utilities .in').collapse('hide');
});

/* caller url-encodes 'keywords' */
function FSU_search(type, keywords) {
   var searchURL = '';
   switch (type) {
      case 'PHFST':
         searchURL = 'https://bb5.fsu.edu/cas/login?service=https://campus.fsu.edu/webapps/portal/frameset.jsp?tab_tab_group_id=_19_1%26SAurl=https%3A%2F%2Fcampus.fsu.edu%2Fwebapps%2FFSU-peoplesearch-bb_bb60%2Fservlet%2FstudentSearchExternal%3FsearchStr%3D' + keywords + '&loginurl=https://campus.fsu.edu/webapps/login/bb_bb60/logincas.jsp?mc=1001';
         break;
      case 'PHF':
         searchURL = 'https://apps.its.fsu.edu/Directory/Directory.html?searchStr=' + keywords + '+&searchBy=lastname&submit=Search';
         break;
      case 'DEPT':
         searchURL = 'https://fsu.edu/cgi-bin/search/new/sframes?TYPE=' + type + '&KEYWORDS=' + keywords;
         break;
	  //case 'GOOGLE':
      default:
         searchURL = 'https://www.fsu.edu/search/results.html?cx=001481282910879549110%3A7l5zcrhp_cg&cof=FORID%3A9&ie=UTF-8&q=' + keywords;
         break;
   }
   //location.href = searchURL;
   window.open(searchURL, '_blank');
   return false;
}

function FSU_URLEncode(url) {
   var safechars = "0123456789" +
               "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
               "abcdefghijklmnopqrstuvwxyz" +
               "-_.!~*'()";
   var hex = "0123456789ABCDEF";

   var plaintext = url;
   var encoded = "";
   for (var i = 0; i < plaintext.length; i++ ) {
      var ch = plaintext.charAt(i);
       if (ch == " ") {
          encoded += "+";
      } else if (safechars.indexOf(ch) != -1) {
          encoded += ch;
      } else {
          var charCode = ch.charCodeAt(0);
         if (charCode > 255) {
            encoded += "+";
         } else {
            encoded += "%";
            encoded += hex.charAt((charCode >> 4) & 0xF);
            encoded += hex.charAt(charCode & 0xF);
         }
      }
   }
   return encoded;
}

function FSU_URLDecode(url) {
   var hexchars = "0123456789ABCDEFabcdef";
   var encoded = url;
   var plaintext = "";
   var i = 0;
   while (i < encoded.length) {
       var ch = encoded.charAt(i);
      if (ch == "+") {
          plaintext += " ";
         i++;
      } else if (ch == "%") {
         if (i < (encoded.length-2)
               && hexchars.indexOf(encoded.charAt(i+1)) != -1
               && hexchars.indexOf(encoded.charAt(i+2)) != -1 ) {
            plaintext += unescape(encoded.substr(i,3));
            i += 3;
         } else {
            plaintext += "%[ERROR]";
            i++;
         }
      } else {
         plaintext += ch;
         i++;
      }
   } // while
   return plaintext;
}

// Fixed Header On Scroll
$(window).scroll(function() {
	var height = $(window).scrollTop(); // find scroll height
	var height1 = $("#fsu-global").outerHeight();
	var height2 = $("#fsu-masthead").outerHeight();
	var height3 = height1 + height2;

    if(height  > height3) {
		$("#fsu-header").addClass("nav-fixed");
		$("#fsu-home").addClass("hidden");
		$("#fsu-top").removeClass("hidden");
		$("#fsu-nav-utility").removeClass("col-sm-5 col-sm-offset-2");
		$("#fsu-nav-utility").addClass("col-sm-4");
		$("body").addClass("add-fixed");
    }
	else {
		$("#fsu-header").removeClass("nav-fixed");
		$("#fsu-home").removeClass("hidden");
		$("#fsu-top").addClass("hidden");
		$("#fsu-nav-utility").addClass("col-sm-5 col-sm-offset-2");
		$("#fsu-nav-utility").removeClass("col-sm-4");
		$("body").removeClass("add-fixed");
	}
});

// Fixed Anchor
/*
$(function(){
	//$("[href^='#']").not("[href~='#']").click(function(evt){ //not works
	$("[href*='#']").click(function(evt){ // works on same page
		evt.preventDefault();
		var obj = $(this),
		getHref = obj.attr("href").split("#")[1],
		offsetSize = 84;
		$(window).scrollTop($("[name*='"+getHref+"']").offset().top - offsetSize);
	});
});
*/


( function( $ ) {
   // Add icons to links within <main>
   $('main p a').filter(function() {
      return host_t = this.hostname.substr(this.hostname.length - 7, 7), host_l = location.hostname.substr(location.hostname.length - 7, 7), host_t && host_t !== host_l;
   }).not(".null").not(".btn").after('<small><span class="fas fa-angle-right" title="External Link"></span></small>');
   $(".link-external").append('&nbsp;<span class="fa fa-caret-right" title="External Link"></span>');
   $("main p a[href*=\\.csv]").after('&nbsp;<span class="fas fa-file-alt" title="Excel Document"></span>');
   $("main p a[href*=\\.xlsx]").after('&nbsp;<span class="fas fa-file-excel" title="Excel Document"></span>');
   $("main p a[href*=\\.pdf]").after('&nbsp;<span class="fas fa-file-pdf" title="PDF Document"></span>');
   $("main p a[href*=\\.pptx]").after('&nbsp;<span class="fas fa-file-powerpoint" title="PowerPoint Document"></span>');
   $("main p a[href*=\\.docx]").after('&nbsp;<span class="fas fa-file-word" title="Word Document"></span>');

   // Add icons to mailto links and buttons
   $.expr[':'].mailto = function(obj) {return obj.href.match(/^mailto\:/);};
   $('main a:mailto').not(".list-icons a").after('&nbsp;<span class="fa fa-envelope" title="Email"></span>');
   $('.btn-download').prepend('<span class="fas fa-download" title="Download"></span>&nbsp;');
   $('.btn-go').append('&nbsp;<span class="fas fa-angle-right" title="Go To Link"></span>');
   $('.btn-go-alt').append('&nbsp;<span class="fa fa-chevron-circle-right" title="Go To Link"></span>');

   // Add icons to .list-icons
   $('.list-icons a').filter(function() {
      return host_t = this.hostname.substr(this.hostname.length - 7, 7), host_l = location.hostname.substr(location.hostname.length - 7, 7), host_t && host_t !== host_l;
   }).before('<span class="far fa-arrow-alt-circle-right"></span>&nbsp;');
   $(".list-icons a[href*=\\.csv]").before('<span class="fas fa-file-alt" title="Comma Separated File"></span>&nbsp;');
   $(".list-icons a[href*=\\.xlsx]").before('<span class="fas fa-file-excel" title="Excel Document"></span>&nbsp;');
   $(".list-icons a[href*=\\.pdf]").before('<span class="fas fa-file-pdf" title="PDF Document"></span>&nbsp;');
   $(".list-icons a[href*=\\.pptx]").before('<span class="fas fa-file-powerpoint" title="PowerPoint Document"></span>&nbsp;');
   $(".list-icons a[href*=\\.docx]").before('<span class="fas fa-file-word" title="Word Document"></span>&nbsp;');
   $.expr[':'].fax = function(obj) {return obj.href.match(/^fax\:/);};
   $('ul.list-icons a:fax').before('<span class="fa fa-fax" title="Fax"></span>&nbsp;');
   $.expr[':'].mailto = function(obj) {return obj.href.match(/^mailto\:/);};
   $('ul.list-icons a:mailto').before('<span class="fa fa-envelope" title="Email"></span>&nbsp;');
   $.expr[':'].tel = function(obj) {return obj.href.match(/^tel\:/);};
   $('ul.list-icons a:tel').before('<span class="fa fa-phone" title="Phone"></span>&nbsp;');
   $('ul.list-icons li.user a').before('<span class="fas fa-user" title="User"></span>&nbsp;');
   $('ul.list-icons li.map a').before('<span class="fa fa-map-marker-alt" title="Location"></span>&nbsp;');

   // Menu arrow toggle
   $('.btn-menu').click(function(){
      $(this).find("span").toggleClass("fa-chevron-circle-down fa-chevron-circle-up");
    });

    // Add the .s3-gt class to buttons with .btn-primary
    $('.btn-primary').addClass('s3-gt'); 

    // Add the .null class to images within links (removes background-image)
    $('a').has('img').addClass('null'); 

} )( jQuery );

