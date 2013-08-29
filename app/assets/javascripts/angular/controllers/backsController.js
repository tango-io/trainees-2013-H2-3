starFishModel.controller('backsController', ['$scope','$http', function($scope, $http){
  $scope.backs = {};

  $scope.validateAmount = function(){
    pledge_selected = $("h5").html();
    amount = parseInt(($("input[name='back[amount]']")).val());
    
    if (pledge_selected < amount) {
      
    }else{
    
    }
  };
}]);

