$(function(){
  var whattosearch;
  var request;
  $("#verify-btn").on('click', function(event){
    event.preventDefault();
  });
  $("#search-btn").on('click', function() {
    search = $("#search-in").val();
    if (isNaN(search)) {
      whattosearch = 'email';
    } else {
      whattosearch = 'id';
    }
    if (whattosearch === 'id') {
      request = $.ajax({
        url: "/search",
        type: "GET",
        data: { id: search },
        dataType: "html"
      });
    } else if (whattosearch === 'email') {
      request = $.ajax({
        url: "/search",
        type: "GET",
        data: { email: search },
        dataType: "html"
      });
    }
    request.done(function(response){
        $("#search-details").html(response);
    });
  });
});
