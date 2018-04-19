angular.module('RegistroApp', ['ngRoute', 'ngResource', 'ngMessages', 'ngAria', 'ngMaterial', 'chart.js'])
.config(function($routeProvider, $locationProvider){

  $locationProvider.html5Mode(true);

  $routeProvider.when('/desafio/registros', {
    templateUrl: '/partials/principal.jsp',
    controller: 'RegistrosController'
  });

  $routeProvider.when('/desafio/registros/new', {
    templateUrl: '/partials/registro.jsp',
    controller: 'RegistroController'
  });

  $routeProvider.when('/desafio/registros/edit/:registroId', {
    templateUrl: '/partials/registro.jsp',
    controller: 'RegistroController'
  });

  $routeProvider.otherwise({ redirectTo: '/desafio/registros'});

});
