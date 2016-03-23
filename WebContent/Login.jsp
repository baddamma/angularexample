<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mahesh AJS Notes</title>
<script
  src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
  src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script
  src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.28//angular-route.min.js"></script>
<script src="ng-infinite-scroll.min.js"></script>
<link rel="stylesheet"
  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style>
table, th, td {
	border: 1px solid grey;
	border-collapse: collapse;
	padding: 5px;
}

table tr:nth-child(odd) {
	background-color: #919191;
}

table tr:nth-child(even) {
	background-color: #ffffff;
}

.divSpacer {
	border: 2px solid black;
	padding-right: 20px;
	padding-left: 20px;
	margin-right: 10px;
	margin-left: 20px;
	margin-top: 20px;
}

.eleSpacer {
	border: 1px solid blue;
	padding-right: 20px;
	padding-left: 20px;
	margin-right: 10px;
	margin-left: 20px;
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
  <div id="divDefaultApp" class="divSpacer" ng-app="defaultApp"
    ng-controller="defaultCtrl">
    <form action="" method="get" name="myForm1" novalidate>
      <table class="eleSpacer">
        <tr>
          <td>UserName:</td>
          <td><input type="text" id="txtUserName"
            name="txtUserName" ng-model="txtUserName"> <span
            style="color: red"
            ng-show="myForm1.txtUserName.$dirty && myForm1.txtUserName.$invalid">
              <span ng-show="myForm1.txtUserName.$error.required">Username
                is required.</span>
          </span></td>
          <td>{{ txtUserName }}</td>
        </tr>
        <tr>
          <td>Email:</td>
          <td><input type="text" id="txtEmail" name="txtEmail"
            ng-model="txtEmail" required> <span
            style="color: red"
            ng-show="myForm1.txtEmail.$dirty && myForm1.txtEmail.$invalid">
              <span ng-show="myForm1.txtEmail.$error.required">Email
                is required.</span> <span
              ng-show="myForm1.txtEmail.$error.email">Invalid
                email address.</span>
          </span></td>
          <td>{{ txtEmail }}</td>
        </tr>
        <tr>
          <td>Age :</td>
          <td><select ng-model="selAge">
              <option value="24">Twenty Four</option>
              <option value="25">Twenty Five</option>
              <option value="26">Twenty Six</option>
              <option value="27">Twenty Seven</option>
          </select></td>
          <td>{{ selAge }}</td>
        </tr>
        <tr>
          <td><label>I Agreee</label></td>
          <td><input type="checkbox" name="chkAccept"
            id="chkAccept" ng-model="chkAccept"></td>
          <td>{{ chkAccept }}</td>
        </tr>
        <tr>
          <td><input type="radio" name="rdSexCheck" value="true"
            ng-model="rdSexCheck"> MALE</td>
          <td><input type="radio" name="rdSexCheck" value="false"
            ng-model="rdSexCheck"> FE-MALE</td>
          <td><span ng-bind="rdSexCheck"></span></td>
        </tr>
        <tr>
          <td colspan="3">show button : <input type="checkbox"
            name="chkShowBtn" ng-model="chkShowBtn">
            <p ng-show="chkShowBtn">I am visible.</p>
          </td>
        </tr>
        <tr>
          <td colspan="3"><input type="button" name="btnClick"
            value="Search...{{ counter }}" ng-click="savevalidations()"
            ng-disabled="chkShowBtn"> <input type="submit"
            value="submit.."
            ng-disabled="myForm1.txtUserName.$dirty && myForm1.txtUserName.$invalid || myForm1.txtEmail.$dirty && myForm1.txtEmail.$invalid">
          </td>
        </tr>
      </table>
      <div class="eleSpacer">
        <div>
          Country: <select id="country" ng-model="states"
            ng-options="country for (country, states) in countries">
            <option value=''>Select</option>
          </select>
        </div>
        <div>
          States: <select id="state" ng-disabled="!states"
            ng-model="cities"
            ng-options="state for (state,city) in states"><option
              value=''>Select</option></select>
        </div>
        <div>
          City: <select id="city" ng-disabled="!cities || !states"
            ng-model="city"><option value=''>Select</option>
            <option ng-repeat="city in cities" value='{{city}}'>{{city}}</option></select>
        </div>
      </div>
    </form>
    {{ countries }}
  </div>

  <div id="divMyTestApp" class="divSpacer" ng-app="
    myTestApp"
    ng-controller="myTestCtrl"
    ng-init="person={firstName:'Ricardo',lastName:'KAKA'};
              quantity=1;cost=5;points=[1,15,19,2,40];
               names=[{name:'Mahesh',country:'India',company:'AT&T'},
                      {name:'Chand',country:'US',company:'Michelle Tech'},
                      {name:'Venky',country:'US',company:'Facebook'}]">

    First Name: <input type="text" ng-model="firstName"><br>
    Last Name: <input type="text" ng-model="lastName"><br>
    <br> Full Name: {{firstName + " " + lastName}} <br>Full
    Person Name : {{ person.firstName + " " + person.lastName }} <br>
    <br> quantity price : {{ (quantity * cost * 2) + addition }} <br>
    Array Index2 Value : {{ points[2] }} <br> filter :<input
      type="text" name="txtFilter1" ng-model="txtFilter1">
    <ul class="eleSpacer">
      <li ng-repeat="x  in names | filter:txtFilter1|orderBy:'company'">
        {{ x.name + '||'+ x.company +'||' + x.country }}</li>
    </ul>
  </div>

  <div id="divHttp" class="divSpacer" ng-app="httpApp"
    ng-controller="httpCtrl"
    ng-init="txtFilter2='Alfreds';inputGitHubName='robconery';">
    filter:<input type="text" name="txtFilter2" ng-model="txtFilter2">
    {{txtFilter2 }}
    <ul class="eleSpacer">
      <li ng-repeat="x in data|filter:txtFilter2|orderBy:'City'">
        {{ x.Name + ', ' + x.Country }}</li>
    </ul>
    <table border=1>
      <tr ng-repeat="x in data|filter:txtFilter2">
        <td>{{ x.Name | uppercase }}</td>
        <td>{{ x.Country }}</td>
      </tr>
    </table>
    <div class="eleSpacer">
      <form name='search user'>
        Search User @GitHub: <input type="text" name="gname"
          ng-model="inputGitHubName"> <select
          ng-model="inputGitHubName">
          <option value="angular">angular</option>
          <option value="robconery">robconery</option>
          <option value="odetocode">odetocode</option>
          <option value="27">Twenty Seven</option>
        </select> <input type="button" value="fetch.."
          ng-click="fetchFromGitHub()"> angular,robconery
      </form>
      <div>{{errorGitHub}}</div>
      <label>Name:</label>{{ userGitHub.name }}<br> <label>company:</label>{{
      userGitHub.company }}<br> <label>location:</label>{{
      userGitHub.location }}<br> <label>email:</label>{{
      userGitHub.email }}<br> <label>avatar_url:</label><img
        ng-src="{{userGitHub.avatar_url}}" alt="testimage" /> <img
        ng-src="http://www.gravatar.com/avatar/{{userGitHub.gravatar_id}}"
        alt="testimage" />
    </div>
    <div class="eleSpacer">
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Star</th>
            <th>Language</th>
          </tr>
          <tr ng-repeat="rp in repos | orderBy:'stargazers_count'">
            <td>{{rp.name}}</td>
            <td>{{rp.stargazers_count | number}}</td>
            <td>{{rp.language}}</td>
          </tr>
        </thead>
      </table>
    </div>
  </div>

  <div id="divForm" class="divSpacer" ng-app="myFormApp"
    ng-controller="myFormCtrl">
    <form novalidate class="eleSpacer">
      First Name:<br> <input type="text" ng-model="user.firstName"><br>
      Last Name:<br> <input type="text" ng-model="user.lastName">
      <br> <br>
      <button ng-click="reset()">RESET</button>
    </form>
    <p>form = {{user}}</p>
    <p>master = {{master}}</p>

    <div class="container" class="eleSpacer">
      <div ng-include="'Include1.html'"></div>
    </div>
  </div>

  <div id="divCustom" class="divSpacer" ng-app="myCustomApp"
    ng-controller="myCustomCtrl">
    <div class="eleSpacer">
      <lable>Custom Dir1:my-customer(tag)</lable>
      <br>
      <my-customer></my-customer>
    </div>
    <div class="eleSpacer">
      <lable>Custom Dir2:dom-Directive(attribute)</lable>
      <br>
      <div dom-Directive></div>
    </div>
    <div class="eleSpacer">
      <lable>Custom Dir3:the-Friend(tag and attribute with inner
      text)</lable>
      <br>
      <the-Friend info="naomi">chand</deFriend>
    </div>
    <div class="eleSpacer">
      <lable>Custom Dir4:my-Dialog(tag with inner text)</lable>
      <br>
      <my-Dialog>Milan Prince</my-Dialog>
    </div>
  </div>

  <div id="divInject" class="divSpacer" ng-app="myInjectApp"
    ng-controller="myInjectCtrl">
    <table border=2>
      <tr>
        <td><input type="text" id="txtInjector" name="txtInjector"
          ng-model="txtInjector"></td>
        <td>{{txtInjector}}</td>
      </tr>
    </table>
  </div>

  <div id="divService" class="divSpacer" ng-app="myServiceApp"
    ng-controller="myServiceCtrl">
    <table border=2>
      <tr>
        <td><input type="text" id="txtServiceInjector"
          name="txtServiceInjector" ng-model="txtServiceInjector"></td>
        <td>{{txtServiceInjector}}</td>
      </tr>
    </table>
    </br>
    <table border=2>
      <tr>
        <td>countdown flag</td>
        <td>{{countDownInterval}}</td>
      </tr>
      <tr>
        <td colspan=2>{{printeTheValue}}</td>
      </tr>
    </table>
  </div>

  <div id="divProvider" class="divSpacer" ng-app="myProviderApp"
    ng-controller="myProviderCtrl">
    <table border=2>
      <tr>
        <td><input type="text" id="txtProviderInjector"
          name="txtProviderInjector" ng-model="txtProviderInjector"></td>
        <td>{{txtProviderInjector}}</td>
        <td><input type="button" name="btnProviderClick"
          ng-click="whenButtonClicked()" value="ProviderClick.."></td>
      </tr>
    </table>
  </div>

  <div id="divUploader" class="divSpacer" ng-app="imageUploaderApp"
    ng-controller="imageUploaderCtrl">
    <br /> <img ng-if="image" src="{{image}}" alt="testimage"
      ng-model="imageURL" /> <br /> <input my-upload type="file"
      name="upload"> <br> <br>
  </div>

  <div id="divRouteExample" class="divSpacer" ng-app="routeProtocalsApp">
     <div class="eleSpacer">
     Hi Mahesh Please check once again with countries list !!
     </div>
    <div ng-view class="eleSpacer"></div>
  </div>
  </br>


  <!-- defines all the application modules -->
  <script src="src/app.js"></script>
  <!-- defines all personal notes -->
  <script src="src/jsGuide.js"></script>
  <!-- defines module controller 1 (has usage of multiple controllers) -->
  <script src="src/controllerApp_1.js"></script>
  <!-- defines module controller 2 (has usage of http injector with http call) -->
  <script src="src/controllerApp_2.js"></script>
  <!-- defines module controller 3 (has usage of angular copy/objects copy) -->
  <script src="src/controllerApp_3.js"></script>
  <!-- defines module controller 4 (has usage of multiple custom directives) -->
  <script src="src/controllerApp_4.js"></script>
  <!-- defines module controller 5 (has usage of factory injectors) -->
  <script src="src/controllerApp_5.js"></script>
  <!-- defines module controller 6 (has usage of factory and service injectors) -->
  <script src="src/controllerApp_6.js"></script>
  <!-- defines module controller 6 (has usage of photo upload) -->
  <script src="src/controllerApp_8.js"></script>
  <!-- Full control and code for routing example to understand -->
  <script>
      var app_route = angular.module('routeProtocalsApp', ['ngRoute']);

      app_route.config(function($routeProvider) {
        $routeProvider.
          when('/countries/', {
            templateUrl: 'supported/route-country-list.jsp',
            controller: 'CountryListCtrl'
          }).
          when('/country/:countryName', {
            templateUrl: 'supported/route-country-detail.jsp',
            controller: 'CountryDetailCtrl'
          }).
          when('/countryHome/', {
            templateUrl: 'supported/route-country-list.jsp',
            controller: 'CountryDetailCtrl'
          }).
          otherwise({
            redirectTo: '/countryHome/'
          });
      });

      app_route.factory('countries', function($http){
        function getData(callback){
          $http({
            method: 'GET',
            url: 'countries.json',
            cache: true
          }).success(callback);
        }

        return {
          list: getData,
          find: function(name, callback){
            getData(function(data) {
              var country = data.filter(function(entry){
                return entry.name === name;
              })[0];
              callback(country);
            });
          }
        };
      });

      app_route.controller('CountryListCtrl', function ($scope, countries){
        countries.list(function(countries) {
          $scope.countries = countries;
        });
      });

      app_route.controller('CountryDetailCtrl', function ($scope, $routeParams, countries){
        countries.find($routeParams.countryName, function(country) {
          $scope.country = country;
        });
      });
      
      //added bootstrap into respective file
      angular.bootstrap(document.getElementById("divRouteExample"), [ 'routeProtocalsApp' ]);
    </script>
  
  <script>
      //providers
      /* var app7 = angular.module("myProviderApp", []);
       app7.value("obAddress1", { salary : 50000, grade : "TG3"} );
       app7.provider("myServiceProvider", function() {
           var provider = {};
           var config   = { configParam : "default" };
           provider.doConfig = function(configParam) {
               config.configParam = configParam;
           }
           provider.$get = function() {
               var service = {};
               service.doService = function() {
                   alert("mySecondService: " + config.configParam);
                  // $scope.txtServiceInjector = obAddress1.grade;
               }
               return service;
           }
           return provider;
       });
       app7.config( function( mySecondServiceProvider ) {
           mySecondServiceProvider.doConfig("new config param");
       });
       app7.controller("myProviderCtrl", function($scope, myServiceProvider) {
           $scope.whenButtonClicked = function() {
             myServiceProvider.doIt();
           }
       });
       angular.bootstrap(document.getElementById("divProvider"),['myProviderApp']); */
    </script>
  <!-- defines Controller definations -->
  <script src="src/controller.js"></script>
  <!-- defines boot strap links -->
  <script src="src/btstrap.js"></script>
</body>
</html>