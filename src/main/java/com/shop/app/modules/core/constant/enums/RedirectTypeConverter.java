package com.shop.app.modules.core.constant.enums;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter(autoApply = true)
public class RedirectTypeConverter implements AttributeConverter<RedirectType, Integer>{
    
    @Override
    public Integer convertToDatabaseColumn(RedirectType attribute) {
        switch (attribute) {
            case  NOT_FOUND_PAGE:
                return 0;
            case PRODUCT_PAGE:
                return 1;
            case CATEGORY_PAGE:
                return 2;
            default:
                throw new IllegalArgumentException("Unknown" + attribute);
        }
    }
 
    @Override
    public RedirectType convertToEntityAttribute(Integer dbData) {
        switch (dbData) {
            case 0:
                return RedirectType.NOT_FOUND_PAGE;
            case 1:
                return RedirectType.PRODUCT_PAGE;
            case 2:
                return RedirectType.CATEGORY_PAGE;
            default:
                throw new IllegalArgumentException("Unknown" + dbData);
        }
    }
}
