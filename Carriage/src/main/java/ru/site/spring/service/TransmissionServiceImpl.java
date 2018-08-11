package ru.site.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.TransmissionDao;

@Service("transmissionService")
public class TransmissionServiceImpl implements TransmissionService {

	@Autowired
	private TransmissionDao transmissionDao;

	@Override
	public List getAllTransmission() {
		return transmissionDao.getAllTransmission();
	}

}
