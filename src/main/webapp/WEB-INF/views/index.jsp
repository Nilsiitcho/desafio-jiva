<%@ page language="java"
  contentType="text/html; text/javascript; text/css charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html ng-app="RegistroApp">
  <head>
    <meta charset="UTF-8">
    <base href="/">
    <title>Registros</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <spring:url value="/resources/img/favicon.png" var="icone"></spring:url>
    <spring:url value="/resources/css/angular-material.min.css" var="angularCss"></spring:url>
    <spring:url value="/resources/css/bootstrap-theme.min.css" var="bootstrapTheme"></spring:url>
    <spring:url value="/resources/css/meu-estilo.css" var="meuEstiloCss"></spring:url>

    <spring:url value="/resources/js/lib/angular.min.js" var="angularJs"></spring:url>
    <spring:url value="/resources/js/lib/angular-route.min.js" var="angularRouteJs"></spring:url>
    <spring:url value="/resources/js/lib/angular-resource.min.js" var="angularResourceJs"></spring:url>
    <spring:url value="/resources/js/lib/angular-animate.min.js" var="angularAnimateJs"></spring:url>

    <spring:url value="/resources/js/lib/angular-aria.min.js" var="angularAriaJs"></spring:url>
    <spring:url value="/resources/js/lib/angular-messages.min.js" var="angularMessagesJs"></spring:url>
    <spring:url value="/resources/js/lib/angular-material.min.js" var="angularMaterialJs"></spring:url>
    <spring:url value="/resources/js/lib/tc-angular-chartjs.min.js" var="angularChartJs"></spring:url>
    <spring:url value="/resources/js/lib/tc-angular-chartjs.js" var="angularChart"></spring:url>
    <spring:url value="/resources/js/lib/chart.min.js" var="chartJs"></spring:url>
    <spring:url value="/resources/js/lib/angular-chart.min.js" var="angularChartMin"></spring:url>

    <spring:url value="/resources/js/main.js" var="mainJs"></spring:url>
    <spring:url value="/resources/js/controllers/registros-controller.js" var="registrosControllerJs"></spring:url>
    <spring:url value="/resources/js/controllers/registro-controller.js" var="registroControllerJs"></spring:url>

    <link rel="shortcut icon" type="image/x-icon" href="${icone}" />
    <link rel="stylesheet" type="text/css" href="${bootstrap}" />
    <link rel="stylesheet" type="text/css" href="${bootstrapTheme}" />
    <link rel="stylesheet" type="text/css" href="${angularCss}" />
    <link rel="stylesheet" type="text/css" href="${meuEstiloCss}" />

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script src="${angularJs }"></script>
    <script src="${angularRouteJs }"></script>
    <script src="${angularResourceJs }"></script>
    <script src="${angularAnimateJs }"></script>
    <script src="${angularAriaJs }"></script>
    <script src="${angularMessagesJs }"></script>
    <script src="${angularMaterialJs }"></script>
    <script src="${angularChartJs }"></script>
    <script src="${angularChart }"></script>
    <script src="${chartJs }"></script>
    <script src="${angularChartMin }"></script>


    <script src="${mainJs }"></script>
    <script src="${registrosControllerJs }"></script>
    <script src="${registroControllerJs }"></script>
  </head>
  <body>
    <div class="container">
      <ng-view></ng-view>
    </div>
  </body>
</html>
