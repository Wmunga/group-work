CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE `brand` (
  `brand_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `product_category` (
  `category_id` int PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(255)
);

CREATE TABLE `product` (
  `product_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `brand_id` int,
  `category_id` int,
  `base_price` decimal
);

CREATE TABLE `product_image` (
  `image_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int,
  `image_url` varchar(255)
);

CREATE TABLE `color` (
  `color_id` int PRIMARY KEY AUTO_INCREMENT,
  `color_name` varchar(255)
);

CREATE TABLE `size_category` (
  `size_category_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `size_option` (
  `size_option_id` int PRIMARY KEY AUTO_INCREMENT,
  `size_category_id` int,
  `size_label` varchar(255)
);

CREATE TABLE `product_variation` (
  `variation_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int,
  `color_id` int,
  `size_option_id` int
);

CREATE TABLE `product_item` (
  `item_id` int PRIMARY KEY AUTO_INCREMENT,
  `variation_id` int,
  `sku` varchar(255),
  `price` decimal,
  `stock_quantity` int
);

CREATE TABLE `attribute_category` (
  `attribute_category_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `attribute_type` (
  `attribute_type_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `product_attribute` (
  `attribute_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int,
  `attribute_category_id` int,
  `attribute_type_id` int,
  `name` varchar(255),
  `value` varchar(255)
);

ALTER TABLE `product` ADD FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`);

ALTER TABLE `product_image` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `size_option` ADD FOREIGN KEY (`size_category_id`) REFERENCES `size_category` (`size_category_id`);

ALTER TABLE `product_variation` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `product_variation` ADD FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`);

ALTER TABLE `product_variation` ADD FOREIGN KEY (`size_option_id`) REFERENCES `size_option` (`size_option_id`);

ALTER TABLE `product_item` ADD FOREIGN KEY (`variation_id`) REFERENCES `product_variation` (`variation_id`);

ALTER TABLE `product_attribute` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `product_attribute` ADD FOREIGN KEY (`attribute_category_id`) REFERENCES `attribute_category` (`attribute_category_id`);

ALTER TABLE `product_attribute` ADD FOREIGN KEY (`attribute_type_id`) REFERENCES `attribute_type` (`attribute_type_id`);


INSERT INTO brand (name) VALUES
('Nike'), ('Apple'), ('Samsung'), ('Adidas'), ('Sony');

-- Insert into product_category
INSERT INTO product_category (category_name) VALUES
('Clothing'), ('Electronics'), ('Footwear'), ('Accessories'), ('Home Appliances');

-- Insert into product
INSERT INTO product (name, brand_id, category_id, base_price) VALUES
('Air Max Shoes', 1, 3, 120.00),
('iPhone 14', 2, 2, 999.99),
('Galaxy S23', 3, 2, 899.99),
('Running Shorts', 4, 1, 35.50),
('Wireless Headphones', 5, 2, 199.99);

-- Insert into product_image
INSERT INTO product_image (product_id, image_url) VALUES
(1, 'airmax.jpg'),
(2, 'iphone14.jpg'),
(3, 'galaxys23.jpg'),
(4, 'shorts.jpg'),
(5, 'headphones.jpg');

-- Insert into color
INSERT INTO color (color_name) VALUES
('Red'), ('Black'), ('White'), ('Blue'), ('Green');

-- Insert into size_category
INSERT INTO size_category (name) VALUES
('Clothing Sizes'), ('Shoe Sizes'), ('Hat Sizes'), ('Electronics Sizes'), ('Accessory Sizes');

-- Insert into size_option
INSERT INTO size_option (size_category_id, size_label) VALUES
(1, 'S'), (1, 'M'), (1, 'L'), (2, '40'), (2, '42');

-- Insert into product_variation
INSERT INTO product_variation (product_id, color_id, size_option_id) VALUES
(1, 2, 4), (1, 3, 5), (4, 1, 1), (4, 4, 2), (4, 5, 3);

-- Insert into product_item
INSERT INTO product_item (variation_id, sku, price, stock_quantity) VALUES
(1, 'SKU001', 125.00, 10),
(2, 'SKU002', 130.00, 8),
(3, 'SKU003', 36.00, 15),
(4, 'SKU004', 37.00, 12),
(5, 'SKU005', 38.00, 5);

-- Insert into attribute_category
INSERT INTO attribute_category (name) VALUES
('Physical'), ('Technical'), ('Material'), ('Usage'), ('Performance');

-- Insert into attribute_type
INSERT INTO attribute_type (name) VALUES
('Text'), ('Number'), ('Boolean'), ('Date'), ('Enum');

-- Insert into product_attribute
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, name, value) VALUES
(1, 1, 2, 'Weight', '1.2'),
(2, 2, 1, 'Processor', 'A16 Bionic'),
(3, 2, 1, 'Camera', '200MP'),
(4, 1, 1, 'Material', 'Polyester'),
(5, 5, 2, 'Battery Life (hrs)', '20');