package br.com.biblioteca.test;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.biblioteca.model.Projeto;
import br.com.biblioteca.repository.ProjetoRepository;

class SprinbootApplicationTests {

	@Autowired
	private ProjetoRepository projetoRepository;
	
	@Test
	void salvarProjeto() {
		
		Projeto projeto = new Projeto();
		
		projeto.setId(999L);
		projeto.setNome("Projeto");
		
		projetoRepository.save(projeto);
	}
	
	@Test
	void editarProjeto() {
		
		Projeto projeto = new Projeto();
		
		projeto.setId(999L);
		projeto.setNome("Projeto Editado");
		
		projetoRepository.save(projeto);
	}
	
	@Test
	void getProjeto() {
		
		Projeto projeto = projetoRepository.getOne(999L);
		
		System.out.println(projeto.getNome());
	}
	
	@Test
	void excluirProjeto() {
		projetoRepository.delete(999L);
	}

}
