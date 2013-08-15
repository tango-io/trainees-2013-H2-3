var starFishModel = angular.module('starFishModel', []);

starFishModel.config(function($httpProvider){
  angular.forEach(['post', 'put', 'delete'], function(method){
    $httpProvider.defaults.headers[method] = $httpProvider.defaults.headers[method] || {};
    $httpProvider.defaults.headers[method]['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  });
});

$(document).on('ready page:load', function(){
  angular.bootstrap(document, ['starFishModel']);

  $("#project_closedate").datepicker({dateFormat: 'yy-mm-dd'});
  $("#start_date").datepicker({dateFormat: 'yy-mm-dd'});
  $("#end_date").datepicker({dateFormat: 'yy-mm-dd'});

  $('#preview').attr('disabled','disabled');
  var totalFields = 6;
  
  $('#project_name').change(function(){
    len = $(this).val().length;
    $.fn.check_fields(len);
    //console.log(totalFields)
  });

  $('#project_description').change(function(){
    len = $(this).val().length;
    $.fn.check_fields(len);
    //console.log(totalFields)
  });

  $("#project_amount").change(function(){
    val = $(this).val();
    len = val.length;
    var intDigit = /^\d+$/;
    if(intDigit.test(val)){ $.fn.check_fields(len);}
    //console.log(totalFields)
    //console.log(val)
  });

  $("#project_us").change(function(){
    len = $(this).val().length;
    $.fn.check_selects(len);
    //console.log(totalFields)
  });

  $("#project_mx").change(function(){
    len = $(this).val().length;
    $.fn.check_selects(len);
    //console.log(totalFields)
  });

  $("#project_closedate").change(function(){
    len = $(this).val().length;
    $.fn.check_fields(len);
    //console.log(totalFields)
  });
  
  $("#project_category").change(function(){
    len = $(this).val().length;
    $.fn.check_selects(len);
    //console.log(totalFields)
  });

  $.fn.check_fields = function(ln){
    if(ln > 0){ totalFields -= 1; }
    else{ totalFields += 1; }
    if(totalFields == 0){ $("#preview").removeAttr('disabled','disabled');}
  }
  $.fn.check_selects = function(ln){
    if(ln >= 1){ totalFields -= 1; }
    else{ totalFields += 1; }
    if(totalFields == 0){ $("#preview").removeAttr('disabled','disabled');}
  }

});

