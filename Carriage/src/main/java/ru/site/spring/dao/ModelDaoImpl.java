package ru.site.spring.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.Model;

@Transactional
@Repository
public class ModelDaoImpl implements ModelDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Model> getAllModel() {
		  List<Model> list = (List<Model>) sessionFactory.getCurrentSession().createQuery("from Model").list();
		  return list;
	}
}
