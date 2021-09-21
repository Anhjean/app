package com.shop.app.modules.catalog.category.model;

import java.util.ArrayList;
import java.util.List;


import lombok.Data;

@Data
public class CategoryDto {

    private Long id;
    private Long parentId = 1L;
    private String hierarchy = ".";
    private String categoryName = "";
    private int position = 1;
    private boolean isActive = true;
    private boolean isRootCategory = false;
    private List<CategoryDto> childrens = new ArrayList<>();

    public CategoryDto() {
    }

    public CategoryDto(Long id, Long parentId, String hierarchy, String categoryName, int position, boolean isActive,
            boolean isRootCategory) {
        this.id = id;
        this.parentId = parentId;
        this.hierarchy = hierarchy;
        this.categoryName = categoryName;
        this.position = position;
        this.isActive = isActive;
        this.isRootCategory = isRootCategory;
    }

    public CategoryDto(Category category) {
        // CategoryDto child = new CategoryDto();
        this.id = category.getId();

        this.parentId = (category.getParent()==null)?null:category.getParent().getId();
        this.hierarchy = category.getHierarchy();
        this.position = category.getPosition();
        this.isActive = category.isActive();
        this.categoryName = category.getCategoryName();
        this.isRootCategory = category.isRootCategory();
    }

    public CategoryDto(Category category, List<Category> childrenList) {
        this.id = category.getId();
        this.parentId = (category.getParent()==null)?null:category.getParent().getId();
        this.hierarchy = category.getHierarchy();
        this.position = category.getPosition();
        this.isActive = category.isActive();
        this.categoryName = category.getCategoryName();
        this.isRootCategory = category.isRootCategory();
        childrenList.forEach( child ->{
            this.childrens.add(new CategoryDto(child.getId(), child.getParent().getId(), child.getHierarchy(), child.getCategoryName(), child.getPosition(), child.isActive(), child.isRootCategory()));
        });
    }

}
