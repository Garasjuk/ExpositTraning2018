package ru.site.spring.service;

import ru.site.spring.model.About;

public interface AboutService {
	 
	About getAllAbout(); 
	void updateAbout(About about);
}
