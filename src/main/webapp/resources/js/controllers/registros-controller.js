angular.module('RegistroApp').controller('RegistrosController', function($scope, $routeParams, $resource, $mdDialog, $filter){

   $scope.mensagem = '';
   $scope.registros = [];
   $filter('currency')($scope.registros.valor, 'R$');

   var receitas = 0;
   var despesas = 0;

   var recursoRegistro = $resource('/desafio/registros/:registroId');

   recursoRegistro.query(function(registros){
     $scope.registros = registros;

     for(var aux in $scope.registros) {
        if($scope.registros[aux].tipo == 1){
          receitas = receitas + $scope.registros[aux].valor;
        }else if($scope.registros[aux].tipo == 2){
          despesas = despesas + $scope.registros[aux].valor;
        }
      }

      //Gráfico
      $scope.data = [receitas, despesas];
   }, function(erro){
     console.log(erro);
   });

   $scope.remover = function(registro){

     if(registro.tipo == 1){
       receitas = receitas - registro.valor;
     }else if(registro.tipo == 2){
       despesas = despesas - registro.valor;
     }

     //Atualizar o Gráfico
     $scope.data = [receitas, despesas];

     recursoRegistro.delete({registroId : registro.id}, function(){
       var indiceRegistro = $scope.registros.indexOf(registro);
       $scope.registros.splice(indiceRegistro, 1);
       $scope.mensagem = 'Registro removido com sucesso!';

     }, function(erro){
       $scope.mensagem = 'Não foi possível remover o registro!';
       console.log(erro);
     });

   };

   $scope.converte = function(registro){
     if(registro.tipo == 1){
       return 'Receita';

     }else if(registro.tipo == 2){
       return 'Despesa';
     }
   };

   $scope.converteData = function(registro){
       var d = new Date(registro.vencimento),
          mes = '' + (d.getMonth() + 1),
          dia = '' + (d.getDate() +1),
          ano = d.getFullYear();

      if (mes.length < 2) mes = '0' + mes;
      if (dia.length < 2) dia = '0' + dia;

      return  (dia + '/' + mes + '/' + ano);
   }

   $scope.showConfirm = function(ev, registro) {
    var confirm = $mdDialog.confirm()
          .title('Voce tem certeza que deseja apagar este registro?')
          .textContent('Apos apagado, o conteudo nao pode ser recuperado!')
          .ariaLabel('Apagar registro')
          .targetEvent(ev)
          .ok('Sim!')
          .cancel('Nao.');

    $mdDialog.show(confirm).then(function() {
      if($scope.remover(registro)){
        $scope.status = 'O registro foi excluido!';
      }
    }, function() {
      $scope.status = 'Operacao cancelada!.';
    });
  };


  //grafico
  $scope.labels = ['Receitas', 'Despesas'];
  $scope.options = {
      legend: {
          display: true,
          labels: {
              fontColor: 'rgb(255, 99, 132)'
          }
      }
  };


});
