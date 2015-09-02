// this is file for customizing JS

// console.log("linked")

$(document).ready(function(){
  
	$('#delete-modal').on('click', function(){
	  console.log('im in')
	  $('#modal').toggle();   // toggle targeting the display none in display with the assigned value
	})
	$('#close').on('click', function(){
	  $('#modal').toggle();
	})

	$('.statusddl').val(2)

//hide footer git hub//
	if(window.location.pathname === "/users"){
		$("div .footer").hide();
	}
	if(window.location.pathname === "/login"){
		$("div .footer").hide();
	}


})


// $(document).ready(function(){

// $('#myModal').on('click', function(){
//   console.log('im in')
//   $('#modal').toggle();   // toggle targeting the display none in display with the assigned value
// })
// $('#close').on('click', function(){
//   $('#modal').toggle();
// })
// })


// $(window).bind("load", function () {
//       var footer = $("#footer");
//       var pos = footer.position();
//       var height = $(window).height();
//       height = height - pos.top;
//       height = height - footer.height();
//       if (height > 0) {
//           footer.css({
//               'margin-top': height + 'px'
//           });
//       }
//   });

//   $(window).resize(function(){
//         var footer = $("#footer");
//         var pos = footer.position();
//         var height = $(window).height();
//         height = height - pos.top;
//         height = height - footer.height();
//         if (height > 0) {
//             footer.css({
//                 'margin-top': height + 'px'
//             });
//         }
//   });

