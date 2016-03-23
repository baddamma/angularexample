//injectors
//creating values
app5.value("empID", 290408);
app5.value("empName", "Mahesh Baddam");
app5.value("obAddress", {
  salary : 10000,
  grade : "U4"
});
//creating factory
app5.factory("myFactory", function(obAddress) { //injecting insde the function
  return obAddress.grade;
});
app5.controller('myInjectCtrl', function($scope, myFactory) {
  //$scope.txtInjector = obAddress.grade;
  //$scope.txtInjector = empName;
  $scope.txtInjector = myFactory;
});