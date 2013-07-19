projectsModel.controller('projectsController',['$scope','$http',function($scope,$http){
  
  var projects = [
    {name: 'Facebook' },
    {name: 'Google' },
    {name: 'Coca-Cola' }
  ];

  $scope.showProjects = function(){
    $scope.projects = projects;
  };

}]);

