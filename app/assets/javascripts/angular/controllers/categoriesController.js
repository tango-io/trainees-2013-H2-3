starFishModel.controller('categoriesController', ['$scope','$http', function($scope, $http){

  $scope.cityMex = ["Aguascalientes", "Baja California", "Baja California Sur", "Campeche", "Chiapas", "Chihuahua", "Coahuila de Zaragoza", "Colima", "Distrito Federal", "Durango", "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "Mexico", "Michoacan de Ocampo", "Morelos", "Nayarit", "Nuevo Leon", "Oaxaca", "Puebla", "Queretaro de Arteaga", "Quintana Roo", "San Luis Potosi", "Sinaloa", "Sonora", "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz-Llave", "Yucatan", "Zacatecas"];

  $scope.cityUsa = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"];

  $scope.countries = ["United States","Mexico"];

  $scope.showCategories= function(){
    $http.get('/categories.json').success(function(categories){
      $scope.categories = categories;
      $("label[for='project_city']").css('display','none');
    });
  };

  $("select[ng-options*='tries']").change(function () {
    var op = $("select[ng-options*='tries'] option:selected").val();
    $("label[for='project_city']").css('display','block');
    if (op===0){
      $("select[ng-options*='Mex']").css('display','none');
      $("select[ng-options*='Usa']").css('display','block');
      $("label[for='project_city']").html($scope.countries[0]);
    }
    else{
      $("label[for='project_city']").html($scope.countries[1]);
      $("select[ng-options*='Mex']").css('display','block');
      $("select[ng-options*='Usa']").css('display','none');
    }
  });  
}]);
