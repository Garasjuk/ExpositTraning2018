package ru.site.spring.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.Body;
import ru.site.spring.model.Orders;

@Transactional
@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void saveOrder(Orders order) {
		sessionFactory.getCurrentSession().save(order);
	}

	@Override
	public int countNewOrder(int id_user) {
//		System.out.println("Count Order id_user " + id_user);
		return ((Number) sessionFactory.getCurrentSession().createSQLQuery("SELECT count(advert.id) FROM advert INNER JOIN orders ON advert.id = orders.id_advert  WHERE advert.id_user like ?  AND orders.active like ?  ").setInteger(0, id_user).setInteger(1,0).uniqueResult()).intValue(); 
	}

	@Override
	public List<Orders> getAllOrder() {
		 List<Orders> list = (List<Orders>) sessionFactory.getCurrentSession().createQuery("from Orders").list();
		 return list;
	}

	@Override
	public void updateIgnoreOrder(long id_order) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("UPDATE orders SET active = ? WHERE id = ?");
		query.setInteger(0, -1);
		query.setLong(1, id_order);
		query.executeUpdate();
	}

	@Override
	public void updateActiveOrder(long id_order) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("UPDATE orders SET active = ? WHERE id = ?");
		query.setInteger(0, 1);
		query.setLong(1, id_order);
		query.executeUpdate();		
	}

	@Override
	public void deleteActiveOrder(long id_order) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("UPDATE orders SET active = ? WHERE id = ?");
		query.setInteger(0, -2);
		query.setLong(1, id_order);
		query.executeUpdate();
		
	}
}
