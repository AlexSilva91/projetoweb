<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Reserva de Sala</title>

<c:import url="../componentes/cabecalho.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1>Cadastro servidor</h1>
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

		<!-- MATRICULA -->
		<div class="form-group">
			<label for="matricula" class="col-form-label">Matrícula<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="matricula" MAXLENGTH="255" required>
		</div>

		<!-- TELEFONE -->
		<div class="form-group">
			<label for="telefone" class="col-form-label">Telefone</label> <input
				type="text" class="form-control" name="telefone" MAXLENGTH="255">
		</div>

		<!-- CATEGORIA -->
		<div class="form-group">
			<label for="categoria" class="col-form-label">Categoria<span
				class="obrigatorio">*</span></label> <select
				class="form-select" name="categoria" required>
				<option>Docente</option>
				<option>Administrativo</option>
				<option>Tercerizado</option>
			</select>
		</div>

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