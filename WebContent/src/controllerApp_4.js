//calling custom directives
app4.controller('myCustomCtrl', [ '$scope', function($scope) {
  $scope.master = {
    cricketPlayer : "Rahul Dravid",
    footballPlayer : "Ricardo KAKA"
  };
  $scope.naomi = {
    name : 'Venky',
    address : 'Pheonix'
  };
  $scope.igor = {
    name : 'Chand',
    address : 'New Jersy'
  };
} ]);
app4.directive("myCustomer",function() {
          return {
            restrict : 'E',
            template : 'Mycustomer Directive:{{master.cricketPlayer}} || {{master.footballPlayer}}'
          };
        });
app4.directive('domDirective', function() {
  return {
    restrict : 'A',
    templateUrl : 'Include1.html',
    link : function($scope, element, attrs) {
      element.on('click', function() {
        element.html('You clicked me!');
      });
      element.on('mouseenter', function() {
        element.css('background-color', 'yellow');
      });
      element.on('mouseleave', function() {
        element.css('background-color', 'white');
      });
    }
  };
});
app4
    .directive(
        'theFriend',
        function() {
          return {
            restrict : 'E',
            transclude : true,
            scope : {
              customerInfo : '=info'
            },
            template : 'using scope {{customerInfo.address}} <div ng-transclude></div></br>'
          };
        });
app4
    .directive(
        'myDialog',
        function() {
          return {
            restrict : 'E',
            transclude : true,
            // templateUrl: 'my-dialog.html',
            template : 'using transclude {{master.footballPlayer}} <span ng-transclude></span>'
          };
        });