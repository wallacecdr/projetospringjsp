<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Projetos</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<a href="./index">Voltar</a>
	<br/>
	<h1>Cadastro de Projetos</h1>
	
	<div style="width: 300px; margin-left: 20px; margin-top: 20px;">
		<form action="../salvarprojeto" method="post" >
			<div class="form-group">
				<label for="nome">Código</label> <input type="text"
					class="form-control" id="codigo" value="${projeto.id}"
					name="id" aria-describedby="codigo" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="nome">Nome</label> <input type="text"
					class="form-control" id="nome" value="${projeto.nome}" name="nome"
					aria-describedby="nome" placeholder="Entre com o nome">
			</div>
			<div class="form-group">
				<label for="data_inicio">Data de Início</label> <input type="date"
					class="form-control" id="data_inicio" value="${projeto.data_inicio}" name="data_inicio"
					aria-describedby="data_inicio" placeholder="Entre com a data do projeto">
			</div>
			<div class="form-group">
				<label for="data_previsao_fim">Previsão do Término</label> <input type="date"
					class="form-control" id="data_previsao_fim" value="${projeto.data_previsao_fim}" name="data_previsao_fim"
					aria-describedby="data_previsao_fim" placeholder="Entre com a data de previsão">
			</div>
			<div class="form-group">
				<label for="data_fim">Data Real do Término</label> <input type="date"
					class="form-control" id="data_fim" value="${projeto.data_fim}" name="data_fim"
					aria-describedby="data_fim" placeholder="Entre com a data de previsão">
			</div>
			<div class="form-group">
				<label for="gerente">Gerente Responsável</label> <select name="gerente"
					class="form-control" id="gerente">
					<c:forEach var="p" items="${pessoas}">
						<option value="${p.nome}">${p.nome}</option>
					</c:forEach>
				</select>
			</div>
			<div class="md-form">
				<label for="descricao">Descrição</label>
			  	<textarea id="descricao" name="descricao" class="md-textarea form-control" rows="3"><c:out value="${projeto.descricao}"></c:out></textarea>
			</div>
			<div class="form-group">
				<label for="orcamento">Orçamento Total</label> <input type="number" step="0.01"
					class="form-control" id="orcamento" value="${projeto.orcamento}" name="orcamento"
					aria-describedby="orcamento" placeholder="Entre com o Orçamento">
			</div>
			
			<div class="form-group">
				<label for="status">Status</label> <select name="status"
					class="form-control" id="status">
	
					<option ${projeto.status == 'EM ANALISE' ? 'selected' : ''}>EM ANALISE</option>
					<option ${projeto.status == 'ANALISE REALIZADA' ? 'selected' : ''}>ANALISE REALIZADA</option>
					<option ${projeto.status == 'ANALISE APROVADA' ? 'selected' : ''}>ANALISE APROVADA</option>
					<option ${projeto.status == 'INICIADO' ? 'selected' : ''}>INICIADO</option>
					<option ${projeto.status == 'PLANEJADO' ? 'selected' : ''}>PLANEJADO</option>
					<option ${projeto.status == 'EM ANDAMENTO' ? 'selected' : ''}>EM ANDAMENTO</option>
					<option ${projeto.status == 'ENCERRADO' ? 'selected' : ''}>ENCERRADO</option>
					<option ${projeto.status == 'CANCELADO' ? 'selected' : ''}>CANCELADO</option>
					</select>
			</div>
			<button type="submit" class="btn btn-primary">Salvar</button>
		</form>
	</div>
	
	<div style="margin-left: 20px; width: 90%;">
		<table class="table" >
			<thead>
				<tr>
					<th scope="col">Nome</th>
					<th scope="col">Editar</th>
					<th scope="col">Excluir</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="projeto" items="${projetos}">
				<tr>
					<th class="row">${projeto.nome}</th>
					<td><a href="./editarprojeto/${projeto.id}">Editar</a></td>
					<td><a href="./excluirprojeto/${projeto.id}">Excluir</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>