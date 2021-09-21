package com.shop.app.modules.catalog.category.service;

import java.util.List;

import com.shop.app.modules.catalog.category.model.Category;
import com.shop.app.modules.catalog.category.model.CategoryDto;



public interface CategoryService {
    List<CategoryDto> getAllCategory();
    CategoryDto getCategory(Long id);
    CategoryDto updateCategory(Long id, Category category);
    Category createCategory( CategoryDto categoryDto);
    String deleteCategory(Long id);
    CategoryDto getCategoryTemplate();
}
