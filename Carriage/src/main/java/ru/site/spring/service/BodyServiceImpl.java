package ru.site.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.BodyDao;

@Service("bodyService")
public class BodyServiceImpl implements BodyService {

	@Autowired
	private BodyDao bodyDao;

	@Override
	public List getAllBody() {
		return bodyDao.getAllBody();
	}

}
