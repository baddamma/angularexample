//http request
var httpRequest = function($scope, $http) {
  $http.get("http://www.w3schools.com/angular/customers.php").success(
      function(response) {
        $scope.data = response.records;
      });
  
  //using function
  $scope.fetchFromGitHub = function() {
    alert("here I am");
    $scope.userGitHub =""
    $http.get("https://api.github.com/users/"+$scope.inputGitHubName)
    .then(onUserSucess,onUserError);
  }
  var onUserSucess = function(response) {
    $scope.userGitHub = response.data;
    $http.get($scope.userGitHub.repos_url)
    .then(onRepos,onUserError);
  };
  var onRepos = function(response) {
   $scope.repos =  response.data;
  };
  var onUserError = function(reason) {
    $scope.errorGitHub = "cound not fetch the user";
  };
  
 
  
};