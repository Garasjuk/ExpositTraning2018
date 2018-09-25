package ru.site.spring.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.Marka;

@Transactional
@Repository
public class MarkaDaoImpl implements MarkaDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Marka> getAllMarka() {
		  List<Marka> list = (List<Marka>) sessionFactory.getCurrentSession().createQuery("from Marka").list();
		  return list;
	}
}
