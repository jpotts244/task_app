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

	// handle email input validation
	var users = $(".users_class").attr("data-users");

	$(".recipientInput").on("change",function(event){
		var input = $(this).val();
		var inputUniq = [];
		var message = [];
		console.log(input);
		
		input = input.trim().toLowerCase().split(",");
		input = input.map(function(i){
			return i.trim();
		});

		input.forEach(function(i){
			if(i !== "" && inputUniq.indexOf(i) === -1){
				inputUniq.push(i);
			}
		});

		inputUniq = inputUniq.filter(function(i){
			return checkExist(i);
		});
		inputUniq = inputUniq.join(",");
		$(this).val(inputUniq);
		if(message.length >0 ){
			$(".recipientInputMsg").text("users: "+message.join(",")+" doesn't exists.");
		}else{
			$(".recipientInputMsg").text("");
		}
		

		function checkExist(email){
			var check = false;
			var usersObj = JSON.parse($(".users_class").attr("data-users"));
			usersObj.forEach(function(user){
				if(email === user.email.toLowerCase() ){
					check = true;
				}
			});
			if(!check){
				message.push(email);
			}
			return check;
		}
	});

	// hide footer on users and login pages
	if( window.location.pathname === "/users" || 
		window.location.pathname === "/login" || 
		window.location.pathname === "/"){
		$("div .footer").hide();
	}


});


// $(document).ready(function(){
  
// 	$('#delete-modal').on('click', function(){
// 	  console.log('im in')
// 	  $('#modal').toggle();   // toggle targeting the display none in display with the assigned value
// 	})
// 	$('#close').on('click', function(){
// 	  $('#modal').toggle();
// 	})

// 	$('.statusddl').val(2)

// 	//hide footer git hub//

// 	if(window.location.pathname === "/new"){
// 		$("div .footer").hide();
// 	}

// })


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

