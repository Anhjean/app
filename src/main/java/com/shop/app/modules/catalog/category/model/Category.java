package com.shop.app.modules.catalog.category.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.shop.app.modules.core.model.AbstractAuditClass;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.shop.app.modules.catalog.product.model.Product;

// import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Entity
@Table(name = "tbl_category", indexes = { @Index(name = "position", columnList = "position"),
        @Index(name = "hierarchy", columnList = "hierarchy") }, uniqueConstraints = {
                @UniqueConstraint(columnNames = { "category_name" }, name = "category"),
// @UniqueConstraint(columnNames = { "external_id" }, name = "cat_externalid")
})
@Data
@EqualsAndHashCode(callSuper = false)
public class Category extends AbstractAuditClass {

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id")
    private List<Category> children = new ArrayList<>();

    @JsonInclude(Include.NON_NULL)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id")
    private Category parent;

    @Column(name = " hierarchy")
    private String hierarchy = ".";

    @Column(name = "category_name")
    private String categoryName;

    @Column(name = "position")
    private int position = 1;

    @Column(name = "is_active")
    private boolean isActive = false;

    @Column(name = "is_root_category")
    private boolean isRootCategory = false;

    @JsonIgnore
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    // Quan hệ n-n với đối tượng ở dưới (Person) (1 địa điểm có nhiều người ở)
    @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
    @ToString.Exclude // Không sử dụng trong toString()
    @JoinTable(name = "tbl_category_product", // Tạo ra một join Table tên là "address_person"
            // TRong đó, khóa ngoại chính là address_id trỏ tới classhiện tại (Address)
            joinColumns = @JoinColumn(name = "id_category", referencedColumnName = "id"),
            // Khóa ngoại thứ 2 trỏ tới thuộc tính ở dưới (Person)
            inverseJoinColumns = @JoinColumn(name = "id_product", referencedColumnName = "id"))
    private List<Product> products = new ArrayList<>();

    /**
     * Constructor If use the custom Contructor when use @Data --> must define the
     * default constructor public Category(){}; first
     */
    public Category() {
    };

    public Category(CategoryDto categoryDto, Category parent) {
        this.parent = parent;
        this.parent.children.add(this);
        this.products = null;
        this.position = categoryDto.getPosition();
        this.categoryName = categoryDto.getCategoryName();
        // return this;
    }

    public Category(CategoryDto categoryDto) {
        this.position = categoryDto.getPosition();
        this.categoryName = categoryDto.getCategoryName();
        // return this;
    }

    public Category update(Category newValue) {
        this.children = newValue.getChildren();
        this.parent = newValue.getParent();
        this.position = newValue.getPosition();
        this.isActive = newValue.isActive();
        this.isRootCategory = newValue.isRootCategory();
        this.categoryName = newValue.getCategoryName();
        generateHierarchy();
        return this;
    }

    public void generateHierarchy() {

        if (this.parent != null) {
            this.hierarchy = this.parent.getHierarchy() + this.getId() + ".";
        } else {
            this.hierarchy = this.getId() + ".";
        }
    }

}
