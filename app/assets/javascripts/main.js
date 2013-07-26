var starFishModel = angular.module('starFishModel', []);

starFishModel.config(function($httpProvider){
  angular.forEach(['post', 'put', 'delete'], function(method){
    $httpProvider.defaults.headers[method] = $httpProvider.defaults.headers[method] || {};
    $httpProvider.defaults.headers[method]['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  });
});

$(document).on('ready page:load', function(){
  angular.bootstrap(document, ['starFishModel']);
  $("#datepicker").datepicker();
});

