package com.shop.app.modules.catalog.product.service;

import com.shop.app.modules.appuser.model.AppUser;
import com.shop.app.modules.appuser.repository.AppUserRepo;
import com.shop.app.modules.catalog.category.model.Category;
import com.shop.app.modules.catalog.product.model.Product;
import com.shop.app.modules.catalog.product.model.ProductAttribute;
import com.shop.app.modules.catalog.product.model.ProductName;
import com.shop.app.modules.catalog.product.repository.ProductNameRepository;
import com.shop.app.modules.catalog.product.repository.ProductRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;
// import java.util.Map;
import java.util.Optional;

/**
 * @author Jean TODO: study more about Transactional annotation
 */
@Slf4j
@Service
@Transactional("tenantTransactionManager")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private AppUserRepo userRepository;

    @Autowired
    private ProductNameRepository productNameRepository;

    @Override

    public List<Product> getAllProduct() {

        return productRepository.findAll();
    }

    @Override
    public Product createProduct(Product productDto) {
        // create new product
        List<ProductName> listName = productDto.getProductName();
        productDto.setProductName(null);
        Product newProduct = new Product();
        newProduct.update(productDto);
        log.info("new product detail {}", newProduct.toString());
        productRepository.save(newProduct);
        log.info("New Product ID {}", newProduct.getId());

        listName.forEach(pName -> {
            pName.setProduct(newProduct);
            productNameRepository.save(pName);
            log.info("---- New Product Name ID {}", newProduct.getId());
        });
        return this.getProduct(newProduct.getId()).get();
        // return productRepository.save(productDto);
    }

    @Override
    public String deleteProduct(Long id) {
        Optional<Product> foundProduct = productRepository.findById(id);
        if (foundProduct.isPresent()) {
            productRepository.deleteById(foundProduct.get().getId());
            return "Item is deleted";
        } else {
            return "Not found";
        }

    }

    @Override
    public Optional<Product> getProduct(Long id) {
        return productRepository.findById(id);
    }

    @Override
    public Optional<Product> updateProduct(Long id, Product product) {
        Optional<Product> foundProduct = productRepository.findById(id);
        // Update the Product Name first
        if (foundProduct.isPresent()) {
            product.getProductName().forEach(pName -> {
                if (pName.getId() == null) {
                    pName.setProduct(foundProduct.get());
                    productNameRepository.save(pName);
                } else {
                    log.info("--- data ----- id {}, Product Name: {}", pName.getId());
                    Optional<ProductName> foundName = productNameRepository.findById(pName.getId());
                    // If Name exists --> update
                    if (foundName.isPresent()) {
                        foundName.get().update(pName);
                        productNameRepository.save(foundName.get());
                    } else { // create news
                        pName.setProduct(foundProduct.get());
                        productNameRepository.save(pName);
                    }
                }
            });
        // Update product Data
            foundProduct.get().update(product);
            this.productRepository.save(foundProduct.get());

            return this.getProduct(id);
        } else {
            return null;
        }
    }

    @Override
    public Product getProductTempalate() {
        Product productTemplate = new Product();
        List<ProductName> listPN = new ArrayList<ProductName>();
        List<ProductAttribute> listAttributes = new ArrayList<ProductAttribute>();
        List<Category> listCategory = new ArrayList<Category>();

        listPN.add(new ProductName());
        listAttributes.add(new ProductAttribute());
        listCategory.add(new Category());
        productTemplate.setProductName(listPN);
        productTemplate.setAttribute(listAttributes);
        productTemplate.setCategory(listCategory);
        return productTemplate;
    }

    public Optional<AppUser> getCurrentAuditor() {
        Optional<AppUser> currentUser;
        final SecurityContext securityContext = SecurityContextHolder.getContext();
        if (securityContext != null) {
            final Authentication authentication = securityContext.getAuthentication();
            if (authentication != null) {
                currentUser = this.userRepository.findByUserName(authentication.getName());// (User)
                                                                                           // authentication.getPrincipal());
            } else {
                currentUser = retrieveSuperUser();
            }
        } else {
            currentUser = retrieveSuperUser();
        }
        return currentUser;
    }

    private Optional<AppUser> retrieveSuperUser() {
        return this.userRepository.findById(Long.valueOf("1"));
    }
}
