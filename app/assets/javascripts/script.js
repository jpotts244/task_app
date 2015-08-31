// this is file for customizing JS

// console.log("linked")

$(function(){

	$("#showList").on("click",function(event){
		// $("#showList").off("click");
		$("#map-wrapper").hide();
		$("#listDisplay").show();
		$(this).removeClass("btn btn-link");
		$("#showMap").addClass("btn btn-link");

	});

	$("#showMap").on("click",function(event){

		// $("#showMap").off("click");
		$("#listDisplay").hide();
		$("#map-wrapper").show();
		$("#map").show();
		$(this).removeClass("btn btn-link");
		$("#showList").addClass("btn btn-link");			

	});

})