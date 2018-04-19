<div class="jumbotron">
	<h1 class="text-center">REGISTROS</h1>
	<h4 class="text-center">Receitas e Despesas</h4>
</div>

<p class="alert alert-info" ng-show="mensagem.length">{{mensagem}}</p>
<div ng-if="status" id="status">
	<b layout="row" layout-align="center center" class="md-padding">
		{{status}} </b>
</div>

<div>
	<form>
		<md-button class="md-raised md-primary"
			ng-href="/desafio/registros/new">Novo <i
			class="material-icons">add</i></md-button>
	</form>
</div>

<div class="row">
	<div class="col-md-8">

			<md-content flex layout-padding>
			<table class="table table-striped table-hover table-sm">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Descricao</th>
						<th scope="col">Tipo</th>
						<th scope="col">Valor</th>
						<th scope="col">Vencimento</th>
						<th scope="col">Acoes</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="registro in registros">
						<td>{{registro.descricao}}</td>
						<td>{{converte(registro)}}</td>
						<td><span style="color: {{registro.tipo === 1 ? 'green' : 'red'}}">{{registro.valor | currency:'R$'}}</span></td>
						<td>{{converteData(registro)}}</td>
						<td><md-button
								ng-href="/desafio/registros/edit/{{registro.id}}"
								class="md-icon-button md-primary md-raised md-block" aria-label="Editar">
							<md-icon> <i class="material-icons">border_color</i></md-icon> </md-button>
							<md-button
								class="md-icon-button md-warn md-raised md-hue-2 md-block"
								aria-label="Remover" ng-click="showConfirm($event, registro)">
							<md-icon> <i class="material-icons">delete</i></md-icon> </md-button></td>
					</tr>
				</tbody>
			</table>
			</md-content>
	</div>

	<div class="col-md-4">

		<div class="panel panel-default">
		 <div class="panel-heading">
		  <h3 class="panel-title text-center">Grafico</h3>
		 </div>
		 <div class="panel-body">
			 <canvas id="pie" class="chart chart-pie"
				 chart-data="data" chart-labels="labels" chart-options="options">
			 </canvas>
		 </div>
		</div>

	</div>
</div>
