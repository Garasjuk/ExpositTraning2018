package ru.site.spring.configuration;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import ru.site.spring.model.Advert;
import ru.site.spring.model.Body;
import ru.site.spring.model.Calendar;
import ru.site.spring.model.Category;
import ru.site.spring.model.Drive;
import ru.site.spring.model.Engine;
import ru.site.spring.model.Fuel;
import ru.site.spring.model.Marka;
import ru.site.spring.model.Model;
import ru.site.spring.model.Orders;
import ru.site.spring.model.Photo;
import ru.site.spring.model.Role;
import ru.site.spring.model.Transmission;
import ru.site.spring.model.User;




@Configuration 
@EnableTransactionManagement

public class DBConfig {

	@Bean
	public HibernateTemplate hibernateTemplate() {
		return new HibernateTemplate(sessionFactory());
	}
	@Bean
	public SessionFactory sessionFactory() {
		return new LocalSessionFactoryBuilder(getDataSource())
		   .addAnnotatedClasses(User.class)
		   .addAnnotatedClasses(Role.class)
		   .addAnnotatedClasses(Category.class)
		   .addAnnotatedClasses(Advert.class)
		   .addAnnotatedClasses(Calendar.class)
		   .addAnnotatedClasses(Drive.class)
		   .addAnnotatedClasses(Engine.class)
		   .addAnnotatedClasses(Fuel.class)
		   .addAnnotatedClasses(Marka.class)
		   .addAnnotatedClasses(Model.class)
		   .addAnnotatedClasses(Transmission.class)
		   .addAnnotatedClasses(Body.class)
		   .addAnnotatedClasses(Photo.class)
		   .addAnnotatedClasses(Orders.class)
		   .buildSessionFactory();
	}
	@Bean
	public DataSource getDataSource() {
	        BasicDataSource dataSource = new BasicDataSource();
	        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
	        dataSource.setUrl("jdbc:mysql://localhost:3306/carriage");
	        dataSource.setUsername("root");
	        dataSource.setPassword("");
	        return dataSource;
	}
	@Bean
	public HibernateTransactionManager hibTransMan(){
		return new HibernateTransactionManager(sessionFactory());
	}
}
