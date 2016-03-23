//ng-app is default and ng-bind can bind the input values
var app = angular.module('defaultApp', []);

app.controller('defaultCtrl', function($scope, $timeout, $http) {

  /*
   * $scope.countries = { 'India': { 'Maharashtra': ['Pune', 'Mumbai', 'Nagpur',
   * 'Akola'], 'Madhya Pradesh': ['Indore', 'Bhopal', 'Jabalpur'], 'Rajasthan':
   * ['Jaipur', 'Ajmer', 'Jodhpur'], 'Telangana' :
   * ['Hyderabad','Secundrabad','Karimnagar'] }, 'USA': { 'Alabama':
   * ['Montgomery', 'Birmingham'], 'California': ['Sacramento', 'Fremont'],
   * 'Illinois': ['Springfield', 'Chicago'] }, 'Australia': { 'New South Wales':
   * ['Sydney'], 'Victoria': ['Melbourne'] } };
   */
  $scope.txtUserName = "Chand";
  $scope.txtEmail = "KAKA@22.com";
  $scope.selAge = "25";
  $scope.counter = 0;
  alert("look");
  $http.get('test.json').success(function(data) {
    $scope.countries = data;
  });
  var cnt = $http.get('test.json');
  cnt.then(function(response) {
    $scope.countries = response.data;
  });
  $scope.savevalidations = function() {
    alert("Button has been clicked");
    $scope.counter = $scope.counter + 1;
    $scope.selAge = "27";// to change watch
    $timeout(function() {
      $scope.txtUserName = "Apply not called";
      // $scope.$digest();
      // using apply
      $scope.$apply(function() {
        $scope.txtUserName = "Apply called";
      });
    });

  }

  // using watch
  $scope.$watch('rdSexCheck', function() {
    alert(' sex info has been changed');
  });
  $scope.$watch('selAge', function() {
    // alert(' age info has been changed');
  });
  $scope.$watch('txtUserName', function() {
    // alert(' Username info has been changed');
  });

});

// ng-app with scope object // adding another app with DOM object
app1.controller('myTestCtrl', function($scope) {
  $scope.firstName = "Cristiano";
  $scope.lastName = "Ronaldo";
  $scope.addition = 5;
});

angular.bootstrap(document.getElementById("divMyTestApp"), [ 'myTestApp' ]);