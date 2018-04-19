package org.desafio.controllers;

import java.util.List;

import javax.validation.Valid;

import org.desafio.daos.RegistroDAO;
import org.desafio.model.Registro;
import org.desafio.validation.RegistroValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Controller
@RestController
@EnableWebMvc
@RequestMapping("desafio/registros")
public class RegistroController {

	@Autowired
	private RegistroDAO registroDAO;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new RegistroValidation());
	}

	@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Registro> listar() {
		return registroDAO.getAll();
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public Registro pegarPorId(@PathVariable Integer id) {
		return registroDAO.getById(id);
	}

	@ResponseStatus(value=HttpStatus.OK)
	@RequestMapping(value = "/gravar", method = RequestMethod.POST)
	public @ResponseBody void cadastra(@Valid @RequestBody Registro registro, BindingResult result) {
		
		if(result.hasErrors()) {
			System.out.println("Não foi possível cadastrar o Produto!");
		}else {
			registroDAO.save(registro);			
		}
		
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public void atualizar(@PathVariable Integer id, @RequestBody Registro registro) {
		registroDAO.update(registro, id);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void apagar(@PathVariable Integer id) {
		registroDAO.remove(id);
	}

}
