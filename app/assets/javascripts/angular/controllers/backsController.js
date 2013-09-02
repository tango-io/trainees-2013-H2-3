starFishModel.controller('backsController', ['$scope','$http', function($scope, $http){

  $scope.validateAmount = function(pledge_id){
    pledge_selected = $("h5[data-id = '"+ pledge_id +"']").html();
    amount = parseInt(($("input[name='back[amount]']")).val());
      
    if (pledge_selected <= amount) {
      console.log("BUENO = "+pledge_selected +" - "+amount+"'");
      return valid = 1;
    }else{
      console.log("MALO = "+pledge_selected+" - "+amount+"");
      return valid = 0;
    }
  };
  $scope.buttonHidden = function(valid){
      if (valid != 1){
        return true;
      }else{
        return false;
      } 
  };
}]);

