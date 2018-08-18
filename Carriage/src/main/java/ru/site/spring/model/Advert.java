package ru.site.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "advert")
public class Advert {
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private long id;
	
	@Column(name = "id_marka")
	private int id_marka;

	@Column(name = "id_model")
	private int id_model;
	
	@Column(name = "year_of_issue")
	private String year_of_issue;
	
	@Column(name = "gov_number")
	private String gov_number;
	
	@Column(name = "mileage")
	private String mileage;
	
	@Column(name = "seats")
	private int seats;
	
	@Column(name = "location")
	private String location;
	
	@Column(name = "id_transmission")
	private int id_transmission;
	
	@Column(name = "id_body")
	private int id_body;
	
	@Column(name = "id_drive")
	private int id_drive;
	
	@Column(name = "id_engine")
	private int id_engine;
	
	@Column(name = "id_fuel")
	private int id_fuel;
	
	@Column(name = "consumption")
	private String consumption;
	
	@Column(name = "damage")
	private String damage;
	
	@Column(name = "accessory")
	private String accessory;
	
	@Column(name = "insurance")
	private String insurance;
	
	@Column(name = "cena")
	private String cena;
	
	@Column(name = "text")
	private String text;
	
	@Column(name = "date_registration")
	private Date date_registration;
	
	@Column(name = "active")
	private int active;
	
	@Column(name = "id_user")
	private int id_user;
	
	
	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public Advert() {
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

	public int getId_model() {
		return id_model;
	}

	public void setId_model(int id_model) {
		this.id_model = id_model;
	}

	public String getYear_of_issue() {
		return year_of_issue;
	}

	public void setYear_of_issue(String year_of_issue) {
		this.year_of_issue = year_of_issue;
	}

	public String getGov_number() {
		return gov_number;
	}

	public void setGov_number(String gov_number) {
		this.gov_number = gov_number;
	}

	public String getMileage() {
		return mileage;
	}

	public void setMileage(String mileage) {
		this.mileage = mileage;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getId_transmission() {
		return id_transmission;
	}

	public void setId_transmission(int id_transmission) {
		this.id_transmission = id_transmission;
	}

	public int getId_body() {
		return id_body;
	}

	public void setId_body(int id_body) {
		this.id_body = id_body;
	}

	public int getId_drive() {
		return id_drive;
	}

	public void setId_drive(int id_drive) {
		this.id_drive = id_drive;
	}

	public int getId_engine() {
		return id_engine;
	}

	public void setId_engine(int id_engine) {
		this.id_engine = id_engine;
	}

	public int getId_fuel() {
		return id_fuel;
	}

	public void setId_fuel(int id_fuel) {
		this.id_fuel = id_fuel;
	}

	public String getConsumption() {
		return consumption;
	}

	public void setConsumption(String consumption) {
		this.consumption = consumption;
	}

	public String getDamage() {
		return damage;
	}

	public void setDamage(String damage) {
		this.damage = damage;
	}

	public String getAccessory() {
		return accessory;
	}

	public void setAccessory(String accessory) {
		this.accessory = accessory;
	}

	public String getInsurance() {
		return insurance;
	}

	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}

	public String getCena() {
		return cena;
	}

	public void setCena(String cena) {
		this.cena = cena;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getDate_registration() {
		return date_registration;
	}

	public void setDate_registration(Date date_registration) {
		this.date_registration = date_registration;
	}

}
