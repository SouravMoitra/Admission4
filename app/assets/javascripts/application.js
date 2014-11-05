// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .



$(function(){
  $(".alert").alert();
  $('#carousel-example-generic').carousel();
  $(".alert").fadeOut(5000);
  $('select#select-stream').change(function(){
    alert("test");
    subject = $(this).val();
    var request = $.ajax({
      url: "/academics/returnsubs",
      type: "POST",
      data: { subject: subject },
      dataType: "html"
    });
    request.done(function(response){
      formsubjects = $(response).find("#subject-entries")
      $("#sub-entry").html(formsubjects);
    });
  });
  $('#date_of_birth').datetimepicker({
     format: 'DD/MM/YYYY',
		pickTime: false
	});
  return $('select#order_country_code').change(function(event) {
    var country_code, select_wrapper, url;
    select_wrapper = $('#order_state_code_wrapper');
    $('select', select_wrapper).attr('disabled', true);
    country_code = $(this).val();
    url = "/personals/subregion_options?parent_region=" + country_code;
    return select_wrapper.load(url);
  });
});
