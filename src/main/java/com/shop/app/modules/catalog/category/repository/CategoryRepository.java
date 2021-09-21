package com.shop.app.modules.catalog.category.repository;

import java.util.List;

import com.shop.app.modules.catalog.category.model.Category;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long>{
    @Query(value = "SELECT c.*  " +
                   "FROM tbl_category c " +
                   "WHERE c.parent_id = :parentId " +
                   "ORDER BY c.position", nativeQuery = true)
    List<Category> findByParentId(@Param("parentId") Long parentId);
    
}
