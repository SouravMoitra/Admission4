$(function(){
  $("#verify-btn").on('click', function(event){
    event.preventDefault();
    user_id = $("#user-id").val();
    alert(user_id);
      event.preventDefault();
      request = $.ajax({
        url: "/verify/doverify",
        type: "POST",
        data: { user_id: user_id },
        dataType: "html"
      });
      request.done(function(response) {
        $("#verification-status").html("<div class='btn btn-success disabled'>Verified</div>");
      });
  });
});
