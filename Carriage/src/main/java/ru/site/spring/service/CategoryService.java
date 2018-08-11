package ru.site.spring.service;

import java.util.List;

import ru.site.spring.model.Category;

public interface CategoryService {
	Category findById(long id);
	void updateCategory(Category category);
	List<Category> getAllCategory(); 
}
