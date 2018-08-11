package ru.site.spring.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.UserDao;
import ru.site.spring.model.User;



@Service("userService")
public class UserServiceImpl implements UserService{
	
	private static final AtomicLong counter = new AtomicLong();
	
	@Autowired
	private  UserDao userDao;
	
	private static List<User> users;
	
//	static{
//		users= populateDummyUsers();
//	}

	public List<User> findAllUsers() {
		return users;
	}
	
	public User findById(long id) {
		return userDao.findById(id);
		
//		for(User user : users){
//			if(user.getId() == id){
//				return user;
//			}
//		}
//		return null;
	}
	
	public User findByName(String name) {
		for(User user : users){
			if(user.getLast_name().equalsIgnoreCase(name)){
				return user;
			}
		}
		return null;
	}
	
	public void saveUser(User user) {
		
		userDao.addUser(user);

//		user.setId(counter.incrementAndGet());
//		users.add(user);
//		
	}

	public void updateUser(User user) {
		userDao.updateUser(user);
		
		//		int index = users.indexOf(user);
//		users.set(index, user);
	}

	public void deleteUserById(long id) {
		
		for (Iterator<User> iterator = users.iterator(); iterator.hasNext(); ) {
		    User user = iterator.next();
		    if (user.getId() == id) {
		        iterator.remove();
		    }
		}
	}

	public boolean isUserExist(User user) {
		return findByName(user.getLast_name())!=null;
	}
	
	public void deleteAllUsers(){
		users.clear();
	}

	public  List<User> getAllUsers(){
		
		return userDao.getAllUsers();
		
//		List<User> users = new ArrayList<User>();
//		users.add(new User(counter.incrementAndGet(),"Sam", "NY", "sam@abc.com"));
//		users.add(new User(counter.incrementAndGet(),"Tomy", "ALBAMA", "tomy@abc.com"));
//		users.add(new User(counter.incrementAndGet(),"Kelly", "NEBRASKA", "kelly@abc.com"));
//		return users;
	}

	@Override
	public User findByEmail(String email) {
		return userDao.findByEmail(email);
	}

	@Override
	public int countNewUser() {
		return userDao.countNewUser();
	}
	 
	public List getNewUser() {
		return userDao.getNewUser();
	}

	@Override
	public void updateActiveUser(long id) {
		userDao.updateActiveUser(id);
		
	}
}
