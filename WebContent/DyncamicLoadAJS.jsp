<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dynamic Load Angular JS</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
  <script src="ng-infinite-scroll.min.js"></script>
</head>
<body>
<div id="divDefaultApp" ng-app="defaultApp" ng-controller="defaultCtrl">
  <div infinite-scroll="addMoreItems()" style="background: #ccc none repeat scroll 0 0;border: 3px solid #666;margin: 5px;padding: 5px;position: relative;width:500px;height: 400px;overflow-y: scroll;">
    <div ng-repeat="item in countries">Item number {{$index}}: {{$item}}</div>
    <div ng-repeat="item in countries">Item number {{$index}}: {{$item}}</div>
  </div>
</div>
<script>
var app = angular.module('defaultApp', ['infinite-scroll']);
angular.module('infinite-scroll').value('THROTTLE_MILLISECONDS', 250);
app.controller('defaultCtrl', function($scope,$timeout,$http) {
  $scope.countries = {
      "India": {
        "Maharashtra": ["Pune", "Mumbai", "Nagpur", "Akola"],
        "Madhya Pradesh": ["Indore", "Bhopal", "Jabalpur"],
        "Rajasthan": ["Jaipur", "Ajmer", "Jodhpur"],
        "Telangana" : ["Hyderabad","Secundrabad","Karimnagar"]
    },
    "USA": {
        "Alabama": ["Montgomery", "Birmingham"],
        "California": ["Sacramento", "Fremont"],
        "Illinois": ["Springfield", "Chicago"]
    },
    "Australia": {
        "New South Wales": ["Sydney"],
        "Victoria": ["Melbourne"]
    } };
  $scope.addMoreItems=function(){
    alert("chand");
    //console.log($scope.countries);
    //$http.get('test.json').success(function(data) {
      //$scope.countries = data;
      //$scope.countries = data;
      //console.log(data);
      //$scope.countries = $scope.countries.push($scope.countries1);
    //});
  };
});

</script>
</body>
</html>