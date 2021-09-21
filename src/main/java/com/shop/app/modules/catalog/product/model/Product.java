package com.shop.app.modules.catalog.product.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import com.shop.app.modules.catalog.category.model.Category;

import javax.persistence.Index;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author Jean With @DynamicUpdate, the entity only update the changes field,
 *         but there can be performance payback So need to consider.
 */
@Entity
@Table(name = "tbl_product", indexes = { @Index(name = "reference_idx", columnList = "p_reference"),
        @Index(name = "supplier_reference_idx", columnList = "s_supplier_reference"),
        @Index(name = "product_supplier_idx", columnList = "id_supplier"),
        @Index(name = "product_manufacturer_idx", columnList = "id_manufacturer"),
        @Index(name = "id_shop_default_idx", columnList = "id_shop_default"),
        @Index(name = "id_tax_rules_group_idx", columnList = "id_tax_rules_group") })
@Data
@EqualsAndHashCode(callSuper = false)
public class Product extends ProductBaseAttribute {

    @Column(name = "id_supplier")
    private int supplierId;
    @Column(name = "id_manufacturer")
    private int manufacturerId;

    // mappedBy trỏ tới tên biến persons ở trong Address.
    @ManyToMany(mappedBy = "products",fetch = FetchType.LAZY)
    // LAZY để tránh việc truy xuất dữ liệu không cần thiết. Lúc nào cần thì mới query
    @EqualsAndHashCode.Exclude
    private List<Category> category;

     // mappedBy trỏ tới tên biến persons ở trong Address.
    @ManyToMany(mappedBy = "products",fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude
     // LAZY để tránh việc truy xuất dữ liệu không cần thiết. Lúc nào cần thì mới query
    private List<ProductAttribute> attribute;

    @Column(name = "id_shop_default", nullable = true)
    private int shopDefaultId;

    @Column(name = "id_tax_rules_group", nullable = true)
    private int taxRulesGroupId;

    /* product name */
    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<ProductName> productName;

    /*  product properties */
    // @Column(name = "pv_uploadable_files")
    // private int uploadableFiles;

    // @Column(name = "pv_text_fields")
    // private int textFields;

    // // @Convert(converter = RedirectTypeConverter.class)
    // @Column(name = "pv_redirect_type")
    // private int redirectType;

    // @Column(name = "pv_id_type_redirected")
    // private int idTypeRedirected;

    // @Column(name = "pv_cache_default_attribute")
    // private int cacheDefaultAttribute;

    /* Initial Pricing */

    @Column(name = "price_additional_shipping_cost", nullable = false, precision = 20, scale = 6)
    private double additionalShippingCost = 0;

    @Size(max = 12)
    @Column(name = "visibility", nullable = false) // enum('both','catalog','search','none')
    private String visibility = "none";

    /* Initial Stock properties */
    @Column(name = "s_quantity", nullable = false)
    private double quantity = 0; // Tổng số lượng hàng còn tồn

    @Column(name = "s_out_of_stock", nullable = false)
    private int outOfStock = 0;

    @Size(max = 255)
    @Column(name = "s_supplier_reference")
    private String supplierReference =""; // Dùng để làm từ khóa tìm kiếm kiểu Json

    /* Checking value */
    @Column(name = "is_on_sale", nullable = false)
    private boolean isOnSale = false;
    @Column(name = "is_online_only", nullable = false)
    private boolean isOnlineOnly = false;

    @Column(name = "is_additional_delivery_times")
    private boolean isAdditionalDeliveryTimes =false;

    @Column(name = "is_quantity_discount", nullable = false)
    private boolean isQuantityDiscount =false;

    @Column(name = "is_customizable", nullable = false)
    private boolean isCustomizable =false;

    @Column(name = "is_active", nullable = false)
    private boolean isActive = false;

    @Column(name = "is_show_condition", nullable = false)
    private boolean isShowCondition =false;

    @Column(name = "is_available_for_order", nullable = false)
    private boolean isAvailableForOrder =false;

    @Column(name = "is_indexed", nullable = false)
    private boolean isIndexed =false;

    @Column(name = "cache_is_pack", nullable = false)
    private boolean cacheIsPack = false;

    @Column(name = "cache_has_attachments", nullable = false)
    private boolean cacheHasAttachments = false;

    @Column(name = "is_show_price", nullable = false)
    private boolean isShowPrice = false;

    @Column(name = "is_virtual", nullable = false)
    private boolean isVirtual = false;

    @Column(name = "is_advanced_stock_management", nullable = false)
    private boolean isAdvancedStockManagement = false;


    public Product update(Product newValue) {
        this.setSupplierId(newValue.getSupplierId());
        this.setManufacturerId(newValue.getManufacturerId());
        this.setCategory(newValue.getCategory());
        this.setShopDefaultId(newValue.getShopDefaultId());
        this.setTaxRulesGroupId(newValue.getTaxRulesGroupId());
        // this.setUploadableFiles(newValue.getUploadableFiles());
        // this.setTextFields(newValue.getTextFields());
        // this.setRedirectType(newValue.getRedirectType());
        // this.setIdTypeRedirected(newValue.getIdTypeRedirected());
        // this.setCacheDefaultAttribute(newValue.getCacheDefaultAttribute());
        this.setAdditionalShippingCost(newValue.getAdditionalShippingCost());
        this.setVisibility((newValue.getVisibility() == null ? "none" : newValue.getVisibility()));
        this.setQuantity(newValue.getQuantity());
        this.setOutOfStock(newValue.getOutOfStock());
        this.setSupplierReference(newValue.getSupplierReference());
        // this.setOnSale(newValue.isOnSale());
        // this.setOnlineOnly(newValue.isOnlineOnly());
        // this.setAdditionalDeliveryTimes(newValue.isAdditionalDeliveryTimes());
        // this.setQuantityDiscount(newValue.isQuantityDiscount());
        // this.setCustomizable(newValue.isCustomizable());
        // this.setActive(newValue.isActive());
        // this.setShowCondition(newValue.isShowCondition());
        // this.setAvailableForOrder(newValue.isAvailableForOrder);
        // this.setIndexed(newValue.isIndexed);
        // this.setCacheIsPack(newValue.cacheIsPack);
        // this.setCacheHasAttachments(newValue.cacheHasAttachments);
        // this.setShowPrice(newValue.isShowPrice);
        // this.setVirtual(newValue.isVirtual);
        // this.setAdvancedStockManagement(newValue.isAdvancedStockManagement);
        // Produc Base Attribute

        this.setReference(newValue.getReference());
        this.setLocation(newValue.getLocation());
        this.setMinimalQuantity(newValue.getMinimalQuantity());
        this.setLowStockThreshold(newValue.getLowStockThreshold());
        this.setLowStockAlert(newValue.isLowStockAlert());
        this.setAvailable_date(newValue.getAvailable_date());
        this.setEan13(newValue.getEan13());
        this.setIsbn(newValue.getIsbn());
        this.setUpc(newValue.getUpc());
        this.setMpn(newValue.getMpn());
        this.setEcoTax(newValue.getEcoTax());
        this.setPrice(newValue.getPrice());
        this.setWholesalePrice(newValue.getWholesalePrice());
        this.setUnitPriceRatio(newValue.getUnitPriceRatio());
        this.setUnity(newValue.getUnity());
        this.setPackStockType(newValue.getPackStockType());
        this.setCondition(newValue.getCondition());
        this.setWidth(newValue.getWidth());
        this.setHeight(newValue.getHeight());
        this.setDepth(newValue.getDepth());
        this.setWeight(newValue.getWeight());
        this.setLastModifiedDate(new Date().toInstant());
        return this;
    }

}
