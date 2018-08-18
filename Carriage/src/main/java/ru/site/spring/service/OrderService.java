package ru.site.spring.service;

import java.util.List;

import ru.site.spring.model.Orders;

public interface OrderService {
	void saveOrder(Orders order);
	void updateIgnoreOrder(long id_order);
	void deleteActiveOrder(long id_order);
	void updateOkOrderWait(long id_order);
	void updateActiveOrder(long id_order , int price);
	int countNewOrder(int id_user);
	List getAllOrder();
	
}
