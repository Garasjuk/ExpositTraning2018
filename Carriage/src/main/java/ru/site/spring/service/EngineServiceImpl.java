package ru.site.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.EngineDao;


@Service("engineService")
public class EngineServiceImpl implements EngineService {

	@Autowired
	private EngineDao engineDao;

	@Override
	public List getAllEngine() {
		return engineDao.getAllEngine();
	}

}
