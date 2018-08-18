package ru.site.spring.dao;

import ru.site.spring.model.About;

public interface AboutDao {
	About getAllAbout();
	void updateAbout(About abuout);
}
