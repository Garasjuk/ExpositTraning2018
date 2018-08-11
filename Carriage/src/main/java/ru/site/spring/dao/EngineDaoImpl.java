package ru.site.spring.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.Engine;

@Transactional
@Repository
public class EngineDaoImpl implements EngineDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Engine> getAllEngine() {

		  List<Engine> list = (List<Engine>) sessionFactory.getCurrentSession().createQuery("from Engine").list();
		  return list;
	}

}
