<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Curso</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="jumbotron">
	<div class="container">
		<h1>Editar Servidor</h1>
		<p class="lead">Preencha o formulário abaixo para realizar a
			alteração do servidor no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="altera" method="POST">

		<!-- ID -->
		<input type="hidden" name="id" value="${servidor.id}" required>

		<!-- NOME -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="nome" autofocus MAXLENGTH="255" required
				value="${servidor.nome}">
		</div>

		<!-- MATRICULA -->
		<div class="form-group">
			<label for="matricula" class="col-form-label">Matrícula<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="matricula" MAXLENGTH="255" required
				value="${servidor.matricula}">
		</div>

		<!-- TELEFONE -->
		<div class="form-group">
			<label for="telefone" class="col-form-label">Telefone</label> <input
				type="text" class="form-control" name="telefone" MAXLENGTH="255"
				value="${servidor.telefone}">
		</div>

		<!-- CATEGORIA -->
		<div class="form-group">
			<label for="categoria" class="col-form-label">Categoria<span
				class="obrigatorio">*</span></label> <select class="form-select"
				name="categoria">
				<option ${servidor.categoria == 'Docente' ? 'selected' : ''}>Docente</option>
				<option ${servidor.categoria == 'Administrativo' ? 'selected' : ''}>Administrativo</option>
				<option ${servidor.categoria == 'Tercerizado' ? 'selected' : ''}>Tercerizado</option>
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