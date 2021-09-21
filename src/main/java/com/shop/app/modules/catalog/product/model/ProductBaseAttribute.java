package com.shop.app.modules.catalog.product.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
// import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import com.shop.app.modules.core.model.AbstractAuditClass;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@MappedSuperclass
@Table(name = "tbl_product_base_attr")
public abstract class ProductBaseAttribute extends AbstractAuditClass {
    /* Product name */

    @Size(max = 255)
    @Column(name = "p_reference")
    private String reference ; // Dùng để làm từ khóa tìm kiếm kiểu Json

    @Size(max = 64)
    @Column(name = "p_location")
    private String location ; // Vị ví trí nơi cũng cấp sản phẩm

    @Column(name = "p_minimal_quantity", nullable = false) // Số lượng đặt hàng tối thiểu
    private int minimalQuantity =0;

    @Column(name = "p_low_stock_threshold")
    private int lowStockThreshold ;

    @Column(name = "p_is_low_stock_alert", nullable = false)
    private boolean isLowStockAlert = false;

    /* Date value */
    @Column(name = "p_available_date")
    private Date available_date; // Ngày có sản phẩm có thể mua hoặc bán

    /* Product code properties */
    @Size(max = 13)
    @Column(name = "pc_ean13")
    private String ean13;
    @Size(max = 32)
    @Column(name = "pc_isbn")
    private String isbn;
    @Size(max = 12)
    @Column(name = "pc_upc")
    private String upc;
    @Size(max = 40)
    @Column(name = "pc_mpn")
    private String mpn;
    @Column(name = "pc_ecotax", nullable = false, precision = 17, scale = 6)
    private double ecoTax;

    /* Price properties */

    @Column(name = "price", nullable = false, precision = 20, scale = 6)
    private double price = 0; // Giá bản lẻ

    @Column(name = "price_wholesale", nullable = false, precision = 20, scale = 6)
    private double wholesalePrice = 0; // giá bán sỉ

    @Column(name = "price_unit_ratio", nullable = false, precision = 20, scale = 6)
    private double unitPriceRatio = 0; // tỷ trọng giá sỉ và giá lẻ

    /* Product basic properties */
    @Size(max=16)
    @Column(name = "s_unity") // Đơn vị tính ở dạng Integer và dùng bảng phụ để lấy data
    private String unity = "Đơn vị";

    @Column(name = "s_pack_stock_type")
    private int packStockType = 0;
    
    @Size(max=4)
    @Column(name = "s_condition", nullable = false) // enum('new','used','refurbished')
    private String condition = "N";

    // Packacge properties
    @Column(name = "s_package_width", nullable = false, precision = 20, scale = 6)
    private double width = 0;

    @Column(name = "s_package_height", nullable = false, precision = 20, scale = 6)
    private double height = 0;

    @Column(name = "s_package_depth", nullable = false, precision = 20, scale = 6)
    private double depth = 0;

    @Column(name = "s_package_weight", nullable = false, precision = 20, scale = 6)
    private double weight = 0;


}
