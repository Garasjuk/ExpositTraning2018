package ru.site.spring.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.Category;
import ru.site.spring.model.User;

@Transactional
@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getAllCategory() {
		String hql = "FROM Category";
		return (List<Category>) hibernateTemplate.find(hql);
	}

	@Override
	public Category findById(long id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Category.class)
				.add(Restrictions.eq("id", id));
		return (Category) criteria.uniqueResult();
	}

	@Override
	public void updateCategory(Category category) {
		sessionFactory.getCurrentSession().update(category);
	}


}
