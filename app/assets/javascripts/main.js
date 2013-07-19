var projectsModel = angular.module('projectModel',[]);

projectsModel.config(function($httpProvider){
  angular.forEach(['post','put','delete'],function(method){
    $httpProvider.defaults.headers[method] = $httpProvider.defaults.headers[method] || {} ;
    $httpProvider.defaults.headers[method]['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  });
});
