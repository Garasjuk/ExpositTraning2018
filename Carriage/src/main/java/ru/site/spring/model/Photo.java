package ru.site.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "body")
public class Photo {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private long id;
	
	@Column(name = "id_advert")
	private int id_advert;

	@Column(name = "photo")
	private String photo;

	
	
	public Photo() {
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	
	
	
}
