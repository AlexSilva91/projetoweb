<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Sala</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="jumbotron">
	<div class="container">
		<h1>Editar Sala</h1>
		<p class="lead">Preencha o formulário abaixo para realizar a
			alteração do servidor no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="altera" method="POST">

		<!-- ID -->
		<input type="hidden" name="id" value="${sala.id}" required>

		<!-- NOME -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="nome" autofocus MAXLENGTH="255" required>
		</div>

		<!-- RESPONSAVEL-->
		<div class="form-group">
			<label for="responsavel" class="col-form-label">Responsavel<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="responsavel" MAXLENGTH="255" required
				value="${sala.responsavel}">S
		</div>

		<!-- STATUS -->
		<div class="form-group">
			<label for="status" class="col-form-label">Status<span
				class="obrigatorio">*</span></label> <select class="form-select"
				name="status">
				<option ${servidor.categoria == 'Ativo' ? 'selected' : ''}>Ativo</option>
				<option ${servidor.categoria == 'Inativo' ? 'selected' : ''}>Inativo</option>
			</select>
		</div>

		
		<security:csrfInput />

		<!-- OBTIGATÓRIO -->
		<label for="obrigatorio">(*) Campo obrigatório</label>
		<div>
			<a href="<c:url value="/ServidorDao/lista" />"
				class="btn btn-secondary"> <span
				class="glyphicon glyphicon-remove"></span> Cancelar
			</a>
			<button type="submit" class="btn btn-primary">
				<span class="glyphicon glyphicon-refresh"></span> Atualizar
			</button>
		</div>
	</form>
</div>

<c:import url="../componentes/rodape.jsp" />