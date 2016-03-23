// service injecting by factory which has been injecting by Value
app6.value("obAddress1", {
  salary : 50000,
  grade : "U8"
});
app6.factory("madFactory", function(obAddress1) { // injecting insde the
  // function
  return obAddress1.salary + '|' + obAddress1.salary;
});
function MadService(madFactory) {
  this.doIt = function($scope) {
    $scope.txtServiceInjector = madFactory;
  }
  this.alertNow = function() {
    //alert("Hello Mahesh");
  }
}
app6.service("myService", MadService);

app6.controller('myServiceCtrl', function($scope,$interval, myService) {
  $scope.countDownInterval = 5;
  var decrementCountDown = function (){
    $scope.countDownInterval -= 1;
    if ( $scope.countDownInterval  < 1 ) {
      $scope.printeTheValue = "Never Trust Any One";
    } else {
      $scope.printeTheValue = "Never Ever Talk to Her";
    }
  };
  var callInterval = function () {
    $interval(decrementCountDown,2000,$scope.countDownInterval);
  };  
  myService.doIt($scope);
  myService.alertNow();
 
});