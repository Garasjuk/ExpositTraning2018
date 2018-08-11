package ru.site.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.DriveDao;

@Service("driveService")
public class DriveServiceImpl implements DriveService {

	@Autowired
	private DriveDao drivetDao;

	@Override
	public List getAllDrive() {
		return drivetDao.getAllDrive();
	}

}
