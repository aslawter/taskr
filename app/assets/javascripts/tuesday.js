$(function(){
  $("#new_task_form").submit(function(){
  $.post(
    "/tasks",
    $("#new_task_form").serialize()
  ).done(function(html){
    $("#tasks").prepend(html);
    $("#errors").html("");
    $("#task_title, #task_body").val("");
  }).fail(function(xhr){
    var html = xhr.responseText;
    $("#errors").html(html);
  });

  return false;
  });
  
  $(".completed_checkbox").click(function(event){
    var formEl = $(event.target).parents("form");
    $.ajax({
      url: formEl.prop("action"),
      data: formEl.serialize(),
      type: "PATCH"
    }).done(function(){
      formEl.parents("li").fadeOut();
   });
  });
});


