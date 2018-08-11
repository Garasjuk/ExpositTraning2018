package ru.site.spring.service;

import java.util.List;

import ru.site.spring.model.Advert;


public interface AdvertService {
	List findById(int id);
	void updateAdvert(Advert advert);
	void saveAdvert(Advert advert);
	List getAllAdvert(); 
	List <Advert> getEveryAdvert(); 
	List getNewAdvert(); 
	List getAllPhoto(); 
	int countNewAdvert();
	void updateActiveAdvert(long id);
	void deleteAdvertById(long id);
}
