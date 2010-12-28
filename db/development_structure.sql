CREATE TABLE `compscrapers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_search_phrase` varchar(255) DEFAULT NULL,
  `word_that_occur` varchar(255) DEFAULT NULL,
  `sort_options` varchar(255) DEFAULT NULL,
  `lowest_price` decimal(8,2) DEFAULT '0.00',
  `decimal` decimal(8,2) DEFAULT '0.00',
  `second_lowest_price` decimal(8,2) DEFAULT '0.00',
  `third_lowest_price` decimal(8,2) DEFAULT '0.00',
  `fourth_lowest_price` decimal(8,2) DEFAULT '0.00',
  `fifth_lowest_price` decimal(8,2) DEFAULT '0.00',
  `sixth_lowest_price` decimal(8,2) DEFAULT '0.00',
  `lowest_site` varchar(255) DEFAULT NULL,
  `second_lowest_site` varchar(255) DEFAULT NULL,
  `third_lowest_site` varchar(255) DEFAULT NULL,
  `fourth_lowest_site` varchar(255) DEFAULT NULL,
  `fifth_lowest_site` varchar(255) DEFAULT NULL,
  `sixth_lowest_site` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `hard_code_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promo_tag` text,
  `backup_table_heading` varchar(255) DEFAULT NULL,
  `backup_table_text` text,
  `where_pro_coming_open_tag` text,
  `pdf_logo_image_url` text,
  `open_table_tag` text,
  `open_table_tag_1_of_3` text,
  `open_table_tag_2_of_3` text,
  `open_table_tag_3_of_3` text,
  `close_table_tag` text,
  `where_pro_coming_mid_section` text,
  `where_pro_coming_close_tag` text,
  `product_title_ot` text,
  `product_title_ct` varchar(255) DEFAULT NULL,
  `related_downloads_ot` text,
  `re_dl_code_1_of_3` text,
  `re_dl_code_2_of_3` text,
  `re_dl_code_3_of_3` text,
  `re_dl_code_a1` text,
  `re_dl_code_a1_table` text,
  `re_dl_code_a2` text,
  `re_dl_code_a2_table` text,
  `man_title_ot` text,
  `man_title_ct` text,
  `reference_ot` text,
  `reference_mid_tag` varchar(255) DEFAULT NULL,
  `reference_mid_2` varchar(255) DEFAULT NULL,
  `reference_end_tag` varchar(255) DEFAULT NULL,
  `instructions` text,
  `shipping_calculator` text,
  `return_detail_open` text,
  `return_detail_close` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `insets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `inset` varchar(60) DEFAULT NULL,
  `inset_2` varchar(60) DEFAULT NULL,
  `inset_3` varchar(60) DEFAULT NULL,
  `inset_4` varchar(60) DEFAULT NULL,
  `inset_5` varchar(60) DEFAULT NULL,
  `inset_6` varchar(60) DEFAULT NULL,
  `inset_7` varchar(60) DEFAULT NULL,
  `inset_8` varchar(60) DEFAULT NULL,
  `inset_9` varchar(60) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` text,
  `manufacturer` varchar(60) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `warranty` varchar(200) DEFAULT NULL,
  `is_usps_approved` tinyint(1) DEFAULT '0',
  `image` varchar(60) DEFAULT NULL,
  `Item_description_with_html` text,
  `options` text,
  `Item_description_without_html` text,
  `return_details` varchar(200) DEFAULT NULL,
  `availability` varchar(200) DEFAULT NULL,
  `shipping_time` varchar(200) DEFAULT NULL,
  `related_Items` varchar(100) DEFAULT NULL,
  `related_referrence_sku` varchar(60) DEFAULT NULL,
  `promo_code_section_availablility` tinyint(1) DEFAULT '0',
  `disclaimer_name` varchar(60) DEFAULT NULL,
  `disclaimer_text` text,
  `product_cmng_img_tag_html` text,
  `brief_summary_of_menu` text,
  `freight_cost_overide` decimal(8,2) DEFAULT '0.00',
  `po_description_details` text,
  `origin_zip` int(11) DEFAULT '30087',
  `invalid_ship_methods` int(11) DEFAULT '101',
  `phone_number_visibility` tinyint(1) DEFAULT '0',
  `item_number_visiblity` tinyint(1) DEFAULT '1',
  `product_id` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `price_override` decimal(8,2) DEFAULT '0.00',
  `active_status` varchar(255) DEFAULT 'Active',
  `product_type` varchar(255) DEFAULT 'Non-inventory Part',
  `cogs_account` varchar(255) DEFAULT 'Cost of Goods Sold',
  `account` varchar(255) DEFAULT 'Sales',
  `sales_tax_code` varchar(255) DEFAULT 'Tax',
  `purchased_for_resale` varchar(255) DEFAULT 'y',
  `is_new` varchar(255) DEFAULT 'New',
  `free_ship_method` int(11) DEFAULT '1',
  `taxable` tinyint(1) DEFAULT '1',
  `ship_alone` tinyint(1) DEFAULT '0',
  `free_shipping` tinyint(1) DEFAULT '0',
  `po_description_detail` varchar(255) DEFAULT 'NONE',
  `commercial_free_shipping` tinyint(1) DEFAULT '0',
  `streetsign_free_shipping` tinyint(1) DEFAULT '0',
  `streetlights_free_shipping` tinyint(1) DEFAULT '0',
  `addressplaq_free_shipping` tinyint(1) DEFAULT '0',
  `commercial_adjustment` decimal(8,2) DEFAULT '0.00',
  `streetsign_adjustment` decimal(8,2) DEFAULT '0.00',
  `streetlights_adjustment` decimal(8,2) DEFAULT '0.00',
  `addressplaq_adjustment` decimal(8,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `material` varchar(30) DEFAULT NULL,
  `style` varchar(30) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `actual_weight` decimal(8,2) DEFAULT '0.00',
  `ship_weight` decimal(8,2) DEFAULT '0.00',
  `overall_size` varchar(200) DEFAULT NULL,
  `wholesale_cost` decimal(8,2) DEFAULT '0.00',
  `map_pricing` decimal(8,2) DEFAULT '0.00',
  `number_of_boxes` int(11) DEFAULT '1',
  `multi_box_weights` decimal(8,2) DEFAULT '0.00',
  `multi_box_dimensions` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `text_anchors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `anchor_text_1` varchar(200) DEFAULT NULL,
  `anchor_text_2` varchar(200) DEFAULT NULL,
  `anchor_text_3` varchar(200) DEFAULT NULL,
  `anchor_text_4` varchar(200) DEFAULT NULL,
  `anchor_text_5` varchar(200) DEFAULT NULL,
  `anchor_text_6` varchar(200) DEFAULT NULL,
  `anchor_text_7` varchar(200) DEFAULT NULL,
  `anchor_text_8` varchar(200) DEFAULT NULL,
  `anchor_text_9` varchar(200) DEFAULT NULL,
  `anchor_text_10` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `url_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `url_link_1` varchar(255) DEFAULT NULL,
  `url_link_2` varchar(255) DEFAULT NULL,
  `url_link_3` varchar(255) DEFAULT NULL,
  `url_link_4` varchar(255) DEFAULT NULL,
  `url_link_5` varchar(255) DEFAULT NULL,
  `url_link_6` varchar(255) DEFAULT NULL,
  `url_link_7` varchar(255) DEFAULT NULL,
  `url_link_8` varchar(255) DEFAULT NULL,
  `url_link_9` varchar(255) DEFAULT NULL,
  `url_link_10` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(40) DEFAULT NULL,
  `name` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `crypted_password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(40) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT 'passive',
  `deleted_at` datetime DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('20100813223003');

INSERT INTO schema_migrations (version) VALUES ('20101125181602');

INSERT INTO schema_migrations (version) VALUES ('20101129193642');

INSERT INTO schema_migrations (version) VALUES ('20101209201120');

INSERT INTO schema_migrations (version) VALUES ('20101209210109');

INSERT INTO schema_migrations (version) VALUES ('20101211162619');

INSERT INTO schema_migrations (version) VALUES ('20101218154924');