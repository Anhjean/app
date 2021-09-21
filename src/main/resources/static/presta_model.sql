CREATE TABLE "ps_product" (
  "id_product" int4 NOT NULL,
  "id_supplier" int4,
  "id_manufacturer" int4,
  "id_category_default" int4,
  "id_shop_default" int4 NOT NULL,
  "id_tax_rules_group" int4 NOT NULL,
  "on_sale" int2 NOT NULL,
  "online_only" int2 NOT NULL,
  "ean13" varchar(13),
  "isbn" varchar(32),
  "upc" varchar(12),
  "mpn" varchar(40),
  "ecotax" numeric(17,6) NOT NULL,
  "quantity" int4 NOT NULL,
  "minimal_quantity" int4 NOT NULL,
  "low_stock_threshold" int4,
  "low_stock_alert" int2 NOT NULL,
  "price" numeric(20,6) NOT NULL,
  "wholesale_price" numeric(20,6) NOT NULL,
  "unity" varchar(255),
  "unit_price_ratio" numeric(20,6) NOT NULL,
  "additional_shipping_cost" numeric(20,6) NOT NULL,
  "reference" varchar(64),
  "supplier_reference" varchar(64),
  "location" varchar(64),
  "width" numeric(20,6) NOT NULL,
  "height" numeric(20,6) NOT NULL,
  "depth" numeric(20,6) NOT NULL,
  "weight" numeric(20,6) NOT NULL,
  "out_of_stock" int4 NOT NULL,
  "additional_delivery_times" int2 NOT NULL,
  "quantity_discount" int2,
  "customizable" int2 NOT NULL,
  "uploadable_files" int2 NOT NULL,
  "text_fields" int2 NOT NULL,
  "active" int2 NOT NULL,
  "redirect_type" varchar(255) NOT NULL,
  "id_type_redirected" int4 NOT NULL,
  "available_for_order" int2 NOT NULL,
  "available_date" date,
  "show_condition" int2 NOT NULL,
  "condition" varchar(255) NOT NULL,
  "show_price" int2 NOT NULL,
  "indexed" int2 NOT NULL,
  "visibility" varchar(255) NOT NULL,
  "cache_is_pack" int2 NOT NULL,
  "cache_has_attachments" int2 NOT NULL,
  "is_virtual" int2 NOT NULL,
  "cache_default_attribute" int4,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "advanced_stock_management" int2 NOT NULL,
  "pack_stock_type" int4 NOT NULL,
  "state" int4 NOT NULL,
  PRIMARY KEY ("id_product")
);
CREATE INDEX "reference_idx" ON "product" USING btree (
  "reference"
);
CREATE INDEX "supplier_reference_idx" ON "product" USING btree (
  "supplier_reference"
);
CREATE INDEX "product_supplier" ON "product" USING btree (
  "id_supplier"
);
CREATE INDEX "product_manufacturer" ON "product" USING btree (
  "id_manufacturer",
  "id_product"
);
CREATE INDEX "id_category_default" ON "product" USING btree (
  "id_category_default"
);
CREATE INDEX "indexed" ON "product" USING btree (
  "indexed"
);
CREATE INDEX "date_add" ON "product" USING btree (
  "date_add"
);
CREATE INDEX "state" ON "product" USING btree (
  "state",
  "date_upd"
);

CREATE TABLE "ps_access" (
  "id_profile" int4 NOT NULL,
  "id_authorization_role" int4 NOT NULL,
  PRIMARY KEY ("id_profile", "id_authorization_role")
);

CREATE TABLE "ps_accessory" (
  "id_product_1" int4 NOT NULL,
  "id_product_2" int4 NOT NULL
);
CREATE INDEX "accessory_product" ON "ps_accessory" USING btree (
  "id_product_1",
  "id_product_2"
);

CREATE TABLE "ps_address" (
  "id_address" int4 NOT NULL,
  "id_country" int4 NOT NULL,
  "id_state" int4,
  "id_customer" int4 NOT NULL,
  "id_manufacturer" int4 NOT NULL,
  "id_supplier" int4 NOT NULL,
  "id_warehouse" int4 NOT NULL,
  "alias" varchar(32) NOT NULL,
  "company" varchar(255),
  "lastname" varchar(255) NOT NULL,
  "firstname" varchar(255) NOT NULL,
  "address1" varchar(128) NOT NULL,
  "address2" varchar(128),
  "postcode" varchar(12),
  "city" varchar(64) NOT NULL,
  "other" text,
  "phone" varchar(32),
  "phone_mobile" varchar(32),
  "vat_number" varchar(32),
  "dni" varchar(16),
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "active" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  PRIMARY KEY ("id_address")
);
CREATE INDEX "address_customer" ON "ps_address" USING btree (
  "id_customer"
);
CREATE INDEX "id_country" ON "ps_address" USING btree (
  "id_country"
);
CREATE INDEX "id_state" ON "ps_address" USING btree (
  "id_state"
);
CREATE INDEX "id_manufacturer" ON "ps_address" USING btree (
  "id_manufacturer"
);
CREATE INDEX "id_supplier" ON "ps_address" USING btree (
  "id_supplier"
);
CREATE INDEX "id_warehouse" ON "ps_address" USING btree (
  "id_warehouse"
);

CREATE TABLE "ps_address_format" (
  "id_country" int4 NOT NULL,
  "format" varchar(255) NOT NULL,
  PRIMARY KEY ("id_country")
);

CREATE TABLE "ps_admin_filter" (
  "id" int4 NOT NULL,
  "employee" int4 NOT NULL,
  "shop" int4 NOT NULL,
  "controller" varchar(60) NOT NULL,
  "action" varchar(100) NOT NULL,
  "filter" text NOT NULL,
  "filter_id" varchar(191) NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX "admin_filter_search_id_idx" ON "ps_admin_filter" USING btree (
  "employee",
  "shop",
  "controller",
  "action",
  "filter_id"
);

CREATE TABLE "ps_advice" (
  "id_advice" int4 NOT NULL,
  "id_ps_advice" int4 NOT NULL,
  "id_tab" int4 NOT NULL,
  "ids_tab" text,
  "validated" int2 NOT NULL,
  "hide" int2 NOT NULL,
  "location" varchar(255) NOT NULL,
  "selector" varchar(255),
  "start_day" int4 NOT NULL,
  "stop_day" int4 NOT NULL,
  "weight" int4,
  PRIMARY KEY ("id_advice")
);

CREATE TABLE "ps_advice_lang" (
  "id_advice" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "html" text,
  PRIMARY KEY ("id_advice", "id_lang")
);

CREATE TABLE "ps_alias" (
  "id_alias" int4 NOT NULL,
  "alias" varchar(191) NOT NULL,
  "search" varchar(255) NOT NULL,
  "active" int2 NOT NULL,
  PRIMARY KEY ("id_alias")
);
CREATE INDEX "alias" ON "ps_alias" USING btree (
  "alias"
);

CREATE TABLE "ps_attachment" (
  "id_attachment" int4 NOT NULL,
  "file" varchar(40) NOT NULL,
  "file_name" varchar(128) NOT NULL,
  "file_size" int8 NOT NULL,
  "mime" varchar(128) NOT NULL,
  PRIMARY KEY ("id_attachment")
);

CREATE TABLE "ps_attachment_lang" (
  "id_attachment" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(32),
  "description" text,
  PRIMARY KEY ("id_attachment", "id_lang")
);

CREATE TABLE "ps_attribute" (
  "id_attribute" int4 NOT NULL,
  "id_attribute_group" int4 NOT NULL,
  "color" varchar(32) NOT NULL,
  "position" int4 NOT NULL,
  PRIMARY KEY ("id_attribute")
);
CREATE INDEX "attribute_group" ON "ps_attribute" USING btree (
  "id_attribute_group"
);

CREATE TABLE "ps_attribute_group" (
  "id_attribute_group" int4 NOT NULL,
  "is_color_group" int2 NOT NULL,
  "group_type" varchar(255) NOT NULL,
  "position" int4 NOT NULL,
  PRIMARY KEY ("id_attribute_group")
);

CREATE TABLE "ps_attribute_group_lang" (
  "id_attribute_group" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(128) NOT NULL,
  "public_name" varchar(64) NOT NULL,
  PRIMARY KEY ("id_attribute_group", "id_lang")
);
CREATE INDEX "IDX_4653726C67A664FB" ON "ps_attribute_group_lang" USING btree (
  "id_attribute_group"
);
CREATE INDEX "IDX_4653726CBA299860" ON "ps_attribute_group_lang" USING btree (
  "id_lang"
);

CREATE TABLE "ps_attribute_group_shop" (
  "id_attribute_group" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_attribute_group", "id_shop")
);
CREATE INDEX "IDX_DB30BAAC67A664FB" ON "ps_attribute_group_shop" USING btree (
  "id_attribute_group"
);
CREATE INDEX "IDX_DB30BAAC274A50A0" ON "ps_attribute_group_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_attribute_impact" (
  "id_attribute_impact" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "id_attribute" int4 NOT NULL,
  "weight" numeric(20,6) NOT NULL,
  "price" numeric(20,6) NOT NULL,
  PRIMARY KEY ("id_attribute_impact")
);
CREATE INDEX "id_product" ON "ps_attribute_impact" USING btree (
  "id_product",
  "id_attribute"
);

CREATE TABLE "ps_attribute_lang" (
  "id_attribute" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(128) NOT NULL,
  PRIMARY KEY ("id_attribute", "id_lang")
);
CREATE INDEX "IDX_3ABE46A77A4F53DC" ON "ps_attribute_lang" USING btree (
  "id_attribute"
);
CREATE INDEX "IDX_3ABE46A7BA299860" ON "ps_attribute_lang" USING btree (
  "id_lang"
);

CREATE TABLE "ps_attribute_shop" (
  "id_attribute" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_attribute", "id_shop")
);
CREATE INDEX "IDX_A7DD8E677A4F53DC" ON "ps_attribute_shop" USING btree (
  "id_attribute"
);
CREATE INDEX "IDX_A7DD8E67274A50A0" ON "ps_attribute_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_authorization_role" (
  "id_authorization_role" int4 NOT NULL,
  "slug" varchar(191) NOT NULL,
  PRIMARY KEY ("id_authorization_role")
);
CREATE INDEX "slug" ON "ps_authorization_role" USING btree (
  "slug"
);

CREATE TABLE "ps_badge" (
  "id_badge" int4 NOT NULL,
  "id_ps_badge" int4 NOT NULL,
  "type" varchar(32) NOT NULL,
  "id_group" int4 NOT NULL,
  "group_position" int4 NOT NULL,
  "scoring" int4 NOT NULL,
  "awb" int4,
  "validated" int2 NOT NULL,
  PRIMARY KEY ("id_badge")
);

CREATE TABLE "ps_badge_lang" (
  "id_badge" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(64),
  "description" varchar(255),
  "group_name" varchar(255),
  PRIMARY KEY ("id_badge", "id_lang")
);

CREATE TABLE "ps_carrier" (
  "id_carrier" int4 NOT NULL,
  "id_reference" int4 NOT NULL,
  "id_tax_rules_group" int4,
  "name" varchar(64) NOT NULL,
  "url" varchar(255),
  "active" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  "shipping_handling" int2 NOT NULL,
  "range_behavior" int2 NOT NULL,
  "is_module" int2 NOT NULL,
  "is_free" int2 NOT NULL,
  "shipping_external" int2 NOT NULL,
  "need_range" int2 NOT NULL,
  "external_module_name" varchar(64),
  "shipping_method" int4 NOT NULL,
  "position" int4 NOT NULL,
  "max_width" int4,
  "max_height" int4,
  "max_depth" int4,
  "max_weight" numeric(20,6),
  "grade" int4,
  PRIMARY KEY ("id_carrier")
);
CREATE INDEX "deleted" ON "ps_carrier" USING btree (
  "deleted",
  "active"
);
CREATE INDEX "id_tax_rules_group" ON "ps_carrier" USING btree (
  "id_tax_rules_group"
);
CREATE INDEX "reference" ON "ps_carrier" USING btree (
  "id_reference",
  "deleted",
  "active"
);

CREATE TABLE "ps_carrier_group" (
  "id_carrier" int4 NOT NULL,
  "id_group" int4 NOT NULL,
  PRIMARY KEY ("id_carrier", "id_group")
);

CREATE TABLE "ps_carrier_lang" (
  "id_carrier" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "delay" varchar(512),
  PRIMARY KEY ("id_lang", "id_shop", "id_carrier")
);

CREATE TABLE "ps_carrier_shop" (
  "id_carrier" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_carrier", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_carrier_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_carrier_tax_rules_group_shop" (
  "id_carrier" int4 NOT NULL,
  "id_tax_rules_group" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_carrier", "id_tax_rules_group", "id_shop")
);

CREATE TABLE "ps_carrier_zone" (
  "id_carrier" int4 NOT NULL,
  "id_zone" int4 NOT NULL,
  PRIMARY KEY ("id_carrier", "id_zone")
);

CREATE TABLE "ps_cart" (
  "id_cart" int4 NOT NULL,
  "id_shop_group" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_carrier" int4 NOT NULL,
  "delivery_option" text NOT NULL,
  "id_lang" int4 NOT NULL,
  "id_address_delivery" int4 NOT NULL,
  "id_address_invoice" int4 NOT NULL,
  "id_currency" int4 NOT NULL,
  "id_customer" int4 NOT NULL,
  "id_guest" int4 NOT NULL,
  "secure_key" varchar(32) NOT NULL,
  "recyclable" int2 NOT NULL,
  "gift" int2 NOT NULL,
  "gift_message" text,
  "mobile_theme" int2 NOT NULL,
  "allow_seperated_package" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "checkout_session_data" text,
  PRIMARY KEY ("id_cart")
);
CREATE INDEX "cart_customer" ON "ps_cart" USING btree (
  "id_customer"
);
CREATE INDEX "id_address_delivery" ON "ps_cart" USING btree (
  "id_address_delivery"
);
CREATE INDEX "id_address_invoice" ON "ps_cart" USING btree (
  "id_address_invoice"
);
CREATE INDEX "id_carrier" ON "ps_cart" USING btree (
  "id_carrier"
);
CREATE INDEX "id_lang" ON "ps_cart" USING btree (
  "id_lang"
);
CREATE INDEX "id_currency" ON "ps_cart" USING btree (
  "id_currency"
);
CREATE INDEX "id_guest" ON "ps_cart" USING btree (
  "id_guest"
);
CREATE INDEX "id_shop_group" ON "ps_cart" USING btree (
  "id_shop_group"
);
CREATE INDEX "id_shop_2" ON "ps_cart" USING btree (
  "id_shop",
  "date_upd"
);
CREATE INDEX "id_shop" ON "ps_cart" USING btree (
  "id_shop",
  "date_add"
);

CREATE TABLE "ps_cart_cart_rule" (
  "id_cart" int4 NOT NULL,
  "id_cart_rule" int4 NOT NULL,
  PRIMARY KEY ("id_cart", "id_cart_rule")
);
CREATE INDEX "id_cart_rule" ON "ps_cart_cart_rule" USING btree (
  "id_cart_rule"
);

CREATE TABLE "ps_cart_product" (
  "id_cart" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "id_address_delivery" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_product_attribute" int4 NOT NULL,
  "id_customization" int4 NOT NULL,
  "quantity" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_cart", "id_product", "id_product_attribute", "id_customization", "id_address_delivery")
);
CREATE INDEX "id_product_attribute" ON "ps_cart_product" USING btree (
  "id_product_attribute"
);
CREATE INDEX "id_cart_order" ON "ps_cart_product" USING btree (
  "id_cart",
  "date_add",
  "id_product",
  "id_product_attribute"
);

CREATE TABLE "ps_cart_rule" (
  "id_cart_rule" int4 NOT NULL,
  "id_customer" int4 NOT NULL,
  "date_from" timestamp NOT NULL,
  "date_to" timestamp NOT NULL,
  "description" text,
  "quantity" int4 NOT NULL,
  "quantity_per_user" int4 NOT NULL,
  "priority" int4 NOT NULL,
  "partial_use" int2 NOT NULL,
  "code" varchar(254) NOT NULL,
  "minimum_amount" numeric(20,6) NOT NULL,
  "minimum_amount_tax" int2 NOT NULL,
  "minimum_amount_currency" int4 NOT NULL,
  "minimum_amount_shipping" int2 NOT NULL,
  "country_restriction" int2 NOT NULL,
  "carrier_restriction" int2 NOT NULL,
  "group_restriction" int2 NOT NULL,
  "cart_rule_restriction" int2 NOT NULL,
  "product_restriction" int2 NOT NULL,
  "shop_restriction" int2 NOT NULL,
  "free_shipping" int2 NOT NULL,
  "reduction_percent" numeric(5,2) NOT NULL,
  "reduction_amount" numeric(20,6) NOT NULL,
  "reduction_tax" int2 NOT NULL,
  "reduction_currency" int4 NOT NULL,
  "reduction_product" int4 NOT NULL,
  "reduction_exclude_special" int2 NOT NULL,
  "gift_product" int4 NOT NULL,
  "gift_product_attribute" int4 NOT NULL,
  "highlight" int2 NOT NULL,
  "active" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_cart_rule")
);
CREATE INDEX "id_customer" ON "ps_cart_rule" USING btree (
  "id_customer",
  "active",
  "date_to"
);
CREATE INDEX "group_restriction" ON "ps_cart_rule" USING btree (
  "group_restriction",
  "active",
  "date_to"
);
CREATE INDEX "id_customer_2" ON "ps_cart_rule" USING btree (
  "id_customer",
  "active",
  "highlight",
  "date_to"
);
CREATE INDEX "group_restriction_2" ON "ps_cart_rule" USING btree (
  "group_restriction",
  "active",
  "highlight",
  "date_to"
);
CREATE INDEX "date_from" ON "ps_cart_rule" USING btree (
  "date_from"
);
CREATE INDEX "date_to" ON "ps_cart_rule" USING btree (
  "date_to"
);

CREATE TABLE "ps_cart_rule_carrier" (
  "id_cart_rule" int4 NOT NULL,
  "id_carrier" int4 NOT NULL,
  PRIMARY KEY ("id_cart_rule", "id_carrier")
);

CREATE TABLE "ps_cart_rule_combination" (
  "id_cart_rule_1" int4 NOT NULL,
  "id_cart_rule_2" int4 NOT NULL,
  PRIMARY KEY ("id_cart_rule_1", "id_cart_rule_2")
);
CREATE INDEX "id_cart_rule_1" ON "ps_cart_rule_combination" USING btree (
  "id_cart_rule_1"
);
CREATE INDEX "id_cart_rule_2" ON "ps_cart_rule_combination" USING btree (
  "id_cart_rule_2"
);

CREATE TABLE "ps_cart_rule_country" (
  "id_cart_rule" int4 NOT NULL,
  "id_country" int4 NOT NULL,
  PRIMARY KEY ("id_cart_rule", "id_country")
);

CREATE TABLE "ps_cart_rule_group" (
  "id_cart_rule" int4 NOT NULL,
  "id_group" int4 NOT NULL,
  PRIMARY KEY ("id_cart_rule", "id_group")
);

CREATE TABLE "ps_cart_rule_lang" (
  "id_cart_rule" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(254) NOT NULL,
  PRIMARY KEY ("id_cart_rule", "id_lang")
);

CREATE TABLE "ps_cart_rule_product_rule" (
  "id_product_rule" int4 NOT NULL,
  "id_product_rule_group" int4 NOT NULL,
  "type" varchar(255) NOT NULL,
  PRIMARY KEY ("id_product_rule")
);

CREATE TABLE "ps_cart_rule_product_rule_group" (
  "id_product_rule_group" int4 NOT NULL,
  "id_cart_rule" int4 NOT NULL,
  "quantity" int4 NOT NULL,
  PRIMARY KEY ("id_product_rule_group")
);

CREATE TABLE "ps_cart_rule_product_rule_value" (
  "id_product_rule" int4 NOT NULL,
  "id_item" int4 NOT NULL,
  PRIMARY KEY ("id_product_rule", "id_item")
);

CREATE TABLE "ps_cart_rule_shop" (
  "id_cart_rule" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_cart_rule", "id_shop")
);

CREATE TABLE "ps_category" (
  "id_category" int4 NOT NULL,
  "id_parent" int4 NOT NULL,
  "id_shop_default" int4 NOT NULL,
  "level_depth" int2 NOT NULL,
  "nleft" int4 NOT NULL,
  "nright" int4 NOT NULL,
  "active" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "position" int4 NOT NULL,
  "is_root_category" int2 NOT NULL,
  PRIMARY KEY ("id_category")
);
CREATE INDEX "category_parent" ON "ps_category" USING btree (
  "id_parent"
);
CREATE INDEX "nleftrightactive" ON "ps_category" USING btree (
  "nleft",
  "nright",
  "active"
);
CREATE INDEX "level_depth" ON "ps_category" USING btree (
  "level_depth"
);
CREATE INDEX "nright" ON "ps_category" USING btree (
  "nright"
);
CREATE INDEX "activenleft" ON "ps_category" USING btree (
  "active",
  "nleft"
);
CREATE INDEX "activenright" ON "ps_category" USING btree (
  "active",
  "nright"
);

CREATE TABLE "ps_category_group" (
  "id_category" int4 NOT NULL,
  "id_group" int4 NOT NULL,
  PRIMARY KEY ("id_category", "id_group")
);
CREATE INDEX "id_category" ON "ps_category_group" USING btree (
  "id_category"
);
CREATE INDEX "id_group" ON "ps_category_group" USING btree (
  "id_group"
);

CREATE TABLE "ps_category_lang" (
  "id_category" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(128) NOT NULL,
  "description" text,
  "link_rewrite" varchar(128) NOT NULL,
  "meta_title" varchar(255),
  "meta_keywords" varchar(255),
  "meta_description" varchar(512),
  PRIMARY KEY ("id_category", "id_shop", "id_lang")
);
CREATE INDEX "category_name" ON "ps_category_lang" USING btree (
  "name"
);

CREATE TABLE "ps_category_product" (
  "id_category" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "position" int4 NOT NULL,
  PRIMARY KEY ("id_category", "id_product")
);
CREATE INDEX "id_product" ON "ps_category_product" USING btree (
  "id_product"
);
CREATE INDEX "id_category" ON "ps_category_product" USING btree (
  "id_category",
  "position"
);

CREATE TABLE "ps_category_shop" (
  "id_category" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "position" int4 NOT NULL,
  PRIMARY KEY ("id_category", "id_shop")
);

CREATE TABLE "ps_cms" (
  "id_cms" int4 NOT NULL,
  "id_cms_category" int4 NOT NULL,
  "position" int4 NOT NULL,
  "active" int2 NOT NULL,
  "indexation" int2 NOT NULL,
  PRIMARY KEY ("id_cms")
);

CREATE TABLE "ps_cms_category" (
  "id_cms_category" int4 NOT NULL,
  "id_parent" int4 NOT NULL,
  "level_depth" int2 NOT NULL,
  "active" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "position" int4 NOT NULL,
  PRIMARY KEY ("id_cms_category")
);
CREATE INDEX "category_parent" ON "ps_cms_category" USING btree (
  "id_parent"
);

CREATE TABLE "ps_cms_category_lang" (
  "id_cms_category" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "name" varchar(128) NOT NULL,
  "description" text,
  "link_rewrite" varchar(128) NOT NULL,
  "meta_title" varchar(255),
  "meta_keywords" varchar(255),
  "meta_description" varchar(512),
  PRIMARY KEY ("id_cms_category", "id_shop", "id_lang")
);
CREATE INDEX "category_name" ON "ps_cms_category_lang" USING btree (
  "name"
);

CREATE TABLE "ps_cms_category_shop" (
  "id_cms_category" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_cms_category", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_cms_category_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_cms_lang" (
  "id_cms" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "meta_title" varchar(255) NOT NULL,
  "head_seo_title" varchar(255),
  "meta_description" varchar(512),
  "meta_keywords" varchar(255),
  "content" text,
  "link_rewrite" varchar(128) NOT NULL,
  PRIMARY KEY ("id_cms", "id_shop", "id_lang")
);

CREATE TABLE "ps_cms_role" (
  "id_cms_role" int4 NOT NULL,
  "name" varchar(50) NOT NULL,
  "id_cms" int4 NOT NULL,
  PRIMARY KEY ("id_cms_role", "id_cms")
);
CREATE INDEX "name" ON "ps_cms_role" USING btree (
  "name"
);

CREATE TABLE "ps_cms_role_lang" (
  "id_cms_role" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "name" varchar(128),
  PRIMARY KEY ("id_cms_role", "id_lang", "id_shop")
);

CREATE TABLE "ps_cms_shop" (
  "id_cms" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_cms", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_cms_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_condition" (
  "id_condition" int4 NOT NULL,
  "id_ps_condition" int4 NOT NULL,
  "type" varchar(255) NOT NULL,
  "request" text,
  "operator" varchar(32),
  "value" varchar(64),
  "result" varchar(64),
  "calculation_type" varchar(255),
  "calculation_detail" varchar(64),
  "validated" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_condition", "id_ps_condition")
);

CREATE TABLE "ps_condition_advice" (
  "id_condition" int4 NOT NULL,
  "id_advice" int4 NOT NULL,
  "display" int2 NOT NULL,
  PRIMARY KEY ("id_condition", "id_advice")
);

CREATE TABLE "ps_condition_badge" (
  "id_condition" int4 NOT NULL,
  "id_badge" int4 NOT NULL,
  PRIMARY KEY ("id_condition", "id_badge")
);

CREATE TABLE "ps_configuration" (
  "id_configuration" int4 NOT NULL,
  "id_shop_group" int4,
  "id_shop" int4,
  "name" varchar(254) NOT NULL,
  "value" text,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_configuration")
);
CREATE INDEX "name" ON "ps_configuration" USING btree (
  "name"
);
CREATE INDEX "id_shop" ON "ps_configuration" USING btree (
  "id_shop"
);
CREATE INDEX "id_shop_group" ON "ps_configuration" USING btree (
  "id_shop_group"
);

CREATE TABLE "ps_configuration_kpi" (
  "id_configuration_kpi" int4 NOT NULL,
  "id_shop_group" int4,
  "id_shop" int4,
  "name" varchar(64) NOT NULL,
  "value" text,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_configuration_kpi")
);
CREATE INDEX "name" ON "ps_configuration_kpi" USING btree (
  "name"
);
CREATE INDEX "id_shop" ON "ps_configuration_kpi" USING btree (
  "id_shop"
);
CREATE INDEX "id_shop_group" ON "ps_configuration_kpi" USING btree (
  "id_shop_group"
);

CREATE TABLE "ps_configuration_kpi_lang" (
  "id_configuration_kpi" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "value" text,
  "date_upd" timestamp,
  PRIMARY KEY ("id_configuration_kpi", "id_lang")
);

CREATE TABLE "ps_configuration_lang" (
  "id_configuration" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "value" text,
  "date_upd" timestamp,
  PRIMARY KEY ("id_configuration", "id_lang")
);

CREATE TABLE "ps_connections" (
  "id_connections" int4 NOT NULL,
  "id_shop_group" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_guest" int4 NOT NULL,
  "id_page" int4 NOT NULL,
  "ip_address" int8,
  "date_add" timestamp NOT NULL,
  "http_referer" varchar(255),
  PRIMARY KEY ("id_connections")
);
CREATE INDEX "id_guest" ON "ps_connections" USING btree (
  "id_guest"
);
CREATE INDEX "date_add" ON "ps_connections" USING btree (
  "date_add"
);
CREATE INDEX "id_page" ON "ps_connections" USING btree (
  "id_page"
);

CREATE TABLE "ps_connections_page" (
  "id_connections" int4 NOT NULL,
  "id_page" int4 NOT NULL,
  "time_start" timestamp NOT NULL,
  "time_end" timestamp,
  PRIMARY KEY ("id_connections", "id_page", "time_start")
);

CREATE TABLE "ps_connections_source" (
  "id_connections_source" int4 NOT NULL,
  "id_connections" int4 NOT NULL,
  "http_referer" varchar(255),
  "request_uri" varchar(255),
  "keywords" varchar(255),
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_connections_source")
);
CREATE INDEX "connections" ON "ps_connections_source" USING btree (
  "id_connections"
);
CREATE INDEX "orderby" ON "ps_connections_source" USING btree (
  "date_add"
);
CREATE INDEX "http_referer" ON "ps_connections_source" USING btree (
  "http_referer"
);
CREATE INDEX "request_uri" ON "ps_connections_source" USING btree (
  "request_uri"
);

CREATE TABLE "ps_contact" (
  "id_contact" int4 NOT NULL,
  "email" varchar(255) NOT NULL,
  "customer_service" int2 NOT NULL,
  "position" int2 NOT NULL,
  PRIMARY KEY ("id_contact")
);

CREATE TABLE "ps_contact_lang" (
  "id_contact" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(255) NOT NULL,
  "description" text,
  PRIMARY KEY ("id_contact", "id_lang")
);

CREATE TABLE "ps_contact_shop" (
  "id_contact" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_contact", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_contact_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_country" (
  "id_country" int4 NOT NULL,
  "id_zone" int4 NOT NULL,
  "id_currency" int4 NOT NULL,
  "iso_code" varchar(3) NOT NULL,
  "call_prefix" int4 NOT NULL,
  "active" int2 NOT NULL,
  "contains_states" int2 NOT NULL,
  "need_identification_number" int2 NOT NULL,
  "need_zip_code" int2 NOT NULL,
  "zip_code_format" varchar(12) NOT NULL,
  "display_tax_label" int2 NOT NULL,
  PRIMARY KEY ("id_country")
);
CREATE INDEX "country_iso_code" ON "ps_country" USING btree (
  "iso_code"
);
CREATE INDEX "country_" ON "ps_country" USING btree (
  "id_zone"
);

CREATE TABLE "ps_country_lang" (
  "id_country" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  PRIMARY KEY ("id_country", "id_lang")
);

CREATE TABLE "ps_country_shop" (
  "id_country" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_country", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_country_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_currency" (
  "id_currency" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "iso_code" varchar(3) NOT NULL,
  "numeric_iso_code" varchar(3),
  "precision" int4 NOT NULL,
  "conversion_rate" numeric(13,6) NOT NULL,
  "deleted" int2 NOT NULL,
  "active" int2 NOT NULL,
  "unofficial" int2 NOT NULL,
  "modified" int2 NOT NULL,
  PRIMARY KEY ("id_currency")
);
CREATE INDEX "currency_iso_code" ON "ps_currency" USING btree (
  "iso_code"
);

CREATE TABLE "ps_currency_lang" (
  "id_currency" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(255) NOT NULL,
  "symbol" varchar(255) NOT NULL,
  "pattern" varchar(255),
  PRIMARY KEY ("id_currency", "id_lang")
);

CREATE TABLE "ps_currency_shop" (
  "id_currency" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "conversion_rate" numeric(13,6) NOT NULL,
  PRIMARY KEY ("id_currency", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_currency_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_customer" (
  "id_customer" int4 NOT NULL,
  "id_shop_group" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_gender" int4 NOT NULL,
  "id_default_group" int4 NOT NULL,
  "id_lang" int4,
  "id_risk" int4 NOT NULL,
  "company" varchar(255),
  "siret" varchar(14),
  "ape" varchar(5),
  "firstname" varchar(255) NOT NULL,
  "lastname" varchar(255) NOT NULL,
  "email" varchar(255) NOT NULL,
  "passwd" varchar(255) NOT NULL,
  "last_passwd_gen" timestamp NOT NULL,
  "birthday" date,
  "newsletter" int2 NOT NULL,
  "ip_registration_newsletter" varchar(15),
  "newsletter_date_add" timestamp,
  "optin" int2 NOT NULL,
  "website" varchar(128),
  "outstanding_allow_amount" numeric(20,6) NOT NULL,
  "show_public_prices" int2 NOT NULL,
  "max_payment_days" int4 NOT NULL,
  "secure_key" varchar(32) NOT NULL,
  "note" text,
  "active" int2 NOT NULL,
  "is_guest" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "reset_password_token" varchar(40),
  "reset_password_validity" timestamp,
  PRIMARY KEY ("id_customer")
);
CREATE INDEX "customer_email" ON "ps_customer" USING btree (
  "email"
);
CREATE INDEX "customer_login" ON "ps_customer" USING btree (
  "email",
  "passwd"
);
CREATE INDEX "id_customer_passwd" ON "ps_customer" USING btree (
  "id_customer",
  "passwd"
);
CREATE INDEX "id_gender" ON "ps_customer" USING btree (
  "id_gender"
);
CREATE INDEX "id_shop_group" ON "ps_customer" USING btree (
  "id_shop_group"
);
CREATE INDEX "id_shop" ON "ps_customer" USING btree (
  "id_shop",
  "date_add"
);

CREATE TABLE "ps_customer_group" (
  "id_customer" int4 NOT NULL,
  "id_group" int4 NOT NULL,
  PRIMARY KEY ("id_customer", "id_group")
);
CREATE INDEX "customer_login" ON "ps_customer_group" USING btree (
  "id_group"
);
CREATE INDEX "id_customer" ON "ps_customer_group" USING btree (
  "id_customer"
);

CREATE TABLE "ps_customer_message" (
  "id_customer_message" int4 NOT NULL,
  "id_customer_thread" int4,
  "id_employee" int4,
  "message" text NOT NULL,
  "file_name" varchar(18),
  "ip_address" varchar(16),
  "user_agent" varchar(128),
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "private" int2 NOT NULL,
  "read" int2 NOT NULL,
  PRIMARY KEY ("id_customer_message")
);
CREATE INDEX "id_customer_thread" ON "ps_customer_message" USING btree (
  "id_customer_thread"
);
CREATE INDEX "id_employee" ON "ps_customer_message" USING btree (
  "id_employee"
);

CREATE TABLE "ps_customer_message_sync_imap" (
  "md5_header" bytea NOT NULL
);
CREATE INDEX "md5_header_index" ON "ps_customer_message_sync_imap" USING btree (
  "md5_header"
);

CREATE TABLE "ps_customer_session" (
  "id_customer_session" int4 NOT NULL,
  "id_customer" int4,
  "token" varchar(40),
  PRIMARY KEY ("id_customer_session")
);

CREATE TABLE "ps_customer_thread" (
  "id_customer_thread" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "id_contact" int4 NOT NULL,
  "id_customer" int4,
  "id_order" int4,
  "id_product" int4,
  "status" varchar(255) NOT NULL,
  "email" varchar(255) NOT NULL,
  "token" varchar(12),
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_customer_thread")
);
CREATE INDEX "id_shop" ON "ps_customer_thread" USING btree (
  "id_shop"
);
CREATE INDEX "id_lang" ON "ps_customer_thread" USING btree (
  "id_lang"
);
CREATE INDEX "id_contact" ON "ps_customer_thread" USING btree (
  "id_contact"
);
CREATE INDEX "id_customer" ON "ps_customer_thread" USING btree (
  "id_customer"
);
CREATE INDEX "id_order" ON "ps_customer_thread" USING btree (
  "id_order"
);
CREATE INDEX "id_product" ON "ps_customer_thread" USING btree (
  "id_product"
);

CREATE TABLE "ps_customization" (
  "id_customization" int4 NOT NULL,
  "id_product_attribute" int4 NOT NULL,
  "id_address_delivery" int4 NOT NULL,
  "id_cart" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "quantity" int4 NOT NULL,
  "quantity_refunded" int4 NOT NULL,
  "quantity_returned" int4 NOT NULL,
  "in_cart" int2 NOT NULL,
  PRIMARY KEY ("id_customization", "id_cart", "id_product", "id_address_delivery")
);
CREATE INDEX "id_product_attribute" ON "ps_customization" USING btree (
  "id_product_attribute"
);
CREATE INDEX "id_cart_product" ON "ps_customization" USING btree (
  "id_cart",
  "id_product",
  "id_product_attribute"
);

CREATE TABLE "ps_customization_field" (
  "id_customization_field" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "type" int2 NOT NULL,
  "required" int2 NOT NULL,
  "is_module" int2 NOT NULL,
  "is_deleted" int2 NOT NULL,
  PRIMARY KEY ("id_customization_field")
);
CREATE INDEX "id_product" ON "ps_customization_field" USING btree (
  "id_product"
);

CREATE TABLE "ps_customization_field_lang" (
  "id_customization_field" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "name" varchar(255) NOT NULL,
  PRIMARY KEY ("id_customization_field", "id_lang", "id_shop")
);

CREATE TABLE "ps_customized_data" (
  "id_customization" int4 NOT NULL,
  "type" int2 NOT NULL,
  "index" int4 NOT NULL,
  "value" varchar(255) NOT NULL,
  "id_module" int4 NOT NULL,
  "price" numeric(20,6) NOT NULL,
  "weight" numeric(20,6) NOT NULL,
  PRIMARY KEY ("id_customization", "type", "index")
);

CREATE TABLE "ps_date_range" (
  "id_date_range" int4 NOT NULL,
  "time_start" timestamp NOT NULL,
  "time_end" timestamp NOT NULL,
  PRIMARY KEY ("id_date_range")
);

CREATE TABLE "ps_delivery" (
  "id_delivery" int4 NOT NULL,
  "id_shop" int4,
  "id_shop_group" int4,
  "id_carrier" int4 NOT NULL,
  "id_range_price" int4,
  "id_range_weight" int4,
  "id_zone" int4 NOT NULL,
  "price" numeric(20,6) NOT NULL,
  PRIMARY KEY ("id_delivery")
);
CREATE INDEX "id_zone" ON "ps_delivery" USING btree (
  "id_zone"
);
CREATE INDEX "id_carrier" ON "ps_delivery" USING btree (
  "id_carrier",
  "id_zone"
);
CREATE INDEX "id_range_price" ON "ps_delivery" USING btree (
  "id_range_price"
);
CREATE INDEX "id_range_weight" ON "ps_delivery" USING btree (
  "id_range_weight"
);

CREATE TABLE "ps_emailsubscription" (
  "id" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_shop_group" int4 NOT NULL,
  "email" varchar(255) NOT NULL,
  "newsletter_date_add" timestamp,
  "ip_registration_newsletter" varchar(15) NOT NULL,
  "http_referer" varchar(255),
  "active" int2 NOT NULL,
  "id_lang" int4 NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "ps_employee" (
  "id_employee" int4 NOT NULL,
  "id_profile" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "lastname" varchar(255) NOT NULL,
  "firstname" varchar(255) NOT NULL,
  "email" varchar(255) NOT NULL,
  "passwd" varchar(255) NOT NULL,
  "last_passwd_gen" timestamp NOT NULL,
  "stats_date_from" date,
  "stats_date_to" date,
  "stats_compare_from" date,
  "stats_compare_to" date,
  "stats_compare_option" int4 NOT NULL,
  "preselect_date_range" varchar(32),
  "bo_color" varchar(32),
  "bo_theme" varchar(32),
  "bo_css" varchar(64),
  "default_tab" int4 NOT NULL,
  "bo_width" int4 NOT NULL,
  "bo_menu" int2 NOT NULL,
  "active" int2 NOT NULL,
  "optin" int2,
  "id_last_order" int4 NOT NULL,
  "id_last_customer_message" int4 NOT NULL,
  "id_last_customer" int4 NOT NULL,
  "last_connection_date" date,
  "reset_password_token" varchar(40),
  "reset_password_validity" timestamp,
  PRIMARY KEY ("id_employee")
);
CREATE INDEX "employee_login" ON "ps_employee" USING btree (
  "email",
  "passwd"
);
CREATE INDEX "id_employee_passwd" ON "ps_employee" USING btree (
  "id_employee",
  "passwd"
);
CREATE INDEX "id_profile" ON "ps_employee" USING btree (
  "id_profile"
);

CREATE TABLE "ps_employee_session" (
  "id_employee_session" int4 NOT NULL,
  "id_employee" int4,
  "token" varchar(40),
  PRIMARY KEY ("id_employee_session")
);

CREATE TABLE "ps_employee_shop" (
  "id_employee" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_employee", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_employee_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_eventbus_deleted_objects" (
  "type" varchar(50) NOT NULL,
  "id_object" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "created_at" timestamp NOT NULL,
  PRIMARY KEY ("type", "id_object", "id_shop")
);

CREATE TABLE "ps_eventbus_incremental_sync" (
  "type" varchar(50) NOT NULL,
  "id_object" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "lang_iso" varchar(3) NOT NULL,
  "created_at" timestamp NOT NULL,
  PRIMARY KEY ("type", "id_object", "id_shop", "lang_iso")
);

CREATE TABLE "ps_eventbus_job" (
  "job_id" varchar(200) NOT NULL,
  "created_at" timestamp NOT NULL
);

CREATE TABLE "ps_eventbus_type_sync" (
  "type" varchar(50) NOT NULL,
  "offset" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "lang_iso" varchar(3),
  "full_sync_finished" int2 NOT NULL,
  "last_sync_date" timestamp NOT NULL
);

CREATE TABLE "ps_fb_category_match" (
  "id_category" int4 NOT NULL,
  "google_category_id" int4 NOT NULL,
  "google_category_name" varchar(255) NOT NULL,
  "google_category_parent_id" int4 NOT NULL,
  "google_category_parent_name" varchar(255) NOT NULL,
  "is_parent_category" int2,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_category", "id_shop")
);
CREATE INDEX "id_category" ON "ps_fb_category_match" USING btree (
  "id_category",
  "google_category_id"
);

CREATE TABLE "ps_feature" (
  "id_feature" int4 NOT NULL,
  "position" int4 NOT NULL,
  PRIMARY KEY ("id_feature")
);

CREATE TABLE "ps_feature_lang" (
  "id_feature" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(128),
  PRIMARY KEY ("id_feature", "id_lang")
);
CREATE INDEX "id_lang" ON "ps_feature_lang" USING btree (
  "id_lang",
  "name"
);

CREATE TABLE "ps_feature_product" (
  "id_feature" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "id_feature_value" int4 NOT NULL,
  PRIMARY KEY ("id_feature", "id_product", "id_feature_value")
);
CREATE INDEX "id_feature_value" ON "ps_feature_product" USING btree (
  "id_feature_value"
);
CREATE INDEX "id_product" ON "ps_feature_product" USING btree (
  "id_product"
);

CREATE TABLE "ps_feature_shop" (
  "id_feature" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_feature", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_feature_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_feature_value" (
  "id_feature_value" int4 NOT NULL,
  "id_feature" int4 NOT NULL,
  "custom" int2,
  PRIMARY KEY ("id_feature_value")
);
CREATE INDEX "feature" ON "ps_feature_value" USING btree (
  "id_feature"
);

CREATE TABLE "ps_feature_value_lang" (
  "id_feature_value" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "value" varchar(255),
  PRIMARY KEY ("id_feature_value", "id_lang")
);

CREATE TABLE "ps_gender" (
  "id_gender" int4 NOT NULL,
  "type" int2 NOT NULL,
  PRIMARY KEY ("id_gender")
);

CREATE TABLE "ps_gender_lang" (
  "id_gender" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(20) NOT NULL,
  PRIMARY KEY ("id_gender", "id_lang")
);
CREATE INDEX "id_gender" ON "ps_gender_lang" USING btree (
  "id_gender"
);

CREATE TABLE "ps_group" (
  "id_group" int4 NOT NULL,
  "reduction" numeric(5,2) NOT NULL,
  "price_display_method" int2 NOT NULL,
  "show_prices" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_group")
);

CREATE TABLE "ps_group_lang" (
  "id_group" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(32) NOT NULL,
  PRIMARY KEY ("id_group", "id_lang")
);

CREATE TABLE "ps_group_reduction" (
  "id_group_reduction" int4 NOT NULL,
  "id_group" int4 NOT NULL,
  "id_category" int4 NOT NULL,
  "reduction" numeric(5,4) NOT NULL,
  PRIMARY KEY ("id_group_reduction")
);
CREATE INDEX "id_group" ON "ps_group_reduction" USING btree (
  "id_group",
  "id_category"
);

CREATE TABLE "ps_group_shop" (
  "id_group" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_group", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_group_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_gsitemap_sitemap" (
  "link" varchar(255),
  "id_shop" int4
);

CREATE TABLE "ps_guest" (
  "id_guest" int4 NOT NULL,
  "id_operating_system" int4,
  "id_web_browser" int4,
  "id_customer" int4,
  "javascript" int2,
  "screen_resolution_x" int2,
  "screen_resolution_y" int2,
  "screen_color" int2,
  "sun_java" int2,
  "adobe_flash" int2,
  "adobe_director" int2,
  "apple_quicktime" int2,
  "real_player" int2,
  "windows_media" int2,
  "accept_language" varchar(8),
  "mobile_theme" int2 NOT NULL,
  PRIMARY KEY ("id_guest")
);
CREATE INDEX "id_customer" ON "ps_guest" USING btree (
  "id_customer"
);
CREATE INDEX "id_operating_system" ON "ps_guest" USING btree (
  "id_operating_system"
);
CREATE INDEX "id_web_browser" ON "ps_guest" USING btree (
  "id_web_browser"
);

CREATE TABLE "ps_homeslider" (
  "id_homeslider_slides" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_homeslider_slides", "id_shop")
);

CREATE TABLE "ps_homeslider_slides" (
  "id_homeslider_slides" int4 NOT NULL,
  "position" int4 NOT NULL,
  "active" int2 NOT NULL,
  PRIMARY KEY ("id_homeslider_slides")
);

CREATE TABLE "ps_homeslider_slides_lang" (
  "id_homeslider_slides" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "title" varchar(255) NOT NULL,
  "description" text NOT NULL,
  "legend" varchar(255) NOT NULL,
  "url" varchar(255) NOT NULL,
  "image" varchar(255) NOT NULL,
  PRIMARY KEY ("id_homeslider_slides", "id_lang")
);

CREATE TABLE "ps_hook" (
  "id_hook" int4 NOT NULL,
  "name" varchar(191) NOT NULL,
  "title" varchar(255) NOT NULL,
  "description" text,
  "position" int2 NOT NULL,
  PRIMARY KEY ("id_hook")
);
CREATE INDEX "hook_name" ON "ps_hook" USING btree (
  "name"
);

CREATE TABLE "ps_hook_alias" (
  "id_hook_alias" int4 NOT NULL,
  "alias" varchar(191) NOT NULL,
  "name" varchar(191) NOT NULL,
  PRIMARY KEY ("id_hook_alias")
);
CREATE INDEX "alias" ON "ps_hook_alias" USING btree (
  "alias"
);

CREATE TABLE "ps_hook_module" (
  "id_module" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_hook" int4 NOT NULL,
  "position" int2 NOT NULL,
  PRIMARY KEY ("id_module", "id_hook", "id_shop")
);
CREATE INDEX "id_hook" ON "ps_hook_module" USING btree (
  "id_hook"
);
CREATE INDEX "id_module" ON "ps_hook_module" USING btree (
  "id_module"
);
CREATE INDEX "position" ON "ps_hook_module" USING btree (
  "id_shop",
  "position"
);

CREATE TABLE "ps_hook_module_exceptions" (
  "id_hook_module_exceptions" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_module" int4 NOT NULL,
  "id_hook" int4 NOT NULL,
  "file_name" varchar(255),
  PRIMARY KEY ("id_hook_module_exceptions")
);
CREATE INDEX "id_module" ON "ps_hook_module_exceptions" USING btree (
  "id_module"
);
CREATE INDEX "id_hook" ON "ps_hook_module_exceptions" USING btree (
  "id_hook"
);

CREATE TABLE "ps_image" (
  "id_image" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "position" int2 NOT NULL,
  "cover" int2,
  PRIMARY KEY ("id_image")
);
CREATE INDEX "id_product_cover" ON "ps_image" USING btree (
  "id_product",
  "cover"
);
CREATE INDEX "idx_product_image" ON "ps_image" USING btree (
  "id_image",
  "id_product",
  "cover"
);
CREATE INDEX "image_product" ON "ps_image" USING btree (
  "id_product"
);

CREATE TABLE "ps_image_lang" (
  "id_image" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "legend" varchar(128),
  PRIMARY KEY ("id_image", "id_lang")
);
CREATE INDEX "id_image" ON "ps_image_lang" USING btree (
  "id_image"
);

CREATE TABLE "ps_image_shop" (
  "id_product" int4 NOT NULL,
  "id_image" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "cover" int2,
  PRIMARY KEY ("id_image", "id_shop")
);
CREATE INDEX "id_product" ON "ps_image_shop" USING btree (
  "id_product",
  "id_shop",
  "cover"
);
CREATE INDEX "id_shop" ON "ps_image_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_image_type" (
  "id_image_type" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "width" int4 NOT NULL,
  "height" int4 NOT NULL,
  "products" int2 NOT NULL,
  "categories" int2 NOT NULL,
  "manufacturers" int2 NOT NULL,
  "suppliers" int2 NOT NULL,
  "stores" int2 NOT NULL,
  PRIMARY KEY ("id_image_type")
);
CREATE INDEX "image_type_name" ON "ps_image_type" USING btree (
  "name"
);

CREATE TABLE "ps_import_match" (
  "id_import_match" int4 NOT NULL,
  "name" varchar(32) NOT NULL,
  "match" text NOT NULL,
  "skip" int4 NOT NULL,
  PRIMARY KEY ("id_import_match")
);

CREATE TABLE "ps_info" (
  "id_info" int4 NOT NULL,
  PRIMARY KEY ("id_info")
);

CREATE TABLE "ps_info_lang" (
  "id_info" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "text" text NOT NULL,
  PRIMARY KEY ("id_info", "id_lang", "id_shop")
);

CREATE TABLE "ps_info_shop" (
  "id_info" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_info", "id_shop")
);

CREATE TABLE "ps_lang" (
  "id_lang" int4 NOT NULL,
  "name" varchar(32) NOT NULL,
  "active" int2 NOT NULL,
  "iso_code" varchar(2) NOT NULL,
  "language_code" varchar(5) NOT NULL,
  "locale" varchar(5) NOT NULL,
  "date_format_lite" varchar(32) NOT NULL,
  "date_format_full" varchar(32) NOT NULL,
  "is_rtl" int2 NOT NULL,
  PRIMARY KEY ("id_lang")
);

CREATE TABLE "ps_lang_shop" (
  "id_lang" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_lang", "id_shop")
);
CREATE INDEX "IDX_2F43BFC7BA299860" ON "ps_lang_shop" USING btree (
  "id_lang"
);
CREATE INDEX "IDX_2F43BFC7274A50A0" ON "ps_lang_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_layered_category" (
  "id_layered_category" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_category" int4 NOT NULL,
  "id_value" int4,
  "type" varchar(255) NOT NULL,
  "position" int4 NOT NULL,
  "filter_type" int4 NOT NULL,
  "filter_show_limit" int4 NOT NULL,
  PRIMARY KEY ("id_layered_category")
);
CREATE INDEX "id_category_shop" ON "ps_layered_category" USING btree (
  "id_category",
  "id_shop",
  "type",
  "id_value",
  "position"
);
CREATE INDEX "id_category" ON "ps_layered_category" USING btree (
  "id_category",
  "type"
);

CREATE TABLE "ps_layered_filter" (
  "id_layered_filter" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "filters" text,
  "n_categories" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_layered_filter")
);

CREATE TABLE "ps_layered_filter_block" (
  "hash" char(32) NOT NULL,
  "data" text,
  PRIMARY KEY ("hash")
);

CREATE TABLE "ps_layered_filter_shop" (
  "id_layered_filter" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_layered_filter", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_layered_filter_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_layered_indexable_attribute_group" (
  "id_attribute_group" int4 NOT NULL,
  "indexable" int2 NOT NULL,
  PRIMARY KEY ("id_attribute_group")
);

CREATE TABLE "ps_layered_indexable_attribute_group_lang_value" (
  "id_attribute_group" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "url_name" varchar(128),
  "meta_title" varchar(128),
  PRIMARY KEY ("id_attribute_group", "id_lang")
);

CREATE TABLE "ps_layered_indexable_attribute_lang_value" (
  "id_attribute" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "url_name" varchar(128),
  "meta_title" varchar(128),
  PRIMARY KEY ("id_attribute", "id_lang")
);

CREATE TABLE "ps_layered_indexable_feature" (
  "id_feature" int4 NOT NULL,
  "indexable" int2 NOT NULL,
  PRIMARY KEY ("id_feature")
);

CREATE TABLE "ps_layered_indexable_feature_lang_value" (
  "id_feature" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "url_name" varchar(128) NOT NULL,
  "meta_title" varchar(128),
  PRIMARY KEY ("id_feature", "id_lang")
);

CREATE TABLE "ps_layered_indexable_feature_value_lang_value" (
  "id_feature_value" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "url_name" varchar(128),
  "meta_title" varchar(128),
  PRIMARY KEY ("id_feature_value", "id_lang")
);

CREATE TABLE "ps_layered_price_index" (
  "id_product" int4 NOT NULL,
  "id_currency" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "price_min" numeric(11,5) NOT NULL,
  "price_max" numeric(11,5) NOT NULL,
  "id_country" int4 NOT NULL,
  PRIMARY KEY ("id_product", "id_currency", "id_shop", "id_country")
);
CREATE INDEX "id_currency" ON "ps_layered_price_index" USING btree (
  "id_currency"
);
CREATE INDEX "price_min" ON "ps_layered_price_index" USING btree (
  "price_min"
);
CREATE INDEX "price_max" ON "ps_layered_price_index" USING btree (
  "price_max"
);

CREATE TABLE "ps_layered_product_attribute" (
  "id_attribute" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "id_attribute_group" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_attribute", "id_product", "id_shop")
);
CREATE INDEX "id_attribute_group" ON "ps_layered_product_attribute" USING btree (
  "id_attribute_group",
  "id_attribute",
  "id_product",
  "id_shop"
);

CREATE TABLE "ps_link_block" (
  "id_link_block" int4 NOT NULL,
  "id_hook" int4,
  "position" int4 NOT NULL,
  "content" text,
  PRIMARY KEY ("id_link_block")
);

CREATE TABLE "ps_link_block_lang" (
  "id_link_block" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(40) NOT NULL,
  "custom_content" text,
  PRIMARY KEY ("id_link_block", "id_lang")
);

CREATE TABLE "ps_link_block_shop" (
  "id_link_block" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_link_block", "id_shop")
);

CREATE TABLE "ps_linksmenutop" (
  "id_linksmenutop" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "new_window" int2 NOT NULL,
  PRIMARY KEY ("id_linksmenutop")
);
CREATE INDEX "id_shop" ON "ps_linksmenutop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_linksmenutop_lang" (
  "id_linksmenutop" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "label" varchar(128) NOT NULL,
  "link" varchar(128) NOT NULL
);
CREATE INDEX "id_linksmenutop" ON "ps_linksmenutop_lang" USING btree (
  "id_linksmenutop",
  "id_lang",
  "id_shop"
);

CREATE TABLE "ps_log" (
  "id_log" int4 NOT NULL,
  "severity" int2 NOT NULL,
  "error_code" int4,
  "message" text NOT NULL,
  "object_type" varchar(32),
  "object_id" int4,
  "id_employee" int4,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_log")
);

CREATE TABLE "ps_mail" (
  "id_mail" int4 NOT NULL,
  "recipient" varchar(126) NOT NULL,
  "template" varchar(62) NOT NULL,
  "subject" varchar(254) NOT NULL,
  "id_lang" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_mail")
);
CREATE INDEX "recipient" ON "ps_mail" USING btree (
  "recipient"
);

CREATE TABLE "ps_manufacturer" (
  "id_manufacturer" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "active" int2 NOT NULL,
  PRIMARY KEY ("id_manufacturer")
);

CREATE TABLE "ps_manufacturer_lang" (
  "id_manufacturer" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "description" text,
  "short_description" text,
  "meta_title" varchar(255),
  "meta_keywords" varchar(255),
  "meta_description" varchar(512),
  PRIMARY KEY ("id_manufacturer", "id_lang")
);

CREATE TABLE "ps_manufacturer_shop" (
  "id_manufacturer" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_manufacturer", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_manufacturer_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_memcached_servers" (
  "id_memcached_server" int4 NOT NULL,
  "ip" varchar(254) NOT NULL,
  "port" int4 NOT NULL,
  "weight" int4 NOT NULL,
  PRIMARY KEY ("id_memcached_server")
);

CREATE TABLE "ps_message" (
  "id_message" int4 NOT NULL,
  "id_cart" int4,
  "id_customer" int4 NOT NULL,
  "id_employee" int4,
  "id_order" int4 NOT NULL,
  "message" text NOT NULL,
  "private" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_message")
);
CREATE INDEX "message_order" ON "ps_message" USING btree (
  "id_order"
);
CREATE INDEX "id_cart" ON "ps_message" USING btree (
  "id_cart"
);
CREATE INDEX "id_customer" ON "ps_message" USING btree (
  "id_customer"
);
CREATE INDEX "id_employee" ON "ps_message" USING btree (
  "id_employee"
);

CREATE TABLE "ps_message_readed" (
  "id_message" int4 NOT NULL,
  "id_employee" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_message", "id_employee")
);

CREATE TABLE "ps_meta" (
  "id_meta" int4 NOT NULL,
  "page" varchar(64) NOT NULL,
  "configurable" int2 NOT NULL,
  PRIMARY KEY ("id_meta")
);
CREATE INDEX "page" ON "ps_meta" USING btree (
  "page"
);

CREATE TABLE "ps_meta_lang" (
  "id_meta" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "title" varchar(128),
  "description" varchar(255),
  "keywords" varchar(255),
  "url_rewrite" varchar(254) NOT NULL,
  PRIMARY KEY ("id_meta", "id_shop", "id_lang")
);
CREATE INDEX "id_shop" ON "ps_meta_lang" USING btree (
  "id_shop"
);
CREATE INDEX "id_lang" ON "ps_meta_lang" USING btree (
  "id_lang"
);

CREATE TABLE "ps_module" (
  "id_module" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "active" int2 NOT NULL,
  "version" varchar(8) NOT NULL,
  PRIMARY KEY ("id_module")
);
CREATE INDEX "name_UNIQUE" ON "ps_module" USING btree (
  "name"
);
CREATE INDEX "name" ON "ps_module" USING btree (
  "name"
);

CREATE TABLE "ps_module_access" (
  "id_profile" int4 NOT NULL,
  "id_authorization_role" int4 NOT NULL,
  PRIMARY KEY ("id_profile", "id_authorization_role")
);

CREATE TABLE "ps_module_carrier" (
  "id_module" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_reference" int4 NOT NULL,
  PRIMARY KEY ("id_module", "id_shop", "id_reference")
);

CREATE TABLE "ps_module_country" (
  "id_module" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_country" int4 NOT NULL,
  PRIMARY KEY ("id_module", "id_shop", "id_country")
);

CREATE TABLE "ps_module_currency" (
  "id_module" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_currency" int4 NOT NULL,
  PRIMARY KEY ("id_module", "id_shop", "id_currency")
);
CREATE INDEX "id_module" ON "ps_module_currency" USING btree (
  "id_module"
);

CREATE TABLE "ps_module_group" (
  "id_module" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_group" int4 NOT NULL,
  PRIMARY KEY ("id_module", "id_shop", "id_group")
);

CREATE TABLE "ps_module_history" (
  "id" int4 NOT NULL,
  "id_employee" int4 NOT NULL,
  "id_module" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "ps_module_preference" (
  "id_module_preference" int4 NOT NULL,
  "id_employee" int4 NOT NULL,
  "module" varchar(191) NOT NULL,
  "interest" int2,
  "favorite" int2,
  PRIMARY KEY ("id_module_preference")
);
CREATE INDEX "employee_module" ON "ps_module_preference" USING btree (
  "id_employee",
  "module"
);

CREATE TABLE "ps_module_shop" (
  "id_module" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "enable_device" int2 NOT NULL,
  PRIMARY KEY ("id_module", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_module_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_operating_system" (
  "id_operating_system" int4 NOT NULL,
  "name" varchar(64),
  PRIMARY KEY ("id_operating_system")
);

CREATE TABLE "ps_order_carrier" (
  "id_order_carrier" int4 NOT NULL,
  "id_order" int4 NOT NULL,
  "id_carrier" int4 NOT NULL,
  "id_order_invoice" int4,
  "weight" numeric(20,6),
  "shipping_cost_tax_excl" numeric(20,6),
  "shipping_cost_tax_incl" numeric(20,6),
  "tracking_number" varchar(64),
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_order_carrier")
);
CREATE INDEX "id_order" ON "ps_order_carrier" USING btree (
  "id_order"
);
CREATE INDEX "id_carrier" ON "ps_order_carrier" USING btree (
  "id_carrier"
);
CREATE INDEX "id_order_invoice" ON "ps_order_carrier" USING btree (
  "id_order_invoice"
);

CREATE TABLE "ps_order_cart_rule" (
  "id_order_cart_rule" int4 NOT NULL,
  "id_order" int4 NOT NULL,
  "id_cart_rule" int4 NOT NULL,
  "id_order_invoice" int4,
  "name" varchar(254) NOT NULL,
  "value" numeric(20,6) NOT NULL,
  "value_tax_excl" numeric(20,6) NOT NULL,
  "free_shipping" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  PRIMARY KEY ("id_order_cart_rule")
);
CREATE INDEX "id_order" ON "ps_order_cart_rule" USING btree (
  "id_order"
);
CREATE INDEX "id_cart_rule" ON "ps_order_cart_rule" USING btree (
  "id_cart_rule"
);

CREATE TABLE "ps_order_detail" (
  "id_order_detail" int4 NOT NULL,
  "id_order" int4 NOT NULL,
  "id_order_invoice" int4,
  "id_warehouse" int4,
  "id_shop" int4 NOT NULL,
  "product_id" int4 NOT NULL,
  "product_attribute_id" int4,
  "id_customization" int4,
  "product_name" varchar(255) NOT NULL,
  "product_quantity" int4 NOT NULL,
  "product_quantity_in_stock" int4 NOT NULL,
  "product_quantity_refunded" int4 NOT NULL,
  "product_quantity_return" int4 NOT NULL,
  "product_quantity_reinjected" int4 NOT NULL,
  "product_price" numeric(20,6) NOT NULL,
  "reduction_percent" numeric(5,2) NOT NULL,
  "reduction_amount" numeric(20,6) NOT NULL,
  "reduction_amount_tax_incl" numeric(20,6) NOT NULL,
  "reduction_amount_tax_excl" numeric(20,6) NOT NULL,
  "group_reduction" numeric(5,2) NOT NULL,
  "product_quantity_discount" numeric(20,6) NOT NULL,
  "product_ean13" varchar(13),
  "product_isbn" varchar(32),
  "product_upc" varchar(12),
  "product_mpn" varchar(40),
  "product_reference" varchar(64),
  "product_supplier_reference" varchar(64),
  "product_weight" numeric(20,6) NOT NULL,
  "id_tax_rules_group" int4,
  "tax_computation_method" int2 NOT NULL,
  "tax_name" varchar(16) NOT NULL,
  "tax_rate" numeric(10,3) NOT NULL,
  "ecotax" numeric(17,6) NOT NULL,
  "ecotax_tax_rate" numeric(5,3) NOT NULL,
  "discount_quantity_applied" int2 NOT NULL,
  "download_hash" varchar(255),
  "download_nb" int4,
  "download_deadline" timestamp,
  "total_price_tax_incl" numeric(20,6) NOT NULL,
  "total_price_tax_excl" numeric(20,6) NOT NULL,
  "unit_price_tax_incl" numeric(20,6) NOT NULL,
  "unit_price_tax_excl" numeric(20,6) NOT NULL,
  "total_shipping_price_tax_incl" numeric(20,6) NOT NULL,
  "total_shipping_price_tax_excl" numeric(20,6) NOT NULL,
  "purchase_supplier_price" numeric(20,6) NOT NULL,
  "original_product_price" numeric(20,6) NOT NULL,
  "original_wholesale_price" numeric(20,6) NOT NULL,
  "total_refunded_tax_excl" numeric(20,6) NOT NULL,
  "total_refunded_tax_incl" numeric(20,6) NOT NULL,
  PRIMARY KEY ("id_order_detail")
);
CREATE INDEX "order_detail_order" ON "ps_order_detail" USING btree (
  "id_order"
);
CREATE INDEX "product_id" ON "ps_order_detail" USING btree (
  "product_id",
  "product_attribute_id"
);
CREATE INDEX "product_attribute_id" ON "ps_order_detail" USING btree (
  "product_attribute_id"
);
CREATE INDEX "id_tax_rules_group" ON "ps_order_detail" USING btree (
  "id_tax_rules_group"
);
CREATE INDEX "id_order_id_order_detail" ON "ps_order_detail" USING btree (
  "id_order",
  "id_order_detail"
);

CREATE TABLE "ps_order_detail_tax" (
  "id_order_detail" int4 NOT NULL,
  "id_tax" int4 NOT NULL,
  "unit_amount" numeric(16,6) NOT NULL,
  "total_amount" numeric(16,6) NOT NULL
);
CREATE INDEX "id_order_detail" ON "ps_order_detail_tax" USING btree (
  "id_order_detail"
);
CREATE INDEX "id_tax" ON "ps_order_detail_tax" USING btree (
  "id_tax"
);

CREATE TABLE "ps_order_history" (
  "id_order_history" int4 NOT NULL,
  "id_employee" int4 NOT NULL,
  "id_order" int4 NOT NULL,
  "id_order_state" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_order_history")
);
CREATE INDEX "order_history_order" ON "ps_order_history" USING btree (
  "id_order"
);
CREATE INDEX "id_employee" ON "ps_order_history" USING btree (
  "id_employee"
);
CREATE INDEX "id_order_state" ON "ps_order_history" USING btree (
  "id_order_state"
);

CREATE TABLE "ps_order_invoice" (
  "id_order_invoice" int4 NOT NULL,
  "id_order" int4 NOT NULL,
  "number" int4 NOT NULL,
  "delivery_number" int4 NOT NULL,
  "delivery_date" timestamp,
  "total_discount_tax_excl" numeric(20,6) NOT NULL,
  "total_discount_tax_incl" numeric(20,6) NOT NULL,
  "total_paid_tax_excl" numeric(20,6) NOT NULL,
  "total_paid_tax_incl" numeric(20,6) NOT NULL,
  "total_products" numeric(20,6) NOT NULL,
  "total_products_wt" numeric(20,6) NOT NULL,
  "total_shipping_tax_excl" numeric(20,6) NOT NULL,
  "total_shipping_tax_incl" numeric(20,6) NOT NULL,
  "shipping_tax_computation_method" int4 NOT NULL,
  "total_wrapping_tax_excl" numeric(20,6) NOT NULL,
  "total_wrapping_tax_incl" numeric(20,6) NOT NULL,
  "shop_address" text,
  "note" text,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_order_invoice")
);
CREATE INDEX "id_order" ON "ps_order_invoice" USING btree (
  "id_order"
);

CREATE TABLE "ps_order_invoice_payment" (
  "id_order_invoice" int4 NOT NULL,
  "id_order_payment" int4 NOT NULL,
  "id_order" int4 NOT NULL,
  PRIMARY KEY ("id_order_invoice", "id_order_payment")
);
CREATE INDEX "order_payment" ON "ps_order_invoice_payment" USING btree (
  "id_order_payment"
);
CREATE INDEX "id_order" ON "ps_order_invoice_payment" USING btree (
  "id_order"
);

CREATE TABLE "ps_order_invoice_tax" (
  "id_order_invoice" int4 NOT NULL,
  "type" varchar(15) NOT NULL,
  "id_tax" int4 NOT NULL,
  "amount" numeric(10,6) NOT NULL
);
CREATE INDEX "id_tax" ON "ps_order_invoice_tax" USING btree (
  "id_tax"
);

CREATE TABLE "ps_order_message" (
  "id_order_message" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_order_message")
);

CREATE TABLE "ps_order_message_lang" (
  "id_order_message" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(128) NOT NULL,
  "message" text NOT NULL,
  PRIMARY KEY ("id_order_message", "id_lang")
);

CREATE TABLE "ps_order_payment" (
  "id_order_payment" int4 NOT NULL,
  "order_reference" varchar(9),
  "id_currency" int4 NOT NULL,
  "amount" numeric(20,6) NOT NULL,
  "payment_method" varchar(255) NOT NULL,
  "conversion_rate" numeric(13,6) NOT NULL,
  "transaction_id" varchar(254),
  "card_number" varchar(254),
  "card_brand" varchar(254),
  "card_expiration" char(7),
  "card_holder" varchar(254),
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_order_payment")
);
CREATE INDEX "order_reference" ON "ps_order_payment" USING btree (
  "order_reference"
);

CREATE TABLE "ps_order_return" (
  "id_order_return" int4 NOT NULL,
  "id_customer" int4 NOT NULL,
  "id_order" int4 NOT NULL,
  "state" int2 NOT NULL,
  "question" text NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_order_return")
);
CREATE INDEX "order_return_customer" ON "ps_order_return" USING btree (
  "id_customer"
);
CREATE INDEX "id_order" ON "ps_order_return" USING btree (
  "id_order"
);

CREATE TABLE "ps_order_return_detail" (
  "id_order_return" int4 NOT NULL,
  "id_order_detail" int4 NOT NULL,
  "id_customization" int4 NOT NULL,
  "product_quantity" int4 NOT NULL,
  PRIMARY KEY ("id_order_return", "id_order_detail", "id_customization")
);

CREATE TABLE "ps_order_return_state" (
  "id_order_return_state" int4 NOT NULL,
  "color" varchar(32),
  PRIMARY KEY ("id_order_return_state")
);

CREATE TABLE "ps_order_return_state_lang" (
  "id_order_return_state" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  PRIMARY KEY ("id_order_return_state", "id_lang")
);

CREATE TABLE "ps_order_slip" (
  "id_order_slip" int4 NOT NULL,
  "conversion_rate" numeric(13,6) NOT NULL,
  "id_customer" int4 NOT NULL,
  "id_order" int4 NOT NULL,
  "total_products_tax_excl" numeric(20,6),
  "total_products_tax_incl" numeric(20,6),
  "total_shipping_tax_excl" numeric(20,6),
  "total_shipping_tax_incl" numeric(20,6),
  "shipping_cost" int2 NOT NULL,
  "amount" numeric(20,6) NOT NULL,
  "shipping_cost_amount" numeric(20,6) NOT NULL,
  "partial" int2 NOT NULL,
  "order_slip_type" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_order_slip")
);
CREATE INDEX "order_slip_customer" ON "ps_order_slip" USING btree (
  "id_customer"
);
CREATE INDEX "id_order" ON "ps_order_slip" USING btree (
  "id_order"
);

CREATE TABLE "ps_order_slip_detail" (
  "id_order_slip" int4 NOT NULL,
  "id_order_detail" int4 NOT NULL,
  "product_quantity" int4 NOT NULL,
  "unit_price_tax_excl" numeric(20,6),
  "unit_price_tax_incl" numeric(20,6),
  "total_price_tax_excl" numeric(20,6),
  "total_price_tax_incl" numeric(20,6),
  "amount_tax_excl" numeric(20,6),
  "amount_tax_incl" numeric(20,6),
  PRIMARY KEY ("id_order_slip", "id_order_detail")
);

CREATE TABLE "ps_order_slip_detail_tax" (
  "id_order_slip_detail" int4 NOT NULL,
  "id_tax" int4 NOT NULL,
  "unit_amount" numeric(16,6) NOT NULL,
  "total_amount" numeric(16,6) NOT NULL
);
CREATE INDEX "id_order_slip_detail" ON "ps_order_slip_detail_tax" USING btree (
  "id_order_slip_detail"
);
CREATE INDEX "id_tax" ON "ps_order_slip_detail_tax" USING btree (
  "id_tax"
);

CREATE TABLE "ps_order_state" (
  "id_order_state" int4 NOT NULL,
  "invoice" int2,
  "send_email" int2 NOT NULL,
  "module_name" varchar(255),
  "color" varchar(32),
  "unremovable" int2 NOT NULL,
  "hidden" int2 NOT NULL,
  "logable" int2 NOT NULL,
  "delivery" int2 NOT NULL,
  "shipped" int2 NOT NULL,
  "paid" int2 NOT NULL,
  "pdf_invoice" int2 NOT NULL,
  "pdf_delivery" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  PRIMARY KEY ("id_order_state")
);
CREATE INDEX "module_name" ON "ps_order_state" USING btree (
  "module_name"
);

CREATE TABLE "ps_order_state_lang" (
  "id_order_state" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "template" varchar(64) NOT NULL,
  PRIMARY KEY ("id_order_state", "id_lang")
);

CREATE TABLE "ps_orders" (
  "id_order" int4 NOT NULL,
  "reference" varchar(9),
  "id_shop_group" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_carrier" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "id_customer" int4 NOT NULL,
  "id_cart" int4 NOT NULL,
  "id_currency" int4 NOT NULL,
  "id_address_delivery" int4 NOT NULL,
  "id_address_invoice" int4 NOT NULL,
  "current_state" int4 NOT NULL,
  "secure_key" varchar(32) NOT NULL,
  "payment" varchar(255) NOT NULL,
  "conversion_rate" numeric(13,6) NOT NULL,
  "module" varchar(255),
  "recyclable" int2 NOT NULL,
  "gift" int2 NOT NULL,
  "gift_message" text,
  "mobile_theme" int2 NOT NULL,
  "shipping_number" varchar(64),
  "total_discounts" numeric(20,6) NOT NULL,
  "total_discounts_tax_incl" numeric(20,6) NOT NULL,
  "total_discounts_tax_excl" numeric(20,6) NOT NULL,
  "total_paid" numeric(20,6) NOT NULL,
  "total_paid_tax_incl" numeric(20,6) NOT NULL,
  "total_paid_tax_excl" numeric(20,6) NOT NULL,
  "total_paid_real" numeric(20,6) NOT NULL,
  "total_products" numeric(20,6) NOT NULL,
  "total_products_wt" numeric(20,6) NOT NULL,
  "total_shipping" numeric(20,6) NOT NULL,
  "total_shipping_tax_incl" numeric(20,6) NOT NULL,
  "total_shipping_tax_excl" numeric(20,6) NOT NULL,
  "carrier_tax_rate" numeric(10,3) NOT NULL,
  "total_wrapping" numeric(20,6) NOT NULL,
  "total_wrapping_tax_incl" numeric(20,6) NOT NULL,
  "total_wrapping_tax_excl" numeric(20,6) NOT NULL,
  "round_mode" int2 NOT NULL,
  "round_type" int2 NOT NULL,
  "invoice_number" int4 NOT NULL,
  "delivery_number" int4 NOT NULL,
  "invoice_date" timestamp NOT NULL,
  "delivery_date" timestamp NOT NULL,
  "valid" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_order")
);
CREATE INDEX "reference" ON "ps_orders" USING btree (
  "reference"
);
CREATE INDEX "id_customer" ON "ps_orders" USING btree (
  "id_customer"
);
CREATE INDEX "id_cart" ON "ps_orders" USING btree (
  "id_cart"
);
CREATE INDEX "invoice_number" ON "ps_orders" USING btree (
  "invoice_number"
);
CREATE INDEX "id_carrier" ON "ps_orders" USING btree (
  "id_carrier"
);
CREATE INDEX "id_lang" ON "ps_orders" USING btree (
  "id_lang"
);
CREATE INDEX "id_currency" ON "ps_orders" USING btree (
  "id_currency"
);
CREATE INDEX "id_address_delivery" ON "ps_orders" USING btree (
  "id_address_delivery"
);
CREATE INDEX "id_address_invoice" ON "ps_orders" USING btree (
  "id_address_invoice"
);
CREATE INDEX "id_shop_group" ON "ps_orders" USING btree (
  "id_shop_group"
);
CREATE INDEX "current_state" ON "ps_orders" USING btree (
  "current_state"
);
CREATE INDEX "id_shop" ON "ps_orders" USING btree (
  "id_shop"
);
CREATE INDEX "date_add" ON "ps_orders" USING btree (
  "date_add"
);

CREATE TABLE "ps_pack" (
  "id_product_pack" int4 NOT NULL,
  "id_product_item" int4 NOT NULL,
  "id_product_attribute_item" int4 NOT NULL,
  "quantity" int4 NOT NULL,
  PRIMARY KEY ("id_product_pack", "id_product_item", "id_product_attribute_item")
);
CREATE INDEX "product_item" ON "ps_pack" USING btree (
  "id_product_item",
  "id_product_attribute_item"
);

CREATE TABLE "ps_page" (
  "id_page" int4 NOT NULL,
  "id_page_type" int4 NOT NULL,
  "id_object" int4,
  PRIMARY KEY ("id_page")
);
CREATE INDEX "id_page_type" ON "ps_page" USING btree (
  "id_page_type"
);
CREATE INDEX "id_object" ON "ps_page" USING btree (
  "id_object"
);

CREATE TABLE "ps_page_type" (
  "id_page_type" int4 NOT NULL,
  "name" varchar(255) NOT NULL,
  PRIMARY KEY ("id_page_type")
);
CREATE INDEX "name" ON "ps_page_type" USING btree (
  "name"
);

CREATE TABLE "ps_page_viewed" (
  "id_page" int4 NOT NULL,
  "id_shop_group" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_date_range" int4 NOT NULL,
  "counter" int4 NOT NULL,
  PRIMARY KEY ("id_page", "id_date_range", "id_shop")
);

CREATE TABLE "ps_pagenotfound" (
  "id_pagenotfound" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_shop_group" int4 NOT NULL,
  "request_uri" varchar(256) NOT NULL,
  "http_referer" varchar(256) NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_pagenotfound")
);
CREATE INDEX "date_add" ON "ps_pagenotfound" USING btree (
  "date_add"
);

CREATE TABLE "ps_product_attachment" (
  "id_product" int4 NOT NULL,
  "id_attachment" int4 NOT NULL,
  PRIMARY KEY ("id_product", "id_attachment")
);

CREATE TABLE "ps_product_attribute" (
  "id_product_attribute" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "reference" varchar(64),
  "supplier_reference" varchar(64),
  "location" varchar(64),
  "ean13" varchar(13),
  "isbn" varchar(32),
  "upc" varchar(12),
  "mpn" varchar(40),
  "wholesale_price" numeric(20,6) NOT NULL,
  "price" numeric(20,6) NOT NULL,
  "ecotax" numeric(17,6) NOT NULL,
  "quantity" int4 NOT NULL,
  "weight" numeric(20,6) NOT NULL,
  "unit_price_impact" numeric(20,6) NOT NULL,
  "default_on" int2,
  "minimal_quantity" int4 NOT NULL,
  "low_stock_threshold" int4,
  "low_stock_alert" int2 NOT NULL,
  "available_date" date,
  PRIMARY KEY ("id_product_attribute")
);
CREATE INDEX "product_default" ON "ps_product_attribute" USING btree (
  "id_product",
  "default_on"
);
CREATE INDEX "product_attribute_product" ON "ps_product_attribute" USING btree (
  "id_product"
);
CREATE INDEX "reference" ON "ps_product_attribute" USING btree (
  "reference"
);
CREATE INDEX "supplier_reference" ON "ps_product_attribute" USING btree (
  "supplier_reference"
);
CREATE INDEX "id_product_id_product_attribute" ON "ps_product_attribute" USING btree (
  "id_product_attribute",
  "id_product"
);

CREATE TABLE "ps_product_attribute_combination" (
  "id_attribute" int4 NOT NULL,
  "id_product_attribute" int4 NOT NULL,
  PRIMARY KEY ("id_attribute", "id_product_attribute")
);
CREATE INDEX "id_product_attribute" ON "ps_product_attribute_combination" USING btree (
  "id_product_attribute"
);

CREATE TABLE "ps_product_attribute_image" (
  "id_product_attribute" int4 NOT NULL,
  "id_image" int4 NOT NULL,
  PRIMARY KEY ("id_product_attribute", "id_image")
);
CREATE INDEX "id_image" ON "ps_product_attribute_image" USING btree (
  "id_image"
);

CREATE TABLE "ps_product_attribute_shop" (
  "id_product" int4 NOT NULL,
  "id_product_attribute" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "wholesale_price" numeric(20,6) NOT NULL,
  "price" numeric(20,6) NOT NULL,
  "ecotax" numeric(17,6) NOT NULL,
  "weight" numeric(20,6) NOT NULL,
  "unit_price_impact" numeric(20,6) NOT NULL,
  "default_on" int2,
  "minimal_quantity" int4 NOT NULL,
  "low_stock_threshold" int4,
  "low_stock_alert" int2 NOT NULL,
  "available_date" date,
  PRIMARY KEY ("id_product_attribute", "id_shop")
);
CREATE INDEX "id_product" ON "ps_product_attribute_shop" USING btree (
  "id_product",
  "id_shop",
  "default_on"
);

CREATE TABLE "ps_product_carrier" (
  "id_product" int4 NOT NULL,
  "id_carrier_reference" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_product", "id_carrier_reference", "id_shop")
);

CREATE TABLE "ps_product_comment" (
  "id_product_comment" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "id_customer" int4 NOT NULL,
  "id_guest" int4 NOT NULL,
  "customer_name" varchar(64) NOT NULL,
  "title" varchar(64) NOT NULL,
  "content" text NOT NULL,
  "grade" int4 NOT NULL,
  "validate" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_product_comment")
);

CREATE TABLE "ps_product_comment_criterion" (
  "id_product_comment_criterion" int4 NOT NULL,
  "id_product_comment_criterion_type" int4 NOT NULL,
  "active" int2 NOT NULL,
  PRIMARY KEY ("id_product_comment_criterion")
);

CREATE TABLE "ps_product_comment_criterion_category" (
  "id_product_comment_criterion" int4 NOT NULL,
  "id_category" int4 NOT NULL,
  PRIMARY KEY ("id_product_comment_criterion", "id_category")
);
CREATE INDEX "id_category" ON "ps_product_comment_criterion_category" USING btree (
  "id_category"
);

CREATE TABLE "ps_product_comment_criterion_lang" (
  "id_product_comment_criterion" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  PRIMARY KEY ("id_product_comment_criterion", "id_lang")
);

CREATE TABLE "ps_product_comment_criterion_product" (
  "id_product" int4 NOT NULL,
  "id_product_comment_criterion" int4 NOT NULL,
  PRIMARY KEY ("id_product", "id_product_comment_criterion")
);
CREATE INDEX "id_product_comment_criterion" ON "ps_product_comment_criterion_product" USING btree (
  "id_product_comment_criterion"
);

CREATE TABLE "ps_product_comment_grade" (
  "id_product_comment" int4 NOT NULL,
  "id_product_comment_criterion" int4 NOT NULL,
  "grade" int4 NOT NULL,
  PRIMARY KEY ("id_product_comment", "id_product_comment_criterion")
);
CREATE INDEX "IDX_A0128571ACF38A54" ON "ps_product_comment_grade" USING btree (
  "id_product_comment"
);
CREATE INDEX "IDX_A01285718375853C" ON "ps_product_comment_grade" USING btree (
  "id_product_comment_criterion"
);

CREATE TABLE "ps_product_comment_report" (
  "id_customer" int4 NOT NULL,
  "id_product_comment" int4 NOT NULL,
  PRIMARY KEY ("id_product_comment", "id_customer")
);
CREATE INDEX "IDX_C2608AB0ACF38A54" ON "ps_product_comment_report" USING btree (
  "id_product_comment"
);

CREATE TABLE "ps_product_comment_usefulness" (
  "id_customer" int4 NOT NULL,
  "id_product_comment" int4 NOT NULL,
  "usefulness" int2 NOT NULL,
  PRIMARY KEY ("id_product_comment", "id_customer")
);
CREATE INDEX "IDX_49A8F246ACF38A54" ON "ps_product_comment_usefulness" USING btree (
  "id_product_comment"
);

CREATE TABLE "ps_product_country_tax" (
  "id_product" int4 NOT NULL,
  "id_country" int4 NOT NULL,
  "id_tax" int4 NOT NULL,
  PRIMARY KEY ("id_product", "id_country")
);

CREATE TABLE "ps_product_download" (
  "id_product_download" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "display_filename" varchar(255),
  "filename" varchar(255),
  "date_add" timestamp NOT NULL,
  "date_expiration" timestamp,
  "nb_days_accessible" int4,
  "nb_downloadable" int4,
  "active" int2 NOT NULL,
  "is_shareable" int2 NOT NULL,
  PRIMARY KEY ("id_product_download")
);

CREATE TABLE "ps_product_group_reduction_cache" (
  "id_product" int4 NOT NULL,
  "id_group" int4 NOT NULL,
  "reduction" numeric(5,4) NOT NULL,
  PRIMARY KEY ("id_product", "id_group")
);

CREATE TABLE "ps_product_lang" (
  "id_product" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "description" text,
  "description_short" text,
  "link_rewrite" varchar(128) NOT NULL,
  "meta_description" varchar(512),
  "meta_keywords" varchar(255),
  "meta_title" varchar(128),
  "name" varchar(128) NOT NULL,
  "available_now" varchar(255),
  "available_later" varchar(255),
  "delivery_in_stock" varchar(255),
  "delivery_out_stock" varchar(255),
  PRIMARY KEY ("id_product", "id_shop", "id_lang")
);
CREATE INDEX "id_lang" ON "ps_product_lang" USING btree (
  "id_lang"
);
CREATE INDEX "name" ON "ps_product_lang" USING btree (
  "name"
);

CREATE TABLE "ps_product_sale" (
  "id_product" int4 NOT NULL,
  "quantity" int4 NOT NULL,
  "sale_nbr" int4 NOT NULL,
  "date_upd" date,
  PRIMARY KEY ("id_product")
);
CREATE INDEX "quantity" ON "ps_product_sale" USING btree (
  "quantity"
);

CREATE TABLE "ps_product_shop" (
  "id_product" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_category_default" int4,
  "id_tax_rules_group" int4 NOT NULL,
  "on_sale" int2 NOT NULL,
  "online_only" int2 NOT NULL,
  "ecotax" numeric(17,6) NOT NULL,
  "minimal_quantity" int4 NOT NULL,
  "low_stock_threshold" int4,
  "low_stock_alert" int2 NOT NULL,
  "price" numeric(20,6) NOT NULL,
  "wholesale_price" numeric(20,6) NOT NULL,
  "unity" varchar(255),
  "unit_price_ratio" numeric(20,6) NOT NULL,
  "additional_shipping_cost" numeric(20,6) NOT NULL,
  "customizable" int2 NOT NULL,
  "uploadable_files" int2 NOT NULL,
  "text_fields" int2 NOT NULL,
  "active" int2 NOT NULL,
  "redirect_type" varchar(255) NOT NULL,
  "id_type_redirected" int4 NOT NULL,
  "available_for_order" int2 NOT NULL,
  "available_date" date,
  "show_condition" int2 NOT NULL,
  "condition" varchar(255) NOT NULL,
  "show_price" int2 NOT NULL,
  "indexed" int2 NOT NULL,
  "visibility" varchar(255) NOT NULL,
  "cache_default_attribute" int4,
  "advanced_stock_management" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "pack_stock_type" int4 NOT NULL,
  PRIMARY KEY ("id_product", "id_shop")
);
CREATE INDEX "id_category_default" ON "ps_product_shop" USING btree (
  "id_category_default"
);
CREATE INDEX "date_add" ON "ps_product_shop" USING btree (
  "date_add",
  "active",
  "visibility"
);
CREATE INDEX "indexed" ON "ps_product_shop" USING btree (
  "indexed",
  "active",
  "id_product"
);

CREATE TABLE "ps_product_supplier" (
  "id_product_supplier" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "id_product_attribute" int4 NOT NULL,
  "id_supplier" int4 NOT NULL,
  "product_supplier_reference" varchar(64),
  "product_supplier_price_te" numeric(20,6) NOT NULL,
  "id_currency" int4 NOT NULL,
  PRIMARY KEY ("id_product_supplier")
);
CREATE INDEX "id_product" ON "ps_product_supplier" USING btree (
  "id_product",
  "id_product_attribute",
  "id_supplier"
);
CREATE INDEX "id_supplier" ON "ps_product_supplier" USING btree (
  "id_supplier",
  "id_product"
);

CREATE TABLE "ps_product_tag" (
  "id_product" int4 NOT NULL,
  "id_tag" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  PRIMARY KEY ("id_product", "id_tag")
);
CREATE INDEX "id_tag" ON "ps_product_tag" USING btree (
  "id_tag"
);
CREATE INDEX "id_lang" ON "ps_product_tag" USING btree (
  "id_lang",
  "id_tag"
);

CREATE TABLE "ps_profile" (
  "id_profile" int4 NOT NULL,
  PRIMARY KEY ("id_profile")
);

CREATE TABLE "ps_profile_lang" (
  "id_lang" int4 NOT NULL,
  "id_profile" int4 NOT NULL,
  "name" varchar(128) NOT NULL,
  PRIMARY KEY ("id_profile", "id_lang")
);

CREATE TABLE "ps_psgdpr_consent" (
  "id_gdpr_consent" int4 NOT NULL,
  "id_module" int4 NOT NULL,
  "active" int4 NOT NULL,
  "error" int4,
  "error_message" text,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_gdpr_consent", "id_module")
);

CREATE TABLE "ps_psgdpr_consent_lang" (
  "id_gdpr_consent" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "message" text,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_gdpr_consent", "id_lang", "id_shop")
);

CREATE TABLE "ps_psgdpr_log" (
  "id_gdpr_log" int4 NOT NULL,
  "id_customer" int4,
  "id_guest" int4,
  "client_name" varchar(250),
  "id_module" int4 NOT NULL,
  "request_type" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_gdpr_log")
);

CREATE TABLE "ps_psreassurance" (
  "id_psreassurance" int4 NOT NULL,
  "icon" varchar(255),
  "custom_icon" varchar(255),
  "status" int4 NOT NULL,
  "position" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "type_link" int4,
  "id_cms" int4,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp,
  PRIMARY KEY ("id_psreassurance")
);

CREATE TABLE "ps_psreassurance_lang" (
  "id_psreassurance" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "title" varchar(255) NOT NULL,
  "description" varchar(255) NOT NULL,
  "link" varchar(255) NOT NULL,
  PRIMARY KEY ("id_psreassurance", "id_shop", "id_lang")
);

CREATE TABLE "ps_quick_access" (
  "id_quick_access" int4 NOT NULL,
  "new_window" int2 NOT NULL,
  "link" varchar(255) NOT NULL,
  PRIMARY KEY ("id_quick_access")
);

CREATE TABLE "ps_quick_access_lang" (
  "id_quick_access" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(32) NOT NULL,
  PRIMARY KEY ("id_quick_access", "id_lang")
);

CREATE TABLE "ps_range_price" (
  "id_range_price" int4 NOT NULL,
  "id_carrier" int4 NOT NULL,
  "delimiter1" numeric(20,6) NOT NULL,
  "delimiter2" numeric(20,6) NOT NULL,
  PRIMARY KEY ("id_range_price")
);
CREATE INDEX "id_carrier" ON "ps_range_price" USING btree (
  "id_carrier",
  "delimiter1",
  "delimiter2"
);

CREATE TABLE "ps_range_weight" (
  "id_range_weight" int4 NOT NULL,
  "id_carrier" int4 NOT NULL,
  "delimiter1" numeric(20,6) NOT NULL,
  "delimiter2" numeric(20,6) NOT NULL,
  PRIMARY KEY ("id_range_weight")
);
CREATE INDEX "id_carrier" ON "ps_range_weight" USING btree (
  "id_carrier",
  "delimiter1",
  "delimiter2"
);

CREATE TABLE "ps_referrer" (
  "id_referrer" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "passwd" varchar(255),
  "http_referer_regexp" varchar(64),
  "http_referer_like" varchar(64),
  "request_uri_regexp" varchar(64),
  "request_uri_like" varchar(64),
  "http_referer_regexp_not" varchar(64),
  "http_referer_like_not" varchar(64),
  "request_uri_regexp_not" varchar(64),
  "request_uri_like_not" varchar(64),
  "base_fee" numeric(5,2) NOT NULL,
  "percent_fee" numeric(5,2) NOT NULL,
  "click_fee" numeric(5,2) NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_referrer")
);

CREATE TABLE "ps_referrer_cache" (
  "id_connections_source" int4 NOT NULL,
  "id_referrer" int4 NOT NULL,
  PRIMARY KEY ("id_connections_source", "id_referrer")
);

CREATE TABLE "ps_referrer_shop" (
  "id_referrer" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "cache_visitors" int4,
  "cache_visits" int4,
  "cache_pages" int4,
  "cache_registrations" int4,
  "cache_orders" int4,
  "cache_sales" numeric(17,2),
  "cache_reg_rate" numeric(5,4),
  "cache_order_rate" numeric(5,4),
  PRIMARY KEY ("id_referrer", "id_shop")
);

CREATE TABLE "ps_request_sql" (
  "id_request_sql" int4 NOT NULL,
  "name" varchar(200) NOT NULL,
  "sql" text NOT NULL,
  PRIMARY KEY ("id_request_sql")
);

CREATE TABLE "ps_required_field" (
  "id_required_field" int4 NOT NULL,
  "object_name" varchar(32) NOT NULL,
  "field_name" varchar(32) NOT NULL,
  PRIMARY KEY ("id_required_field")
);
CREATE INDEX "object_name" ON "ps_required_field" USING btree (
  "object_name"
);

CREATE TABLE "ps_risk" (
  "id_risk" int4 NOT NULL,
  "percent" int2 NOT NULL,
  "color" varchar(32),
  PRIMARY KEY ("id_risk")
);

CREATE TABLE "ps_risk_lang" (
  "id_risk" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(20) NOT NULL,
  PRIMARY KEY ("id_risk", "id_lang")
);
CREATE INDEX "id_risk" ON "ps_risk_lang" USING btree (
  "id_risk"
);

CREATE TABLE "ps_search_engine" (
  "id_search_engine" int4 NOT NULL,
  "server" varchar(64) NOT NULL,
  "getvar" varchar(16) NOT NULL,
  PRIMARY KEY ("id_search_engine")
);

CREATE TABLE "ps_search_index" (
  "id_product" int4 NOT NULL,
  "id_word" int4 NOT NULL,
  "weight" int2 NOT NULL,
  PRIMARY KEY ("id_word", "id_product")
);
CREATE INDEX "id_product" ON "ps_search_index" USING btree (
  "id_product",
  "weight"
);

CREATE TABLE "ps_search_word" (
  "id_word" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "word" varchar(30) NOT NULL,
  PRIMARY KEY ("id_word")
);
CREATE INDEX "id_lang" ON "ps_search_word" USING btree (
  "id_lang",
  "id_shop",
  "word"
);

CREATE TABLE "ps_sekeyword" (
  "id_sekeyword" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_shop_group" int4 NOT NULL,
  "keyword" varchar(256) NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_sekeyword")
);

CREATE TABLE "ps_shop" (
  "id_shop" int4 NOT NULL,
  "id_shop_group" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "id_category" int4 NOT NULL,
  "theme_name" varchar(255) NOT NULL,
  "active" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  PRIMARY KEY ("id_shop")
);
CREATE INDEX "IDX_CBDFBB9EF5C9E40" ON "ps_shop" USING btree (
  "id_shop_group"
);

CREATE TABLE "ps_shop_group" (
  "id_shop_group" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "share_customer" int2 NOT NULL,
  "share_order" int2 NOT NULL,
  "share_stock" int2 NOT NULL,
  "active" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  PRIMARY KEY ("id_shop_group")
);

CREATE TABLE "ps_shop_url" (
  "id_shop_url" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "domain" varchar(150) NOT NULL,
  "domain_ssl" varchar(150) NOT NULL,
  "physical_uri" varchar(64) NOT NULL,
  "virtual_uri" varchar(64) NOT NULL,
  "main" int2 NOT NULL,
  "active" int2 NOT NULL,
  PRIMARY KEY ("id_shop_url")
);
CREATE INDEX "full_shop_url" ON "ps_shop_url" USING btree (
  "domain",
  "physical_uri",
  "virtual_uri"
);
CREATE INDEX "full_shop_url_ssl" ON "ps_shop_url" USING btree (
  "domain_ssl",
  "physical_uri",
  "virtual_uri"
);
CREATE INDEX "id_shop" ON "ps_shop_url" USING btree (
  "id_shop",
  "main"
);

CREATE TABLE "ps_smarty_cache" (
  "id_smarty_cache" char(40) NOT NULL,
  "name" char(40) NOT NULL,
  "cache_id" varchar(254),
  "modified" timestamp NOT NULL,
  "content" text NOT NULL,
  PRIMARY KEY ("id_smarty_cache")
);
CREATE INDEX "name" ON "ps_smarty_cache" USING btree (
  "name"
);
CREATE INDEX "cache_id" ON "ps_smarty_cache" USING btree (
  "cache_id"
);
CREATE INDEX "modified" ON "ps_smarty_cache" USING btree (
  "modified"
);

CREATE TABLE "ps_smarty_last_flush" (
  "type" varchar(255) NOT NULL,
  "last_flush" timestamp NOT NULL,
  PRIMARY KEY ("type")
);

CREATE TABLE "ps_smarty_lazy_cache" (
  "template_hash" varchar(32) NOT NULL,
  "cache_id" varchar(191) NOT NULL,
  "compile_id" varchar(32) NOT NULL,
  "filepath" varchar(255) NOT NULL,
  "last_update" timestamp NOT NULL,
  PRIMARY KEY ("template_hash", "cache_id", "compile_id")
);

CREATE TABLE "ps_specific_price" (
  "id_specific_price" int4 NOT NULL,
  "id_specific_price_rule" int4 NOT NULL,
  "id_cart" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_shop_group" int4 NOT NULL,
  "id_currency" int4 NOT NULL,
  "id_country" int4 NOT NULL,
  "id_group" int4 NOT NULL,
  "id_customer" int4 NOT NULL,
  "id_product_attribute" int4 NOT NULL,
  "price" numeric(20,6) NOT NULL,
  "from_quantity" int4 NOT NULL,
  "reduction" numeric(20,6) NOT NULL,
  "reduction_tax" int2 NOT NULL,
  "reduction_type" varchar(255) NOT NULL,
  "from" timestamp NOT NULL,
  "to" timestamp NOT NULL,
  PRIMARY KEY ("id_specific_price")
);
CREATE INDEX "id_product_2" ON "ps_specific_price" USING btree (
  "id_product",
  "id_product_attribute",
  "id_customer",
  "id_cart",
  "from",
  "to",
  "id_shop",
  "id_shop_group",
  "id_currency",
  "id_country",
  "id_group",
  "from_quantity",
  "id_specific_price_rule"
);
CREATE INDEX "id_product" ON "ps_specific_price" USING btree (
  "id_product",
  "id_shop",
  "id_currency",
  "id_country",
  "id_group",
  "id_customer",
  "from_quantity",
  "from",
  "to"
);
CREATE INDEX "from_quantity" ON "ps_specific_price" USING btree (
  "from_quantity"
);
CREATE INDEX "id_specific_price_rule" ON "ps_specific_price" USING btree (
  "id_specific_price_rule"
);
CREATE INDEX "id_cart" ON "ps_specific_price" USING btree (
  "id_cart"
);
CREATE INDEX "id_product_attribute" ON "ps_specific_price" USING btree (
  "id_product_attribute"
);
CREATE INDEX "id_shop" ON "ps_specific_price" USING btree (
  "id_shop"
);
CREATE INDEX "id_customer" ON "ps_specific_price" USING btree (
  "id_customer"
);
CREATE INDEX "from" ON "ps_specific_price" USING btree (
  "from"
);
CREATE INDEX "to" ON "ps_specific_price" USING btree (
  "to"
);

CREATE TABLE "ps_specific_price_priority" (
  "id_specific_price_priority" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "priority" varchar(80) NOT NULL,
  PRIMARY KEY ("id_specific_price_priority", "id_product")
);
CREATE INDEX "id_product" ON "ps_specific_price_priority" USING btree (
  "id_product"
);

CREATE TABLE "ps_specific_price_rule" (
  "id_specific_price_rule" int4 NOT NULL,
  "name" varchar(255) NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_currency" int4 NOT NULL,
  "id_country" int4 NOT NULL,
  "id_group" int4 NOT NULL,
  "from_quantity" int4 NOT NULL,
  "price" numeric(20,6),
  "reduction" numeric(20,6) NOT NULL,
  "reduction_tax" int2 NOT NULL,
  "reduction_type" varchar(255) NOT NULL,
  "from" timestamp NOT NULL,
  "to" timestamp NOT NULL,
  PRIMARY KEY ("id_specific_price_rule")
);
CREATE INDEX "id_product" ON "ps_specific_price_rule" USING btree (
  "id_shop",
  "id_currency",
  "id_country",
  "id_group",
  "from_quantity",
  "from",
  "to"
);

CREATE TABLE "ps_specific_price_rule_condition" (
  "id_specific_price_rule_condition" int4 NOT NULL,
  "id_specific_price_rule_condition_group" int4 NOT NULL,
  "type" varchar(255) NOT NULL,
  "value" varchar(255) NOT NULL,
  PRIMARY KEY ("id_specific_price_rule_condition")
);
CREATE INDEX "id_specific_price_rule_condition_group" ON "ps_specific_price_rule_condition" USING btree (
  "id_specific_price_rule_condition_group"
);

CREATE TABLE "ps_specific_price_rule_condition_group" (
  "id_specific_price_rule_condition_group" int4 NOT NULL,
  "id_specific_price_rule" int4 NOT NULL,
  PRIMARY KEY ("id_specific_price_rule_condition_group", "id_specific_price_rule")
);

CREATE TABLE "ps_state" (
  "id_state" int4 NOT NULL,
  "id_country" int4 NOT NULL,
  "id_zone" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "iso_code" varchar(7) NOT NULL,
  "tax_behavior" int2 NOT NULL,
  "active" int2 NOT NULL,
  PRIMARY KEY ("id_state")
);
CREATE INDEX "id_country" ON "ps_state" USING btree (
  "id_country"
);
CREATE INDEX "name" ON "ps_state" USING btree (
  "name"
);
CREATE INDEX "id_zone" ON "ps_state" USING btree (
  "id_zone"
);

CREATE TABLE "ps_statssearch" (
  "id_statssearch" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_shop_group" int4 NOT NULL,
  "keywords" varchar(255) NOT NULL,
  "results" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_statssearch")
);

CREATE TABLE "ps_stock" (
  "id_stock" int4 NOT NULL,
  "id_warehouse" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "id_product_attribute" int4 NOT NULL,
  "reference" varchar(64) NOT NULL,
  "ean13" varchar(13),
  "isbn" varchar(32),
  "upc" varchar(12),
  "mpn" varchar(40),
  "physical_quantity" int4 NOT NULL,
  "usable_quantity" int4 NOT NULL,
  "price_te" numeric(20,6),
  PRIMARY KEY ("id_stock")
);
CREATE INDEX "id_warehouse" ON "ps_stock" USING btree (
  "id_warehouse"
);
CREATE INDEX "id_product" ON "ps_stock" USING btree (
  "id_product"
);
CREATE INDEX "id_product_attribute" ON "ps_stock" USING btree (
  "id_product_attribute"
);

CREATE TABLE "ps_stock_available" (
  "id_stock_available" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "id_product_attribute" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "id_shop_group" int4 NOT NULL,
  "quantity" int4 NOT NULL,
  "physical_quantity" int4 NOT NULL,
  "reserved_quantity" int4 NOT NULL,
  "depends_on_stock" int2 NOT NULL,
  "out_of_stock" int2 NOT NULL,
  "location" varchar(255) NOT NULL,
  PRIMARY KEY ("id_stock_available")
);
CREATE INDEX "product_sqlstock" ON "ps_stock_available" USING btree (
  "id_product",
  "id_product_attribute",
  "id_shop",
  "id_shop_group"
);
CREATE INDEX "id_shop" ON "ps_stock_available" USING btree (
  "id_shop"
);
CREATE INDEX "id_shop_group" ON "ps_stock_available" USING btree (
  "id_shop_group"
);
CREATE INDEX "id_product" ON "ps_stock_available" USING btree (
  "id_product"
);
CREATE INDEX "id_product_attribute" ON "ps_stock_available" USING btree (
  "id_product_attribute"
);

CREATE TABLE "ps_stock_mvt" (
  "id_stock_mvt" int8 NOT NULL,
  "id_stock" int4 NOT NULL,
  "id_order" int4,
  "id_supply_order" int4,
  "id_stock_mvt_reason" int4 NOT NULL,
  "id_employee" int4 NOT NULL,
  "employee_lastname" varchar(32),
  "employee_firstname" varchar(32),
  "physical_quantity" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  "sign" int2 NOT NULL,
  "price_te" numeric(20,6),
  "last_wa" numeric(20,6),
  "current_wa" numeric(20,6),
  "referer" int8,
  PRIMARY KEY ("id_stock_mvt")
);
CREATE INDEX "id_stock" ON "ps_stock_mvt" USING btree (
  "id_stock"
);
CREATE INDEX "id_stock_mvt_reason" ON "ps_stock_mvt" USING btree (
  "id_stock_mvt_reason"
);

CREATE TABLE "ps_stock_mvt_reason" (
  "id_stock_mvt_reason" int4 NOT NULL,
  "sign" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "deleted" int2 NOT NULL,
  PRIMARY KEY ("id_stock_mvt_reason")
);

CREATE TABLE "ps_stock_mvt_reason_lang" (
  "id_stock_mvt_reason" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(255) NOT NULL,
  PRIMARY KEY ("id_stock_mvt_reason", "id_lang")
);

CREATE TABLE "ps_store" (
  "id_store" int4 NOT NULL,
  "id_country" int4 NOT NULL,
  "id_state" int4,
  "city" varchar(64) NOT NULL,
  "postcode" varchar(12) NOT NULL,
  "latitude" numeric(13,8),
  "longitude" numeric(13,8),
  "phone" varchar(16),
  "fax" varchar(16),
  "email" varchar(255),
  "active" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_store")
);

CREATE TABLE "ps_store_lang" (
  "id_store" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(255) NOT NULL,
  "address1" varchar(255) NOT NULL,
  "address2" varchar(255),
  "hours" text,
  "note" text,
  PRIMARY KEY ("id_store", "id_lang")
);

CREATE TABLE "ps_store_shop" (
  "id_store" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_store", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_store_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_supplier" (
  "id_supplier" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "active" int2 NOT NULL,
  PRIMARY KEY ("id_supplier")
);

CREATE TABLE "ps_supplier_lang" (
  "id_supplier" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "description" text,
  "meta_title" varchar(255),
  "meta_keywords" varchar(255),
  "meta_description" varchar(512),
  PRIMARY KEY ("id_supplier", "id_lang")
);

CREATE TABLE "ps_supplier_shop" (
  "id_supplier" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_supplier", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_supplier_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_supply_order" (
  "id_supply_order" int4 NOT NULL,
  "id_supplier" int4 NOT NULL,
  "supplier_name" varchar(64) NOT NULL,
  "id_lang" int4 NOT NULL,
  "id_warehouse" int4 NOT NULL,
  "id_supply_order_state" int4 NOT NULL,
  "id_currency" int4 NOT NULL,
  "id_ref_currency" int4 NOT NULL,
  "reference" varchar(64) NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  "date_delivery_expected" timestamp,
  "total_te" numeric(20,6),
  "total_with_discount_te" numeric(20,6),
  "total_tax" numeric(20,6),
  "total_ti" numeric(20,6),
  "discount_rate" numeric(20,6),
  "discount_value_te" numeric(20,6),
  "is_template" int2,
  PRIMARY KEY ("id_supply_order")
);
CREATE INDEX "id_supplier" ON "ps_supply_order" USING btree (
  "id_supplier"
);
CREATE INDEX "id_warehouse" ON "ps_supply_order" USING btree (
  "id_warehouse"
);
CREATE INDEX "reference" ON "ps_supply_order" USING btree (
  "reference"
);

CREATE TABLE "ps_supply_order_detail" (
  "id_supply_order_detail" int4 NOT NULL,
  "id_supply_order" int4 NOT NULL,
  "id_currency" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "id_product_attribute" int4 NOT NULL,
  "reference" varchar(64) NOT NULL,
  "supplier_reference" varchar(64) NOT NULL,
  "name" varchar(128) NOT NULL,
  "ean13" varchar(13),
  "isbn" varchar(32),
  "upc" varchar(12),
  "mpn" varchar(40),
  "exchange_rate" numeric(20,6),
  "unit_price_te" numeric(20,6),
  "quantity_expected" int4 NOT NULL,
  "quantity_received" int4 NOT NULL,
  "price_te" numeric(20,6),
  "discount_rate" numeric(20,6),
  "discount_value_te" numeric(20,6),
  "price_with_discount_te" numeric(20,6),
  "tax_rate" numeric(20,6),
  "tax_value" numeric(20,6),
  "price_ti" numeric(20,6),
  "tax_value_with_order_discount" numeric(20,6),
  "price_with_order_discount_te" numeric(20,6),
  PRIMARY KEY ("id_supply_order_detail")
);
CREATE INDEX "id_supply_order" ON "ps_supply_order_detail" USING btree (
  "id_supply_order",
  "id_product"
);
CREATE INDEX "id_product_attribute" ON "ps_supply_order_detail" USING btree (
  "id_product_attribute"
);
CREATE INDEX "id_product_product_attribute" ON "ps_supply_order_detail" USING btree (
  "id_product",
  "id_product_attribute"
);

CREATE TABLE "ps_supply_order_history" (
  "id_supply_order_history" int4 NOT NULL,
  "id_supply_order" int4 NOT NULL,
  "id_employee" int4 NOT NULL,
  "employee_lastname" varchar(255),
  "employee_firstname" varchar(255),
  "id_state" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_supply_order_history")
);
CREATE INDEX "id_supply_order" ON "ps_supply_order_history" USING btree (
  "id_supply_order"
);
CREATE INDEX "id_employee" ON "ps_supply_order_history" USING btree (
  "id_employee"
);
CREATE INDEX "id_state" ON "ps_supply_order_history" USING btree (
  "id_state"
);

CREATE TABLE "ps_supply_order_receipt_history" (
  "id_supply_order_receipt_history" int4 NOT NULL,
  "id_supply_order_detail" int4 NOT NULL,
  "id_employee" int4 NOT NULL,
  "employee_lastname" varchar(255),
  "employee_firstname" varchar(255),
  "id_supply_order_state" int4 NOT NULL,
  "quantity" int4 NOT NULL,
  "date_add" timestamp NOT NULL,
  PRIMARY KEY ("id_supply_order_receipt_history")
);
CREATE INDEX "id_supply_order_detail" ON "ps_supply_order_receipt_history" USING btree (
  "id_supply_order_detail"
);
CREATE INDEX "id_supply_order_state" ON "ps_supply_order_receipt_history" USING btree (
  "id_supply_order_state"
);

CREATE TABLE "ps_supply_order_state" (
  "id_supply_order_state" int4 NOT NULL,
  "delivery_note" int2 NOT NULL,
  "editable" int2 NOT NULL,
  "receipt_state" int2 NOT NULL,
  "pending_receipt" int2 NOT NULL,
  "enclosed" int2 NOT NULL,
  "color" varchar(32),
  PRIMARY KEY ("id_supply_order_state")
);

CREATE TABLE "ps_supply_order_state_lang" (
  "id_supply_order_state" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(128),
  PRIMARY KEY ("id_supply_order_state", "id_lang")
);

CREATE TABLE "ps_tab" (
  "id_tab" int4 NOT NULL,
  "id_parent" int4 NOT NULL,
  "position" int4 NOT NULL,
  "module" varchar(64),
  "class_name" varchar(64) NOT NULL,
  "route_name" varchar(256),
  "active" int2 NOT NULL,
  "enabled" int2 NOT NULL,
  "hide_host_mode" int2 NOT NULL,
  "icon" varchar(32),
  PRIMARY KEY ("id_tab")
);

CREATE TABLE "ps_tab_advice" (
  "id_tab" int4 NOT NULL,
  "id_advice" int4 NOT NULL,
  PRIMARY KEY ("id_tab", "id_advice")
);

CREATE TABLE "ps_tab_lang" (
  "id_tab" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(128) NOT NULL,
  PRIMARY KEY ("id_tab", "id_lang")
);
CREATE INDEX "IDX_CFD9262DED47AB56" ON "ps_tab_lang" USING btree (
  "id_tab"
);
CREATE INDEX "IDX_CFD9262DBA299860" ON "ps_tab_lang" USING btree (
  "id_lang"
);

CREATE TABLE "ps_tab_module_preference" (
  "id_tab_module_preference" int4 NOT NULL,
  "id_employee" int4 NOT NULL,
  "id_tab" int4 NOT NULL,
  "module" varchar(191) NOT NULL,
  PRIMARY KEY ("id_tab_module_preference")
);
CREATE INDEX "employee_module" ON "ps_tab_module_preference" USING btree (
  "id_employee",
  "id_tab",
  "module"
);

CREATE TABLE "ps_tag" (
  "id_tag" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(32) NOT NULL,
  PRIMARY KEY ("id_tag")
);
CREATE INDEX "tag_name" ON "ps_tag" USING btree (
  "name"
);
CREATE INDEX "id_lang" ON "ps_tag" USING btree (
  "id_lang"
);

CREATE TABLE "ps_tag_count" (
  "id_group" int4 NOT NULL,
  "id_tag" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  "counter" int4 NOT NULL,
  PRIMARY KEY ("id_group", "id_tag")
);
CREATE INDEX "id_group" ON "ps_tag_count" USING btree (
  "id_group",
  "id_lang",
  "id_shop",
  "counter"
);

CREATE TABLE "ps_tax" (
  "id_tax" int4 NOT NULL,
  "rate" numeric(10,3) NOT NULL,
  "active" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  PRIMARY KEY ("id_tax")
);

CREATE TABLE "ps_tax_lang" (
  "id_tax" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "name" varchar(32) NOT NULL,
  PRIMARY KEY ("id_tax", "id_lang")
);

CREATE TABLE "ps_tax_rule" (
  "id_tax_rule" int4 NOT NULL,
  "id_tax_rules_group" int4 NOT NULL,
  "id_country" int4 NOT NULL,
  "id_state" int4 NOT NULL,
  "zipcode_from" varchar(12) NOT NULL,
  "zipcode_to" varchar(12) NOT NULL,
  "id_tax" int4 NOT NULL,
  "behavior" int4 NOT NULL,
  "description" varchar(100) NOT NULL,
  PRIMARY KEY ("id_tax_rule")
);
CREATE INDEX "id_tax_rules_group" ON "ps_tax_rule" USING btree (
  "id_tax_rules_group"
);
CREATE INDEX "id_tax" ON "ps_tax_rule" USING btree (
  "id_tax"
);
CREATE INDEX "category_getproducts" ON "ps_tax_rule" USING btree (
  "id_tax_rules_group",
  "id_country",
  "id_state",
  "zipcode_from"
);

CREATE TABLE "ps_tax_rules_group" (
  "id_tax_rules_group" int4 NOT NULL,
  "name" varchar(50) NOT NULL,
  "active" int4 NOT NULL,
  "deleted" int2 NOT NULL,
  "date_add" timestamp NOT NULL,
  "date_upd" timestamp NOT NULL,
  PRIMARY KEY ("id_tax_rules_group")
);

CREATE TABLE "ps_tax_rules_group_shop" (
  "id_tax_rules_group" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_tax_rules_group", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_tax_rules_group_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_timezone" (
  "id_timezone" int4 NOT NULL,
  "name" varchar(32) NOT NULL,
  PRIMARY KEY ("id_timezone")
);

CREATE TABLE "ps_translation" (
  "id_translation" int4 NOT NULL,
  "id_lang" int4 NOT NULL,
  "key" text NOT NULL,
  "translation" text NOT NULL,
  "domain" varchar(80) NOT NULL,
  "theme" varchar(32),
  PRIMARY KEY ("id_translation")
);
CREATE INDEX "IDX_ADEBEB36BA299860" ON "ps_translation" USING btree (
  "id_lang"
);
CREATE INDEX "key" ON "ps_translation" USING btree (
  "domain"
);

CREATE TABLE "ps_warehouse" (
  "id_warehouse" int4 NOT NULL,
  "id_currency" int4 NOT NULL,
  "id_address" int4 NOT NULL,
  "id_employee" int4 NOT NULL,
  "reference" varchar(64),
  "name" varchar(45) NOT NULL,
  "management_type" varchar(255) NOT NULL,
  "deleted" int2 NOT NULL,
  PRIMARY KEY ("id_warehouse")
);

CREATE TABLE "ps_warehouse_carrier" (
  "id_carrier" int4 NOT NULL,
  "id_warehouse" int4 NOT NULL,
  PRIMARY KEY ("id_warehouse", "id_carrier")
);
CREATE INDEX "id_warehouse" ON "ps_warehouse_carrier" USING btree (
  "id_warehouse"
);
CREATE INDEX "id_carrier" ON "ps_warehouse_carrier" USING btree (
  "id_carrier"
);

CREATE TABLE "ps_warehouse_product_location" (
  "id_warehouse_product_location" int4 NOT NULL,
  "id_product" int4 NOT NULL,
  "id_product_attribute" int4 NOT NULL,
  "id_warehouse" int4 NOT NULL,
  "location" varchar(64),
  PRIMARY KEY ("id_warehouse_product_location")
);
CREATE INDEX "id_product" ON "ps_warehouse_product_location" USING btree (
  "id_product",
  "id_product_attribute",
  "id_warehouse"
);

CREATE TABLE "ps_warehouse_shop" (
  "id_shop" int4 NOT NULL,
  "id_warehouse" int4 NOT NULL,
  PRIMARY KEY ("id_warehouse", "id_shop")
);
CREATE INDEX "id_warehouse" ON "ps_warehouse_shop" USING btree (
  "id_warehouse"
);
CREATE INDEX "id_shop" ON "ps_warehouse_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_web_browser" (
  "id_web_browser" int4 NOT NULL,
  "name" varchar(64),
  PRIMARY KEY ("id_web_browser")
);

CREATE TABLE "ps_webservice_account" (
  "id_webservice_account" int4 NOT NULL,
  "key" varchar(32) NOT NULL,
  "description" text,
  "class_name" varchar(50) NOT NULL,
  "is_module" int2 NOT NULL,
  "module_name" varchar(50),
  "active" int2 NOT NULL,
  PRIMARY KEY ("id_webservice_account")
);
CREATE INDEX "key" ON "ps_webservice_account" USING btree (
  "key"
);

CREATE TABLE "ps_webservice_account_shop" (
  "id_webservice_account" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_webservice_account", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_webservice_account_shop" USING btree (
  "id_shop"
);

CREATE TABLE "ps_webservice_permission" (
  "id_webservice_permission" int4 NOT NULL,
  "resource" varchar(50) NOT NULL,
  "method" varchar(255) NOT NULL,
  "id_webservice_account" int4 NOT NULL,
  PRIMARY KEY ("id_webservice_permission")
);
CREATE INDEX "resource_2" ON "ps_webservice_permission" USING btree (
  "resource",
  "method",
  "id_webservice_account"
);
CREATE INDEX "resource" ON "ps_webservice_permission" USING btree (
  "resource"
);
CREATE INDEX "method" ON "ps_webservice_permission" USING btree (
  "method"
);
CREATE INDEX "id_webservice_account" ON "ps_webservice_permission" USING btree (
  "id_webservice_account"
);

CREATE TABLE "ps_zone" (
  "id_zone" int4 NOT NULL,
  "name" varchar(64) NOT NULL,
  "active" int2 NOT NULL,
  PRIMARY KEY ("id_zone")
);

CREATE TABLE "ps_zone_shop" (
  "id_zone" int4 NOT NULL,
  "id_shop" int4 NOT NULL,
  PRIMARY KEY ("id_zone", "id_shop")
);
CREATE INDEX "id_shop" ON "ps_zone_shop" USING btree (
  "id_shop"
);

