// variables/objects copy angular.copy();
var angularCopy = function($scope) {
  $scope.master = {
    firstName : "Lionel",
    lastName : "Messi"
  };
  $scope.reset = function() {
    $scope.user = angular.copy($scope.master);
  };
  $scope.reset();
};
