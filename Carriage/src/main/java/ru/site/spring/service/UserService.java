package ru.site.spring.service;

import java.util.List;

import ru.site.spring.model.User;

public interface UserService {
	
	User findById(long id);
	
	User findByName(String name);

	User findByEmail(String email);
	
	void saveUser(User user);
	
	void updateUser(User user);

	void updatPassUser(long id, String pass);

	void updateActiveUser(long id);
	
	void deleteUserById(long id);

	List<User> getAllUsers(); 
	
	void deleteAllUsers();
	
	public boolean isUserExist(User user);
	
	int countNewUser();
	
	List getNewUser();
	
}
