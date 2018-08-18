package ru.site.spring.dao;

import java.util.List;
import ru.site.spring.model.Orders;

public interface OrderDao {
	void saveOrder(Orders order);
	void updateIgnoreOrder(long id_order);
	void updateActiveOrder(long id_order, int price);
	void deleteActiveOrder(long id_order);
	void updateOkOrderWait(long id_order);
	int countNewOrder(int id_user);
	List<Orders> getAllOrder();
}
