$(function(){
  $("#new_task_form").submit(function(){
  $.post(
    "/tasks",
    $("#new_task_form").serialize()
  ).done(function(html){
    console.log(html);
    $("#tasks").prepend(html);
  });

  return false;
  });
});

