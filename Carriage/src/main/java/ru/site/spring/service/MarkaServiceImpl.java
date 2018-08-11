package ru.site.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.MarkaDao;

@Service("markaService")
public class MarkaServiceImpl implements MarkaService {

	@Autowired
	private MarkaDao markaDao;

	@Override
	public List getAllMarka() {
		return markaDao.getAllMarka();
	}

}
