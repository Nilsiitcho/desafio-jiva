package org.desafio.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.desafio.model.Registro;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class RegistroDAO {

	@PersistenceContext
	private EntityManager manager;

	public List<Registro> getAll() {
		return manager.createQuery("select r from Registro r", Registro.class).getResultList();
	}

	public Registro getById(Integer id) {
		Registro registro = manager.find(Registro.class, id);
		return registro;
	}

	public void remove(Integer id) {
		Registro registro = manager.find(Registro.class, id);
		manager.remove(registro);
	}

	public void save(Registro registro) {
		manager.persist(registro);
	}

	public void update(Registro registro, Integer id) {
		manager.merge(registro);
	}
}
