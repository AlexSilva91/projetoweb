package web.controller;

import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.SalaDao;
import web.dao.ServidorDao;
import web.modelo.Sala;
import web.modelo.Servidor;

@Transactional
@Controller
@RequestMapping("/sala")
public class SalaController {

	private List<Sala> lista_salas;
	private List<Servidor> lista_responsaveis;

	@Autowired
	SalaDao dao;

	@Autowired
	ServidorDao dao_servidor;

	@RequestMapping("/novo")
	public String sala(Model model) {
		this.lista_responsaveis = dao_servidor.lista();
		model.addAttribute("responsaveis", this.lista_responsaveis);
		return "sala/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Sala sala, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(sala);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_salas = dao.lista();
		model.addAttribute("salas", this.lista_salas);
		return "sala/lista";
	}

	@RequestMapping("/remove")
	public String remove(Sala sala) {
		dao.remove(sala.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("sala", dao.buscaPorId(id));
		return "sala/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("sala", dao.buscaPorId(id));
		return "sala/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Sala sala, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:edita?id=" + sala.getId();
		}

		dao.altera(sala);
		return "redirect:lista";
	}
}
