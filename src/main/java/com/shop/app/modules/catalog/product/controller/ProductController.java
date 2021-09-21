package com.shop.app.modules.catalog.product.controller;

import com.shop.app.modules.catalog.product.model.Product;
import com.shop.app.modules.catalog.product.service.ProductServiceImpl;
import com.shop.app.security.RequestAuthorization;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import java.io.Serializable;
import java.util.Optional;

/**
 * @author Jean 
 */
@Slf4j
@RestController
@RequestMapping("/api/products")
public class ProductController implements Serializable {

    @Autowired
    ProductServiceImpl  productServiceImpl;

    @RequestAuthorization
    @RequestMapping(value = "", method = RequestMethod.GET)
    public ResponseEntity<Object> getAllProduct() {
        log.info("getAllProduct() method call...");
        return new ResponseEntity<>(productServiceImpl.getAllProduct(),HttpStatus.OK);
    }

    
    @RequestMapping(value = "/template", method = RequestMethod.GET)
    public ResponseEntity<Object> getProductTempalate() {
        log.info("getProductTempalate() method call...");
        return new ResponseEntity<>(productServiceImpl.getProductTempalate(),HttpStatus.OK);
    }

    @RequestMapping(value = "/{Id}", method = RequestMethod.GET)
    public ResponseEntity<Object> getProduct(@PathVariable Long Id ) {
        log.info("getProduct({}) method call...",Id);
        Optional<Product> getProduct = productServiceImpl.getProduct(Id);
        return new ResponseEntity<>((getProduct == null)? "Not found":getProduct,HttpStatus.OK);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateProduct(@PathVariable Long id, @RequestBody Product product ) {
        log.info("updateProduct({}) method call...",id);
        Optional<Product> updatedProduct = productServiceImpl.updateProduct(id,product);
        return new ResponseEntity<>((updatedProduct == null) ? "Not found" : updatedProduct,HttpStatus.OK);
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public ResponseEntity<Object> createProduct(@RequestBody Product product ) {
        log.info("createProduct() method call...");
        return new ResponseEntity<>(productServiceImpl.createProduct(product),HttpStatus.OK);
    }

    @RequestMapping(value = "/{Id}", method = RequestMethod.DELETE)
    public ResponseEntity<Object> deleteProduct(@PathVariable Long Id ) {
        log.info("deleteProduct() method call...");
        return new ResponseEntity<>(productServiceImpl.deleteProduct(Id),HttpStatus.OK);
    }

}
