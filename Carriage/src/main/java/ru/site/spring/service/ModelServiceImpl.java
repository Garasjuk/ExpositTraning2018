package ru.site.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.ModelDao;

@Service("modelService")
public class ModelServiceImpl implements ModelService {

	@Autowired
	private ModelDao modelDao;

	@Override
	public List getAllModel() {
		return modelDao.getAllModel();
	}

}
