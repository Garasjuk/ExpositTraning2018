package ru.site.spring.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.Role;

@Transactional
@Repository
public class RoleDaoImpl implements RoleDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Role> getAllRole() {
		  List<Role> list = (List<Role>) sessionFactory.getCurrentSession().createQuery("from Role").list();
		  return list;
	}
}
