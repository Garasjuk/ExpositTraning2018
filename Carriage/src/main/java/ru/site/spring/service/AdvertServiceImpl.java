package ru.site.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.AdvertDao;
import ru.site.spring.model.Advert;

@Service("advertService")
public class AdvertServiceImpl implements AdvertService {

	@Autowired
	private AdvertDao advertDao;

	@Override
	public List findById(int id) {
		return advertDao.findById(id);
	}

	@Override
	public void updateAdvert(Advert advert) {
		advertDao.updateAdvert(advert);
	}

	@Override
	public List getAllAdvert() {
		return advertDao.getAllAdvert();
	}

	public int countNewAdvert() {
		return advertDao.countNewAdvert();
	}

	@Override
	public List getNewAdvert() {
		// TODO Auto-generated method stub
		return advertDao.getNewAdvert();
	}

	@Override
	public List getAllPhoto() {
		// TODO Auto-generated method stub
		return advertDao.getAllPhoto();
	}

	@Override
	public void updateActiveAdvert(long id) {
		advertDao.updateActiveAdvert(id);
		
	}

	@Override
	public void saveAdvert(Advert advert) {
		advertDao.saveAdvert(advert);
		
	}

	@Override
	public void deleteAdvertById(long id) {
		advertDao.deleteAdvertById(id);
	}

	@Override
	public List<Advert> getEveryAdvert() {
		return advertDao.getEveryAdvert();
	}
}
