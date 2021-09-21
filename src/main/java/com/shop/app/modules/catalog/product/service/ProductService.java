package com.shop.app.modules.catalog.product.service;

import java.util.List;
import java.util.Optional;

import com.shop.app.modules.catalog.product.model.Product;

/**
 * @author Jean
 */
public interface ProductService {

    List<Product> getAllProduct();
    Optional<Product> getProduct(Long id);
    Optional<Product> updateProduct(Long id, Product product);
    Product createProduct(Product product);
    String deleteProduct(Long id);
    Product getProductTempalate();
}
