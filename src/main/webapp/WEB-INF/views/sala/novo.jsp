<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastro de Sala</title>

<c:import url="../componentes/cabecalho.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1>Cadastro sala</h1>
		<p class="lead">Preencha o formulário abaixo para realizar o
			cadastro no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="adiciona" method="POST">

		<!-- NOME -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="nome" autofocus MAXLENGTH="255" required>
		</div>

		<!-- RESPONSAVEL-->
		<div class="form-group">
			<label for="responsavel.id" class="col-form-label">Responsável<span
				class="obrigatorio">*</span></label> <select class="form-select"
				name="responsavel.id" required>

				<c:forEach var="resp" items="${responsaveis}">
					<option value="${resp.id}">${resp.matricula}-->
						${resp.nome}</option>
				</c:forEach>

			</select>
		</div>

		<br>

		<!-- STATUS -->
		<div class="form-group">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input"
					id="customCheck1" name="status" checked="checked"> <label
					class="custom-control-label" for="customCheck1">Ativa</label>
			</div>
		</div>

		<br>

		<security:csrfInput />

		<!-- OBTIGATÓRIO -->
		<label for="obrigatorio">(*) Campo obrigatório</label>
		<div>
			<button type="reset" class="btn btn-secondary">
				<span class="glyphicon glyphicon-trash"></span> Limpar
			</button>
			<button type="submit" class="btn btn-primary ">
				<span class="glyphicon glyphicon-floppy-disk"></span> Salvar
			</button>
		</div>
	</form>
</div>

<c:import url="../componentes/rodape.jsp" />