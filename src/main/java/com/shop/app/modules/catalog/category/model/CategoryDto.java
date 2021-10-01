package com.shop.app.modules.catalog.category.model;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import lombok.Data;

@Data
@JsonInclude(Include.NON_NULL)
public class CategoryDto {

    private Long id;
    private Long parentId;
    private String hierarchy;
    private String categoryName;
    private Integer position;
    private Boolean isActive;
    private Boolean isRootCategory;
    private CategoryDto parentDto;
    private List<CategoryDto> childrens = new ArrayList<>();

    public CategoryDto() {
    }

    public CategoryDto(Long id, String hierarchy, String categoryName, Integer position) {
        this.id = id;
        this.hierarchy = hierarchy;
        this.categoryName = categoryName;
        this.position = position;
    }

    public CategoryDto(Long id, String hierarchy, String categoryName, int position, Boolean isActive,
            Boolean isRootCategory,Category parent, List<Category> childrenList) {
        this.id = id;
        this.hierarchy = hierarchy;
        this.categoryName = categoryName;
        this.position = position;
        this.isActive = isActive;
        this.isRootCategory = isRootCategory;
        if (parent == null) {
            this.parentId = null;
            this.parentDto = null;
        } else {
            this.parentId = parent.getId();
            this.parentDto = new CategoryDto(parent.getId(), parent.getHierarchy(),parent.getCategoryName(), null);
        }
        if(childrenList == null){
        this.childrens = null; //set null to not show in query
        } else{
            childrenList.forEach(child -> {
                this.childrens.add(new CategoryDto(child.getId(), child.getHierarchy(),child.getCategoryName(), child.getPosition()));
            });
        }
    }

    public CategoryDto loadFromEntity(Category category) {
       return new CategoryDto(category.getId(), category.getHierarchy(), category.getCategoryName(), category.getPosition(), 
       category.isActive(),category.isRootCategory(),category.getParent(),null);
    }

    public CategoryDto loadFromEntityWithChildren(Category category, List<Category> childrenList) {
        return new CategoryDto(category.getId(), category.getHierarchy(), category.getCategoryName(), category.getPosition(), 
       category.isActive(),category.isRootCategory(),category.getParent(),childrenList);
    }

}
