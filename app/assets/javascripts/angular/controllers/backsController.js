starFishModel.controller('backsController', ['$scope','$http', function($scope, $http){

  $scope.validateAmount = function(pledge_id){
    pledge_selected = $("h5[data-id = '"+ pledge_id +"']").html();
    amount = parseInt(($("input[name='back[amount]']")).val());
      
    if (pledge_selected <= amount) {
      $('#mybutton').removeAttr('disabled');
    }else{
      $('#mybutton').attr('disabled', 'enabled');
    }
  };

}]);

