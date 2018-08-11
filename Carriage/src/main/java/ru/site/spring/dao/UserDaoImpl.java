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

import ru.site.spring.model.Body;
import ru.site.spring.model.User;

@Transactional
@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<User> getAllUsers() {
		
		  List<User> list = (List<User>) sessionFactory.getCurrentSession().createQuery("from User").list();
		  return list;
//		String hql = "FROM User";
//		return (List<User>) hibernateTemplate.find(hql);
	}

	@Override
	public void addUser(User user) {
//		hibernateTemplate.save(user);
		sessionFactory.getCurrentSession().save(user);

	}

	@Override
	public User findByName(String name) {
		String hql = "FROM User WHERE  user.username = ?";
		return (User) hibernateTemplate.find(hql);
	}

	@Override
	public User findByEmail(String email) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class)
				.add(Restrictions.eq("email", email));
		return (User) criteria.uniqueResult();
	}

	
	@Override
	public User findById(long id) {
		
//		System.out.println("findById " + id);
		
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class)
				.add(Restrictions.eq("id", id));
		return (User) criteria.uniqueResult();
	}
	@Override
	public void updateUser( User user) {
		sessionFactory.getCurrentSession().update(user);
	}

	@Override
	public int countNewUser() {
		return ((Number) sessionFactory.getCurrentSession().createSQLQuery("SELECT count(id) FROM  user WHERE active like ? ").setInteger(0, 0).uniqueResult()).intValue(); 
	}

	public List getNewUser() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT user.id as '0', user.last_name as '1', user.first_name as '2', user.midle_name as '3', user.series_passport as '4', "
				+ "user.number_passport  as '5', user.issued_by_passport as '6', user.issued_passport as '7', user.date_birthday as '8', user.location_birthday as '9', "
				+ "user.series_license as '10',  user.number_license as '11', user.issued_by_license as '12', user.valid_license as '13', user.id_category as '14', "
				+ " category.category as '15', user.photo as '16', user.phone as '17', user.email as '18', user.date_registration as '19', user.id_role as '20', role.role as '21' "
				+ "FROM  (user INNER JOIN category ON user.id_category = category.id) INNER JOIN role ON user.id_role = role.id "
				+ "WHERE user.active like ? ");
		query.setInteger(0, 0);
		List result = query.list();
		return result;
	}

	@Override
	public void updateActiveUser(long id) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("UPDATE user SET active = ? WHERE id = ?");
		query.setInteger(0, 1);
		query.setLong(1, id);
		query.executeUpdate();
	}
}
