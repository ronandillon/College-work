var myapp = angular.module("myApp", []);
myapp.controller("MovieController", function($scope, $http) {
  //Define the JS object myData and the doClick function.
  $scope.search = "";

  $scope.change = function() {
    var responsePromise = $http.get("http://www.omdbapi.com/?t="+$scope.search);

    responsePromise.success(function(data, status, headers, config) {
      $scope.details = data;
    });
    responsePromise.error(function(data, status, headers, config) {
      alert("AJAX failed!");
    });

    var responsePromise2 = $http.get("http://www.omdbapi.com/?s="+$scope.search);

    responsePromise2.success(function(data, status, headers, config) {
      $scope.related = data;
    });
    responsePromise2.error(function(data, status, headers, config) {
      alert("AJAX failed!");
    });
  }
});