package ru.site.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.site.spring.dao.AboutDao;
import ru.site.spring.dao.SearchDao;
import ru.site.spring.model.About;
import ru.site.spring.model.Search;

@Service("searchService")
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao searchDao;

	@Override
	public List getSearch(Search search) {
		return searchDao.getSearch(search);
	}
	
}
