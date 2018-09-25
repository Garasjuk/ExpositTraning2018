package ru.site.spring.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.Transmission;

@Transactional
@Repository
public class TransmissionDaoImpl implements TransmissionDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Transmission> getAllTransmission() {
		  List<Transmission> list = (List<Transmission>) sessionFactory.getCurrentSession().createQuery("from Transmission").list();
		  return list;
	}
}
