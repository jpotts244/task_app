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
})