ALTER TABLE `sufficiency` ADD `last_update` CHAR(10) NOT NULL AFTER `added_by`, ADD `last_update_by` TINYINT(3) NOT NULL AFTER `last_update`;
