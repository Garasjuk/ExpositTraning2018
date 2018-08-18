package ru.site.spring.dao;


import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.About;

@Transactional
@Repository
public class AboutDaoImpl implements AboutDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public About getAllAbout() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(About.class);
		return (About) criteria.uniqueResult();
	}

	@Override
	public void updateAbout(About about) {
		sessionFactory.getCurrentSession().update(about);		
	}
}
