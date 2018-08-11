package ru.site.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.AdvertDao;
import ru.site.spring.dao.OrderDao;
import ru.site.spring.model.Advert;
import ru.site.spring.model.Orders;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;

	@Override
	public void saveOrder(Orders order) {
		orderDao.saveOrder(order);
	}

	@Override
	public int countNewOrder(int id_user) {
		return orderDao.countNewOrder(id_user);
	}

	@Override
	public List getAllOrder() {
		return orderDao.getAllOrder();
	}

	@Override
	public void updateIgnoreOrder(long id_order) {
		orderDao.updateIgnoreOrder(id_order);
		
	}

	@Override
	public void updateActiveOrder(long id_order) {
		orderDao.updateActiveOrder(id_order);
		
	}

	@Override
	public void deleteActiveOrder(long id_order) {
		orderDao.deleteActiveOrder(id_order);
		
	}
	
}
