angular.module('RegistroApp').controller('RegistroController', function($scope, $routeParams, $resource){

  $scope.registro = {};
  $scope.mensagem = '';

  var recursoRegistro = $resource('/desafio/registros/:registroId', null, {
    update: {
      method: 'PUT'
    }
  });

  if($routeParams.registroId){

    recursoRegistro.get({registroId: $routeParams.registroId}, function(registro){
      $scope.registro = registro;
    }, function(erro){
      console.log(erro);
      $scope.mensagem = 'Não foi possível obter registro!';
    });

  }

  $scope.submeter = function(){
    if($scope.formulario.$valid){
      if($scope.registro.id){

        recursoRegistro.update({registroId: $scope.registro.id}, $scope.registro, function(){
          $scope.mensagem = 'Registro atualizado com sucesso!';
        }, function(erro){
          $scope.mensagem = 'Não foi possível alterar registro!';
          console.log(erro);
        });

      } else {
        var salvar = $resource('/desafio/registros/gravar');

        salvar.save($scope.registro, function(){
          $scope.mensagem = 'Registro inserido com sucesso!';
        }, function(erro){
          $scope.mensagem = 'Não foi possível inserir registro!';
          console.log(erro);
        });

      }
    }
  };

})
.config(function($mdThemingProvider) {

    $mdThemingProvider.theme('docs-dark', 'default')
      .primaryPalette('yellow')
      .dark();

  });
