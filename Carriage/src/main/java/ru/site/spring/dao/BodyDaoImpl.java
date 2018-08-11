package ru.site.spring.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.Advert;
import ru.site.spring.model.Body;
import ru.site.spring.model.Category;
import ru.site.spring.model.User;

@Transactional
@Repository
public class BodyDaoImpl implements BodyDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Body> getAllBody() {

		  List<Body> list = (List<Body>) sessionFactory.getCurrentSession().createQuery("from Body").list();
		  return list;
		
//		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT id, body FROM body ");
//		 return (List<Body>) query.getResultList();
	}

}
