<md-toolbar class="md-theme-light">
<h2 class="md-toolbar-tools">
	<span>CADASTRO DE REGISTRO</span>
</h2>
</md-toolbar>

<p ng-show="mensagem.length" class="alert alert-info">{{mensagem}}</p>

<div layout="column" ng-cloak class="md-inline-form">

	<form name="formulario" ng-submit="submeter()" novalidate>
		<md-content md-theme="docs-dark" layout-gt-sm="row" layout-padding>
		<div>
			<md-input-container> <label>Descrição</label> <input
				ng-model="registro.descricao" required name="descricao">
			<div ng-messages="projectForm.descricao.$error">
				<div ng-message="required">Descrição obrigatória!.</div>
			</div>
			</md-input-container>
		</div>
		</md-content>

		<md-content layout-padding>
		<div>
			<div layout-gt-xs="row">
				<md-input-container class="md-block" flex-gt-xs>
				<label>Valor <i class="material-icons">attach_money</i></label>
				<input ng-model="registro.valor" type="number" required min="1" step="0.01"> </md-input-container>
			</div>

			<div layout-gt-sm="row">
				<md-input-container> <label>Vencimento</label>
				<md-datepicker ng-model="registro.vencimento" required></md-datepicker>
				</md-input-container>
			</div>

			<div layout-gt-sm="row">
				<md-radio-group ng-model="registro.tipo" required> <md-radio-button
					value="1" class="md-primary">Receita</md-radio-button> <md-radio-button
					value="2"> Despesas </md-radio-button> </md-radio-group>
			</div>
		</div>

		<section layout="row" layout-sm="column" layout-align="center center"
			layout-wrap>
			<md-button type="submit" class="md-raised md-primary"
				ng-disabled="formulario.$invalid">Salvar <i class="material-icons">done</i></md-button>
			<md-button ng-href="/">Voltar <i class="material-icons">arrow_back</i></md-button>
		</section>
		</md-content>
	</form>

</div>
