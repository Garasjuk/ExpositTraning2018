package ru.site.spring.dao;

import java.util.List;

import ru.site.spring.model.User;


public interface UserDao {
	List<User> getAllUsers();
	void addUser(User user);
	User findByName(String name);
	User findByEmail(String email);
	User findById(long id);
	void updateUser(User user);
	void updatePassUser(long id, String pass);
	void updateActiveUser(long id);
	int countNewUser();
	List getNewUser(); 
}
