// this is file for customizing JS

// console.log("linked")
$(function(){
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

});

