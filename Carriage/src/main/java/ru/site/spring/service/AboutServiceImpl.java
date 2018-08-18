package ru.site.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.AboutDao;
import ru.site.spring.model.About;

@Service("aboutService")
public class AboutServiceImpl implements AboutService {

	@Autowired
	private AboutDao aboutDao;

	@Override
	public About getAllAbout() {
		return aboutDao.getAllAbout();
	}

	@Override
	public void updateAbout(About about) {
		aboutDao.updateAbout(about);
	}
	
}
