package com.shop.app.modules.catalog.product.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
// import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;
// import com.fasterxml.jackson.annotation.JsonIgnore;
import com.shop.app.modules.core.model.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;


@Entity
@Table(name = "tbl_product_name", indexes = {
    @Index(name = "id_lang", columnList ="id_lang"),
    @Index(name = "p_name", columnList ="p_name")
})
@Data
@EqualsAndHashCode(callSuper = false)
public class ProductName extends BaseEntity{
    @Column(name = "id_lang")
    private Long langId = 1L;

    @JsonIgnore // must use JsonIgnore to obmit this property when query with product
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_product", nullable = false)
    private Product product;

    @Lob
    @Size (max = 4000)
    @Column(name = "p_description", columnDefinition = "TEXT")
    private  String description = "";

    @Lob
    @Size (max = 1000)
    @Column(name = "p_description_short", columnDefinition = "TEXT")
    private  String descriptionShort ="";

    
    @Size (max = 128)
    @Column(name = "p_link_rewrite")
    private  String linkRewrite ="";

    @Size (max = 512)
    @Column(name = "meta_description")
    private  String metaDescription ="";

    @Size (max = 255)
    @Column(name = "meta_keywords")
    private  String metaKeywords ="";

    @Size (max = 128)
    @Column(name = "meta_title")
    private  String metaTitle ="";

    @Size (max = 128)
    @Column(name = "p_name")
    private  String productName ="";

    public ProductName update(ProductName newProductName){
        this.langId = newProductName.getLangId();
        this.description = newProductName.getDescription();
        this.descriptionShort = newProductName.getDescriptionShort();
        this.linkRewrite = newProductName.getLinkRewrite();
        this.metaDescription = newProductName.getMetaDescription();
        this.metaKeywords = newProductName.getMetaKeywords();
        this.metaTitle = newProductName.getMetaTitle();
        this.productName = newProductName.getProductName();
        return this;
    }

    @PrePersist
    private void setDefaultValue(){
        if (this.isNew()){
            this.langId = (long) 1;
        }
    }

}
