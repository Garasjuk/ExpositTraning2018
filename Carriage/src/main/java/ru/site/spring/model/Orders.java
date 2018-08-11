package ru.site.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class Orders {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private long id;
	
	@Column(name = "id_advert")
	private int id_advert;

	@Column(name = "id_user")
	private int id_user;
	
	@Column(name = "date_order")
	private Date date_order;
	
	@Column(name = "date_registration")
	private Date date_registration;

	@Column(name = "cena")
	private int cena;
	
	@Column(name = "active")
	private int active;

	public Orders() {
		super();
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getId_advert() {
		return id_advert;
	}

	public void setId_advert(int id_advert) {
		this.id_advert = id_advert;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public Date getDate_order() {
		return date_order;
	}

	public void setDate_order(Date date_order) {
		this.date_order = date_order;
	}

	public Date getDate_registration() {
		return date_registration;
	}

	public void setDate_registration(Date date_registration) {
		this.date_registration = date_registration;
	}

	public int getCena() {
		return cena;
	}

	public void setCena(int cena) {
		this.cena = cena;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
	
	
	
}
