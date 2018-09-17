package ru.site.spring.dao;


import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.Search;

@Transactional
@Repository
public class SearchDaoImpl implements SearchDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List getSearch(Search search) {
		boolean metka = false;
		String str = "SELECT advert.id as '0', advert.id_marka as '1', marka.marka as '2', advert.id_model as '3', model.model as '4',"
				+ "advert.year_of_issue as '5', advert.gov_number as '6', advert.mileage as '7', advert.seats as '8', advert.location as '9', advert.id_transmission as '10',"
				+ "transmission.transmission as '11', advert.id_body as '12', body.body as '13', advert.id_drive as '14', drive.drive as '15', advert.id_engine as '16',"
				+ "engine.engine as '17', advert.id_fuel as '18', fuel.fuel as '19', advert.consumption as '20', advert.damage as '21', advert.accessory as '22', advert.insurance as '23',"
				+ "advert.cena as '24', advert.text as '25', advert.date_registration as '26', advert.active as '27', advert.id_user as '28'"
				+ "FROM (((((model INNER JOIN (advert INNER JOIN marka ON advert.id_marka = marka.id) ON (advert.id_model = model.id) AND (model.id_marka = marka.id)) "
				+ "INNER JOIN transmission ON advert.id_transmission = transmission.id) "
				+ "INNER JOIN body ON advert.id_body = body.id) "
				+ "INNER JOIN drive ON advert.id_drive = drive.id) "
				+ "INNER JOIN engine ON advert.id_engine = engine.id) "
				+ "INNER JOIN fuel ON advert.id_fuel = fuel.id ";
	
		str += " WHERE ";
//		System.out.println("Id_marka : " + search.getId_marka());
		if (search.getId_marka() > 0)
			if (metka == false) {
				str += " advert.id_marka like " + search.getId_marka();
				metka = true;
			}else {
				str += " and advert.id_marka like " + search.getId_marka();
			}
//		System.out.println("Id_model : " + search.getId_model());
		if (search.getId_model() > 0)
			if (metka == false) {
				str += " advert.id_model like " + search.getId_model();
				metka = true;
			}else {
				str += " and advert.id_model like " + search.getId_model();
			}		
//		System.out.println("Year_of_issue : " + search.getYear_of_issue());
		if (search.getYear_of_issueStart() >0 && search.getYear_of_issueFinish() >0 )
			if (metka == false) {
				str += " advert.year_of_issue between " + search.getYear_of_issueStart() + " and " + search.getYear_of_issueFinish();
				metka = true;
			}else {
				str += " and advert.year_of_issue between " + search.getYear_of_issueStart() + " and " + search.getYear_of_issueFinish();
			}
//		System.out.println("Mileage : " + search.getMileage());
		if (search.getMileageStart() > 0 && search.getMileageFinish() > 0)
			if (metka == false) {
				str += " advert.mileage between " + search.getMileageStart() + " and " + search.getMileageFinish();
				metka = true;
			}else {
				str += " and advert.mileage between " + search.getMileageStart() + " and " + search.getMileageFinish();
			}
		if (search.getSeatsStart() >0 && search.getSeatsFinish() > 0 )
			if (metka == false) {
				str += " advert.seats between " + search.getSeatsStart() + " and " + search.getSeatsFinish();
				metka = true;
			}else {
				str += " and advert.seats between " + search.getSeatsStart() + "and "+ search.getSeatsFinish();
			}		
		if (search.getId_transmission() >0 )
			if (metka == false) {
				str += " advert.id_transmission like " + search.getId_transmission();
				metka = true;
			}else {
				str += " and advert.id_transmissionts like " + search.getId_transmission();
			}		
		if (search.getId_body() >0 )
			if (metka == false) {
				str += " advert.id_body like " + search.getId_body();
				metka = true;
			}else {
				str += " and advert.id_body like " + search.getId_body();
			}
		if (search.getId_drive() >0 )
			if (metka == false) {
				str += " advert.id_drive like " + search.getId_drive();
				metka = true;
			}else {
				str += " and advert.id_drive like " + search.getId_drive();
			}
		if (search.getId_engine() >0 )
			if (metka == false) {
				str += " advert.id_engine like " + search.getId_engine();
				metka = true;
			}else {
				str += " and advert.id_engine like " + search.getId_engine();
			}
		if (search.getId_fuel() >0 )
			if (metka == false) {
				str += " advert.id_fuel like " + search.getId_fuel();
				metka = true;
			}else {
				str += " and advert.id_fuel like " + search.getId_fuel();
			}
		if (search.getCenaStart() >0 && search.getCenaFinish() > 0)
			if (metka == false) {
				str += " advert.cena between " + search.getCenaStart() + " and " +search.getCenaFinish();
				metka = true;
			}else {
				str += " and advert.cena between " + search.getCenaStart() + " and " + search.getCenaFinish();
			}
		
		System.out.println("SQL : " + str);
		Query query = sessionFactory.getCurrentSession().createSQLQuery(str);
		
		List result = query.list();
		return result;
	}
}
