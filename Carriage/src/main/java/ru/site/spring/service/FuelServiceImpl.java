package ru.site.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.FuelDao;

@Service("fuelService")
public class FuelServiceImpl implements FuelService {

	@Autowired
	private FuelDao fuelDao;

	@Override
	public List getAllFuel() {
		return fuelDao.getAllFuel();
	}

}
