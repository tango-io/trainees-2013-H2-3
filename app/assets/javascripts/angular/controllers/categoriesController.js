starFishModel.controller('categoriesController', ['$scope','$http', function($scope, $http){

  $scope.categories = {};

  $scope.showCategories= function(){
    $http.get('/categories.json').success(function(categories){
      $scope.categories = categories;
    });
  };

}]);

