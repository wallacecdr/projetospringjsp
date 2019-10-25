package br.com.biblioteca.controller;

import java.text.Normalizer.Form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import br.com.biblioteca.model.Pessoa;
import br.com.biblioteca.model.Projeto;
import br.com.biblioteca.repository.PessoaRepository;
import br.com.biblioteca.repository.ProjetoRepository;

@Controller
public class ProjetoController {
	
	@Autowired
	private ProjetoRepository projetoRepository;
	
	@Autowired
	private PessoaRepository pessoaRepository;

	@RequestMapping(method = RequestMethod.GET, value = "projeto/cadastro")
	public ModelAndView indexCadastroProjeto() {
		
		ModelAndView view = new ModelAndView("projeto/cadastro");
		
		Iterable<Projeto> projetos = projetoRepository.findAll();
		Iterable<Pessoa> pessoas = pessoaRepository.findAll();
		
		view.addObject("projetos", projetos);
		view.addObject("projeto", new Projeto());
		view.addObject("pessoas", pessoas);
		
		return view;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/projeto/salvarprojeto")
	public ModelAndView cadastroProjeto(Projeto projeto, BindingResult binding) {

		projetoRepository.save(projeto);
		
		ModelAndView view = new ModelAndView("projeto/cadastro");

		Iterable<Projeto> projetos = projetoRepository.findAll();
		Iterable<Pessoa> pessoas = pessoaRepository.findAll();

		view.addObject("projetos", projetos);
		view.addObject("projeto", new Projeto());
		view.addObject("pessoas", pessoas);

		return view;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "projeto/editarprojeto/{idprojeto}")
	public ModelAndView editarProjeto(@PathVariable("idprojeto") Long idprojeto) {

		ModelAndView view = new ModelAndView("projeto/cadastro");

		Projeto projeto = projetoRepository.findOne(idprojeto);
		Iterable<Pessoa> pessoas = pessoaRepository.findAll();

		view.addObject("projeto", projeto);
		view.addObject("pessoas", pessoas);

		return view;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "projeto/excluirprojeto/{idprojeto}")
	public ModelAndView excluirProjeto(@PathVariable("idprojeto") Long idprojeto) {

		Projeto projeto = projetoRepository.findOne(idprojeto);
		
		if(!projeto.getStatus().equals("INICIADO")) {
			projetoRepository.delete(idprojeto);
		}
		
		ModelAndView view = new ModelAndView(new RedirectView("../cadastro"));
		Iterable<Projeto> projetos = projetoRepository.findAll();
		Iterable<Pessoa> pessoas = pessoaRepository.findAll();

		view.addObject("projetos", projetos);
		view.addObject("projeto", new Projeto());
		view.addObject("pessoas", pessoas);

		return view;
	}
}
