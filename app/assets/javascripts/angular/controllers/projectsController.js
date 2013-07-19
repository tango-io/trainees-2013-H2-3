projectsModel.controller('projectsController', ['$scope','$http', function($scope, $http){

  $scope.hola = "mundo";
  $scope.projects = [
    {name: 'Facebook' },
    {name: 'Google' },
    {name: 'Coca-Cola' }
  ];

  
}]);

