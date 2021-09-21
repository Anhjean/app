package com.shop.app.modules.core.constant.enums;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter(autoApply = true)
public class ProductConditionConverter implements AttributeConverter<ProductCondition, String>{
    @Override
    public String convertToDatabaseColumn(ProductCondition attribute) {
        switch (attribute) {
            case  NEW:
                return "new";
            case USED:
                return "used";
            case REFURBISHED:
                return "refurdbish";
            default:
                throw new IllegalArgumentException("Unknown" + attribute);
        }
    }
 
    @Override
    public ProductCondition convertToEntityAttribute(String dbData) {
        switch (dbData) {
            case "new":
                return ProductCondition.NEW;
            case "used":
                return ProductCondition.USED;
            case "refurdbish":
                return ProductCondition.REFURBISHED;
            default:
                throw new IllegalArgumentException("Unknown" + dbData);
        }
    }
}
