package ru.site.spring.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import ru.site.spring.model.Advert;
import ru.site.spring.model.Body;
import ru.site.spring.model.Category;
import ru.site.spring.model.User;

@Transactional
@Repository
public class AdvertDaoImpl implements AdvertDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List getAllAdvert() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT advert.id as '0', advert.id_marka as '1', marka.marka as '2', advert.id_model as '3', model.model as '4',"
				+ "advert.year_of_issue as '5', advert.gov_number as '6', advert.mileage as '7', advert.seats as '8', advert.latitude as '9', advert.id_transmission as '10',"
				+ "transmission.transmission as '11', advert.id_body as '12', body.body as '13', advert.id_drive as '14', drive.drive as '15', advert.id_engine as '16',"
				+ "engine.engine as '17', advert.id_fuel as '18', fuel.fuel as '19', advert.consumption as '20', advert.damage as '21', advert.accessory as '22', advert.insurance as '23',"
				+ "advert.cena as '24', advert.text as '25', advert.date_registration as '26', advert.active as '27', advert.id_user as '28', advert.longitude as '29' "
				+ "FROM (((((model INNER JOIN (advert INNER JOIN marka ON advert.id_marka = marka.id) ON (advert.id_model = model.id) AND (model.id_marka = marka.id)) "
				+ "INNER JOIN transmission ON advert.id_transmission = transmission.id) "
				+ "INNER JOIN body ON advert.id_body = body.id) "
				+ "INNER JOIN drive ON advert.id_drive = drive.id) "
				+ "INNER JOIN engine ON advert.id_engine = engine.id) "
				+ "INNER JOIN fuel ON advert.id_fuel = fuel.id ");
		
		List result = query.list();
		return result;
	}

	@Override
	public List findById(int id) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT advert.id as '0', advert.id_marka as '1', marka.marka as '2', advert.id_model as '3', model.model as '4',"
				+ "advert.year_of_issue as '5', advert.gov_number as '6', advert.mileage as '7', advert.seats as '8', advert.latitude as '9', advert.id_transmission as '10',"
				+ "transmission.transmission as '11', advert.id_body as '12', body.body as '13', advert.id_drive as '14', drive.drive as '15', advert.id_engine as '16',"
				+ "engine.engine as '17', advert.id_fuel as '18', fuel.fuel as '19', advert.consumption as '20', advert.damage as '21', advert.accessory as '22', advert.insurance as '23',"
				+ "advert.cena as '24', advert.text as '25', advert.date_registration as '26', advert.id_user as '27', advert.longitude as '28' "
				+ "FROM (((((model INNER JOIN (advert INNER JOIN marka ON advert.id_marka = marka.id) ON (advert.id_model = model.id) AND (model.id_marka = marka.id)) "
				+ "INNER JOIN transmission ON advert.id_transmission = transmission.id) INNER JOIN body ON advert.id_body = body.id) INNER JOIN drive ON advert.id_drive = drive.id) "
				+ "INNER JOIN engine ON advert.id_engine = engine.id) INNER JOIN fuel ON advert.id_fuel = fuel.id "
				+ "WHERE advert.id_model like ? ");
		query.setInteger(0, id);
		List result = query.list();
		return result;
	}

	@Override
	public void updateAdvert(Advert advert) {
		sessionFactory.getCurrentSession().update(advert);
	}

	@Override
	public void saveAdvert(Advert advert) {
		sessionFactory.getCurrentSession().save(advert);
	}

	@Override
	public int countNewAdvert() {
		return ((Number) sessionFactory.getCurrentSession().createSQLQuery("SELECT count(id) FROM advert WHERE active like ? ").setInteger(0, 0).uniqueResult()).intValue(); 
	}

	@Override
	public List getNewAdvert() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT advert.id as '0', advert.id_marka as '1', marka.marka as '2', advert.id_model as '3', model.model as '4',"
				+ "advert.year_of_issue as '5', advert.gov_number as '6', advert.mileage as '7', advert.seats as '8', advert.latitude as '9', advert.id_transmission as '10',"
				+ "transmission.transmission as '11', advert.id_body as '12', body.body as '13', advert.id_drive as '14', drive.drive as '15', advert.id_engine as '16',"
				+ "engine.engine as '17', advert.id_fuel as '18', fuel.fuel as '19', advert.consumption as '20', advert.damage as '21', advert.accessory as '22', advert.insurance as '23',"
				+ "advert.cena as '24', advert.text as '25', advert.date_registration as '26', advert.id_user as '27', advert.longitude as '28'"
				+ "FROM (((((model INNER JOIN (advert INNER JOIN marka ON advert.id_marka = marka.id) ON (advert.id_model = model.id) AND (model.id_marka = marka.id)) "
				+ "INNER JOIN transmission ON advert.id_transmission = transmission.id) INNER JOIN body ON advert.id_body = body.id) INNER JOIN drive ON advert.id_drive = drive.id) "
				+ "INNER JOIN engine ON advert.id_engine = engine.id) INNER JOIN fuel ON advert.id_fuel = fuel.id "
				+ "WHERE advert.active like ? ");
		query.setInteger(0, 0);
		List result = query.list();
		return result;
	}

	@Override
	public List getAllPhoto() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT photo.id as '0', photo.id_advert as '1', photo.photo as '2' FROM photo ");
		List result = query.list();
		return result;
	}

	@Override
	public void updateActiveAdvert(long id) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("UPDATE advert SET active = ? WHERE id = ?");
		query.setInteger(0, 1);
		query.setLong(1, id);
		query.executeUpdate();
	}

	@Override
	public void deleteAdvertById(long id) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("DELETE FROM advert WHERE id = ?");
		query.setLong(0, id);
		query.executeUpdate();
	}

	@Override
	public List<Advert> getEveryAdvert() {
		  List<Advert> list = (List<Advert>) sessionFactory.getCurrentSession().createQuery("from Advert").list();
		  return list;
	}

}
