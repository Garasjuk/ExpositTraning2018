package ru.site.spring.dao;

import java.util.List;

import ru.site.spring.model.Advert;

public interface AdvertDao {
	List<Advert> getAllAdvert();
	List<Advert> getEveryAdvert();
	List getNewAdvert();
	List getAllPhoto();
	List findById(int id);
	void updateAdvert(Advert advert);
	void saveAdvert(Advert advert);
	int countNewAdvert();
	void updateActiveAdvert(long id);
	void deleteAdvertById(long id);

}
