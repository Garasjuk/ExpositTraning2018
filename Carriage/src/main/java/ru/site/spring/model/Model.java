package ru.site.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "model")
public class Model {

	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private long id;
	
	@Column(name = "id_marka")
	private int id_marka;

	@Column(name = "model")
	private String model;

	public Model() {
		super();
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getId_marka() {
		return id_marka;
	}

	public void setId_marka(int id_marka) {
		this.id_marka = id_marka;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
	
	
}
