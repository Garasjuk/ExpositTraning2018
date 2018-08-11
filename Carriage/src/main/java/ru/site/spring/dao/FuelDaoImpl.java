package ru.site.spring.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.Fuel;

@Transactional
@Repository
public class FuelDaoImpl implements FuelDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Fuel> getAllFuel() {

		  List<Fuel> list = (List<Fuel>) sessionFactory.getCurrentSession().createQuery("from Fuel").list();
		  return list;
	}
}
