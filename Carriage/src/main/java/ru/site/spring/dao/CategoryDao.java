package ru.site.spring.dao;

import java.util.List;

import ru.site.spring.model.Category;

public interface CategoryDao {
	List<Category> getAllCategory();
	Category findById(long id);
	void updateCategory(Category category);

}
