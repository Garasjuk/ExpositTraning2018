package ru.site.spring.dao;

import java.util.List;

import ru.site.spring.model.About;
import ru.site.spring.model.Search;

public interface SearchDao {
	List getSearch(Search search);
}
