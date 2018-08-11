package ru.site.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "transmission")
public class Transmission {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private long id;
	
	@Column(name = "transmission")
	private String transmission;

	public Transmission() {
		super();
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTransmission() {
		return transmission;
	}

	public void setTransmission(String transmission) {
		this.transmission = transmission;
	}
	
	
	
}
