package com.shop.app.modules.catalog.product.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import com.shop.app.modules.core.model.BaseEntity;


import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "tbl_attribute")
@Data
@EqualsAndHashCode(callSuper = false)
public class ProductAttribute extends BaseEntity {

    
    @Column(name = "att_codetype", nullable = true)
    private int attCodeType;

    @Size(max=255)
    @Column(name="att_type", nullable = true)
    private String atttype;

    @Size(max=255)
    @Column(name="att_name", nullable = true)
    private String attName;

    /* Price properties */

    @Column(name = "price", precision = 20, scale = 6)
    private double price; // Giá bản lẻ

    @Column(name = "price_wholesale",  precision = 20, scale = 6)
    private double wholesalePrice; // giá bán sỉ

    @Column(name = "price_unit_ratio", precision = 20, scale = 6)
    private double unitPriceRatio; // tỷ trọng giá sỉ và giá lẻ

    @Column(name = "is_use_att_price", nullable = true)
    private boolean isUseAttPrice;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "tbl_attribute_product", //Tạo ra một join Table tên là "address_person"
            joinColumns = @JoinColumn(name = "id_attribute", referencedColumnName = "id"),  // TRong đó, khóa ngoại chính là id_categoryd trỏ tới class hiện tại (ProductAtrribute)
            inverseJoinColumns = @JoinColumn(name = "id_product", referencedColumnName = "id")) //Khóa ngoại thứ 2 trỏ tới thuộc tính ở dưới (Products)
    private List<Product> products;

    @PrePersist
    private void setDefaultValue(){
        if (this.isNew()){
            this.isUseAttPrice = false;
        }
    };
}
