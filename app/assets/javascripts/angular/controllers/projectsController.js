projectsModel.controller('projectsController', ['$scope','$http', function($scope, $http){
  $scope.projects = {};

  $scope.showProjects= function(){
    $http.get('/projects.json').success(function(projects){
      $scope.projects = projects;
    });
    //$scope.projects = projects;
  };

}]);

