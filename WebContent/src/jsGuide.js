/*
   ####AJS app level attributes####
   ng-app         : We can define the scope of AJS like App scope
   ng-controller  : Controller scope of inside app
   ng-init        : Define a variables at page level instatiation
   
   ####AJS sub level scopes####
   ng-model="var" : Create a variable and keeps as ready to use or bind
   ng-bind="var"  : Binds the var from model and displays
   ng-repeat="x in array" : loops over array with x.name etc
   
   
   ####List of filters  ####
   Name | uppercase
   Name | lowercase
   price | currency
   {{ amount | currency:"USD$"  }}
   {{ startDate | date:'short'  }}
   var in vars | filter:searchTerm
   {{ var | json }}
   var in vars | limitTo:10
   {{ var | number }}
   var in vars | filter:searchTerm | orderBy:'name'
   
   ##orderBy: 'var'
   
   ng-disabled="chkShowBtn"
   ng-show="true"
   ng-hide="false"
   ng-click="count = count + 1";ng-click="function();"
   ng-include="abc.text"
   ng-src={{}}
   
   ####Binding Directives####
   ng-bind          , ng-model      ,  ng-class         , ng-init     
   ####Model Directives####
   ng-app           , ng-controller   
   ####Event Directives####
   ng-keydown       , ng-keypress      , ng-keyup
   ng-mouseenter    , ng-mouseleave    , ng-mousemove  , ng-mouseover
   ng-click         , ng-change        , ng-focus      , ng-dblclick  
   ####Display Directives####
   ng-blur          , ng-copy           , ng-transclude 
   ng-disabled      , ng-hide           , ng-href
   ng-if            , ng-include        , ng-paste
   ng-repeat        , ng-style          , ng-switch   ,
   
   
   ####form Validations####
   $dirty     : The user has interacted with the field.
   $valid     : The field content is valid.
   $invalid   : The field content is invalid.
   $pristine  : User has not interacted with the field yet.
   
   ####Bootstrap classes####
   <div>      container         A content container
   <table>    table             A table
   <table>    table-striped     A striped table
   <button>   btn               A button
   <button>   btn-success       A success button
   <span>     glyphicon         A glyph icon
   <span>     glyphicon-pencil  A pencil icon
   <span>     glyphicon-user    A user icon
   <span>     glyphicon-save    A save icon
   <form>     form-horizontal   A horizontal form
   <div>      form-group        A form group
   <label>    control-label     A control label
   <label>    col-sm-2          A 2 columns span
   <div>      col-sm-10         A 10 columns span
   
   ##
   $scope.$watch('var',function(){..});  with in angularscope
   $scope.$digest();                     need to call for out side statements to get watch
   $scope.$apply(function() { $scope.txtUserName = "Apply called"; }); // equalent to watch + digest
   
   ##Custom Directives
   <fp-date-picker ng-model="main.dateOne" on-select="main.dateSelectedOne()"></fp-date-picker>
   app.directive('fpDatePicker', function() {
     return {
       scope: { select: '&onSelect'},
       restrict: 'EA',
       require: 'ngModel',
       templateUrl: 'datepicker.html',
       link: function($scope, $element, $attrs, ngModel) { ... }
       template: 'Name: {{customer.name}} Address: {{customer.address}}'
      };
   })
   
   template : you can display the string as you defined.
   templateUrl : "abc.html" you can give file name to display
   restrict :
      'A' - only matches attribute name
      'E' - only matches element name
      'C' - only matches class name
      'AEC' - matches either attribute or element or class name
   scope : {customerInfo: '=info'} info you need to pass in the customtag as attribute and you can use at template as customerinfo
   customer: '=' in scope as same at both level
   transclude: true // What ever you mention in <tag>text here</tag> will inside of ngtransclude
   
   ##few functions
   angular.bind(self, fn, args);
   angular.element(element);
   angular.extend(dst, src);
   angular.injector(modules, [strictDi]);
   angular.forEach(values,function(value,key){},log);
   
   angular.fromJson(json);                            // deserialization
   angular.toJson(obj, pretty);     //converts to Json

   angular.bootstrap(element, [modules], [config]);   angular.bootstrap(document, ['demo']);
   angular.copy(source, [destination]);               $scope.master= angular.copy(user);
   angular.equals(o1, o2);  
   
   angular.isArray(value);          //checks for Array
   angular.isDate(value);           //checks for date
   angular.isDefined(value);        //checks for isdefined
   angular.isFunction(value);       //checks for Function
   angular.isNumber(value);
   angular.isObject(value);
   angular.isString(value);
   angular.isUndefined(value);
   angular.lowercase(string);
   angular.uppercase(string);
   angular.noop();                  // performs no operation

   ## Values and injecting values
   Providers in AngularJS is the most flexible form of factory you can create
   
   
   
   ## Ajax Submits and http requests
   var temp = $http.get("url");
   temp.then(function(response){
     $scope.data = response.data;
   });
   
   ##sample API's
   https://api.github.com/users/odetocode
   https://api.github.com/users/robconery
   https://api.github.com/users/angular
   
   
   ## AJS inbuit services
   var doWork = function () { console.log("mahesh here"); }
   setTimeot(dowork, 2000); // runs after the intervaL
   setInterval(dowork,2000); // run for every interval
   
   ##BuiltIn services
   http
     $http.get(url).then(onSuccess,onError);
   interval
     $interval(<call_back_function>,2000,<numberoftimes>); 
     var A = $interval(<params>);
     $interval.cancel(A);
   $timeout
   $log
   $animate
   $location
   $browser
   $window
   
   
   ##How to register the service to module // BEST WAY TO DO IT
   var test1 = function(){
     var t1 = function() {};
     var t2 = function(){};
     return {
       t1:t1,
       t2:t2
     }
   
   };
   var module = angular.module("gitHubsection");
   module.factory('test1',test1)
   //usage 
   test1.t1();//include this service in controller like others with out $
   
   ##routing 
   angular.route.js
   $routeProvider // routing engine
   #ng-view
     <div ng-vew></div> // initiating routing
   #configure rules into routing engine
   
   $routeProvider
       .when("/main",{
                 templateUrl:"main.html",
                 controller:"MainController"
         })
       .when("/user/:username",{
                 templateUrl:"user.html",
                 controller: "UserController"
         })
       .otherwise({redirectTo:".main"}); 
       
  $routeParams // like URL scope in CF and we can get everthing in this scope
  
  
  ##invoking these route calls
    $location.has("/main"); // It will check var main exists or not in URL
    $location.path("/user/"+username); //append /#/user/mahesh in URL
  
    <a href="/#/main"></a>
   
  
   





*/