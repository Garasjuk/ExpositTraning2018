package ru.site.spring.model;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private long id;
	
	@Column(name = "last_name")
	private String last_name;
	
	@Column(name = "first_name")
	private String first_name;
	
	@Column(name = "midle_name")
	private String midle_name;
	
	@Column(name = "series_passport")
	private String series_passport;
	
	@Column(name = "number_passport")
	private int number_passport;
	
	@Column(name = "issued_by_passport")
	private String issued_by_passport;
	
	@Column(name = "issued_passport")
	private Date issued_passport;
	
	@Column(name = "date_birthday")
	private Date date_birthday;
	
	@Column(name = "location_birthday")
	private String location_birthday;
	
	@Column(name = "series_license")
	private String series_license;
	
	@Column(name = "number_license")
	private int number_license;
	
	@Column(name = "issued_by_license")
	private String issued_by_license;
	
	@Column(name = "issued_license")
	private Date issued_license;
	
	@Column(name = "valid_license")
	private Date valid_license;
	
	@Column(name = "id_category")
	private int id_category;
	
	@Column(name = "photo")
	private String photo;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "pass")
	private String pass;
	
	@Column(name = "date_registration")
	private Date date_registration;
	
	@Column(name = "active")
	private int active;

	@Column(name = "id_role")
	private int id_role;
	
	public User(){
		id=0;
	}
		
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getMidle_name() {
		return midle_name;
	}

	public void setMidle_name(String midle_name) {
		this.midle_name = midle_name;
	}

	public String getSeries_passport() {
		return series_passport;
	}

	public void setSeries_passport(String series_passport) {
		this.series_passport = series_passport;
	}

	public int getNumber_passport() {
		return number_passport;
	}

	public void setNumber_passport(int number_passport) {
		this.number_passport = number_passport;
	}

	public String getIssued_by_passport() {
		return issued_by_passport;
	}

	public void setIssued_by_passport(String issued_by_passport) {
		this.issued_by_passport = issued_by_passport;
	}

	public Date getIssued_passport() {
		return issued_passport;
	}

	public void setIssued_passport(Date issued_passport) {
		this.issued_passport = issued_passport;
	}

	public Date getDate_birthday() {
		return date_birthday;
	}

	public void setDate_birthday(Date date_birthday) {
		this.date_birthday = date_birthday;
	}

	public String getLocation_birthday() {
		return location_birthday;
	}

	public void setLocation_birthday(String location_birthday) {
		this.location_birthday = location_birthday;
	}

	public String getSeries_license() {
		return series_license;
	}

	public void setSeries_license(String series_license) {
		this.series_license = series_license;
	}

	public int getNumber_license() {
		return number_license;
	}

	public void setNumber_license(int number_license) {
		this.number_license = number_license;
	}

	public String getIssued_by_license() {
		return issued_by_license;
	}

	public void setIssued_by_license(String issued_by_license) {
		this.issued_by_license = issued_by_license;
	}

	public Date getIssued_license() {
		return issued_license;
	}

	public void setIssued_license(Date issued_license) {
		this.issued_license = issued_license;
	}

	public Date getValid_license() {
		return valid_license;
	}

	public void setValid_license(Date valid_license) {
		this.valid_license = valid_license;
	}

	public int getId_category() {
		return id_category;
	}

	public void setId_category(int id_category) {
		this.id_category = id_category;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Date getDate_registration() {
		return date_registration;
	}

	public void setDate_registration(Date date_registration) {
		this.date_registration = date_registration;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public int getId_role() {
		return id_role;
	}

	public void setId_role(int id_role) {
		this.id_role = id_role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof User))
			return false;
		User other = (User) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", last_name=" + last_name + ",  email=" + email + "]";
	}

}
