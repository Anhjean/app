package com.shop.app.modules.catalog.category.controller;

import java.io.Serializable;
import java.util.Optional;

import com.shop.app.modules.catalog.category.model.Category;
import com.shop.app.modules.catalog.category.model.CategoryDto;
import com.shop.app.modules.catalog.category.service.CategoryServiceImpl;
import com.shop.app.security.RequestAuthorization;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

/**
 * @author Jean 
 */
@Slf4j
@RestController
@RequestMapping("/api/categories")
public class CategoryController  implements Serializable{
    @Autowired
    CategoryServiceImpl categoryServiceImpl;

    @RequestAuthorization
    @RequestMapping(value = "", method = RequestMethod.GET)
    public ResponseEntity<Object> getAllCategory() {
        log.info("getAllCategory() method call...");
        return new ResponseEntity<>(categoryServiceImpl.getAllCategory(),HttpStatus.OK);
    }

    
    @RequestMapping(value = "/template", method = RequestMethod.GET)
    public ResponseEntity<Object> getCategoryTempalate() {
        log.info("getCategoryTempalate() method call...");
        return new ResponseEntity<>(categoryServiceImpl.getCategoryTemplate(),HttpStatus.OK);
    }

    @RequestMapping(value = "/{Id}", method = RequestMethod.GET)
    public ResponseEntity<Object> getCategory(@PathVariable Long Id ) {
        log.info("getCategory({}) method call...",Id);
        CategoryDto getCategory = categoryServiceImpl.getCategory(Id);
        return new ResponseEntity<>((getCategory == null)? "Not found":getCategory,HttpStatus.OK);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateCategory(@PathVariable Long id, @RequestBody Category Category ) {
        log.info("updateCategory({}) method call...",id);
        CategoryDto updatedCategory = categoryServiceImpl.updateCategory(id,Category);
        return new ResponseEntity<>((updatedCategory == null) ? "Not found" : updatedCategory,HttpStatus.OK);
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public ResponseEntity<Object> createCategory(@RequestBody CategoryDto Categorydto ) {
        log.info("createCategory() method call...");
        return new ResponseEntity<>(categoryServiceImpl.createCategory(Categorydto),HttpStatus.OK);
    }

    @RequestMapping(value = "/{Id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteCategory(@PathVariable Long Id ) {
        log.info("deleteCategory() method call...");
        return new ResponseEntity<>(categoryServiceImpl.deleteCategory(Id),HttpStatus.OK);
    }
    
}
