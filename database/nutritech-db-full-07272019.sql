-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 26, 2019 at 09:30 PM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.3.7-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nutritech`
--

-- --------------------------------------------------------

--
-- Table structure for table `compatibility`
--

CREATE TABLE `compatibility` (
  `id` tinyint(2) NOT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `name_short` varchar(25) NOT NULL,
  `comp_text` text,
  `added_by` tinyint(3) NOT NULL,
  `create_dte` char(10) NOT NULL,
  `last_update` char(10) NOT NULL,
  `last_update_by` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `compatibility`
--

INSERT INTO `compatibility` (`id`, `symbol`, `name_short`, `comp_text`, `added_by`, `create_dte`, `last_update`, `last_update_by`) VALUES
(2, NULL, 'Level 1', 'This product has been designed to be compatible with most commonly used insecticides, fungicides and acaricides.  However, it is not feasible to test all possible combinations of pesticides it may be mixed with.  A compatibility test is recommended for combinations that have not been used previously.  Consult your Nutrient Technologies representative for detailed compatibility information.', 1, '1471838954', '1476124720', 1),
(3, NULL, 'Level 2', 'This product has been designed to be compatible with most commonly used insecticides, fungicides and acaricides.  However, it is not feasible to test all possible combinations of pesticides it may be mixed with.  A compatibility test is recommended for combinations that have not been used previously.  DO NOT mix with strongly acidic materials as injury from soluble copper may result (see additional restrictions under suggested use).  Consult your Nutrient Technologies representative for detailed compatibility information.', 1, '1472508474', '1476124730', 1),
(4, NULL, 'Level 3', 'This product has been designed to be compatible with most commonly used insecticides, fungicides and acaricides.  However, it is not feasible to test all possible combinations of pesticides it may be mixed with.  DO NOT mix with lime, fixed copper fungicides, or TPTH.  A compatibility test is recommended for combinations that have not been used previously.  Consult your Nutrient Technologies representative for detailed compatibility information.', 1, '1472508569', '1476124751', 1),
(5, NULL, 'Level 4', 'This product has been designed to be compatible with most commonly used insecticides, fungicides and acaricides.  However, it is not feasible to test all possible combinations of pesticides it may be mixed with.  DO NOT mix with lime or TPTH.  A compatibility test is recommended for combinations that have not been used previously.  Consult your Nutrient Technologies representative for detailed compatibility information.', 1, '1472508638', '1476124760', 1),
(6, NULL, 'Level 5', 'This product has been designed to be compatible with most commonly used insecticides, fungicides and acaricides.  However, it is not feasible to test all possible combinations of pesticides it may be mixed with.  DO NOT mix with lime, calcium chloride, calcium or potassium nitrate, fixed copper fungicides, or TPTH.  A compatibility test is recommended for combinations that have not been used previously.  Consult your Nutrient Technologies representative for detailed compatibility information.', 1, '1472508745', '1476124768', 1);

-- --------------------------------------------------------

--
-- Table structure for table `crop`
--

CREATE TABLE `crop` (
  `id` smallint(5) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `sub_type` varchar(45) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `create_dte` char(10) NOT NULL,
  `last_update` char(10) NOT NULL,
  `added_by` int(3) NOT NULL,
  `last_update_by` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crop`
--

INSERT INTO `crop` (`id`, `name`, `sub_type`, `image_url`, `create_dte`, `last_update`, `added_by`, `last_update_by`) VALUES
(11, 'Almonds', 'none', '1472586511.jpg', '1472426580', '1472586511', 1, 1),
(12, 'Apples, Pears', 'Tree Crops', '1472586456.jpg', '1472437741', '1472586456', 1, 1),
(13, 'Citrus, Avocado', 'none', 'CitrusAvocado1472586554.jpg', '1472586554', '1472586554', 1, 0),
(14, 'Melons, squash, cucumber', 'none', 'Melonssquashcucumber1472586608.jpg', '1472586608', '1472586608', 1, 0),
(15, 'Grapes', 'Wine, table, raisin', 'Grapes1472586638.jpg', '1472586638', '1472586638', 1, 0),
(16, 'Stone fruit, cherries', 'none', 'Stonefruit1472586756.jpg', '1472586756', '1472587080', 1, 1),
(17, 'Tomato, peppers, eggplant', 'none', 'TomatopeppersEggplant1472586798.jpg', '1472586798', '1472587064', 1, 1),
(18, 'Walnut', 'none', 'Walnut1472586831.jpg', '1472586831', '1472586831', 1, 0),
(19, 'Potato', 'none', 'Potato1472586851.jpg', '1472586851', '1472586851', 1, 0),
(20, 'Leafy Greens, celery', 'none', 'LeafyGreenslettuce1472586886.jpg', '1472586886', '1472587047', 1, 1),
(21, 'Pistachio', 'none', 'Pistachio1472588061.jpg', '1472588061', '1472588061', 1, 0),
(22, 'Strawberry', 'none', 'Strawberry1472588083.jpg', '1472588083', '1472588083', 1, 0),
(23, 'Cole crops', 'none', 'Colecrops1472588123.jpg', '1472588123', '1472588123', 1, 0),
(24, 'Berries and small fruit', 'none', 'Berriesandsmallfruit1472588148.jpg', '1472588148', '1472588148', 1, 0),
(25, 'Apple', 'none', 'da9080ffb43f660acf208517da9e90327b0ed23f.jpg', '1563333071', '1563333071', 1, 1),
(26, 'Pears', 'none', '6daa31de23c1cf9b33a211ad17b41810b64b4b5f.png', '1563333122', '1563333122', 1, 1),
(27, 'Apricot', 'none', '5bfee9cd7ec86b0bda44bed5948c4da2de5b2d04.jpeg', '1563345652', '1563345652', 1, 1),
(28, 'Artichoke', 'none', '95769b2b415475238fdaebe63d0c4578916f2663.jpeg', '1563345750', '1563345750', 1, 1),
(29, 'Avocado', 'none', 'd52a041156fb0076ef32ff6d3b7fdda4e234da69.jpg', '1563345962', '1563345962', 1, 1),
(30, 'Blueberry', 'Highbush', 'dd2c3fa10f4977e12f2eda716bb6cd8b23bb4278.png', '1563346049', '1563346049', 1, 1),
(31, 'Blueberry', 'Rabbit Eye', '7774fc838e8466bb26684b9b39fb214fed279c45.jpg', '1563346295', '1563346295', 1, 1),
(32, 'Caneberry', 'none', 'cdc74a235312b6d2248fd1fddaa75e943ab0c3c4.jpg', '1563346630', '1563346630', 1, 1),
(33, 'Cashew', 'none', 'de366b16f380bc2850bb7df98fd0abe806532d38.jpg', '1563346852', '1563447565', 1, 1),
(34, 'Cherry', 'Sweet', '369c0eabc01e6ef9521530f6f380678c643647d6.jpg', '1563347070', '1563347070', 1, 1),
(35, 'Cherry', 'Sour', 'c5dddb3205d92107a09636d04df85f11c04cd276.jpg', '1563347204', '1563347204', 1, 1),
(36, 'Cranberry', 'none', 'b546fafa5f0f3b55f4f9287edbd3ce7a3f2d99a0.jpg', '1563347344', '1563347344', 1, 1),
(37, 'Fig', 'none', 'f83276c792568af73c4fbde33b782e44be9e1f25.jpeg', '1563347523', '1563347523', 1, 1),
(38, 'Grapefruit', 'none', 'baaf1ca55f51ee83bfda11bc336ee3434ce76481.jpg', '1563347721', '1563347721', 1, 1),
(39, 'Grapes', 'Wine Leaves', 'e80d556b31df81dec4c8d3849d4fdbec52788415.jpeg', '1563349232', '1563349232', 1, 1),
(40, 'Grapes', 'Wine Petioles', '05cfc7ce8f15a30cc5672e16cf1da0ca10e1881c.jpeg', '1563349253', '1563349253', 1, 1),
(41, 'Grapes', 'Table & Raisin', '0172bc2dd280bc58c9ebb2c379f993d5ae1398f1.jpg', '1563349357', '1563349357', 1, 1),
(42, 'Grapes', 'Concord', 'c66f05294cb54486d73b6669c08c8dd743e3246a.jpg', '1563349481', '1563349481', 1, 1),
(43, 'Hazelnut', 'Filbert', '8bad983cbdfcc63d5a8a9ed89a0a84a85596e1dc.jpg', '1563349620', '1563349620', 1, 1),
(44, 'Hops', 'none', '9c8a9865f8fe161e0f4d83bbb280677657610e26.jpg', '1563349785', '1563413608', 1, 1),
(45, 'Kiwi', 'none', 'ed88217596f6745e2837d950292047d83b958fac.jpg', '1563426156', '1563426156', 1, 1),
(46, 'Lemon', 'none', '5312b24f4cd70fbb77e7496b80246c7e397f4859.png', '1563426177', '1563426177', 1, 1),
(47, 'Melons', 'Cantaloupe, Muskmelon', '2a006a9942fd7ce1955d2e96bb3d9cbca81bb568.jpg', '1563426236', '1563447747', 1, 1),
(48, 'Melons', 'Watermelon', '1bfa33a27fe949ad6db35e840f586c0c60963222.jpg', '1563426286', '1563426286', 1, 1),
(49, 'Melons', 'All Varities', '724b62b1e960ee07ee08320eaf8bd3b9958b6553.jpg', '1563426323', '1563447777', 1, 1),
(50, 'Mint', 'none', '324b266104d712f7a02ff7799bd3c4e5fc704a0e.jpg', '1563426358', '1563426358', 1, 1),
(51, 'Olive', 'none', 'f3836a4eb7dd0e09a46b8f13fee38867992b1c01.jpg', '1563426394', '1563426394', 1, 1),
(52, 'Orange', 'Navel, Valencia', '5c0663389947a4e2abc7a547f06e8e59be8ae9e4.jpg', '1563426439', '1563426439', 1, 1),
(53, 'Orange', 'Tangerine, Mandarin', '46adea1e49712692a948392e5f0fd1528f407fde.jpg', '1563426497', '1563426497', 1, 1),
(54, 'Peach', 'none', '335eb3ccc9dd72e4663de20cf43d9b6ae02d6c47.jpg', '1563426518', '1563426518', 1, 1),
(55, 'Pecan', 'none', 'b600340b1b80f06562e9a870c499b20e90755946.jpeg', '1563426533', '1563426533', 1, 1),
(56, 'Persimmons', 'none', '6111c1f569f13e3a60b14436ef83fc298678a114.jpg', '1563426549', '1563426549', 1, 1),
(57, 'Pomegranate', 'none', 'd67daadd786eca42546f69841e37140d996470b7.jpg', '1563426724', '1563426724', 1, 1),
(58, 'Dried Plum', 'none', '9faa44f061e1b3e57c7a1f867fa3c9430ed6e130.jpg', '1563426754', '1563426754', 1, 1),
(59, 'Rasberries', 'none', '1897235a326a9cd248e1bab262d14c54ce24a1cf.jpg', '1563426860', '1563426860', 1, 1),
(60, 'Alfalfa', 'none', 'faa68949cba499d6ef5aa800dda46b24cbd6fa0a.jpg', '1563426879', '1563426879', 1, 1),
(61, 'Barley', 'none', '40d86e27ff8a500683ce52e6425efaa4b924de4d.jpg', '1563426893', '1563426893', 1, 1),
(62, 'Beans', 'All types', '835e6e5458ddd32df83193bf2143bcf72be8f3d2.jpg', '1563426921', '1563426921', 1, 1),
(63, 'Beans', 'French, Snap, Dwarf..', '82e87ad06dd68fa8a52230ce8125988b1623729c.jpg', '1563426983', '1563426983', 1, 1),
(64, 'Beans', 'Lima', '7b7960f5d12b99ef9b3cf9418bd47a57d6c4f48a.jpg', '1563426999', '1563426999', 1, 1),
(65, 'Beans', 'Blackeye, Dry', '68ebde08dbe1a9803e56ae34b10fe303fad350f4.jpg', '1563427028', '1563427028', 1, 1),
(66, 'Beans', 'Garbanzo', '5f4ad0a4ecbee82747fbda657bfbaada7c030f5f.jpg', '1563427049', '1563427049', 1, 1),
(67, 'Beans', 'Fava, Field', 'd0deaa714e6b568dfb0ab6f73094a07dc56f28a3.jpg', '1563427138', '1563427138', 1, 1),
(68, 'Beans', 'Pinto', '6cb964a2c1bcafb0f82a6929c594352b11375db5.jpg', '1563427154', '1563427385', 1, 1),
(69, 'Clover', 'Alsike', 'f2caca6e87f5671908b54693c7be94a5145f5566.jpg', '1563427170', '1563427400', 1, 1),
(70, 'Beans', 'Ladino, White', '8e0070b87cb4e2470360ddccbe290821d8fc800b.jpg', '1563427218', '1563427218', 1, 1),
(71, 'Beans', 'Red', '8ba974f33cdd604dac3b5566588dd2f7e085a12d.jpg', '1563427423', '1563427423', 1, 1),
(72, 'Beans', 'Subterranean', '310d2f45fc4368cd9ae34e48e786c7187926b99e.jpg', '1563427443', '1563427443', 1, 1),
(73, 'Corn', 'Field, Silage', '4872c50bc3e91d1cd672c0de239f569b8e2a3030.jpg', '1563427468', '1563427468', 1, 1),
(74, 'Corn', 'Sweet', 'd5aea998854989289ea2d2381dc65cb6a0a62e64.jpg', '1563427487', '1563427487', 1, 1),
(75, 'Cotton', 'All types', '254b55d247e1b24a482dfc475b6e5dd12f8d84a3.jpg', '1563427513', '1563427513', 1, 1),
(76, 'Cotton', 'Acala', 'cfd8093e7aabf9eff2835016c55ce8922d113695.jpg', '1563427533', '1563427533', 1, 1),
(77, 'Cotton', 'Pima', '2396334b3be0abdfb64d6504f3adf783330f679a.jpg', '1563427546', '1563427546', 1, 1),
(78, 'Grass', 'Brome', 'df569b7231cbcc61c1e6c304ac8b31a0fc7486c8.jpg', '1563427570', '1563427570', 1, 1),
(79, 'Grass', 'Coastal Bermuda', '53af5a3de1153544375e5ac89a11b73306980152.jpg', '1563427594', '1563447343', 1, 1),
(80, 'Grass', 'Creeping Bent', '9e4197ea4daa8f179db8b1c177e96394dfe25bb3.jpg', '1563427616', '1563427616', 1, 1),
(81, 'Grass', 'Orchard', '428cb9165c5d8000a8be1dd71817d90e95e42ac6.jpg', '1563427634', '1563427634', 1, 1),
(82, 'Grass', 'Perennial Rye', 'b74a093fe2361da56cb3c95443712c2cd4d8e7e3.jpg', '1563427655', '1563427655', 1, 1),
(83, 'Grass', 'Rye', 'af9cc00733ce408b688c8b6f640bd07bea5f85cc.jpg', '1563427667', '1563427667', 1, 1),
(84, 'Grass', 'Sudan Sorghum--Sudan', 'ef024b9fc5e237f5b7e942d7d0e7e37bcfa33b7d.jpg', '1563427880', '1563427880', 1, 1),
(85, 'Grass', 'Switch', 'aacf2e112911811992428f799e6b861df9dbe002.jpg', '1563428016', '1563428016', 1, 1),
(86, 'Grass', 'Tall Fescue', '1dc7a860eadc7866463b4c49849da1eb77cb5e5b.jpg', '1563428036', '1563428036', 1, 1),
(87, 'Grass', 'Timothy', '2e63b7a751c6be30fc855ce8da609ff5c1c27ff7.jpg', '1563428067', '1563428067', 1, 1),
(88, 'Millet', 'none', '58b9854d6d82397b8fd1b825339a30d6db51bd26.jpg', '1563439819', '1563439819', 1, 1),
(89, 'Milo', 'none', '9b56200c2dc0c2b3aa07e7801c2f5aca0684423d.jpg', '1563440039', '1563440039', 1, 1),
(90, 'Oat', 'none', '270059c421a038c4124412cd8306ef54bc270d7c.jpg', '1563440151', '1563440151', 1, 1),
(91, 'Pea', 'English', '67762ed83e578fe21e22a5538124fafbac4c9816.jpg', '1563440242', '1563440262', 1, 1),
(92, 'Pea', 'Chick, Black eyed', '82b9cbc44c0ee03382516d2ed7b3570d832ce146.jpg', '1563440293', '1563440293', 1, 1),
(93, 'Pea', 'Field', 'a475771d0c8b1851bf35ad960985587c4e56e2cc.jpg', '1563440307', '1563440307', 1, 1),
(94, 'Peanut', 'none', '311f26f5ef8e2c4120bda5e7bcfe8876ef4a4335.jpg', '1563440320', '1563440320', 1, 1),
(95, 'Peppermint', 'none', 'aeaa19b4e71695a92a2cf4e223d3058ef1fd2a14.jpg', '1563440341', '1563440341', 1, 1),
(96, 'Rice', 'none', '54984c6067f1c966d8007c7533ee1c8434faa9f4.jpg', '1563440438', '1563440438', 1, 1),
(97, 'Safflower', 'none', '1a3a047afd41b665f4e0296300ac85f1b86f2a7c.jpg', '1563440600', '1563440600', 1, 1),
(98, 'Soybean', 'none', '753ddbe3934f91dddf138ab3a1b9ae1189e43863.jpg', '1563440750', '1563440750', 1, 1),
(99, 'Sugar Beet', 'none', '6b9a4e49a07085ef90396ede1848f037ed6bb422.jpeg', '1563440901', '1563440901', 1, 1),
(100, 'Sugar Cane', 'none', '03fe4f2029d810494fc58d5b2cdb15fd03568834.jpg', '1563440970', '1563440970', 1, 1),
(101, 'Wheat', 'none', '8b7794806e289a96173b635e42c43996b4163892.jpeg', '1563440992', '1563440992', 1, 1),
(102, 'Lime', 'none', '5ae6dce0a01153702e203d2fc8348c4e982764a4.jpg', '1563497571', '1563497571', 1, 1),
(103, 'Clover', 'Ladino or White', 'fc6b2efe72d77891f574552d3a23959e5be2f464.jpg', '1563671705', '1563671705', 1, 1),
(104, 'Clover', 'Red', 'bdcfae56bedfc08962e4098319d7aac87cea609c.jpg', '1563671725', '1563671725', 1, 1),
(105, 'Clover', 'Subterranean', '027b2bb16ecb828461cf6c8c24bbd142e75d987b.jpg', '1563671739', '1563671739', 1, 1),
(106, 'Sorghum', 'none', '7b139a9c2288283706d5991e302d8e5dd3ada886.jpg', '1563673600', '1563673600', 1, 1),
(107, 'Asparagus', 'none', '3e1f43b7ed41b5be4e5a04ea6c505fa604ecb5ec.gif', '1563758064', '1563758064', 1, 1),
(108, 'Broccoli', 'none', '3bff990a3ea3eafcebe714b1eec70be8d9d1525b.jpg', '1563759451', '1563759451', 1, 1),
(109, 'Brussel Sprouts', 'none', '12f7959f5e2bce28fe31e72e3b1cfb7b3dd8766b.jpg', '1563759469', '1563759469', 1, 1),
(110, 'Cabbage', 'none', '1c06c7aed4d8f115524dc54ce111a7b44071ebe0.jpg', '1563759511', '1563759511', 1, 1),
(111, 'Cabbage', 'Chinese', '7c0bdc2006ce00043f343518f08f6aad75616ac8.jpg', '1563759531', '1563759531', 1, 1),
(112, 'Carrot', 'none', 'd15b1df2a386f916565a4210b0d3b9ba241f025a.jpg', '1563759543', '1563759543', 1, 1),
(113, 'Cauliflower', 'none', 'ce26fa99e572c817f858026edb05f8e010496b7f.jpg', '1563759555', '1563759555', 1, 1),
(114, 'Celery', 'none', '3815b357f3756ec6b89c1e0a52d6212108b09f38.jpg', '1563759581', '1563759581', 1, 1),
(115, 'Collards', 'none', 'a06cb877c03d5a823509d161df54be055cfaad08.jpg', '1563759653', '1563759653', 1, 1),
(116, 'Cucumber', 'none', 'fc4ec707c803d89195ee9778fc6abda68b8b87b5.jpg', '1563759669', '1563759669', 1, 1),
(117, 'Eggplant', 'none', 'a5c8c616d1292d6484a41ff3b667ad3e3ef3884a.jpg', '1563759685', '1563759685', 1, 1),
(118, 'Endive', 'Escarole', '1397df64e100b67a3cad9dbbb1076e4d9b213f9b.jpg', '1563759773', '1563777773', 1, 3),
(119, 'Garlic', 'none', 'e30593ad5c0c55ee0dd45c5423e62a0fa181bd0b.jpg', '1563759797', '1563759797', 1, 1),
(120, 'Horseradish', 'none', '94602880cda02dc684df05bbc165af6d759ed9b7.jpg', '1563759816', '1563759816', 1, 1),
(121, 'Kale', 'none', 'fbcb3a986408e41c90b26a82fbe343b985c507d0.jpg', '1563759832', '1563759832', 1, 1),
(122, 'Kohlrabi', 'none', 'a773dc5e595394e990bcc6de553e62ea2cad46ca.jpg', '1563759876', '1563759876', 1, 1),
(123, 'Lettuce', 'All types', 'cad8b584dea35ba5c7921fea079a08a48fdb0752.jpg', '1563759895', '1563779176', 1, 3),
(124, 'Onion', 'none', '11ec88b7ac575a34fc12cae81c70e835e1a07113.jpg', '1563759917', '1563759917', 1, 1),
(125, 'Peppers', 'Chili', '2a9d40e6093041acf33fb20a8917973c53435228.jpg', '1563759942', '1563759942', 1, 1),
(126, 'Peppers', 'Bell, Sweet', '06ddbb34eb17007959378736379ca3126b4a1b35.jpg', '1563759958', '1563759958', 1, 1),
(127, 'Peppers', 'Jalapeno', 'a741bcd43d5b6760387bac40d8d9d10ad3b9cb27.jpg', '1563760004', '1563760004', 1, 1),
(128, 'Potatoes', 'All Varieties', '4fb99f49319b9a0eea894edbc6b76d4673a26c00.jpg', '1563760035', '1563781616', 1, 3),
(129, 'Potatoes', 'Russet Burbank', '4aa7358f95893062e0edeef32885f69e412b4dda.png', '1563760054', '1563760054', 1, 1),
(130, 'Potatoes', 'White, Red Boilers', '3f26aedb78197a80c3fd2145890c72a737c94a7d.jpg', '1563760095', '1563760095', 1, 1),
(131, 'Potatoes', 'Sweet', '89942ca9a6ed393635a4f2bad42936e511c8d522.jpg', '1563760112', '1563760112', 1, 1),
(132, 'Pumpkin', 'none', '3fb796b153ff38e518ce25457107007e6275cc53.jpg', '1563760129', '1563760129', 1, 1),
(133, 'Radish', 'none', 'd0062119147efa573c9836976221d7ba7f49a77f.jpg', '1563760151', '1563760151', 1, 1),
(134, 'Spinach', 'none', 'f3af7e04b9e72bf1e45861814b73274e12ac3362.jpg', '1563760166', '1563782501', 1, 3),
(135, 'Squash', 'none', '16720dd9895361911c04c655c3e288cbb8e62f4b.jpg', '1563760184', '1563760184', 1, 1),
(136, 'Tomato', 'Fresh Market', '34a6d6066c221e5c3c89a445e5d2acf0bdd4d152.jpg', '1563760206', '1563760206', 1, 1),
(137, 'Tomato', 'Process', 'eebef16be7da0baa1fc3b97556315b5c7c98777c.jpg', '1563760220', '1563760220', 1, 1),
(138, 'Tomato', 'Cherry', '585754c039e9044b3d95a8ba2615cb1d534dfe99.jpg', '1563760233', '1563760233', 1, 1),
(139, 'Turnip', 'none', '82bea3bf12a1ee43df8764db24b2a0beed883c6d.jpeg', '1563760246', '1563760246', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `deficiency`
--

CREATE TABLE `deficiency` (
  `id` int(11) NOT NULL,
  `element_id` int(4) DEFAULT NULL,
  `crop_id` int(4) DEFAULT NULL,
  `name_short` varchar(45) DEFAULT NULL,
  `image_1` varchar(75) DEFAULT NULL,
  `image_2` varchar(75) DEFAULT NULL,
  `image_3` varchar(75) DEFAULT NULL,
  `image_4` varchar(75) DEFAULT NULL,
  `added_by` tinyint(2) NOT NULL,
  `create_dte` char(10) NOT NULL,
  `last_update` char(10) NOT NULL,
  `removed_dte` char(10) NOT NULL,
  `deficiency_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deficiency`
--

INSERT INTO `deficiency` (`id`, `element_id`, `crop_id`, `name_short`, `image_1`, `image_2`, `image_3`, `image_4`, `added_by`, `create_dte`, `last_update`, `removed_dte`, `deficiency_description`) VALUES
(1, 5, 12, 'Mg Deficiency ', 'd50474a96754ffb14a7076fd53457713d53b406d.png', NULL, NULL, NULL, 1, '1473782081', '1474558326', '1474558326', 'Always on the oldest leaves first'),
(3, 9, 12, 'Mn Deficiency A,P', '02f4f9cd233dfb6bd6385838997dd6e2e9feb48a.png', NULL, NULL, NULL, 1, '1474557025', '1474558302', '1474558302', 'Newest leaves first. Leaves grow to be normal size.'),
(4, 8, 12, 'Zn Deficiency A,P', '74d7a7b5da987f43e1e46b0b5a3e25b5921b5e1e.png', NULL, NULL, NULL, 1, '1474557107', '1474558276', '1474558276', 'Yellow leaf, green veins with green borders, always newest leaves.  Leaf is not dwarfed.'),
(5, 15, 16, 'N Deficiency SF', 'a0fefd5e28a6ad570f9ec579e7ebc7a421853094.png', '833e6f00c695ac97b5c12d120ad5b12c5a8f6cb1.png', NULL, NULL, 1, '1474557237', '1479152228', '1479152228', '<li>Red coloration of stem and leaf midrib</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n<li>Stunted growth, delayed maturity, reduced yields</li>\r\n\r\n'),
(6, 3, 16, 'P Deficiency SF', 'd179323c666fcbb0ed0866b3a2a5e9df56a9ca9e.png', '8f3e7b48596226923687e3ac2790b554592f6841.png', '52851dd67b315d79a522b5cc86638f22367494d8.png', NULL, 1, '1474557386', '1479152087', '1479152087', '<li>Purplish areas on branches, stems and leaves (older leaves first)</li>\r\n<li>Leaves with a darker green color than normal</li>\r\n<li>Slow or stunted growth</li>\r\n'),
(7, 11, 16, 'Cu Deficiency SF', 'd6fb2c29f774cddf0104588e5bab812f020d7890.png', NULL, NULL, NULL, 1, '1474557503', '1474558202', '1474558202', 'Wrinkly leaves whose stems bend down.'),
(8, 10, 16, 'Fe Deficieny SF', '031da8aece140c5489686466462934909ca46417.png', '83b0984705021d3e4d763805ed49815ee03d1c61.png', 'b703ddaebad015340bae372812754e097b864041.png', NULL, 1, '1474557640', '1474558171', '1474558171', 'Newest leaves first. Yellowing of the leaf, but the veins remain green.'),
(9, 18, 16, 'K Deficiency SF', 'a3006dc12a336c71ca55fb1715b2811e5c688c53.png', '1b70236d7e6274432eeaeb5fc0abf7e3963ff26a.png', NULL, NULL, 1, '1474557767', '1476486558', '1476486558', 'Oldest leaves die back, starting at the tip and along the distal margins. May look like salt burn, but is uniquely on the oldest foliage.'),
(10, 5, 16, 'Mg Deficiency SF', 'aed49a3053bddd6fe2824ff58a9bafe255cae34d.png', '3e58fd4bbec58ef34a3694a01628d407255f4cb1.png', NULL, NULL, 1, '1474557993', '1474557993', '1474557993', 'Always on the oldest leaves first. '),
(11, 9, 16, 'Mn Deficiency SF', 'f218e53ef72e900b7654ebab97ed66c779f79513.png', 'c603f8c743050bf2e2fc619355dc2383eb70ff02.png', NULL, NULL, 1, '1474558122', '1474558122', '1474558122', 'Newest leaves first. Yellowed leaf, green veins, with green borders beside the vein.'),
(12, 18, 22, 'K Deficiency Berries', '37693ff3fa34ea00f09565056fa19696963b766a.png', NULL, NULL, NULL, 1, '1474558446', '1476486498', '1476486498', 'Oldest leaves die back, starting at the tip and along the distal margins. May look like salt burn, but is uniquely on the oldest foliage.'),
(13, 8, 22, 'Zn Deficiency Berries', '7cd7afe067979241d3bc1d22ce02c15e36beca4a.png', NULL, NULL, NULL, 1, '1474558524', '1474558524', '1474558524', 'Yellow leaf, green veins with green borders, always newest leaves.  Leaf is dwarfed.\r\n'),
(14, 12, 22, 'B Deficiency Berries', 'c4e76b4653760cf8c83f10043a0409a0adbe151f.png', 'bb40066a9caf52751053a2ed9b3dea88f34c0800.png', NULL, NULL, 1, '1474558666', '1474558666', '1474558666', 'Thickened, curled and wilted leaves. Reduced flowering.\r\n'),
(15, 6, 22, 'Ca Deficiency Berries', 'e7a10734918931b5259041a5f0b2eefc00d5dcfc.png', NULL, NULL, NULL, 1, '1474558767', '1474558767', '1474558767', 'Stunted growth. Necrotic leaf margins.\r\n'),
(16, 10, 22, 'Fe Def Strawerries', '12cfd102f6be791cff31b5189f3cef8c753ad558.png', NULL, NULL, NULL, 1, '1474558825', '1479151977', '1479151977', 'Newest leaves first. Yellowing of the leaf, but the veins remain green. '),
(17, 5, 22, 'Mg Deficiency Berries', 'c481d55e0c0f3aa7f8075874f8cfc4a2c66b45d8.png', NULL, NULL, NULL, 1, '1474558899', '1474558899', '1474558899', 'Always on the oldest leaves first. '),
(18, 15, 22, 'N Deficiency Berries', 'a339de7788eb79282f1fd6748d35a2be85512b33.png', NULL, NULL, NULL, 1, '1474558978', '1479151859', '1479151859', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n'),
(19, 12, 15, 'B Deficiency Vines', 'd5a6ce4d3403375db20d42e771f9884cbf3454ff.png', '22fd7731aa0b492c851b3ad0f49320eb9c7f9de1.png', NULL, NULL, 1, '1474559107', '1474559107', '1474559107', 'Chlorotic leaf tips and margins, reduced flowering.\r\n'),
(20, 10, 15, 'Fe Deficiency Vines', '54abf604a88d36fb22fda290ce21507c0ab8f9c9.png', 'c60aa22f76219ffcb627b5d607c35819890f3f6b.png', NULL, NULL, 1, '1474559218', '1474559218', '1474559218', 'Newest leaves first. Yellowing or whitening of the leaf, but the veins remain green. '),
(21, 5, 15, 'Mg Deficiency Vines', '8d8744b85c519e43b68282823fa5f6c80aa23ec0.png', '8754845880180c5f6e6137132741f5f4fb71bc87.jpg', NULL, NULL, 1, '1474559289', '1474559289', '1474559289', 'Always on the oldest leaves first. '),
(22, 9, 15, 'Mn Deficiency Vines', 'bcd26db655a116ed3aae369a863245bb38d1c38e.png', NULL, NULL, NULL, 1, '1474559362', '1474579799', '1474579799', 'Newest leaves first. Yellowed leaf, green veins, with green borders beside the veins'),
(23, 15, 15, 'N Deficiency Vines', '7389769b379b059b551e462ebab362113bf0c52c.png', NULL, NULL, NULL, 1, '1474559431', '1479151825', '1479151825', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n'),
(24, 18, 15, 'K Deficiency Vines', 'dedfb790b4048f1ac3346985b365387344f2fb42.png', 'e00c8763233c41ddc9a62b968b46f0b1b30aa41c.png', 'bc8fd0673b93011d7ecb3208a80b808c21876c39.png', NULL, 1, '1474559544', '1476486469', '1476486469', 'Oldest leaves die back, starting at the tip and along the distal margins. May look like salt burn, but is uniquely on the oldest foliage.'),
(25, 8, 15, 'Zn Deficiency Vines', '479cf2d7bd754b012d411f844d06674448d5ed63.png', 'b1836492a58d7e62fd10776c7b65417843776823.png', '900d0ec83a69e3d4864e13a912ad122e8b4e7793.png', NULL, 1, '1474559642', '1474559642', '1474559642', 'Yellow leaf, green veins with green borders, always newest leaves. Leaf is dwarfed.'),
(26, 10, 13, 'Fe Deficiency C,A', '234439ac40eadc36b2e9cb1e8afd7bbd85642d5c.png', 'f41daaf52dcb2b368181b59030bf78c278666bcc.png', NULL, NULL, 1, '1474559709', '1479143281', '1479143281', 'Newest leaves first. Yellowing of the leaf, but the veins remain green. '),
(27, 5, 13, 'Mg Deficiency C,A', '1172bb1b4926f10d0fbd24e572627c6b4a4793dc.png', 'e2970f75e30bb097ae2b04aa289f7e4e9b5171d9.png', NULL, NULL, 1, '1474559795', '1474559795', '1474559795', 'Oldest leaves first. Bottom center of the leaf is green, and the end and sides are yellow or orange, making an inverted \"v\" as it zigzags with the veins.'),
(28, 9, 13, 'Mn Def Citrus, Avocados', '2814d04d2dfe1e6992c29e9c7bfe9c88f1d36a3e.png', NULL, NULL, NULL, 1, '1474559849', '1479148710', '1479148710', 'Yellowed leaf, green veins, with green borders beside the veins. Leaves grow to be normal size.'),
(29, 15, 13, 'N def Citrus, Avocado', 'fd812c84b19f0f71b98e750e37761470dc16d864.png', 'c596aaac00cc34de144664025ecab016cd176f76.png', NULL, NULL, 1, '1474559893', '1479148601', '1479148601', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n<li>Excess sulfur and phosphate may cause N deficiency</li>\r\n'),
(30, 8, 13, 'Zn Def Citrus, Avocado', '9394ce056c8b351f41aded5c29342917c4d2240c.png', NULL, NULL, NULL, 1, '1474559948', '1479148494', '1479148494', 'Yellow leaf, green veins with green borders, always newest leaves. Leaf is dwarfed.'),
(31, 3, 13, 'P deficieceny citrus, avocado', 'f927877edf0dbcb63c3f3bce1ee35491249ccafc.jpg', NULL, NULL, NULL, 1, '1475784364', '1479152344', '1479152344', 'Purplish or reddish pigment forms in the oldest leaves first.  '),
(32, 18, 13, 'K Deficiency C, A', '461e38a119f85706dd1157810f3a394a76d5c965.png', NULL, NULL, NULL, 1, '1479143976', '1479853473', '1479853473', '<li>First appears in margins, then between veins in older leaves</li>\r\n<li>Begins as yellow or red and turns brown, veins remain normal color</li>\r\n<li>May also appear as burning of leaf margins and spotting of leaf</li>\r\n'),
(33, 12, 11, 'B Deficiency Almonds', 'dd10c3452031960e9b3aa4213548ac16b0ff8836.png', NULL, NULL, NULL, 1, '1479144110', '1479144110', '1479144110', '<li>Death of twigs</li>\r\n<li>Lesions along stem</li>\r\n<li>Gum exudation</li>\r\n'),
(34, 18, 11, 'K Deficiency Almonds', '2dabecdbcb81c67af0398be9a74b31cda5538485.png', NULL, NULL, NULL, 1, '1479144177', '1479853509', '1479853509', '<li>First appears in margins, then between veins in older leaves</li>\r\n<li>Begins as yellow or red and turns brown, veins remain normal color</li>\r\n<li>May also appear as burning of leaf margins and spotting of leaf</li>\r\n'),
(35, 8, 11, 'Zn Deficiency Almonds', 'ec2db46f196746a81c01c666974433e504acd8cd.png', '38d66ed4a00958f1f4075eb5565096f490583adc.png', NULL, NULL, 1, '1479144297', '1479144297', '1479144297', '<li>Symptoms first appear in terminal growth areas and younger leaves</li>\r\n<li>Reduced leaf size and interveinal yellowing</li>\r\n<li>Stunted and/or short tip/root growth and loss of turgidity</li>\r\n'),
(36, 18, 18, 'K Deficiency Walnut', '400bbb0404f98ebfc21d61b451fd8721f5d9d40a.png', '0948b597565888d761b0f11048b97f20461f4d11.png', NULL, NULL, 1, '1479144364', '1479853455', '1479853455', '<li>First appears in margins, then between veins in older leaves</li>\r\n<li>Begins as yellow or red and turns brown, veins remain normal color</li>\r\n<li>May also appear as burning of leaf margins and spotting of leaf</li>\r\n'),
(37, 8, 18, 'Zn Deficiency Walnut', '1fbe8ce91dca2a0fc95987bfa80800f56763e01e.png', NULL, NULL, NULL, 1, '1479144461', '1479144461', '1479144461', '<li>Symptoms first appear in terminal growth areas and younger leaves</li>\r\n<li>Reduced leaf size and interveinal yellowing</li>\r\n<li>Stunted and/or short tip/root growth and loss of turgidity</li>'),
(38, 6, 20, 'Ca De Leafy Vegetabls', 'cf504d214ae5816bb2aeb5c13ab897c486cc8c58.png', '4bc995fb90ce8b4dd7da812ed71be3a5ee7785cb.png', 'd012b7258a3727eb03844c76f79e639bfc2680b7.png', NULL, 1, '1479144642', '1479144642', '1479144642', '\r\n<li>Leaf shows \"tip-burn\"</li>\r\n<li>Stunted growth</li>\r\n<li>Necrotic leaf margins</li>'),
(39, 15, 20, 'N Def Leafy Vegetables', 'f2a1dbd4cb1f3ad92ef47e3b2737572f1da60bb2.png', '97868e67365fcf67a99b45c232abed2cd343b54a.png', NULL, NULL, 1, '1479144792', '1479148455', '1479148455', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n'),
(40, 3, 20, 'P Def Leafy Vegetables', 'fbb80bf6aaf6579f98750303bcec0a0151f963ce.png', NULL, NULL, NULL, 1, '1479144930', '1479144930', '1479144930', '<li>Purplish areas on stems and leaves (older leaves first)</li>\r\n<li>Leaves with a darker green color than normal</li>\r\n<li>Slow or stunted growth</li>\r\n'),
(41, 12, 23, 'Born Deficiency Cole Crop', '5d8f0f739ad22d699f02a73043ce3fbeb8d26e04.png', 'bee523ab4e926536be6cd2c923b98b5f74bc04d4.png', NULL, '25ae87bba3cab3e74800342eca3167e9f9b8d038.png', 1, '1479145383', '1479145383', '1479145383', '<li>Cracked and corky stems, petioles and midribs</li> \r\n<li>Stems of broccoli, cabbage and cauliflower can be hollow and discolored</li> \r\n<li>Cauliflower curds become brown and leaves may roll and curl</li>\r\n<li>Cabbage heads may be small and yellow</li>  '),
(42, 5, 23, 'Mg Def Cole Crops', 'c82844e96aeee3138166b9b469e242b29f65de00.png', NULL, NULL, NULL, 1, '1479145630', '1479145630', '1479145630', '<li>Occurs in strongly acidic, light, or sandy soils</li>\r\n<li>Chlorosis starts in old leaves and progresses to new growth</li>\r\n<li>Necrotic spots may form between veins</li>\r\n'),
(43, 6, 23, 'Ca Def Cole Crops', 'c439b09c65fee921251f7afbf151227c393ebe73.png', NULL, NULL, NULL, 1, '1479145925', '1479145925', '1479145925', '<li>First affects young tissues</li>\r\n<li>Necrotic leaf margins</li>\r\n<li>Internal cabbage leaves with tip burn</li>\r\n\r\n\r\n'),
(44, 13, 23, 'Mo Def Cole Crops', 'eba318a80c7d1102b2bcfe5a28d7e1459a85654d.png', 'b719ef52fce44ab27259dd62e7e9e1f2fe0e3cd2.png', NULL, NULL, 1, '1479146329', '1479146329', '1479146329', '<li>General chlorosis, looks like Nitrogen deficiency</li>\r\n<li>Young developing leaves are distorted and curled</li>\r\n<li>Cauliflower curds can be small, open, and loose</li>\r\n'),
(45, 15, 23, 'N Def Cole Crops', '7105d79b86d8432cff2c4585f61e3482504b3468.png', '66ed10b010873d09609ef3b27181325ab64c5b7e.png', NULL, NULL, 1, '1479146804', '1479854098', '1479854098', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n<li>Leaf stems tend to be thin and hard</li>\r\n'),
(46, 9, 14, 'Man Deficiency Cucubits', 'a44c4151cbc824698ebcf44f1d0b3f863b5e351b.png', '7d8fd99bcc9e65dbefb5a444ca0dabebafb2f6ef.png', NULL, NULL, 1, '1479147083', '1479147747', '1479147747', '<li>Interveinal yellowing or mottle-leaf on young leaves</li>\r\n<li>symptoms expressed on the young leaves first</li>\r\n<li>plants stunted</li>'),
(47, 18, 14, 'K Deficiency Cucurbits', '1d013263d4438f5b7560b7a85f1e319af9f830fd.png', 'd8a3bf1a29379af050d58ebba7e37f0d8aeaf968.png', NULL, NULL, 1, '1479147420', '1479853428', '1479853428', '<li>First appears in margins, then between veins in older leaves</li>\r\n<li>Begins as yellow or red and turns brown, veins remain normal color</li>\r\n<li>May also appear as burning of leaf margins and spotting of leaf</li>\r\n'),
(48, 10, 14, 'Fe Deficiency Cucurbits', 'c1f278bcdbcf1b8d9406ba69c4cd15376bbd8093.png', NULL, NULL, NULL, 1, '1479147923', '1479147923', '1479147923', '<li>Yellow or white chlorosis between green veins on younger leaves</li>\r\n<li>Poor vigor leading to death of the shoot tips</li>\r\n<li>Symptoms are most serious in poorly drained, alkaline soils</li>'),
(49, 5, 14, 'Mg Deficiency Cucurbits', '3e1019da2e4eb0cda825f4a5980235cde91b0f5f.png', NULL, NULL, NULL, 1, '1479148169', '1479148169', '1479148169', '<li>Chlorosis on the oldest leaves, may have red or orange coloration</li>\r\n<li>Older leaves shrivel and drop</li>\r\n<li>Veins remain green with the interveinal areas having orange chlorotic mottle</li>\r\n<li>Growth can be stunted</li>'),
(50, 13, 14, 'Mo Deficiency Cucurbits', 'f288667a7699bdd57abc4984a645e2f0da20b979.png', NULL, NULL, NULL, 1, '1479148333', '1479148333', '1479148333', '<li>Begins on older leaves and progresses towards the tip</li>\r\n<li>Yellow-green or pale orange interveinal mottling distributed uniformly over the leaf</li>\r\n<li>Marginal wilting, inrolling and cupping</li>\r\n<li>Flower formation is suppressed</li>'),
(51, 15, 14, 'N Deficiency Cucurbits', 'ffd3c324fab9897ed3303426020d20a1d5a8a9ea.png', NULL, NULL, NULL, 1, '1479148436', '1479148436', '1479148436', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n'),
(52, 18, 17, 'K Def Tomato, Peppers', '13e19833b68bb55f995f383fe61f8dcdfd62fd1f.png', 'ee62d42172a8f714101488e2c682f925ca10d13e.png', NULL, NULL, 1, '1479149097', '1479853407', '1479853407', '<li>First appears in margins, then between veins in older leaves</li>\r\n<li>Begins as yellow or red and turns brown, veins remain normal color</li>\r\n<li>May also appear as burning of leaf margins and spotting of leaf</li>\r\n<li>Blotchy Ripening in tomato; green and yellow areas merging into red color of surface</li>'),
(53, 6, 17, 'Ca Def Tomato, Pepper', 'a5467b4917d86b22f0bebd8d8a9f23c2f2855bdb.png', NULL, NULL, NULL, 1, '1479149280', '1479149280', '1479149280', '<li>Stunted growth</li>\r\n<li>Necrotic leaf margins</li>\r\n<li>Eventual death of terminal buds and root tips</li>\r\n<li>Necrosis of trusses and \"Blossom End Wilt\" of distal fruitlets</li>'),
(54, 5, 17, 'Mg Def Tomato, Pepper', 'e815053630acad840766382c7ab4d37239cf8f33.png', '3604bc630fe188d19cc32c7eecf5d9a152f9016b.png', NULL, NULL, 1, '1479149462', '1479149462', '1479149462', '<li>Chlorosis starts in old leaves and progresses to new growth</li>\r\n<li>Fruits show \"Green Back\"</li>\r\n'),
(55, 15, 17, 'N Def Tomato, Pepper', '1c83e3210297fc0e3e7aba3f9fe016adfb975c77.png', NULL, NULL, NULL, 1, '1479149585', '1479149585', '1479149585', '<li>Stunted and thin growth</li>\r\n<li>Delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n'),
(56, 3, 17, 'P Def Tomato, Peppers', 'f8e7f99fb41cad650fbf48c508652fc58bc049fd.png', NULL, NULL, NULL, 1, '1479149708', '1479149708', '1479149708', '<li>Purplish areas on branches, stems and leaves (older leaves first)</li>\r\n<li>Leaves with a darker green color than normal</li>\r\n<li>Slow or stunted growth</li>\r\n<li>Leaflets droop or curl backward</li>'),
(57, 5, 19, 'Mg Deficiency Potato', '24ea0f2c28a1f8a099db3e054bdb847e5d0cd51a.png', NULL, NULL, NULL, 1, '1479149934', '1479149934', '1479149934', '<li>General chlorosis on young, mature leaves first</li>\r\n<li>Interveinal neurosis and scorched appearance</li>'),
(58, 18, 19, 'K Deficiency Potato', '7adb254f00065acfc26ede923498b920ca90549e.png', NULL, NULL, NULL, 1, '1479150135', '1479853385', '1479853385', '<li>First appears in young, full-sized leaves</li>\r\n<li>May also appear as burning of leaf margins and spotting of leaf</li>\r\n<li>Leaves become crinkled</li>\r\n\r\n'),
(59, 8, 19, 'Zn Deficiency Potato', '5018906f80ad87e32c85657722b7c74d77b0ec6f.png', NULL, NULL, NULL, 1, '1479150572', '1479150572', '1479150572', '<li>Symptoms first appear in terminal growth areas and younger leaves</li>\r\n<li>Reduced leaf size and interveinal yellowing</li>\r\n<li>Stunted and/or short tip/root growth and loss of turgidity</li>\r\n'),
(60, 10, 24, 'Fe Deficiency Berries', '94bea88e271899c5309668401f960b5ced975e32.png', NULL, NULL, NULL, 1, '1479150923', '1479150923', '1479150923', '<li>Interveinal chlorosis on young leaves (yellow to almost white)</li>\r\n<li>Twig dieback</li>\r\n<li>Smaller than normal young leaves</li>\r\n'),
(61, 11, 21, 'Cu Deficiency Pistachio', 'c7344b3c8cc5a41d7f186c79b9276b9db1c44e4f.png', '7b0fb34d3b04751cdfefa49c45217f2683b0add5.png', NULL, NULL, 1, '1479151148', '1479151148', '1479151148', '<li>Reduced or stunted growth</li>\r\n<li>Distortion of young leaves/growing points</li>\r\n<li>Necrosis of apical meristem</li>\r\n<li>Increase of foliar diseases</li>\r\n'),
(62, 10, 21, 'Fe Deficiency Pistachio', '8e7e29bf05eb4d320ec3d4d4410653605c4c74aa.png', NULL, NULL, NULL, 1, '1479151238', '1479151238', '1479151238', '<li>Interveinal chlorosis on young leaves (yellow to almost white)</li>\r\n<li>Twig dieback</li>\r\n<li>Smaller than normal young leaves</li>\r\n'),
(63, 18, 21, 'K Deficiency Pistachio', '841ce067966f113bdd45bfd28c0bfa82dfe6deac.png', NULL, NULL, NULL, 1, '1479151294', '1479853367', '1479853367', '<li>First appears in margins, then between veins in older leaves</li>\r\n<li>Begins as yellow or red and turns brown, veins remain normal color</li>\r\n<li>May also appear as burning of leaf margins and spotting of leaf</li>\r\n'),
(64, 15, 21, 'N Deficiency Pistachio', '8a18248651198dd985115aa4446ffcc48ab17386.png', '2835f6d4e54889a4785c6e77de22d79f77ad6054.png', NULL, NULL, 1, '1479151345', '1479151345', '1479151345', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n'),
(65, 3, 21, 'P Deficiency Pistachio', '88bc2b639052bb54459e8e8cd27436b2428c02ca.png', NULL, NULL, NULL, 1, '1479151403', '1479151403', '1479151403', '<li>Purplish areas on branches, stems and leaves (older leaves first)</li>\r\n<li>Leaves with a darker green color than normal</li>\r\n<li>Slow or stunted growth</li>\r\n'),
(66, 8, 21, 'Zn Deficiency Pistachio', '97011a3bf17569029666dac68260f436c96b3ef5.png', NULL, NULL, NULL, 1, '1479151503', '1479151503', '1479151503', '<li>Symptoms first appear in terminal growth areas and younger leaves</li>\r\n<li>Reduced leaf size and interveinal yellowing</li>\r\n<li>Stunted and/or short tip/root growth and loss of turgidity</li>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `element`
--

CREATE TABLE `element` (
  `id` int(11) NOT NULL,
  `element_name` varchar(75) DEFAULT NULL,
  `element_desc` varchar(150) DEFAULT NULL,
  `chemical_name` varchar(20) NOT NULL,
  `benefits` text,
  `deficiency` text,
  `create_dte` char(10) NOT NULL,
  `last_update` char(10) NOT NULL,
  `last_update_by` int(3) NOT NULL,
  `symbol` varchar(45) NOT NULL,
  `show_flag` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `element`
--

INSERT INTO `element` (`id`, `element_name`, `element_desc`, `chemical_name`, `benefits`, `deficiency`, `create_dte`, `last_update`, `last_update_by`, `symbol`, `show_flag`) VALUES
(1, 'Nitrogen', '', 'N', '<li>Influences plant growth and yield</li>\r\n<li>Utilized by plant to develop chlorophyll and synthesize amino acids</li>\r\n\r\n', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n<li>Excess sulfur and phosphate may cause N deficiency</li>', '1472347297', '1474983703', 1, '', 0),
(3, 'Available Phosphate', '', 'P2O5', 'Involved in the storage and transfer of chemical energy used for:\r\n<li>Growth and reproduction</li>\r\n<li>Stimulating seed development</li>\r\n<li>Root formation</li>\r\n<li>Hastening maturity</li>\r\nPhosphorous supplementation is required for plants with:\r\n<li>Cold weather/soils</li>\r\n<li>Limited root growth period</li>\r\n<li>Rapid vegetative growth</li>\r\n', '<li>Purplish areas on branches, stems and leaves (older leaves first)</li>\r\n<li>Leaves with a darker green color than normal</li>\r\n<li>Slow or stunted growth</li>\r\n', '1472437966', '1474596847', 1, '', 1),
(4, 'Potassium', '', 'K2O', '•	Accelerates growth of meristematic tissue\r\n•	Regulates stomatal opening\r\n•	Enhances translocation of sugars for starch production\r\n•	Promotes carbohydrate/nitrogen metabolism \r\n•	Helps plant adapt to environmental effects\r\n•	Plants that produce a lot of carbohydrates have high Potassium requirements\r\n</li>', '•	First appear in the margins and then between veins in older leaves\r\n•	Discoloration begins as yellow or red and turns brown, veins remain normal color\r\n•	Discoloration may also appear as burning of leaf margins and spotting of leaf', '1472507775', '1474983721', 1, '', 0),
(5, 'Magnesium', '', 'Mg', '<li>Major component of chlorophyll molecule</li>\r\n<li>Actively involved in photosynthesis and energy metabolism</li>\r\n<li>Aids in formation of sugars, fats, and oils</li>\r\n<li>Associated with rapid growth, high protein levels, and carbohydrate utilization</li>\r\n', '<li>Imbalance result from overuse of manure, K, Ca and ammonium nitrogen</li>\r\n<li>Occurs in strongly acidic, light, or sandy soils</li>\r\n<li>Chlorosis starts in old leaves and progresses to new growth </li>\r\n', '1472507900', '1474596395', 1, '', 1),
(6, 'Calcium', '', 'Ca', '•	Involved in Nitrogen uptake\r\n•	Essential during early season cell division and growth\r\n<li>Effects vegetation and fruit set</li>\r\n<li>Important in forming cell walls, rigid structure, enhancing pollen germination and growth</li>\r\n<li>Increases flavor and storage longevity</li>\r\n<li>Reduces many physiologic disorders</li>\r\n', '<li>Stunted growth</li>\r\n<li>Necrotic leaf margins</li>\r\n<li>Eventual death of terminal buds and root tips</li>\r\n', '1472507912', '1474596299', 1, '', 1),
(7, 'Sulfur', '', 'S', '<li>Constituent of amino acids and necessary for protein synthesis</li>\r\n<li>Involved in photosynthesis and nitrogen metabolism</li>\r\n<li>Essential for nodule formation on legume roots</li>', '<li>Chlorosis on younger leaves</li>\r\n<li>Stunted growth, delayed maturity, small/spindly plants</li>\r\n<li>May be caused by high Nitrogen levels</li>\r\n', '1472507922', '1474596216', 1, '', 1),
(8, 'Zinc', '', 'Zn', '<li>Promotes starch formation</li>\r\n<li>Promotes seed and root development and maturation</li>', '<li>Symptoms first appear in terminal growth areas and younger leaves</li>\r\n<li>Reduced leaf size and interveinal yellowing</li>\r\n<li>Stunted and/or short tip/root growth and loss of turgidity</li>\r\n\r\n', '1472507930', '1474596121', 1, '', 1),
(9, 'Manganese', '', 'Mn', '<li>Activator for enzymes in plant growth process</li>\r\n<li>Required for water=splitting reaction in photosynthesis</li>\r\n<li>Assists iron in chlorophyll formation </li>\r\n<li>Generally required with zinc in foliar sprays</li>\r\n', '<li>Interveinal yellowing or mottle-leaf on young leaves</li>\r\n<li>Induced by soils with high pH or high levels of iron, copper, zinc, calcium, or magnesium</li>\r\n', '1472507964', '1474595993', 1, '', 1),
(10, 'Iron', '', 'Fe', '<li>Required for formation of chlorophyll</li>\r\n<li>Activator for respiration, photosynthesis, and symbiotic nitrogen fixation</li>\r\n\r\n', '•	Common in high pH, low aeration, and cold soils\r\n<li>Common when high levels of zinc or manganese are present</li>\r\n<li>Interveinal chlorosis on young leaves (yellow to almost white)</li>\r\n<li>Twig dieback</li>\r\n<li>Smaller than normal young leaves</li>\r\n', '1472507971', '1474595913', 1, '', 1),
(11, 'Copper', '', 'Cu', '<li>Activator of numerous plant enzymes</li>\r\n<li>Influences pigment development and fruit color</li>\r\n', '•	Reduced or stunted growth\r\n<li>Distortion of young leaves/growing points</li>\r\n<li>Necrosis of apical meristem</li>\r\n<li>Increase of foliar diseases</li>\r\n<li>Lignification is reduced or absent</li>\r\n', '1472507980', '1474595831', 1, '', 1),
(12, 'Boron', '', 'B', '<li>Involved in regulating metabolism of carbohydrates</li>\r\n<li>Improves pollen viability and increases fruit set</li>\r\n<li>Contributes to differentiation of meristematic cells</li>\r\n<li>Assists in calcium uptake and movement of starch to roots</li>\r\n', '<li>Death of terminal growth areas</li>\r\n<li>Chlorotic leaf tips and margins</li>\r\n<li>Thickened, curled and wilted leaves</li>\r\n<li>Reduced flowering</li>\r\n', '1472508021', '1474595756', 1, '', 1),
(13, 'Molybdenum', '', 'Mo', '<li>Essential for nitrate reductase enzyme</li>\r\n<li>Necessary to reduce nitrate nitrogen to the amino form</li>\r\n<li>Results in effective plant utilization of nitrogen</li>\r\n<li>Necessary for nitrogen fixation in legumes</li>\r\n', '<li>Stunted growth and general chlorosis, looks like Nitrogen deficiency</li>\r\n<li>Necrosis of leaf margins due to excess unused nitrates</li>\r\n<li>Soils with low pH or excess copper or sulfur</li>\r\n', '1472508038', '1474595665', 1, '', 1),
(14, 'Cobalt', '', 'Co', 'Cobalt is a component of a number of enzymes, increases drought resistance in seeds, and important in the life-cycle of legumes.\r\n', 'Cobalt is a component of a number of enzymes, increases drought resistance in seeds, and important in the life-cycle of legumes.\r\n', '1472508047', '1474595538', 1, '', 1),
(15, 'Total Nitrogen', '', 'N', '<li>Influences plant growth and yield</li>\r\n<li>Utilized by plant to develop chlorophyll and synthesize amino acids</li>\r\n\r\n', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n<li>Excess sulfur and phosphate may cause N deficiency</li>', '1474043127', '1474983677', 1, '', 1),
(16, 'Ammoniacal Nitrogen', '', 'N', '<li>Influences plant growth and yield</li>\r\n<li>Utilized by plant to develop chlorophyll and synthesize amino acids</li>\r\n\r\n', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n<li>Excess sulfur and phosphate may cause N deficiency</li>', '1474043229', '1474983666', 1, '', 0),
(17, 'Urea Nitrogen', '', 'N', '<li>Influences plant growth and yield</li>\r\n<li>Utilized by plant to develop chlorophyll and synthesize amino acids</li>\r\n\r\n', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n<li>Excess sulfur and phosphate may cause N deficiency</li>', '1474043241', '1474983652', 1, '', 0),
(18, 'Soluble Potash', '', 'K2O', '\r\n<li>Enhances translocation of sugars for starch production</li>\r\n<li>Promotes carbohydrate/nitrogen metabolism</li> \r\n<li>Helps plant adapt to environmental effects</li>\r\n<li>Plants that produce a lot of carbohydrates have high Potassium requirements</li>\r\n', '<li>First appears in margins, then between veins in older leaves</li>\r\n<li>Begins as yellow or red and turns brown, veins remain normal color</li>\r\n<li>May also appear as burning of leaf margins and spotting of leaf</li>\r\n', '1474043495', '1474596475', 1, '', 1),
(19, 'Nitrate Nitrogen', '', 'N', '<li>Influences plant growth and yield</li>\r\n<li>Utilized by plant to develop chlorophyll and synthesize amino acids</li>\r\n\r\n', '<li>Stunted growth, delayed maturity, reduced yields</li>\r\n<li>Chlorosis more pronounced in older plant tissue</li>\r\n<li>Excess sulfur and phosphate may cause N deficiency</li>', '1474087526', '1474983634', 1, '', 0),
(20, 'Ascophyllum Nodosum', '', 'AN', '', '', '1562835731', '1562835731', 0, '', 1),
(21, 'Chlorine', NULL, 'Cl', NULL, NULL, '1564040290', '1564040290', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `growth_stage`
--

CREATE TABLE `growth_stage` (
  `id` smallint(5) NOT NULL,
  `name_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `growth_stage`
--

INSERT INTO `growth_stage` (`id`, `name_desc`) VALUES
(115, '10-20% color'),
(93, '2-6 weeks old'),
(87, '3-4 leaf'),
(82, '3-5 months'),
(54, '3-6’'),
(110, '30-50 days'),
(34, '4 to 6-month old spring cycle leaves'),
(74, '4-6”'),
(61, '4-8 leaf'),
(9, '5 to 7-Month-Old Leaves'),
(81, '5-6 weeks pre-harvest'),
(53, '6-12”'),
(80, '6-8’'),
(99, '8-12 leaf stage'),
(72, '8-12”'),
(64, '8-leaf to heading'),
(26, 'August'),
(90, 'August-september'),
(18, 'Bloom'),
(44, 'Bloom to green fruit'),
(89, 'Boot'),
(86, 'Boot to flower (protein)'),
(66, 'Boot to heading'),
(101, 'Bulbing'),
(95, 'Early'),
(50, 'Early bloom'),
(97, 'Early bud to small fruit'),
(109, 'Early flower'),
(60, 'Early flowering'),
(35, 'Early fruit'),
(116, 'Early fruit set'),
(27, 'Early Growth'),
(7, 'Early harvest'),
(67, 'Early pegging'),
(107, 'Early season'),
(106, 'Early set'),
(2, 'Early Summer'),
(83, 'Early tiller'),
(104, 'Early vegetative growth'),
(47, 'First bloom'),
(73, 'First bud'),
(51, 'First flower'),
(36, 'First mature fruit'),
(105, 'First open bloom'),
(58, 'First open boll'),
(118, 'First pick'),
(112, 'First ripe fruit'),
(56, 'First square'),
(71, 'Flag leaf'),
(43, 'Flower bud start'),
(77, 'Flowering'),
(117, 'Fruit 1/2” diameter'),
(16, 'Fruit Maturation'),
(25, 'Full Bloom'),
(45, 'Growing season'),
(48, 'Head emergence'),
(91, 'Heading'),
(65, 'Heading to harvest'),
(94, 'Heads 1/2 size'),
(84, 'Jointing'),
(5, 'July'),
(10, 'July-August'),
(39, 'June'),
(103, 'Late fruit'),
(92, 'Late growth'),
(3, 'Late June to early July'),
(13, 'Late May to June'),
(102, 'Late season'),
(4, 'Late Summer'),
(114, 'Main set - bulking'),
(75, 'Main vegetative growth'),
(24, 'Maturation'),
(111, 'Mature'),
(69, 'Max-tiller'),
(38, 'May'),
(37, 'May-june'),
(8, 'Mid harvest'),
(6, 'Mid July-Mid Aug'),
(14, 'Mid-August to Mid-September'),
(49, 'Mid-growth'),
(79, 'Mid-season'),
(46, 'Mid-summer'),
(68, 'Mid-tiller'),
(108, 'Mid-vegetative growth'),
(28, 'NA'),
(96, 'Near maturity'),
(15, 'Non-Fruiting'),
(33, 'None'),
(70, 'Panicle initiation'),
(57, 'Peak bloom'),
(19, 'Post-Bloom'),
(21, 'Post-Veraison'),
(17, 'Pre-Bloom'),
(88, 'Pre-boot'),
(100, 'Pre-bulbing'),
(52, 'Pre-flowering'),
(59, 'Pre-harvest'),
(78, 'Prior to pod set'),
(40, 'September'),
(41, 'September-october'),
(98, 'Small fruit to harvest'),
(76, 'Soft dough'),
(1, 'Spring'),
(42, 'Summer'),
(55, 'Tassel to silk'),
(113, 'Vegetative growth'),
(20, 'Veraison'),
(85, 'Yield');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_03_06_000000_aimeos_users_table', 1),
('2015_08_10_000000_aimeos_users_label', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('343ad0bc94c7d5de5888623808be6ec1090fa78dc5118867d59db83c47e0d066cd845bb1a1367305', 1, 1, NULL, '[]', 0, '2019-05-30 12:13:35', '2019-05-30 12:13:35', '2019-06-15 00:13:35'),
('ca4e856762045f74c0569e671a227b2020a67ac1b7b3aec3847dc153022ffade05ba8a7395e53e1e', 1, 1, NULL, '[]', 0, '2019-05-30 12:38:05', '2019-05-30 12:38:05', '2019-06-15 00:38:05'),
('fae86fc2a13bbffac0c340c9af7680fce5fd4273eeb5486bdd611eababd1c30651af4914e4a38bad', 1, 1, NULL, '[]', 0, '2019-05-30 12:40:28', '2019-05-30 12:40:28', '2019-06-15 00:40:28'),
('f30d81f0224bee5dc33fe9537832b0d23d3510f18fa0bc4ca5dff853c585615a8ac12570e9ba642f', 1, 1, NULL, '[]', 0, '2019-05-30 13:23:41', '2019-05-30 13:23:41', '2019-06-15 01:23:41'),
('39f5cee3e6c8dcecaccd792b08b5edc8cb32724de587f462f92b7ebae2b68c0fa6b1ff11c3597e8c', 1, 1, NULL, '[]', 0, '2019-06-01 18:50:58', '2019-06-01 18:50:58', '2019-06-17 06:50:58'),
('70f238ef9f0d97ecbe0e2a3fb4c591d4298aabfa71b4f69d2cdbf62b1b0ea8415358359c9cc5f1cf', 1, 1, NULL, '[]', 0, '2019-06-01 19:30:38', '2019-06-01 19:30:38', '2019-06-17 07:30:37'),
('ce4f9878d6d8039a4d22c37e9ae5fa1a4cb8cafc4561c2ae3c206fa47fc7373cb3daf93721fff74a', 1, 1, NULL, '[]', 0, '2019-06-01 23:04:39', '2019-06-01 23:04:39', '2019-06-17 11:04:39'),
('ccf53d80bc7c3cac1f04b47173cd20f362b45f9da9edc5a6d65c5e1f8a2278fbc4775fcf2f23fe77', 1, 1, NULL, '[]', 0, '2019-06-01 23:08:02', '2019-06-01 23:08:02', '2019-06-17 11:08:02'),
('e9739c89f206a7666f3d3ce84471c837389c565f677601e5c9a5d5ee9e91ece624106e8820e2b262', 1, 1, NULL, '[]', 0, '2019-06-02 01:05:18', '2019-06-02 01:05:18', '2019-06-17 13:05:18'),
('c43c2aba8272fa719804248eeae27936b063e20fbbd6ef4b7b9a8add7923534e3e277b369a2110b6', 1, 1, NULL, '[]', 0, '2019-06-17 12:39:55', '2019-06-17 12:39:55', '2019-07-03 00:39:55'),
('1930fe8779c0c96409ee36807dcb6e39c9e25b23564939b516200aa8a39739725ccb3079133cd92f', 1, 1, NULL, '[]', 0, '2019-06-19 00:55:46', '2019-06-19 00:55:46', '2019-07-04 12:55:46'),
('16f1167a6e13f2f1c41ccea497353bb62fad95a638355cf2af757f5b93778cc7320c92bcdad2e424', 1, 1, NULL, '[]', 0, '2019-06-19 00:59:31', '2019-06-19 00:59:31', '2019-07-04 12:59:31'),
('1821e8c0d399d38f73a1c676e64e5105cac6a4fd5bc1aacf2b21b3a1be65c3e59bf02944cf04072d', 1, 1, NULL, '[]', 0, '2019-06-19 01:02:31', '2019-06-19 01:02:31', '2019-07-04 13:02:31'),
('a39c14f5cb8d9b7b33a0ed9c4a2b05553c959c7ce97a2bfd36aebb2bc9c8303f0fab9a163eb6deed', 1, 1, NULL, '[]', 0, '2019-06-19 12:22:13', '2019-06-19 12:22:13', '2019-07-05 00:22:13'),
('d4c10443652ddd5567420073efe147e9bb05aeeda34a26326dc480c58796c450d744a5dab82d05c2', 1, 1, NULL, '[]', 0, '2019-06-19 12:47:45', '2019-06-19 12:47:45', '2019-07-05 00:47:45'),
('e9b0a44c6aa1ceb603df2ac55d7184da280e6b9fb7b0b054bc28403f716b2017dd42f897c8356592', 1, 1, NULL, '[]', 0, '2019-06-19 12:48:13', '2019-06-19 12:48:13', '2019-07-05 00:48:13'),
('96f0888faaaae4394664466dd4c415f98a54482e75dd34d01964fa31cea8503981031c664d3ffad1', 1, 1, NULL, '[]', 0, '2019-06-19 12:48:27', '2019-06-19 12:48:27', '2019-07-05 00:48:27'),
('c382b92e27a7e5c5cde79df2cdba7e9ad5ff58b051d8bd291255ec6506b3042e5c589347f450749e', 1, 1, NULL, '[]', 0, '2019-06-20 01:51:45', '2019-06-20 01:51:45', '2019-07-05 13:51:45'),
('f49a608f75e6b973dc33d407af653d2417281ab7ab7fd72a3747f590ef6c7efbe3f64fd454ca505f', 1, 1, NULL, '[]', 0, '2019-06-20 02:00:52', '2019-06-20 02:00:52', '2019-07-05 14:00:52'),
('4542bcabbace4d77597de3ef4b70c1c46f1598211545a963536d9a37567bb19e0937f4dc42cfdd88', 1, 1, NULL, '[]', 0, '2019-06-20 02:04:53', '2019-06-20 02:04:53', '2019-07-05 14:04:53'),
('29a806759d20d7dc5d031bab926f6a1536e8b8cf5d350cab8ac90bde3d5216ec0826f12c4d58da8f', 1, 1, NULL, '[]', 0, '2019-06-20 14:11:35', '2019-06-20 14:11:35', '2019-07-06 02:11:35'),
('c56645eaf3922b446e565b7aa2bfb399903355944208f4a03a41fb25cd241b3807d9357281aca4e4', 1, 1, NULL, '[]', 0, '2019-06-20 14:13:00', '2019-06-20 14:13:00', '2019-07-06 02:13:00'),
('4debe79059f96982b71c7a11437cfe496368e4b90e87b27fe9e8150a2cd3d62fb7b9e7dbceb435d9', 1, 1, NULL, '[]', 0, '2019-06-20 14:13:16', '2019-06-20 14:13:16', '2019-07-06 02:13:16'),
('6ae7ae6e34476e88cb34e9e77de8c3b9b7125e19a6652b18875e1b46308bf37585a8e570615c9c69', 1, 1, NULL, '[]', 0, '2019-06-20 14:13:26', '2019-06-20 14:13:26', '2019-07-06 02:13:26'),
('c82b1eaf605968976dc1a7b74cabe3377a2d7fb63378ee67662cf7dc3db039c196415c4cd73d50ea', 1, 1, NULL, '[]', 0, '2019-06-20 14:14:20', '2019-06-20 14:14:20', '2019-07-06 02:14:20'),
('2f1dc6f10ce2d38d6ad92b722fb21ab7084bf33b6bf9e78035aad8837fdf32a3da7c7af6e8a928c5', 1, 1, NULL, '[]', 0, '2019-06-20 14:18:43', '2019-06-20 14:18:43', '2019-07-06 02:18:43'),
('1eb582db3571c169a6f868097fdcd930a0a172f065cc10631cbf643a1e9697393e9fbcd69024df66', 1, 1, NULL, '[]', 0, '2019-06-20 14:21:02', '2019-06-20 14:21:02', '2019-07-06 02:21:02'),
('7b7cdce42502a95394f95597551b14a84f63e43002299d45ae6a7098d98cb8db1e94d01fa0fa8e43', 1, 1, NULL, '[]', 0, '2019-06-20 14:22:55', '2019-06-20 14:22:55', '2019-07-06 02:22:55'),
('869b13476a535248ded38ea09b83bd99771d8ead0e9344cded939dcfa87d2ecb9cdfad81957af992', 1, 1, NULL, '[]', 0, '2019-06-20 14:24:32', '2019-06-20 14:24:32', '2019-07-06 02:24:32'),
('92e223de319cfbdb1cbc9ef93499260596304f0f9b985d25af9d16f8a247c32572648d8e14dc715e', 1, 1, NULL, '[]', 0, '2019-06-20 14:26:39', '2019-06-20 14:26:39', '2019-07-06 02:26:39'),
('2eb3a14fa8d291ba991ee20e834da4e1474e30cffcbb0e160e6fdefe213674c7cf8b4fc516ef7982', 1, 1, NULL, '[]', 0, '2019-06-21 00:27:25', '2019-06-21 00:27:25', '2019-07-06 12:27:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, 1, 'ledgedog_crew', 'T1hBIaMA0YtIhfIlTN6xoh2Nab5VIY4uPdQXqQCA', 'http://localhost/ledgedog.com/public/auth/callback', 0, 1, 0, '2019-05-30 01:46:29', '2019-05-30 01:46:29'),
(2, NULL, 'Laravel Personal Access Client', 'JbEJUfgNMyKPRvSHRCc57KWNpoy2JOjChDhZf2nP', 'http://localhost', 1, 0, 0, '2019-07-15 00:36:51', '2019-07-15 00:36:51');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('e6e28ab6061a61a7679246cb761952efb8aaffdcc580484e67616939d6820f141330384716a677bd', '343ad0bc94c7d5de5888623808be6ec1090fa78dc5118867d59db83c47e0d066cd845bb1a1367305', 0, '2019-06-15 00:13:35'),
('016979278f735bc7dc4f836a5f22541f9286f866aa75bb996d01c8f5b5eae4a8d2377722196f5615', 'ca4e856762045f74c0569e671a227b2020a67ac1b7b3aec3847dc153022ffade05ba8a7395e53e1e', 0, '2019-06-15 00:38:05'),
('87adc5bbcf110f39f8164ab600c5e3fb67aec27e7099894b3672d164bf162f068c90c42372b1d141', 'fae86fc2a13bbffac0c340c9af7680fce5fd4273eeb5486bdd611eababd1c30651af4914e4a38bad', 0, '2019-06-15 00:40:28'),
('59794ad5c7ff45588668d147f20d61233d3dbb5c1c9404dc88f09a032734be719877daa896843def', 'f30d81f0224bee5dc33fe9537832b0d23d3510f18fa0bc4ca5dff853c585615a8ac12570e9ba642f', 0, '2019-06-15 01:23:41'),
('ac26398f362d47390faa620f657eef1179b4d01902fa4c1075163c7bebb4413f56aaaac8e71769ec', '39f5cee3e6c8dcecaccd792b08b5edc8cb32724de587f462f92b7ebae2b68c0fa6b1ff11c3597e8c', 0, '2019-06-17 06:50:58'),
('04dec9831b558e2c29f468ff284eed425202b0f8838642e2f7f008c5610849cff69a2b8bd21b1bdd', '70f238ef9f0d97ecbe0e2a3fb4c591d4298aabfa71b4f69d2cdbf62b1b0ea8415358359c9cc5f1cf', 0, '2019-06-17 07:30:38'),
('f05f638beaa66f35be85782bb7fb20a980a6aee0fd1496a02f0fdef5c526016a4a334bfa3e6032ed', 'ce4f9878d6d8039a4d22c37e9ae5fa1a4cb8cafc4561c2ae3c206fa47fc7373cb3daf93721fff74a', 0, '2019-06-17 11:04:40'),
('5a7190c0e8b1791c6e95e432c0fb3ce5344f1857d20e45bdb09970e82158993cdb4c8532631664f8', 'ccf53d80bc7c3cac1f04b47173cd20f362b45f9da9edc5a6d65c5e1f8a2278fbc4775fcf2f23fe77', 0, '2019-06-17 11:08:02'),
('f5bdb93f2b6459fd8574b84d49d40c7119e1fe7ef55bc61d46d2b177ec833d0d4ce8e1ea7c839f5b', 'e9739c89f206a7666f3d3ce84471c837389c565f677601e5c9a5d5ee9e91ece624106e8820e2b262', 0, '2019-06-17 13:05:18'),
('cd653a87760f7f48f9a5b3c184fa822749997eb05f44da1523c759453ca65178b36e9279d2f62393', 'c43c2aba8272fa719804248eeae27936b063e20fbbd6ef4b7b9a8add7923534e3e277b369a2110b6', 0, '2019-07-03 00:39:55'),
('122b52c20d24c09292b580e5e75c89c264ab4ac994ec95e197c2b3e0ecb5ee0ddc6611e3e5538be5', '1930fe8779c0c96409ee36807dcb6e39c9e25b23564939b516200aa8a39739725ccb3079133cd92f', 0, '2019-07-04 12:55:46'),
('45d022dc901b891b620d353423ecc1efe2d7dd778b98991d41161a8054a67c464daeaa2d3736a103', '16f1167a6e13f2f1c41ccea497353bb62fad95a638355cf2af757f5b93778cc7320c92bcdad2e424', 0, '2019-07-04 12:59:31'),
('17dc4fc0ee5c2475ddb1ccd9f95b7de46732a800b41375a1426974c7d53da1d8fe2ef3de3b005983', '1821e8c0d399d38f73a1c676e64e5105cac6a4fd5bc1aacf2b21b3a1be65c3e59bf02944cf04072d', 0, '2019-07-04 13:02:31'),
('2787aa8505dff1104b3a7066d6e8d628c0ea330800d1cf5611a699bab442c2ba4f36a9f4c5173ff2', 'a39c14f5cb8d9b7b33a0ed9c4a2b05553c959c7ce97a2bfd36aebb2bc9c8303f0fab9a163eb6deed', 0, '2019-07-05 00:22:13'),
('8f953af526912776e34959ba181d5637ad466d5915ab1ef186ef6cb978b9d585680c83928a39a414', 'd4c10443652ddd5567420073efe147e9bb05aeeda34a26326dc480c58796c450d744a5dab82d05c2', 0, '2019-07-05 00:47:45'),
('bf21c97d77be3f926603e3074c13137179fef05a70be1023e98d22f8c40a6b290cee766fd58ae246', 'e9b0a44c6aa1ceb603df2ac55d7184da280e6b9fb7b0b054bc28403f716b2017dd42f897c8356592', 0, '2019-07-05 00:48:13'),
('2e4de1f296e01e8645622c757bb1e6759654115cfc320c03dc07363e5ba66ecae96c66e496ca29da', '96f0888faaaae4394664466dd4c415f98a54482e75dd34d01964fa31cea8503981031c664d3ffad1', 0, '2019-07-05 00:48:27'),
('4cd82fa35c69205738ebfd0819d03cad6b447214cd11fbe402533a5ef4429db7146e787a62a7f23d', 'c382b92e27a7e5c5cde79df2cdba7e9ad5ff58b051d8bd291255ec6506b3042e5c589347f450749e', 0, '2019-07-05 13:51:45'),
('0e6addcfa57f67765d5cd4b94c2ef065e06adc504d57679b098c53db6ab0d0587d1f18f7d4489d06', 'f49a608f75e6b973dc33d407af653d2417281ab7ab7fd72a3747f590ef6c7efbe3f64fd454ca505f', 0, '2019-07-05 14:00:52'),
('854efac3e8bcef2cc8a9eb89dd7ef45cd78a940eeed47928b59eaf585e991eee6b691aa0d88e0c90', '4542bcabbace4d77597de3ef4b70c1c46f1598211545a963536d9a37567bb19e0937f4dc42cfdd88', 0, '2019-07-05 14:04:53'),
('4f5a4b8d9294a0bcf94c226719fd8f668f6256d1ed46b1a8a6a36ab012c509ef04481b2d174770e4', '29a806759d20d7dc5d031bab926f6a1536e8b8cf5d350cab8ac90bde3d5216ec0826f12c4d58da8f', 0, '2019-07-06 02:11:35'),
('4f9e6f66bd3ab0cd3f97e728670aa5d7cfacf37b522a45f3ff934262bbf96ad859733bea69db1b99', 'c56645eaf3922b446e565b7aa2bfb399903355944208f4a03a41fb25cd241b3807d9357281aca4e4', 0, '2019-07-06 02:13:00'),
('782e9afc296dc9d7cb1934374ddb407958220ce5b9bf5d298b435357cca8aaeb24ee78148f41b0ea', '4debe79059f96982b71c7a11437cfe496368e4b90e87b27fe9e8150a2cd3d62fb7b9e7dbceb435d9', 0, '2019-07-06 02:13:16'),
('2ede0e4cf047dfe49706ed0dcb0544aa4362c5989a2605a6fb37face0594320b5ba49448f121fa4e', '6ae7ae6e34476e88cb34e9e77de8c3b9b7125e19a6652b18875e1b46308bf37585a8e570615c9c69', 0, '2019-07-06 02:13:26'),
('47cebb7b2842eb4f899c5f13d1341f329b935f4192eac970d327148d0cc404dc02e43c020ba0e900', 'c82b1eaf605968976dc1a7b74cabe3377a2d7fb63378ee67662cf7dc3db039c196415c4cd73d50ea', 0, '2019-07-06 02:14:20'),
('349862fa5dffda0df575bdca97bf2a658d1faaaee358f203468c218bd0bd4429f319d05e048ff45e', '2f1dc6f10ce2d38d6ad92b722fb21ab7084bf33b6bf9e78035aad8837fdf32a3da7c7af6e8a928c5', 0, '2019-07-06 02:18:43'),
('2b6ddc6cc086264a8dbcb75fb915aec8fa4ff44c74f00f2843f09821f50bb08ab05838383bfc37be', '1eb582db3571c169a6f868097fdcd930a0a172f065cc10631cbf643a1e9697393e9fbcd69024df66', 0, '2019-07-06 02:21:02'),
('b26e0748909c2d988fa4c7e4e0180991a67abe56230ae15fef967af4618e1fbf0c31395c948c5f59', '7b7cdce42502a95394f95597551b14a84f63e43002299d45ae6a7098d98cb8db1e94d01fa0fa8e43', 0, '2019-07-06 02:22:55'),
('0543aa3e67550144165173475b96e7e4633cba13b468994dd26084d2e323fd9bf382a0423d89a152', '869b13476a535248ded38ea09b83bd99771d8ead0e9344cded939dcfa87d2ecb9cdfad81957af992', 0, '2019-07-06 02:24:32'),
('5a741baeba073baa4fc85a7d668b1203fc1101b33dd44202010a393b436c0546055e999d0bd31f0b', '92e223de319cfbdb1cbc9ef93499260596304f0f9b985d25af9d16f8a247c32572648d8e14dc715e', 0, '2019-07-06 02:26:39'),
('4f2adde7a1d03fa45ff37142032068f07aac705c5585ff15205a4560b3c4cfcb2b334663391cf27e', '2eb3a14fa8d291ba991ee20e834da4e1474e30cffcbb0e160e6fdefe213674c7cf8b4fc516ef7982', 0, '2019-07-06 12:27:25');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_group` varchar(25) DEFAULT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `product_code` varchar(5) DEFAULT NULL,
  `benefits` text,
  `dilution` text,
  `warning` text,
  `caution` text,
  `net_contents` varchar(145) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `product_subname` varchar(35) NOT NULL,
  `description` text NOT NULL,
  `added_by` tinyint(3) NOT NULL,
  `last_update_by` tinyint(3) NOT NULL,
  `create_dte` char(10) NOT NULL,
  `last_update` char(10) NOT NULL,
  `removed_dte` char(10) NOT NULL,
  `compatibility` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_group`, `product_name`, `product_code`, `benefits`, `dilution`, `warning`, `caution`, `net_contents`, `image_url`, `product_subname`, `description`, `added_by`, `last_update_by`, `create_dte`, `last_update`, `removed_dte`, `compatibility`) VALUES
(3, '', 'All Season Blend', NULL, '\r\n<li>0.2% Ammoniacal Nitrogen</li>\r\n<li>1.8% Urea Nitrogen</li>\r\n<li>Contributes to higher yields</li>\r\n<li>Supplies high concentrations of 13 nutrients</li>\r\n<li>Improves plant’s potential for productivity</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Apply directly to foliage by spraying</li>\r\n<li>Excellent adherence to foliage</li>\r\n<li>pH neutral</li>', 'Field & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons', NULL, NULL, '11.30 LBS/GAL', 'AllSeasonBlend1473983949.png', '2-6-2', '4.5% Calcium plus 9 essential nutrients\r\nUse as a basis for spray programs in combination with other Tech-Flo products to address specific nutrient requirements.', 1, 0, '1473178293', '1479409701', '1473178293', 2),
(4, '', 'Alpha', NULL, '<li>Contributes to higher yields</li>\r\n<li>Improve stress tolerance in tree crops</li>\r\n<li>Enhances plant vigor</li>\r\n<li>Improves quality of produce: size, color, sugar, firmness</li>\r\n<li>Micronized nutrient particles provide greater surface area coverage</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons', NULL, NULL, '11.20 LBS/GAL', 'Alpha1474047012.png', '0-10-0', 'Use alone or with Tech-Flo Gamma.  Improves stress tolerance in tree crops due to extreme heat, moisture stress, or strong winds.', 1, 0, '1474047012', '1476025232', '1474047012', 2),
(6, '', 'Beta', NULL, '<li>Contributes to higher yields</li>\r\n<li>Improves quality of produce: size, color, sugar, firmness</li>\r\n<li>Improves storage, handling, and shipping properties of produce</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons', NULL, NULL, '11.60 LBS/GAL', 'Beta1474047704.png', '0-6-0', 'Recommended as early season spray for almost all crops, but is especially effective on root crops, green leafy vegetables, peas and beans, cucurbits, and transplants.  Used in California on citrus.', 1, 0, '1474047704', '1474561141', '1474047704', 4),
(9, '', 'Bloom Blend', NULL, '\r\n<li>0.2% Ammoniacal Nitrogen</li>\r\n<li>0.8% Urea Nitrogen</li>\r\n<li>Improves plant’s potential for productivity</li>\r\n<li>Use on tree crops, vines, vegetables, field and row crops</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.30 LBS/GAL', 'BloomBlend1474085585.png', '1-10-0', 'Provides a steady release of Calcium plus 9 essential nutrients when plant is undergoing a period of rapid cell division, flowering, and fruit growth initiation.\r\n', 1, 0, '1474085585', '1479409772', '1474085585', 2),
(10, '', 'Cal-Bor', NULL, '<li>Contributes to higher yields in early season applications</li>\r\n<li>Improves quality of produce: size, color, sugar, firmness</li>\r\n<li>Use as bloom spray to increase fruit set in avocados</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.40 LBS/GAL', 'CalBor1474085719.png', '', 'Recommended for use on crops commonly affected by Calcium disorders.  Can be applied at any time during the growing season.\r\n', 1, 0, '1474085719', '1474561103', '1474085719', 2),
(11, '', 'Cal-Bor + Moly', NULL, '<li>Enhances vigor of trees</li>\r\n<li>Improves quality of fruit: size, color, finish</li>\r\n<li>Contributes to higher yields in early season applications</li>\r\n<li>Can be used as bloom spray to increase fruit set and return bloom</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.40 LBS/GAL', 'CalBorMoly1474085880.png', '', 'Recommended for use on crops commonly affected by Calcium disorders.  Can be applied at any time during the growing season.  Molybdenum added for proper utilization of Nitrogen.\r\n', 1, 0, '1474085812', '1474561082', '1474085812', 2),
(13, '', 'Calcium', NULL, '<li>Improves quality of produce: size, color, sugar, firmness</li>\r\n<li>Improves storage, handling, and shipping properties of produce</li>\r\n<li>No dissolving time or heat required to disperse in spray tank</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.40 LBS/GAL', 'Calcium1474086205.png', '', 'Recommended for use on crops commonly affected by Calcium disorders.  Can be applied at any time during the growing season.  \r\n', 1, 0, '1474086205', '1474561035', '1474086205', 2),
(14, '', 'Canopy & Crop Sizing Blend', NULL, '<li>Contributes to higher yields</li>\r\n<li>Improves storage, handling, and shipping properties of produce</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Micronized nutrient particles provide greater surface area coverage<li>\r\n<li>Formulated with PolysorbygenTM to enhance formulation stability</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.30 LBS/GAL', 'CanopyCropSizingBlend1474086376.png', '0-6-0', 'Balanced nutrient blend designed for pre-bloom and post-bloom first and second cover spray applications.\r\n', 1, 0, '1474086376', '1479409828', '1474086376', 2),
(15, '', 'Copocal ', NULL, '<li>Improves quality or crops</li> \r\n<li>Enhances color of produce </li>\r\n<li>Use on tree crops, vines, vegetables, field and row crops</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Micronized nutrient particles provide greater surface area coverage<li>\r\n<li>Formulated with PolysorbygenTM to enhance formulation stability</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.60 LBS/GAL', 'Copal1474086474.png', '0-14-0', 'Enhances color development in a wide range of crops.  Best color is obtained from multiple applications starting early in vegetable crops, mid-season for fruit trees.\r\n', 1, 0, '1474086474', '1474560960', '1474086474', 3),
(16, '', 'CVN Zinc 10%', NULL, '<li>0.2% Ammoniacal Nitrogen</li>\r\n<li>2.8% Urea Nitrogen</li>\r\n<li>Use as post-harvest application</li>\r\n<li>Improves winter hardiness</li>\r\n<li>Influences bud vigor and fruit set</li>\r\n<li>Improves quality of apples, pears, and cherries</li>\r\n<li>Use during dormant/delayed dormant applications on deciduous trees</li>\r\n<li>Use for foliar applications on pecans, walnuts, almonds, hops, grapes, and stone fruits</li>\r\n<li>Micronized nutrient particles provide greater surface area coverage</li>\r\n<li>pH neutral</li>', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.30 LBS/GAL', 'CVNZinc101474086700.png', '3-2-0', 'Corn, Vine and Nut blend effective in influencing Zinc levels in plant tissue.  Especially useful when Zinc levels are chronically low and on crops unresponsive to other forms of Zinc.\r\n', 1, 0, '1474086700', '1479409876', '1474086700', 2),
(17, '', 'Gamma', NULL, '<li>Contributes to higher yields</li>\r\n<li>Improves quality and finish of produce </li>\r\n<li>Use on most crops</li>\r\n<li>Micronized nutrient particles provide greater surface area coverage</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.20 LBS/GAL', 'Gamma1474086790.png', '0-10-0', 'Use as part of a general nutrition program where quality results are paramount.  Especially effective on potatoes, green leafy vegetables, apples, alfalfa, mint, seed crops, artichokes.\r\n', 1, 0, '1474086790', '1474560907', '1474086790', 2),
(18, '', 'Hi-Mag', NULL, '<li>Contributes to higher yields</li>\r\n<li>Improves quality and finish of produce </li>\r\n<li>Use on most crops</li>\r\n<li>Micronized nutrient particles provide greater surface area coverage</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '12.00 LBS/GAL', 'HiMag1474086894.png', '', 'Suggested where Magnesium levels are distinctly low and Mg is a major element of concern.  \r\n', 1, 0, '1474086894', '1474560869', '1474086894', 2),
(19, '', 'MN-15', NULL, '<li>Contributes to higher yields</li>\r\n<li>Improves quality of produce</li>\r\n<li>Improves storage, handling, and shipping properties of produce</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '13.00 LBS/GAL', 'MN151474086970.png', '0-7-0', 'Manganese activates enzymes in plant growth process and assists in chlorophyll formation. Recommended as an early season spray for almost all crops.\r\n', 1, 0, '1474086970', '1474560846', '1474086970', 2),
(20, '', 'MZ 10-6', NULL, '<li>Contributes to higher yields</li>\r\n<li>Enhances seed and root maturation</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '13.00 LBS/GAL', 'MZ1061474087098.png', '0-4-2', 'Manganese activates enzymes in plant growth process.  Zinc and Mn assist in chlorophyll formation. Recommended as early season spray for almost all crops.\r\n', 1, 0, '1474087098', '1474560825', '1474087098', 2),
(21, '', 'Nutricop 20', NULL, '<li>Improves color of produce </li>\r\n<li>Use on tree crops, berries, vines, vegetables, field and row crops</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Micronized nutrient particles provide greater surface area coverage</li>\r\n<li>Formulated with PolysorbygenApply the suggested rates of TECH-FLO in the following amounts of water per acre</li>', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.40 LBS/GAL', 'Nutricop201474087163.png', '', 'Enhances color development in a wide range of crops.  Best color is obtained from multiple applications starting early in vegetable crops, mid-season for fruit trees.\r\n', 1, 0, '1474087163', '1478885797', '1474087163', 3),
(22, '', 'Omega', NULL, '<li>Contributes to higher yields</li>\r\n<li>Improves quality of produce </li>\r\n<li>Improves storage, handling, and shipping properties of produce</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.30 LBS/GAL', 'Omega1474087274.png', '0-18-0', 'Highest concentrations of Calcium and Phosphate in our product line.\r\n', 1, 0, '1474087274', '1474560746', '1474087274', 2),
(23, '', 'Phi', NULL, '<li>1.1% Ammoniacal Nitrogen</li>\r\n<li>0.9% Urea Nitrogen</li>\r\n<li>Enhances plant vigor</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>No dissolving time or heat required to disperse in spray tank</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Formulated with PolysorbygenTM to enhance formulation stability</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.00 LBS/GAL', 'Phi1474087396.png', '2-4-0', 'Effective in correcting Iron chlorosis.  Stimulates growth and improves plant vigor on crops grown in marginal soils, particularly where salinity or oil-soaking is a problem.\r\n', 1, 0, '1474087396', '1479410034', '1474087396', 2),
(24, '', 'Sigma', NULL, '\r\n<li>1.2% Nitrate Nitrogen</li>\r\n<li>1.8% Urea Nitrogen</li>\r\n<li>Contributes to higher yields</li>\r\n<li>Influences maturity, sugar development, and color</li>\r\n<li>Promotes cold hardiness</li>\r\n<li>Aids in recovery from freeze, frost, or hail damage</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.00 LBS/GAL', 'Sigma1474087507.png', '3-6-14', 'May be applied anytime during the growing season, especially mid-to-late season to influence maturity, sugar development, and color on crops with high Potash requirements.  \r\n', 1, 0, '1474087507', '1479410070', '1474087507', 2),
(25, '', 'Valley Blend', NULL, '<li>Contributes to higher yields</li>\r\n<li>Improve stress tolerance in tree crops</li>\r\n<li>Enhances plant vigor</li>\r\n<li>Improves quality of produce </li>\r\n<li>Micronized nutrient particles provide greater surface area coverage</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.30 LBS/GAL', 'ValleyBlend1474087728.png', '0-8-0', 'Useful combination of balanced nutrients for many crops.  Can be used throughout the growing season.\r\n', 1, 0, '1474087728', '1479410131', '1474087728', 2),
(26, '', 'Zeta Zinc 22', NULL, '<li>Use as post-harvest application</li>\r\n<li>Improves winter hardiness</li>\r\n<li>Influences bud vigor and fruit set</li> \r\n<li>Improves quality of apples, pears, and cherries</li>\r\n<li>Use during dormant/delayed dormant applications on deciduous trees</li>\r\n<li>Use for foliar applications on pecans, walnuts, almonds, hops, grapes, and stone fruits</li>\r\n<li>Micronized nutrient particles provide greater surface area coverage</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '12.00 LBS/GAL', 'ZetaZinc221474087836.png', '', 'Extremely effective in influencing Zinc levels in plant tissue.  Especially useful when Zinc levels are chronically low and on crops unresponsive to other forms of Zinc.\r\n', 1, 0, '1474087836', '1474560574', '1474087836', 2),
(28, '', 'ZMC', NULL, '<li>Contributes to higher yields</li>\r\n<li>Enhances seed and root maturation</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Controlled-release formulations reduce phytotoxicity</li>\r\n<li>Limited water solubility causes excellent adherence to foliage</li>\r\n<li>pH neutral</li>\r\n', 'Apply the suggested rates of TECH-FLO in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '11.60 LBS/GAL', 'ZMC1474088022.png', '0-5-0', 'Manganese activates enzymes in plant growth process.  Zinc and Mn assist in chlorophyll formation. Recommended as early season spray for almost all crops.\r\n', 1, 0, '1474088022', '1479410183', '1474088022', 3),
(29, '', 'Cobalt', NULL, '<li>2.0% Urea Nitrogen</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Use on tree crops, vines, vegetables, field and row crops</li>\r\n<li>Compatible with most pesticides, miticides and fungicides</li>\r\n<li>Apply directly to foliage by spraying</li>\r\n<li>Mixes readily</li>', 'Apply the suggested rates of TECH-SPRAY in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '9.15 LBS/GAL', 'Cobalt1474123827.png', '2-6-2', 'Cobalt is a component of a number of enzymes, increases drought resistance in seeds, and important in the life-cycle of legumes.\r\n', 1, 0, '1474123827', '1476024425', '1474123827', 5),
(30, '', 'Copper', NULL, '<li>Improves color of produce</li>\r\n<li>Lowers pH in spray mixture</li>\r\n<li>Use on tree crops, berries, vines, vegetables, field and row crops</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Apply directly to foliage by spraying</li>\r\n<li>Mixes readily</li>\r\n', 'Apply the suggested rates of TECH-SPRAY in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '10.40 LBS/GAL', 'Copper1474123929.png', '0-10-0', 'Enhances color development in a wide range of crops.  Best color is obtained from multiple applications starting early in vegetable crops, mid-season for fruit trees.  \r\n', 1, 0, '1474123929', '1475809842', '1474123929', 6),
(32, '', 'Hi-K', NULL, '<li>Influences crop maturity</li>\r\n<li>Improves color development on stone fruit, apples, and grapes</li>\r\n<li>Phosate and Potash derivered from phosphate sources only</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Apply directly to foliage by spraying</li>\r\n<li>Near neutral pH</li>\r\n<li>Mixes readily</li>\r\n', 'Apply the suggested rates of TECH-SPRAY in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '13.60 LBS/GAL', 'HiK1474124144.png', '0-26-28', 'Ideal product to incorporate into programs where maturation is the goal.  Contains no chlorides, nitrates, or sulfates.  Also used in freeze and drought resistance programs.\r\n', 1, 0, '1474124144', '1474560393', '1474124144', 6),
(33, '', 'IZP', NULL, '<li>Enhances plant vigor</li>\r\n<li>Contributes to higher yields</li>\r\n<li>Lowers pH in spray mixture</li>\r\n<li>Influences crop maturity</li>\r\n<li>Apply directly to foliage by spraying</li>\r\n<li>Mixes readily</li>\r\n', 'Apply the suggested rates of TECH-SPRAY in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '10.00 LBS/GAL', 'IZP1474124230.png', '0-8-0', 'Stimulates growth, maturity and improves plant vigor on crops grown in marginal soils, particularly where salinity or oil-soaking is a problem.  Zinc assists in chlorophyll production. \r\n', 1, 0, '1474124230', '1475809792', '1474124230', 4),
(34, '', 'Liquibor ', NULL, '<li>Contributes to higher yields in early season applications</li>\r\n<li>Improves quality of produce: size, color, sugar, firmness</li>\r\n<li>Use as bloom spray to increase fruit set</li>\r\n<li>Mixes readily</li>\r\n', 'Apply the suggested rates of TECH-SPRAY in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '8.90 LBS/GAL', 'Liquor1474124295.png', '', 'Improves pollen viability and fruit set. Can be applied at any time during the growing season.\r\n', 1, 0, '1474124295', '1474560348', '1474124295', 5),
(35, '', 'MG', NULL, '<li>Contributes to higher yields</li>\r\n<li>Improves quality and finish of produce </li>\r\n<li>Lowers pH in spray mixture</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Mixes readily</li>\r\n', 'Apply the suggested rates of TECH-SPRAY in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '10.50 LBS/GAL', 'MG1474124379.png', '0-10-0', 'Aids in formation of sugars, fats and oils.  When applying Magnesium, attention must also be paid to Calcium and Potash levels.  \r\n', 1, 0, '1474124379', '1475809750', '1474124379', 4),
(36, '', 'Mn ', NULL, '<li>Contributes to higher yields</li>\r\n<li>Improves quality of produce </li>\r\n<li>Improves storage, handling, and shipping properties of produce</li>\r\n<li>Lowers pH in spray mixture</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Contains 0.5% Nikel</li>\r\n<li>Mixes readily</li>', 'Apply the suggested rates of TECH-SPRAY in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '10.1 LBS/GAL', 'Mn1474124470.png', '0-10-0', 'Manganese activates enzymes in plant growth process and assists in chlorophyll formation. Recommended as early season spray for almost all crops.  \r\n', 1, 0, '1474124470', '1475809718', '1474124470', 4),
(37, '', 'Moly-Mag', NULL, '<li>Contributes to higher yields in early season applications</li>\r\n<li>5.0% Urea Nitrogen</li>\r\n<li>Improves quality and finish of produce </li>\r\n<li>Enhances vigor of plants</li>\r\n<li>Can be used as bloom spray to increase fruit set and return bloom</li>\r\n<li>Use on tree crops, vines, vegetables, berries, field and row crops</li>\r\n<li>Mixes readily</li>', 'Apply the suggested rates of TECH-SPRAY in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '10.40 LBS/GAL', 'MolyMag1474124558.png', '5-0-0', 'Moly-Mag is used in growth oriented programs such as new orchard plantings or leafy green crops.\r\n', 1, 0, '1474124558', '1476024340', '1474124558', 5),
(38, '', 'Mo-Power', NULL, '<li>Concentrated source of Molybdenum</li>\r\n<li>0.3% Ammoniacal Nitrogen</li>\r\n<li>3.7% Urea Nitrogen</li>\r\n<li>Improves fruit quality</li>\r\n<li>Enhances vigor of plants</li>\r\n<li>Use on tree crops, vines, vegetables, berries, field and row crops</li>\r\n<li>Mixes readily</li>', 'Apply the suggested rates of TECH-SPRAY in the following amounts of water per acre.\r\nMinimum dilution rate: 1 quart per 5 gallons water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 3-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-4 pints per 100 gallons\r\n', NULL, NULL, '9.08 LBS/GAL', 'MoPower1474124649.png', '4-2-1', 'A concentrated Mo source enhances plant vigor and fruit quality. \r\n', 1, 0, '1474124649', '1479410294', '1474124649', 5),
(41, '', 'Alpha DF', NULL, '<li>Contributes to higher yields</li>\r\n<li>Influences bud vigor and fruit set</li> \r\n<li>Improves quality of produce </li>\r\n<li>Improves storage, handling, and shipping properties of produce</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n', 'Apply the suggested rates of ALPHA DF in the following amounts of water per acre.\r\nMinimum dilution rate: 1 pound per gallon of water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 10-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-10 pounds per 100 gallons\r\n', NULL, NULL, '25 LBS', 'AlphaDF1474125029.png', '0-24-0', 'Highly concentrated wettable powder for use as a foliar spray.  Can be applied at any time during the growing season.  \r\n', 1, 0, '1474125029', '1474560037', '1474125029', 2),
(42, '', 'B-17 Boric Acid Spray', NULL, '<li>Salt-free</li>\r\n<li>Readily available</li>\r\n<li>Suitable for use on all crops</li>\r\n<li>Mildly acidic</li>\r\n<li>Contributes to higher yields in early season applications</li>\r\n<li>Improves quality of produce: size, color, sugar, firmness</li>\r\n<li>Certified organic input material</li>\r\n', 'Apply the suggested rates of B-17 BORIC ACID SPRAY in the following amounts of water per acre.  Minimum dilution rate: 1 pound per 5 gallons of water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 10-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-5 pounds per 100 gallons\r\n', NULL, NULL, '25 LBS', 'B17BoricAcidSpray1474125194.png', '', 'Solely derived from boric acid, B-17 dissolves readily and imparts a slightly acidic effect to the spray solution.  Extremely economical and effective.\r\n', 1, 0, '1474125194', '1476024369', '1474125194', 2),
(43, '', 'Mira-Cal', NULL, '<li>Improves quality of produce: size, color, sugar, firmness</li>\r\n<li>Improves storage, handling, and shipping properties of produce</li>\r\n<li>Prevents or corrects nutritional deficiencies and imbalances</li>\r\n<li>Apply directly to foliage by spraying</li>\r\n', 'Apply the suggested rates of MIRA-CAL in the following amounts of water per acre.  Minimum dilution rate: .75 pounds per gallon of water per suggested rate.\r\n\r\nField & Row Crops:\r\nBy air: 10-20 gallons\r\nBy ground: 10 gallons minimum\r\nTree crops:\r\nBy air: 10 gallons minimum\r\nBy ground concentrate: 40-100 gallons\r\nBy ground dilute: 100-500 gallons\r\nIn oil sprays: use 1-5 pounds per 100 gallons\r\n', NULL, NULL, '11.6lbs / gallon', 'MiraCal1474125341.png', '', 'Highly concentrated soluble powder formulated without chlorides, nitrates, or sulfates. Can be applied at any time during the growing season.  \r\n', 1, 0, '1474125341', '1479341584', '1474125341', 2),
(44, '', 'Neri Blend', NULL, '<li>need data</li>', '', NULL, NULL, '2.5 Gallons', '1249901cd869440b06a796ee3397afcfee81fcd2.png', '0-2-1', 'Provides essential plant nutrients and Ascophyllum nodosum in a highly concentrated, easy to use, flowable formulation for use as a foliar spray.', 1, 1, '1563967640', '1564038529', '1563967640', 2),
(45, '', 'Acrecio', NULL, '<li>helps plants recover from environmental stresses</li>\r\n<li>promotes root growth and vigor</li>\r\n<li>improves soil health</li>', 'Dilute Acrecio to 0.5%- 1% concentration for soil applications.', NULL, NULL, '2.5 Gallons', 'a4ec15cbdb85d66308df59ffb9835a99a3092be9.png', '9-3-7', 'New Generation Biostimulant and Root Activator.  Contains Humic Acids to stimulate soil microorganisms, improve bioavailability of nutrients, and reduce leaching.  Select amino acids promote root growth and cell differentiation at root and shoot tips.', 1, 1, '1563967933', '1564098379', '1563967933', 2),
(46, '', 'Neri Copper', NULL, '', 'Uniformly apply the suggested rates of NERI product in the following amounts of water per acre.  Minimum dilution rate: 1 pt per 5 gallons water per suggested rate.\r\nField & Row Crops:\r\nBy air - 3-20 gals.\r\nBy ground - 10 gals. minimum.\r\nTree Crops: \r\nBy air - 10 gals. minimum.\r\nBy ground concentrate 25-100 gals.\r\nBy ground dilute 100-500 gals.\r\nin oil sprays, use 1-4 pints per 100 gallons.', NULL, NULL, '2.5 Gallons', 'd21f5c1535befeee819220a308dcfba1b1d60b46.png', '', 'Neri Copper provides essential plant nutrients and Ascophyllum nodosum in a highly concentrated, easy to use, flowable formulation for use as a foliar spray.', 1, 1, '1564044132', '1564044263', '1564044132', 2),
(47, '', 'Neri Iron', NULL, '<li>Pure Seaweed Extract</li>\r\n<li>Improves stress resistance</li>\r\n<li>Increase root mass</li>\r\n<li>Biostimulant</li>', 'Uniformly apply the suggested rates of NERI product in the following amounts of water per acre.  Minimum dilution rate: 1 pt per 5 gallons water per suggested rate.\r\nField & Row Crops:\r\nBy air - 3-20 gals.\r\nBy ground - 10 gals. minimum.\r\nTree Crops: \r\nBy air - 10 gals. minimum.\r\nBy ground concentrate 25-100 gals.\r\nBy ground dilute 100-500 gals.\r\nin oil sprays, use 1-4 pints per 100 gallons.', NULL, NULL, '9.20 lbs/gal', '052298f54e3e53e2b9a4a31c0d7e54742c888471.png', '0-2-0', 'At low tide, Ascophyllum nodosum is subject to temperature variations, solar radiation and to the drying conditions of the atmosphere for 12 hours. To survive, Ascophyllum nodosum produces molecules capable of inducing stress-resistance mechanisms both at plant level and at cell level.  NERI combines the highest quality Ascophyllum nodosum with specific nutrients to:\r\n<ul>\r\n<li>influence desirable traits in your crops</li>\r\n<li>improve resistance to stresses- drought, heat, saline soils</li>\r\n<li>enhance the plant’s natural growth stages to yield the best possible crop</li>\r\n<ul>', 1, 1, '1564044551', '1564044623', '1564044551', 2),
(48, '', 'Neri Magnesium', NULL, '<li>Pure Seaweed Extract</li>\r\n<li>Improves stress resistance</li>\r\n<li>Increase root mass</li>\r\n<li>Biostimulant</li>', 'Uniformly apply the suggested rates of NERI product in the following amounts of water per acre.  Minimum dilution rate: 1 pt per 5 gallons water per suggested rate.\r\nField & Row Crops:\r\nBy air - 3-20 gals.\r\nBy ground - 10 gals. minimum.\r\nTree Crops: \r\nBy air - 10 gals. minimum.\r\nBy ground concentrate 25-100 gals.\r\nBy ground dilute 100-500 gals.\r\nin oil sprays, use 1-4 pints per 100 gallons.', NULL, NULL, '9.40 lbs/gal', '721f30a5f63ece3be1be646c28065ce4d7594701.png', '', 'At low tide, Ascophyllum nodosum is subject to temperature variations, solar radiation and to the drying conditions of the atmosphere for 12 hours. To survive, Ascophyllum nodosum produces molecules capable of inducing stress-resistance mechanisms both at plant level and at cell level.  NERI combines the highest quality Ascophyllum nodosum with specific nutrients to:\r\n<ul>\r\n<li>influence desirable traits in your crops</li>\r\n<li>improve resistance to stresses- drought, heat, saline soils</li>\r\n<li>enhance the plant’s natural growth stages to yield the best possible crop</li>\r\n<ul>', 1, 1, '1564044689', '1564044712', '1564044689', 2),
(49, '', 'Neri Manganese', NULL, '<li>Pure Seaweed Extract</li>\r\n<li>Improves stress resistance</li>\r\n<li>Increase root mass</li>\r\n<li>Biostimulant</li>', 'Uniformly apply the suggested rates of NERI product in the following amounts of water per acre.  Minimum dilution rate: 1 pt per 5 gallons water per suggested rate.\r\nField & Row Crops:\r\nBy air - 3-20 gals.\r\nBy ground - 10 gals. minimum.\r\nTree Crops: \r\nBy air - 10 gals. minimum.\r\nBy ground concentrate 25-100 gals.\r\nBy ground dilute 100-500 gals.\r\nin oil sprays, use 1-4 pints per 100 gallons.', NULL, NULL, '9.80 lbs/gal', '523c3bd4db962e062b369e19ac43d19fce1a1c5c.png', '0-2-0', 'At low tide, Ascophyllum nodosum is subject to temperature variations, solar radiation and to the drying conditions of the atmosphere for 12 hours. To survive, Ascophyllum nodosum produces molecules capable of inducing stress-resistance mechanisms both at plant level and at cell level.  NERI combines the highest quality Ascophyllum nodosum with specific nutrients to:\r\n<ul>\r\n<li>influence desirable traits in your crops</li>\r\n<li>improve resistance to stresses- drought, heat, saline soils</li>\r\n<li>enhance the plant’s natural growth stages to yield the best possible crop</li>\r\n<ul>', 1, 1, '1564044819', '1564044819', '1564044819', 2),
(50, '', 'Neri Zinc', NULL, '<li>Pure Seaweed Extract</li>\r\n<li>Improves stress resistance</li>\r\n<li>Increase root mass</li>\r\n<li>Biostimulant</li>', 'Uniformly apply the suggested rates of NERI product in the following amounts of water per acre.  Minimum dilution rate: 1 pt per 5 gallons water per suggested rate.\r\nField & Row Crops:\r\nBy air - 3-20 gals.\r\nBy ground - 10 gals. minimum.\r\nTree Crops: \r\nBy air - 10 gals. minimum.\r\nBy ground concentrate 25-100 gals.\r\nBy ground dilute 100-500 gals.\r\nin oil sprays, use 1-4 pints per 100 gallons.', NULL, NULL, '9.25 lbs/gal', '2525c90e9813cf4f2765f46970614db83332ae0f.png', '', 'At low tide, Ascophyllum nodosum is subject to temperature variations, solar radiation and to the drying conditions of the atmosphere for 12 hours. To survive, Ascophyllum nodosum produces molecules capable of inducing stress-resistance mechanisms both at plant level and at cell level.  NERI combines the highest quality Ascophyllum nodosum with specific nutrients to:\r\n<ul>\r\n<li>influence desirable traits in your crops</li>\r\n<li>improve resistance to stresses- drought, heat, saline soils</li>\r\n<li>enhance the plant’s natural growth stages to yield the best possible crop</li>\r\n<ul>', 1, 1, '1564044921', '1564044921', '1564044921', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_compatibility`
--

CREATE TABLE `product_compatibility` (
  `product_id` int(3) NOT NULL,
  `compatibility_id` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_element`
--

CREATE TABLE `product_element` (
  `product_id` int(11) DEFAULT NULL,
  `element_id` int(8) DEFAULT NULL,
  `percent` decimal(4,2) DEFAULT NULL,
  `weight` float(4,2) DEFAULT NULL,
  `is_guaranteed_amt` tinyint(1) NOT NULL DEFAULT '1',
  `create_dte` char(13) NOT NULL,
  `last_update` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_element`
--

INSERT INTO `product_element` (`product_id`, `element_id`, `percent`, `weight`, `is_guaranteed_amt`, `create_dte`, `last_update`) VALUES
(41, 3, '24.00', NULL, 1, '1474560037', '1474560037'),
(41, 6, '22.00', NULL, 1, '1474560037', '1474560037'),
(41, 7, '2.50', NULL, 1, '1474560037', '1474560037'),
(41, 8, '12.00', NULL, 1, '1474560037', '1474560037'),
(34, 12, '2.50', NULL, 1, '1474560348', '1474560348'),
(32, 3, '26.00', NULL, 1, '1474560393', '1474560393'),
(32, 18, '28.00', NULL, 1, '1474560393', '1474560393'),
(26, 7, '2.50', NULL, 1, '1474560574', '1474560574'),
(26, 8, '22.00', NULL, 1, '1474560574', '1474560574'),
(22, 3, '18.00', NULL, 1, '1474560746', '1474560746'),
(22, 6, '7.50', NULL, 1, '1474560746', '1474560746'),
(22, 5, '1.00', NULL, 1, '1474560746', '1474560746'),
(22, 14, '0.06', NULL, 1, '1474560746', '1474560746'),
(22, 13, '0.06', NULL, 1, '1474560746', '1474560746'),
(20, 3, '4.00', NULL, 1, '1474560825', '1474560825'),
(20, 18, '2.00', NULL, 1, '1474560825', '1474560825'),
(20, 7, '1.00', NULL, 1, '1474560825', '1474560825'),
(20, 9, '10.00', NULL, 1, '1474560825', '1474560825'),
(20, 8, '6.00', NULL, 1, '1474560825', '1474560825'),
(19, 3, '7.00', NULL, 1, '1474560846', '1474560846'),
(19, 9, '15.00', NULL, 1, '1474560846', '1474560846'),
(18, 5, '20.00', NULL, 1, '1474560869', '1474560869'),
(17, 3, '10.00', NULL, 1, '1474560907', '1474560907'),
(17, 6, '4.00', NULL, 1, '1474560907', '1474560907'),
(17, 5, '6.00', NULL, 1, '1474560907', '1474560907'),
(15, 3, '14.00', NULL, 1, '1474560960', '1474560960'),
(15, 6, '7.50', NULL, 1, '1474560960', '1474560960'),
(15, 11, '5.00', NULL, 1, '1474560960', '1474560960'),
(13, 6, '10.00', NULL, 1, '1474561035', '1474561035'),
(13, 7, '8.00', NULL, 1, '1474561035', '1474561035'),
(11, 6, '10.00', NULL, 1, '1474561082', '1474561082'),
(11, 7, '8.00', NULL, 1, '1474561082', '1474561082'),
(11, 12, '1.00', NULL, 1, '1474561082', '1474561082'),
(11, 13, '0.50', NULL, 1, '1474561082', '1474561082'),
(10, 6, '10.00', NULL, 1, '1474561103', '1474561103'),
(10, 7, '8.00', NULL, 1, '1474561103', '1474561103'),
(10, 12, '1.00', NULL, 1, '1474561103', '1474561103'),
(6, 3, '6.00', NULL, 1, '1474561141', '1474561141'),
(6, 6, '1.00', NULL, 1, '1474561141', '1474561141'),
(6, 7, '1.50', NULL, 1, '1474561141', '1474561141'),
(6, 9, '6.50', NULL, 1, '1474561141', '1474561141'),
(6, 8, '6.50', NULL, 1, '1474561141', '1474561141'),
(36, 3, '10.00', NULL, 1, '1475809718', '1475809718'),
(36, 9, '3.00', NULL, 1, '1475809718', '1475809718'),
(36, 7, '1.50', NULL, 1, '1475809718', '1475809718'),
(35, 3, '10.00', NULL, 1, '1475809750', '1475809750'),
(35, 5, '3.00', NULL, 1, '1475809750', '1475809750'),
(35, 7, '2.50', NULL, 1, '1475809750', '1475809750'),
(35, 8, '1.00', NULL, 1, '1475809750', '1475809750'),
(33, 3, '8.00', NULL, 1, '1475809792', '1475809792'),
(33, 7, '2.00', NULL, 1, '1475809792', '1475809792'),
(33, 10, '3.00', NULL, 1, '1475809792', '1475809792'),
(33, 8, '1.00', NULL, 1, '1475809792', '1475809792'),
(30, 3, '10.00', NULL, 1, '1475809842', '1475809842'),
(30, 7, '2.50', NULL, 1, '1475809842', '1475809842'),
(30, 11, '5.00', NULL, 1, '1475809842', '1475809842'),
(37, 15, '5.00', NULL, 1, '1476024340', '1476024340'),
(37, 17, '0.00', NULL, 1, '1476024340', '1476024340'),
(37, 5, '4.00', NULL, 1, '1476024340', '1476024340'),
(37, 13, '1.00', NULL, 1, '1476024340', '1476024340'),
(42, 12, '17.00', NULL, 1, '1476024369', '1476024369'),
(29, 15, '2.00', NULL, 1, '1476024425', '1476024425'),
(29, 17, '0.00', NULL, 1, '1476024425', '1476024425'),
(29, 3, '6.00', NULL, 1, '1476024425', '1476024425'),
(29, 18, '2.00', NULL, 1, '1476024425', '1476024425'),
(29, 14, '0.50', NULL, 1, '1476024425', '1476024425'),
(4, 3, '10.00', NULL, 1, '1476025232', '1476025232'),
(4, 6, '8.00', NULL, 1, '1476025232', '1476025232'),
(4, 7, '2.50', NULL, 1, '1476025232', '1476025232'),
(4, 8, '5.00', NULL, 1, '1476025232', '1476025232'),
(21, 11, '20.00', NULL, 1, '1478885797', '1478885797'),
(3, 15, '2.00', NULL, 1, '1479409701', '1479409701'),
(3, 3, '6.00', NULL, 1, '1479409701', '1479409701'),
(3, 18, '2.00', NULL, 1, '1479409701', '1479409701'),
(3, 6, '4.50', NULL, 1, '1479409701', '1479409701'),
(3, 5, '0.50', NULL, 1, '1479409701', '1479409701'),
(3, 7, '2.50', NULL, 1, '1479409701', '1479409701'),
(3, 12, '0.25', NULL, 1, '1479409701', '1479409701'),
(3, 14, '0.08', NULL, 1, '1479409701', '1479409701'),
(3, 11, '0.50', NULL, 1, '1479409701', '1479409701'),
(3, 10, '1.00', NULL, 1, '1479409701', '1479409701'),
(3, 9, '1.50', NULL, 1, '1479409701', '1479409701'),
(3, 13, '0.10', NULL, 1, '1479409701', '1479409701'),
(3, 8, '2.00', NULL, 1, '1479409701', '1479409701'),
(9, 15, '1.00', NULL, 1, '1479409772', '1479409772'),
(9, 3, '10.00', NULL, 1, '1479409772', '1479409772'),
(9, 6, '5.00', NULL, 1, '1479409772', '1479409772'),
(9, 5, '1.50', NULL, 1, '1479409772', '1479409772'),
(9, 7, '0.50', NULL, 1, '1479409772', '1479409772'),
(9, 12, '0.25', NULL, 1, '1479409772', '1479409772'),
(9, 14, '0.10', NULL, 1, '1479409772', '1479409772'),
(9, 11, '0.50', NULL, 1, '1479409772', '1479409772'),
(9, 10, '0.50', NULL, 1, '1479409772', '1479409772'),
(9, 9, '0.50', NULL, 1, '1479409772', '1479409772'),
(9, 13, '0.10', NULL, 1, '1479409772', '1479409772'),
(9, 8, '2.00', NULL, 1, '1479409772', '1479409772'),
(14, 3, '6.00', NULL, 1, '1479409828', '1479409828'),
(14, 5, '1.25', NULL, 1, '1479409828', '1479409828'),
(14, 6, '3.00', NULL, 1, '1479409828', '1479409828'),
(14, 7, '1.00', NULL, 1, '1479409828', '1479409828'),
(14, 8, '5.00', NULL, 1, '1479409828', '1479409828'),
(14, 9, '2.25', NULL, 1, '1479409828', '1479409828'),
(14, 10, '1.00', NULL, 1, '1479409828', '1479409828'),
(14, 11, '1.00', NULL, 1, '1479409828', '1479409828'),
(14, 13, '0.10', NULL, 1, '1479409828', '1479409828'),
(16, 15, '3.00', NULL, 1, '1479409876', '1479409876'),
(16, 3, '2.00', NULL, 1, '1479409876', '1479409876'),
(16, 6, '1.00', NULL, 1, '1479409876', '1479409876'),
(16, 5, '0.50', NULL, 1, '1479409876', '1479409876'),
(16, 7, '2.00', NULL, 1, '1479409876', '1479409876'),
(16, 14, '0.60', NULL, 1, '1479409876', '1479409876'),
(16, 11, '1.00', NULL, 1, '1479409876', '1479409876'),
(16, 10, '1.00', NULL, 1, '1479409876', '1479409876'),
(16, 9, '1.00', NULL, 1, '1479409876', '1479409876'),
(16, 8, '10.00', NULL, 1, '1479409876', '1479409876'),
(23, 15, '2.00', NULL, 1, '1479410034', '1479410034'),
(23, 3, '4.00', NULL, 1, '1479410034', '1479410034'),
(23, 6, '2.50', NULL, 1, '1479410034', '1479410034'),
(23, 10, '5.00', NULL, 1, '1479410034', '1479410034'),
(24, 15, '3.00', NULL, 1, '1479410070', '1479410070'),
(24, 3, '6.00', NULL, 1, '1479410070', '1479410070'),
(24, 18, '14.00', NULL, 1, '1479410070', '1479410070'),
(24, 8, '5.00', NULL, 1, '1479410070', '1479410070'),
(25, 3, '8.00', NULL, 1, '1479410131', '1479410131'),
(25, 6, '4.00', NULL, 1, '1479410131', '1479410131'),
(25, 5, '2.00', NULL, 1, '1479410131', '1479410131'),
(25, 7, '1.20', NULL, 1, '1479410131', '1479410131'),
(25, 11, '0.35', NULL, 1, '1479410131', '1479410131'),
(25, 9, '3.30', NULL, 1, '1479410131', '1479410131'),
(25, 13, '0.10', NULL, 1, '1479410131', '1479410131'),
(25, 8, '4.00', NULL, 1, '1479410131', '1479410131'),
(28, 3, '5.00', NULL, 1, '1479410183', '1479410183'),
(28, 6, '1.00', NULL, 1, '1479410183', '1479410183'),
(28, 7, '1.50', NULL, 1, '1479410183', '1479410183'),
(28, 11, '2.50', NULL, 1, '1479410183', '1479410183'),
(28, 9, '5.00', NULL, 1, '1479410183', '1479410183'),
(28, 8, '5.00', NULL, 1, '1479410183', '1479410183'),
(38, 15, '4.00', NULL, 1, '1479410294', '1479410294'),
(38, 3, '2.00', NULL, 1, '1479410294', '1479410294'),
(38, 18, '1.00', NULL, 1, '1479410294', '1479410294'),
(38, 13, '2.80', NULL, 1, '1479410294', '1479410294'),
(43, 6, '30.00', NULL, 1, '1518486610', '1518486610'),
(44, 3, '2.00', NULL, 1, '1564044274', '1564044274'),
(44, 18, '1.00', NULL, 1, '1564044274', '1564044274'),
(44, 6, '1.50', NULL, 1, '1564044274', '1564044274'),
(44, 12, '0.08', NULL, 1, '1564044274', '1564044274'),
(44, 14, '0.02', NULL, 1, '1564044274', '1564044274'),
(44, 11, '0.15', NULL, 1, '1564044274', '1564044274'),
(44, 10, '0.30', NULL, 1, '1564044274', '1564044274'),
(44, 9, '0.50', NULL, 1, '1564044274', '1564044274'),
(44, 13, '0.03', NULL, 1, '1564044274', '1564044274'),
(44, 8, '0.65', NULL, 1, '1564044274', '1564044274'),
(50, 8, '5.00', NULL, 1, '1564054774', '1564054774'),
(50, 20, '1.00', NULL, 0, '1564054774', '1564054774'),
(49, 3, '2.00', NULL, 1, '1564054798', '1564054798'),
(49, 9, '5.00', NULL, 1, '1564054798', '1564054798'),
(49, 20, '1.00', NULL, 0, '1564054798', '1564054798'),
(48, 5, '5.00', NULL, 1, '1564054811', '1564054811'),
(48, 20, '1.00', NULL, 0, '1564054811', '1564054811'),
(47, 3, '2.00', NULL, 1, '1564054827', '1564054827'),
(47, 10, '3.00', NULL, 1, '1564054827', '1564054827'),
(47, 6, '2.30', NULL, 1, '1564054827', '1564054827'),
(47, 20, '1.00', NULL, 0, '1564054827', '1564054827'),
(46, 11, '5.00', NULL, 1, '1564054842', '1564054842'),
(46, 20, '1.00', NULL, 0, '1564054842', '1564054842'),
(45, 17, '9.00', NULL, 1, '1564098379', '1564098379'),
(45, 3, '3.00', NULL, 1, '1564098379', '1564098379'),
(45, 18, '7.00', NULL, 1, '1564098379', '1564098379');

-- --------------------------------------------------------

--
-- Table structure for table `rec_product`
--

CREATE TABLE `rec_product` (
  `deficiency_id` int(11) NOT NULL,
  `rec_product` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sample_unit`
--

CREATE TABLE `sample_unit` (
  `id` smallint(5) NOT NULL,
  `name_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sample_unit`
--

INSERT INTO `sample_unit` (`id`, `name_desc`) VALUES
(1, 'Mature Leaves From Non-Fruiting, Non-Expanding Spurs'),
(2, 'Leaves from non-fruiting, non-expanding leaves (CA)'),
(3, 'Mid-shoot leaves (PNW)'),
(4, 'Bottom 6” of petiole of most recently matured leaf'),
(5, 'Most recently matured leaf from non-fruiting terminals'),
(6, 'Mid-shoot current growth'),
(7, 'Most recently mature leaf from laterals of current season primo canes'),
(8, 'Most recently mature leaf'),
(9, 'Current season growing tips from fruiting and non-fruiting uprights'),
(10, 'Basal to mid-shoot leaves'),
(11, 'Mature leaf behind fruit'),
(12, 'Most recently mature leaf from growing tip'),
(13, 'Recently mature leaf opposite basal clusters'),
(14, 'Recently mature leaf 2-3 nodes above top most cluster'),
(15, 'Petiole from recently mature leaf opposite basal clusters'),
(16, 'Petiole from most recently mature leaf from growing tip'),
(17, 'Leaf opposite basal flower clusters'),
(18, 'Petiole from most recently mature leaf'),
(19, 'Mature leaves from mid-shoot current growth'),
(20, 'Mature leaf head high'),
(21, 'Petioles of mid-cane leaves'),
(22, 'Mid-cane leaves'),
(23, 'Non-fruiting terminals'),
(24, 'Petiole from first fully mature leaf from vine tip'),
(25, 'First fully mature leaf from vine tip'),
(26, 'Top 6” of stem stripped of leaves'),
(27, 'Leaves of top 6” of first unbranched stem'),
(28, 'Paired leaflets from mid portion of leaves'),
(29, 'Most recently mature leaf from non-fruiting shoots'),
(30, 'Terminal leaflets'),
(31, 'Top 1/3 of plant'),
(32, 'Recently mature leaf'),
(33, 'Entire above ground portion of plant'),
(34, 'First fully developed leaf from tip'),
(35, 'Leaf opposite and below primary ear'),
(36, 'Basal 4-5” of midrib from first fully mature leaf'),
(37, 'First fully developed leaf from tip'),
(38, 'Whole tops'),
(39, 'Clippings'),
(40, 'Most recently developed leaflets'),
(41, 'Top 6 inches of stems'),
(42, 'Y-leaf'),
(43, 'Mid-stems minus leaves'),
(44, 'Mid-stem leaves'),
(45, 'Third leaf below head'),
(46, '3rd leaf from tip'),
(47, 'Whole tops minus dead or dying leaves'),
(48, 'Flag leaf'),
(49, 'Below ground portion of stem from seed to soil line minus dirt'),
(50, 'Lower 2” of stem above soil line'),
(51, 'Flag leaf for grain protein content'),
(52, 'Top 4 inches of frond'),
(53, 'Top 12 inches of frond'),
(54, 'Mid-stem from most recently mature leaf'),
(55, 'Whole above ground plant'),
(56, 'Whole fully mature outer leaf'),
(57, 'Distal 1/3 of most recently mature stalk minus leaves'),
(58, 'Leaves from most recently mature stalk');

-- --------------------------------------------------------

--
-- Table structure for table `sufficiency`
--

CREATE TABLE `sufficiency` (
  `id` smallint(5) NOT NULL,
  `crop_id` smallint(5) NOT NULL,
  `growth_stage_id` smallint(5) NOT NULL,
  `sample_unit_id` smallint(5) NOT NULL,
  `n_percent` varchar(15) DEFAULT NULL,
  `no3_ppm` varchar(15) DEFAULT NULL,
  `p_percent` varchar(15) DEFAULT NULL,
  `po4_ppm` varchar(15) DEFAULT NULL,
  `k_percent` varchar(15) DEFAULT NULL,
  `ca_percent` varchar(15) DEFAULT NULL,
  `mg_percent` varchar(15) DEFAULT NULL,
  `s_percent` varchar(15) DEFAULT NULL,
  `b_ppm` varchar(15) DEFAULT NULL,
  `cu_ppm` varchar(15) DEFAULT NULL,
  `fe_ppm` varchar(15) DEFAULT NULL,
  `mn_ppm` varchar(15) DEFAULT NULL,
  `zn_ppm` varchar(15) DEFAULT NULL,
  `na_percent` varchar(15) DEFAULT NULL,
  `cl_percent` varchar(15) DEFAULT NULL,
  `create_dte` char(10) NOT NULL,
  `added_by` tinyint(3) NOT NULL,
  `last_update` char(10) NOT NULL,
  `last_update_by` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sufficiency`
--

INSERT INTO `sufficiency` (`id`, `crop_id`, `growth_stage_id`, `sample_unit_id`, `n_percent`, `no3_ppm`, `p_percent`, `po4_ppm`, `k_percent`, `ca_percent`, `mg_percent`, `s_percent`, `b_ppm`, `cu_ppm`, `fe_ppm`, `mn_ppm`, `zn_ppm`, `na_percent`, `cl_percent`, `create_dte`, `added_by`, `last_update`, `last_update_by`) VALUES
(1, 11, 1, 1, '3.4-3.8', NULL, '0.15', NULL, '2.4-4', '1.6', '0.2', '0.15', '25-65', '6-20', '40', '30', '30', '< 0.25', '< 0.30', '1563231574', 1, '', 0),
(2, 11, 2, 1, '2.5-3.3', NULL, '0.15', NULL, '2.2-4', '1.6', '0.2', '0.15', '25-65', '6-20', '40', '30', '30', '< 0.25', '< 0.30', '1563326281', 3, '', 0),
(3, 11, 3, 1, '2.3-3.5', NULL, '0.15', NULL, '1.8-3', '2.0', '0.25', '0.20', '30-65', '6-20', '30', '30', '20', '< 0.25', '< 0.30', '1563327396', 3, '', 0),
(4, 11, 4, 1, '2-2.5', NULL, '0.15', NULL, '1.8-2.5', '2.0', '0.25', '0.20', '30-65', '6-20', '30', '30', '20', '< 0.25', '< 0.30', '1563327569', 3, '', 0),
(5, 25, 5, 2, '2-2.4', NULL, '0.1-0.3', NULL, '1.2-2', '1.1-1.6', NULL, NULL, '25-70', '', '', '', NULL, '< 0.15', '< 0.3', '1563344901', 3, '', 0),
(6, 25, 6, 3, '2.1-2.5', NULL, NULL, NULL, '1.2-2', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563345432', 3, '', 0),
(7, 27, 5, 2, '2-2.5', NULL, '0.13-0.3', NULL, '2.5-3', '1.6-3', NULL, NULL, '20-70', '', '', '', NULL, '< 0.1', '< 0.2', '1563346830', 3, '', 0),
(8, 28, 7, 4, NULL, '6000-15000', NULL, '2000-4000', '3.0-7', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563347036', 3, '', 0),
(9, 28, 8, 4, NULL, '2500-3500', NULL, '1700-2500', '2.5-5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563347120', 3, '', 0),
(10, 29, 9, 5, '1.6-2.0', NULL, '0.08', NULL, '0.75', '1.0', '0.25', '0.20', '50-100', '5-15', '50', '30', '30', NULL, NULL, '1563347364', 3, '', 0),
(11, 30, 6, 6, '1.7-2.1', NULL, '0.08', NULL, '0.4', '0.3', '0.15', '0.12', '25-70', '5-20', '60', '50', '8', NULL, NULL, '1563347538', 3, '', 0),
(12, 30, 6, 6, '1.2-1.7', NULL, '0.08', NULL, '0.35', '0.25', '0.15', '0.11', '12-35', '4-10', '25', '25', '10', NULL, NULL, '1563347655', 3, '', 0),
(13, 32, 10, 7, '2.3-3', NULL, '0.2-0.45', NULL, '1.25-2', '1.0-2', NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563347801', 3, '', 0),
(14, 33, 28, 8, '1.7-2.8', NULL, '0.15', NULL, '0.90', '0.2', '0.2', '0.15', '', '', '', '', NULL, NULL, NULL, '1563348028', 3, '', 0),
(15, 34, 13, 1, '2.6-4.8', NULL, '0.2', NULL, '1.6', '1.4', '0.4', '0.2', '20-90', '10-20', '50', '25', '25', '< 0.2', '< 0.3', '1563348196', 3, '', 0),
(16, 34, 3, 1, '2.0-3.0', NULL, '0.2', NULL, '1.6', '1.4', '0.4', '0.2', '20-90', '10-20', '50', '25', '25', '< 0.2', '< 0.3', '1563348346', 3, '', 0),
(17, 34, 3, 1, '2.6-3.0', NULL, '0.15', NULL, '1.6', '1.5', '0.3', '0.2', '20-55', '8-28', '40', '40', '20', NULL, NULL, '1563348466', 3, '', 0),
(18, 36, 14, 9, '0.9-1.1', NULL, '0.1', NULL, '0.40', '0.30', '0.15', '0.08', '15-60', '4-10', '20', '10', '15', NULL, NULL, '1563348680', 3, '', 0),
(19, 37, 3, 10, '2.0-2.5', NULL, '0.1', NULL, '1.0', '3.0', '0.25', '0.20', '25-50', '6-20', '50', '20', '15', NULL, NULL, '1563348833', 3, '', 0),
(20, 38, 15, 8, '2.4-3.0', NULL, '0.15', NULL, '0.80', '1.5', '0.25', '0.15', '30-100', '5-100', '40', '25', '25', NULL, NULL, '1563348972', 3, '', 0),
(21, 38, 16, 11, '2.0-2.6', NULL, '0.13', NULL, '0.80', '1.5', '0.3', '0.15', '30-100', '5-16', '40', '25', '25', NULL, NULL, '1563349103', 3, '', 0),
(22, 15, 17, 12, '3.0-5.0', NULL, '0.3', NULL, '3.0', '1.5', '0.4', '0.3', '45-100', '10', '30', '30', '40', '< 0.3', '< 0.5', '1563349305', 3, '', 0),
(23, 15, 18, 13, '2.5-3.5', NULL, '0.3', NULL, '2.5', '1.5', '0.4', '0.3', '45-100', '10', '30', '30', '40', '< 0.3', '< 0.5', '1563349465', 3, '', 0),
(24, 15, 19, 14, '2.0-3.0', NULL, '0.3', NULL, '2.0', '1.5', '0.4', '0.3', '45-100', '10', '30', '30', '40', '< 0.3', '< 0.5', '1563349604', 3, '', 0),
(25, 15, 20, 12, '1.5-3.0', NULL, '0.3', NULL, '1.5', '1.5', '0.4', '0.3', '45-100', '10', '30', '30', '40', '< 0.3', '< 0.5', '1563349738', 3, '', 0),
(26, 15, 21, 12, '1.5-3.0', NULL, '0.3', NULL, '1.5', '1.5', '0.4', '0.3', '45-100', '10', '30', '30', '40', '< 0.3', '< 0.5', '1563349827', 3, '', 0),
(27, 15, 24, 12, '1.0-2.5', NULL, '0.3', NULL, '1.0', '1.5', '0.4', '0.3', '45-100', '10', '30', '30', '40', '< 0.3', '< 0.5', '1563350009', 3, '', 0),
(28, 15, 18, 15, NULL, '500-1200', '0.25', NULL, '1.5', '1.25', '0.3', '0.15', '30-70', '7-25', '40', '30', '25', '< 0.2', '< 0.2', '1563350247', 3, '', 0),
(29, 15, 20, 16, NULL, '30-200', '0.15', NULL, '0.8', '1.25', '0.3', '0.15', '30-70', '7-25', '40', '30', '25', '< 0.2', '< 0.2', '1563350713', 3, '', 0),
(30, 15, 18, 15, NULL, '500-1200', '0.15', NULL, '1.5', '1.25', '0.3', '0.10', '30-70', '7-25', '40', '25', '25', '< 0.5', '< 1.5', '1563350861', 3, '', 0),
(31, 15, 20, 16, NULL, '500-1200', '0.12', NULL, '0.8', '1.25', '0.3', '0.10', '30-70', '7-25', '40', '25', '25', '< 0.5', '< 1.5', '1563351038', 3, '', 0),
(32, 15, 25, 17, '1.6-2.8', NULL, '0.3', NULL, '2.6', '0.45', '0.15', '0.15', '25-50', '', '40', '20', '20', NULL, NULL, '1563351208', 3, '', 0),
(33, 15, 26, 18, NULL, '150-450', '0.1', NULL, '0.60', NULL, '0.15', NULL, '25', '', '', '25', '25', NULL, NULL, '1563351340', 3, '', 0),
(34, 43, 5, 19, '2.3-2.6', NULL, '0.15', NULL, '0.7', '1.0', '0.25', '0.15', '30-70', '4-50', '50', '25', '15', NULL, NULL, '1563351480', 3, '', 0),
(35, 44, 27, 20, '2.6', NULL, '0.35', NULL, '2.2', '2.0', '0.4', NULL, '', '', '', '', NULL, NULL, NULL, '1563351663', 3, '', 0),
(36, 45, 10, 21, NULL, '2000-9000', NULL, '1000-3000', '1.0-2', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563496512', 3, '', 0),
(37, 45, 33, 22, '2-2.5', '', '0.14-0.25', '', '1.4-2', '2.0-4', '', '', '30-90', '', '', '', '', '< 0.15', '< 0.1', '1563496850', 3, '1563673955', 3),
(38, 46, 34, 23, '2.2-2.7', NULL, '0.1', NULL, '1.0', '1.5', '0.2', '0.15', '', '', '40', '40', '20', NULL, NULL, '1563497148', 3, '', 0),
(39, 102, 34, 23, '2.4-3.0', NULL, '0.15', NULL, '1.60', '1.50', '0.25', '0.15', '30-100', '5-100', '40', '20', '20', NULL, NULL, '1563497746', 3, '', 0),
(40, 47, 27, 24, NULL, '12000', NULL, '3000', '6', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563497882', 3, '', 0),
(41, 47, 35, 24, NULL, '8000', NULL, '2500', '5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563497959', 3, '', 0),
(42, 47, 36, 24, NULL, '3000', NULL, '2000', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563498053', 3, '', 0),
(43, 48, 27, 24, NULL, '12000', NULL, '3000', '6', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563498111', 3, '', 0),
(44, 48, 35, 24, NULL, '7500', NULL, '2500', '5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563498167', 3, '', 0),
(45, 48, 36, 24, NULL, '3000', NULL, '2000', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563498211', 3, '', 0),
(46, 49, 27, 25, NULL, NULL, NULL, NULL, NULL, '2.2', '0.6', '0.25', '30-80', '5-30', '50', '20', '30', NULL, NULL, '1563498321', 3, '', 0),
(47, 49, 35, 25, NULL, NULL, NULL, NULL, NULL, '2.2', '0..6', '0.25', '30-80', '5-30', '50', '20', '30', NULL, NULL, '1563498398', 3, '', 0),
(48, 49, 36, 25, NULL, NULL, NULL, NULL, NULL, '2.2', '0.6', '0.25', '30-80', '5-30', '50', '20', '30', NULL, NULL, '1563498469', 3, '', 0),
(49, 50, 37, 26, NULL, '8000-12000', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563498559', 3, '', 0),
(50, 50, 5, 26, NULL, '4000-6000', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563498591', 3, '', 0),
(51, 50, 26, 26, NULL, '1000-3000', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563498629', 3, '', 0),
(52, 50, 37, 27, '2.8-4.2', NULL, '0.3-0.5', '2.4-3.6', '1-1.8', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563498734', 3, '', 0),
(53, 51, 3, 10, NULL, NULL, NULL, NULL, NULL, NULL, '0.1', '0.2', '20-150', '5-20', '45', '50', '15', '< 0.2', '< 0.3', '1563498838', 3, '', 0),
(54, 52, 34, 23, '2.5-2.7', NULL, '0.12', NULL, '1.20', '3.0', '0.3', '0.15', '35-100', '5-16', '60', '25', '25', NULL, NULL, '1563498958', 3, '', 0),
(55, 53, 34, 23, '3.0-3.4', NULL, '0.15', NULL, '0.90', '1.5', '0.25', '0.15', '30-100', '5-100', '40', '20', '20', NULL, NULL, '1563499032', 3, '', 0),
(56, 26, 3, 1, '2.3-2.8', NULL, '0.15', NULL, '1.0', '1.0', '0.25', '0.15', '20-70', '10-25', '60', '30', '18', '< 0.25', '< 0.3', '1563499145', 3, '', 0),
(57, 54, 1, 10, '3-4', NULL, '0.15', NULL, '1.8', '0.8', '0.2', '0.15', '18-150', '6-20', '40', '35', '20', '< 0.2', '< 0.2', '1563499289', 3, '', 0),
(58, 54, 3, 10, '2.4-3.3', NULL, '0.1', NULL, '1.2', '1.0', '0.25', '0.15', '20-80', '6-20', '30', '30', '20', '< 0.2', '< 0.3', '1563499365', 3, '', 0),
(59, 54, 4, 10, '2-2.6', NULL, '0.1', NULL, '1.2', '1.0', '0.25', '0.15', '20-80', '6-20', '30', '30', '20', '< 0.2', '< 0.3', '1563499464', 3, '', 0),
(60, 55, 38, 28, '2.7', NULL, '0.2', NULL, '1.1', '0.4', '0.1', '0.10', '40-200', '5-40', '20', '20', '50', '< 0.1', '< 0.3', '1563499596', 3, '', 0),
(61, 55, 39, 28, '2.5', NULL, '0.18', NULL, '1', '0.4', '0.1', '0.10', '40-200', '5-40', '20', '20', '50', '< 0.1', '< 0.3', '1563499677', 3, '', 0),
(62, 55, 5, 28, '2.2', NULL, '0.15', NULL, '0.7', '0.4', '0.1', '0.10', '40-200', '5-40', '20', '20', '50', '< 0.1', '< 0.3', '1563499746', 3, '', 0),
(63, 55, 26, 28, '2', NULL, '0.15', NULL, '0.7', '0.4', '0.1', '0.10', '40-200', '5-40', '20', '20', '50', '< 0.1', '< 0.3', '1563499822', 3, '', 0),
(64, 55, 40, 28, '2', NULL, '0..15', NULL, '0.7', '0.4', '0.1', '0.10', '40-200', '5-40', '20', '20', '50', '< 0.1', '< 0.3', '1563499908', 3, '', 0),
(65, 56, 41, 29, '1.5-2.8', NULL, '0.1-0.2', '1.3-3.8', '0.8-3', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563500033', 3, '', 0),
(66, 21, 38, 30, '4', NULL, '0.2', NULL, '1.8', '1.3', '0.6', '0.25', '80-120', '6', '50', '30', '10', '< 0.1', '< 0.3', '1563504444', 3, '', 0),
(67, 21, 39, 30, '3.5', NULL, '0.2', NULL, '1.8', '1.3', '0.6', '0.25', '100-150', '6', '50', '30', '10', '< 0.1', '< 0.3', '1563506368', 3, '', 0),
(68, 21, 5, 30, '2.5', NULL, '0.15', NULL, '1.8', '1.3', '0.6', '0.25', '150-250', '6', '50', '30', '10', '< 0.1', '< 0.3', '1563506518', 3, '', 0),
(69, 21, 26, 30, '2.5', NULL, '0.15', NULL, '1.8', '1.3', '0.6', '0.25', '150-250', '6', '50', '30', '10', '< 0.1', '< 0.3', '1563506626', 3, '', 0),
(70, 21, 40, 30, '2.2', NULL, '0.15', NULL, '1', '1.3', '0.6', '0.25', '150-250', '6', '50', '30', '10', '< 0.1', '< 0.3', '1563506729', 3, '', 0),
(71, 57, 37, 1, '1.5', NULL, '0.1', NULL, '1', '1', '0.3', '0.1', '20-60', '4-20', '', '35', '20', NULL, NULL, '1563506830', 3, '', 0),
(72, 58, 1, 1, '3.4-4', NULL, '0.15', NULL, '2', '0.8', '0.2', '0.15', '25-100', '6-25', '40', '40', '20', '< 0.2', '< 0.3', '1563506938', 3, '', 0),
(73, 58, 42, 1, '2.3-2.8', NULL, 'O.15', NULL, '1.3', '1', '0.2', '0.15', '25-100', '6-25', '40', '40', '20', '< 0.2', '< 0.3', '1563507059', 3, '', 0),
(74, 58, 4, 1, '2-2.5', NULL, '0.15', NULL, '1.3', '1', '0.2', '0.15', '25-100', '6-25', '40', '40', '20', '< 0.2', '< 0.3', '1563507155', 3, '', 0),
(75, 59, 43, 25, '2.5-4.0', NULL, '0.3', NULL, '1.3', '1.0', '0.25', NULL, '25-50', '6-50', '40', '40', '20', NULL, NULL, '1563507297', 3, '', 0),
(76, 59, 44, 25, '2.8-3.5', NULL, '0.25', NULL, '1.8', '0.8', '0.2', NULL, '35', '7-15', '40', '35', '20', NULL, NULL, '1563507475', 3, '', 0),
(77, 22, 45, 8, '3', NULL, '0.15', NULL, '1.5', '0.7', '0.3', '0.15', '35', '3', '50', '30', '20', '< 0.3', NULL, '1563507581', 3, '', 0),
(78, 22, 45, 18, NULL, '1000', NULL, '1000', '1', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563507663', 3, '', 0),
(79, 18, 1, 30, '3-4', NULL, '0.15', NULL, '1.5', '0.8', '0.25', '0.15', '30-300', '6-15', '40', '20', '20', '< 0.1', '< 0.3', '1563507750', 3, '', 0),
(80, 18, 46, 30, '2.4-3.2', NULL, '0.1', NULL, '1.2', '1.0', '0.3', '0.15', '30-300', '6-15', '50', '20', '20', '< 0.1', '< 0.3', '1563507892', 3, '', 0),
(81, 18, 4, 30, '2-3', NULL, '0.1', NULL, '1.2', '1.0', '0.3', '0.15', '30-300', '6-15', '50', '20', '20', '< 0.1', '< 0.3', '1563508025', 3, '', 0),
(82, 60, 47, 31, '4.0-5.5', NULL, '0.2', NULL, '2.4', '1.0', '0.25', '0.25', '30-80', '5-15', '40', '30', '20', '< 0.1', '< 1.8', '1563509036', 3, '', 0),
(83, 61, 48, 31, '1.75-3.0', NULL, '0.2', NULL, '1.50', '0.30', '0.15', '0.15', '', '5-25', '', '25', '15', NULL, NULL, '1563509503', 3, '', 0),
(84, 62, 27, 18, NULL, '3200-5000', NULL, '2500-3500', '5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563509623', 3, '', 0),
(85, 62, 49, 18, NULL, '3000-4500', NULL, '2000-3000', '5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563509728', 3, '', 0),
(86, 62, 50, 18, NULL, '1500-2500', NULL, '1500', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563509855', 3, '', 0),
(87, 63, 51, 8, '3.0-6.0', NULL, '0.25-0.5', NULL, '1.8-2.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563509977', 3, '', 0),
(88, 64, 51, 8, '2.5-3.5', NULL, '0.2-0.3', NULL, '1.5-2.25', '0.8', '0.3', '0.15', '', '5-30', '50', '30', '30', '< 0.2', '< 0.35', '1563510215', 3, '', 0),
(89, 65, 51, 8, '4.0-5.0', NULL, '0.3-0.4', NULL, '2.5-3.0', '0.8', '0.3', '0.15', '', '5-30', '50', '30', '30', '< 0.2', '< 0.35', '1563510352', 3, '', 0),
(90, 66, 51, 8, '2.3-3.5', NULL, '0.25-0.4', NULL, '1.5-2.5', '0.8', '0.3', '0.15', '', '5-30', '50', '30', '30', '< 0.2', '< 0.35', '1563510509', 3, '', 0),
(91, 67, 51, 8, '3.5-5.0', '', '0.35-0.5', '', '3.0-5.0', '0.8', '0.3', '0.15', '', '5-30', '50', '30', '30', '< 0.2', '< 0.35', '1563510646', 3, '1563674073', 3),
(92, 68, 49, 32, '4.0-5.5', '', '0.25-0.5', '', '1.7-2.5', '0.35-2.0', '0.25-1.0', '0.25-0.35', '20-50', '4-10', '25-350', '25-150', '20-70', '< 0.25', '', '1563510921', 3, '1563674257', 3),
(94, 69, 51, 31, NULL, NULL, '0.25', NULL, '1.5', '1.0', '0.3', '0.25', '15-50', '3-15', '40', '40', '15', NULL, NULL, '1563511559', 3, '', 0),
(95, 69, 52, 8, '4.5', NULL, '0.35', NULL, '2.0', '0.5', '0.2', '0.25', '25-50', '5-8', '40', '25', '15', NULL, NULL, '1563511744', 3, '', 0),
(96, 69, 52, 31, '3.0-4.5', NULL, '0.3', NULL, '1.8', '2.0', '0.2', '0.25', '30-80', '8-15', '30', '30', '18', NULL, NULL, '1563511881', 3, '', 0),
(97, 69, 52, 8, '3.0-3.5', NULL, '0.25', NULL, '1.0', '1.0', '0.25', '0.20', '25', '7-13', '40', '40', '25', NULL, NULL, '1563511972', 3, '', 0),
(98, 73, 53, 33, '3.5-5.0', '', '0.4-0.8', '', '3.5-5.0', '0.3-0.7', '0.15-0.45', '0.15-0.5', '5-25', '5-20', '', '25-30', '20-60', '', '< 0.08', '1563512188', 3, '1563674460', 3),
(99, 73, 54, 34, '3.5-5.0', NULL, '0.3-0.5', NULL, '2.4-4.0', '0.5', '0.3', '0.20', '10-100', '7-20', '20', '20', '20', '< 0.7', '< 2.0', '1563512358', 3, '', 0),
(100, 73, 55, 35, '2.7-3.5', NULL, '0.25-0.4', NULL, '1.7-2.5', '0.25', '0.2', '0.20', '5-25', '3-15', '20', '20', '20', NULL, NULL, '1563512507', 3, '', 0),
(101, 74, 53, 36, NULL, '5500', NULL, '1500', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563512646', 3, '', 0),
(102, 74, 54, 37, NULL, '2500', NULL, '1100', '3', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563512762', 3, '', 0),
(103, 74, 55, 35, NULL, '1500', NULL, '1000', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563512827', 3, '', 0),
(104, 75, 56, 8, '3.5-4.75', '', '0.25', '', '1.5', '2.0', '0.3', '0.20', '20-60', '8-20', '30', '30', '30', '< 0.2', '', '1563512935', 3, '1563674646', 3),
(105, 75, 25, 8, '3.0-4.3', NULL, '0.25', NULL, '0.90', '2.20', '0.3', '0.20', '20-60', '5-25', '30', '30', '20', '< 0.2', NULL, '1563513403', 3, '', 0),
(106, 76, 56, 18, NULL, '14000-19000', NULL, '1700-2000', '4.5-5.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563513536', 3, '', 0),
(107, 76, 47, 18, NULL, '12000-18000', NULL, '1500-2000', '4.0-5.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563513627', 3, '', 0),
(108, 76, 57, 18, NULL, '5000-7000', NULL, '1200-1500', '3.0-4.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563513709', 3, '', 0),
(109, 76, 58, 18, NULL, '2000-4000', NULL, '1000-1500', '2.5-4.0', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563513778', 3, '', 0),
(110, 76, 59, 18, NULL, '2000', NULL, '1000', '1.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563513826', 3, '', 0),
(111, 77, 56, 18, NULL, '8000-12000', NULL, '1500-2000', '4.5-5.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563513911', 3, '', 0),
(112, 77, 47, 18, NULL, '6000-8000', NULL, '1500-2000', '3.5-4.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563513988', 3, '', 0),
(113, 77, 57, 18, NULL, '5000-7000', NULL, '1200-1500', '2.5-4.0', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563514069', 3, '', 0),
(114, 77, 58, 18, NULL, '3000-5000', NULL, '1000-1200', '2.0-4.0', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563514122', 3, '', 0),
(115, 77, 59, 18, NULL, '1500', NULL, '1000', '1.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563514163', 3, '', 0),
(116, 78, 49, 38, '2.0-4.0', NULL, '0.25', NULL, '1.8', '0.25', '0.2', '0.20', '6-30', '5-25', '40', '25', '20', NULL, NULL, '1563514256', 3, '', 0),
(117, 79, 49, 38, '2.2-4.0', NULL, '0.25', NULL, '1.8', '0.25', '0.2', '0.20', '6-30', '5-25', '40', '25', '20', NULL, NULL, '1563680075', 3, '1563680075', 3),
(118, 80, 49, 39, '4.5-6.0', NULL, '0.3', NULL, '2.2', '0.50', '0.25', '0.2', '8-20', '8-30', '40', '25', '25', NULL, NULL, '1563680581', 3, '1563680581', 3),
(119, 81, 49, 38, '3.2-4.2', NULL, '0..25', NULL, '2.6', '0.50', '0.15', '0.20', '8-12', '3-5', '40', '40', '20', NULL, NULL, '1563680731', 3, '1563680731', 3),
(120, 82, 49, 38, '4.5-5.0', NULL, '0.35', NULL, '2.0', '0.25', '0.15', '0.25', '9-17', '6', '40', '40', '14', NULL, NULL, '1563696651', 3, '1563696651', 3),
(121, 83, 49, 38, '4.0-5.0', NULL, '0.5', NULL, '1.9', NULL, '0.2', NULL, '', '5', '', '15', NULL, NULL, NULL, '1563696721', 3, '1563696721', 3),
(122, 84, 49, 38, '2.0-3.5', NULL, '0.2', NULL, '1.9', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563696835', 3, '1563696835', 3),
(123, 85, 60, 38, '0.65', NULL, '0.08', NULL, '0.90', '0.15', '0.15', NULL, '', '', '', '', NULL, NULL, NULL, '1563696910', 3, '1563696910', 3),
(124, 86, 49, 38, '3.4-3.8', NULL, '0.35', NULL, '3.0', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563696978', 3, '1563696978', 3),
(125, 87, 60, 38, '0.55', NULL, '0.1', NULL, '1.15', '0.10', '0.06', '0.15', '10', '7-45', '22', '11', '25', NULL, NULL, '1563697223', 3, '1563697223', 3),
(127, 88, 49, 38, '2.5-4.0', NULL, '0.22', NULL, '2.3', NULL, NULL, '0.15', '', '', '', '', '33', NULL, NULL, '1563697325', 3, '1563697325', 3),
(128, 89, 61, 33, '3.5', NULL, '0.3', NULL, '2.5', '0.2', '0.2', '0.2', '10-100', '5-15', '55', '50', '30', '< 0.5', '< 2.0', '1563698762', 3, '1563698762', 3),
(129, 89, 64, 37, '3.2', NULL, '0.2', NULL, '2', '0.2', '0.2', '0.2', '10-100', '5-15', '55', '50', '30', '< 0.5', '< 2.0', '1563698957', 3, '1563698957', 3),
(130, 89, 65, 37, '2.7', NULL, '0.2', NULL, '2', '0.2', '0.2', '0.2', '10-100', '5-15', '55', '50', '30', '< 0.5', '< 2.0', '1563699076', 3, '1563699076', 3),
(131, 90, 66, 31, '2.0-3.0', NULL, '0.2', NULL, '1.5', '0.2', '0.15', '0.15', '', '5-25', '40', '25', '15', NULL, NULL, '1563699223', 3, '1563699223', 3),
(132, 91, 47, 40, '4.0-6.0', NULL, '0.3', NULL, '2.0', '1.2', '0.3', '0.20', '25-60', '7-25', '50', '30', '25', NULL, NULL, '1563699458', 3, '1563699458', 3),
(133, 92, 47, 40, '4.0-5.0', NULL, '0.3', NULL, '2.3', '2.0', '0.3', '0.20', '25-80', '6-25', '50', '30', '20', NULL, NULL, '1563699573', 3, '1563699573', 3),
(134, 93, 51, 8, '4.8-5.3', NULL, '0.3-0.4', NULL, '2.2-3.2', '0.8', '0.3', '0.15', '', '5-30', '50', '30', '30', '< 0.2', '< 0.35', '1563699732', 3, '1563699732', 3),
(135, 94, 50, 31, '3.5-4.0', NULL, '0.25', NULL, '1.7', '1.25', '0.3', '0.2', '25-60', '5-20', '60', '60', '25', NULL, NULL, '1563699851', 3, '1563699851', 3),
(136, 94, 67, 31, '3.5-4.0', NULL, '0.2', NULL, '1.7', '1.25', '0.3', '0.2', '20-50', '10-50', '60', '60', '20', NULL, NULL, '1563699951', 3, '1563699951', 3),
(137, 95, 49, 41, NULL, NULL, '0.3', NULL, '3.5', NULL, NULL, '0.15', '', '', '', '', '25', NULL, NULL, '1563700107', 3, '1563700107', 3),
(138, 96, 68, 42, '4.6-5.2', NULL, '0.2', '1000', '1.4', '0.2', '0.2', '0.2', '6-25', '10-30', '30', '30', '22', '< 1.85', '< 0.5', '1563700311', 3, '1563700311', 3),
(139, 96, 69, 42, '4-4.6', NULL, '0.2', '1000', '1.2', '0.2', '0.2', '0.2', '6-25', '10-30', '30', '30', '18', '< 1.85', '< 0.5', '1563700436', 3, '1563700436', 3),
(140, 96, 70, 42, '3-3.8', NULL, '0.25', '800', '1.2', '0.2', '0.2', '0.2', '6-25', '10-30', '30', '30', '18', '< 1.85', '< 0.5', '1563700596', 3, '1563700596', 3),
(141, 96, 71, 42, '2.6-3.2', NULL, '0.25', '800', '1.2', '0.2', '0.2', '0.2', '6-25', '10-30', '30', '30', '18', '< 1.85', '< 0.5', '1563700712', 3, '1563700712', 3),
(142, 97, 72, 43, NULL, '3500', NULL, '1500', '2.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563700803', 3, '1563700803', 3),
(143, 97, 73, 43, NULL, '2000', NULL, '1000', '2.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563700857', 3, '1563700857', 3),
(144, 97, 45, 44, NULL, NULL, NULL, NULL, NULL, '1', '0.35', '0.25', '25-40', '6-10', '40', '40', '20', NULL, NULL, '1563701017', 3, '1563701017', 3),
(145, 106, 74, 38, '3.5-5.1', NULL, '0.3', NULL, '3.0', '0.9', '0.35', '0.25', '15', '8-15', '40', '40', '30', NULL, NULL, '1563701144', 3, '1563701144', 3),
(146, 106, 75, 8, '3.2-4.2', NULL, '0.3', NULL, '2.5', '0.2', '0.2', '0.20', '10', '2-15', '40', '20', '20', NULL, NULL, '1563701378', 3, '1563701378', 3),
(147, 106, 18, 45, '3.0-3.5', NULL, '0.3', NULL, '2.5', '0.3', '0.1', '0.20', '10', '10-15', '30', '20', '20', NULL, NULL, '1563701498', 3, '1563701498', 3),
(148, 106, 76, 45, '3.0-4.0', NULL, '0.15', NULL, '1.0', '0.2', '0.1', '0.15', '6', '1-3', '30', '8', '7', NULL, NULL, '1563701602', 3, '1563701602', 3),
(149, 98, 27, 8, '4.0-5.5', NULL, '0.3', NULL, '1.7', '1.1', '0.3', '0.20', '20-55', '10-30', '40', '20', '20', NULL, NULL, '1563701756', 3, '1563701756', 3),
(150, 98, 77, 8, '4.0-5.5', NULL, '0.3', NULL, '1.7', '0.8', '0.25', '0.20', '20-55', '10-30', '40', '20', '20', NULL, NULL, '1563701944', 3, '1563701944', 3),
(151, 98, 78, 8, '4.0-5.5', NULL, '0.25', NULL, '1.7', '0.5', '0.25', '0.20', '20-55', '10-30', '40', '20', '20', NULL, NULL, '1563702054', 3, '1563702054', 3),
(152, 99, 79, 8, '4.3-5.0', NULL, '0.45', NULL, '2-6', '0.4', '0.2', '0.2', '35-200', '4-10', '30', '25', '10', '< 3.7', '< 2.5', '1563754754', 3, '1563754754', 3),
(153, 99, 80, 18, NULL, '8000-15000', NULL, '3000', '6', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563755758', 3, '1563755758', 3),
(154, 99, 79, 18, NULL, '5000-6000', NULL, '2000', '4.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563755991', 3, '1563755991', 3),
(155, 99, 81, 18, NULL, '1000-1500', NULL, '1500', '3', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563756081', 3, '1563756081', 3),
(156, 100, 82, 46, '2.0-2.60', NULL, '0.2', NULL, '1.1', '0.20', '0.1', '0.15', '4-30', '5-15', '40', '25', '20', NULL, NULL, '1563756939', 3, '1563756939', 3),
(157, 101, 83, 47, '4.25', NULL, '0.3', NULL, '2.5', '0.2', '0.15', '0.2', '6-25', '10-30', '30', '30', '20', NULL, NULL, '1563757310', 3, '1563757310', 3),
(158, 101, 84, 47, '3.7', NULL, '0.3', NULL, '2', '0.2', '0.15', '0.2', '6-25', '10-30', '30', '30', '20', NULL, NULL, '1563758958', 3, '1563758958', 3),
(159, 101, 85, 48, '3', NULL, '0.2', NULL, '1.5', '0.2', '0.15', '0.2', '6-25', '10-30', '30', '30', '20', NULL, NULL, '1563759490', 3, '1563759490', 3),
(160, 101, 86, 48, '4.2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563759551', 3, '1563759551', 3),
(161, 101, 87, 49, NULL, '7000-12000', NULL, '3000', '2', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563759791', 3, '1563759791', 3),
(162, 101, 84, 50, NULL, '5500-10000', NULL, '2500', '1.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563759887', 3, '1563759887', 3),
(163, 101, 88, 50, NULL, '4000-8000', NULL, '1500', '1.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563759962', 3, '1563759962', 3),
(164, 101, 89, 50, NULL, '3000-8000', NULL, '1000', '1', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563760023', 3, '1563760023', 3),
(165, 101, 71, 51, '4.4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563760107', 3, '1563760107', 3),
(166, 107, 46, 52, NULL, '500', NULL, '1600', '3.0', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563760830', 3, '1563760830', 3),
(167, 107, 5, 53, '3.5-4.0', NULL, '0.35', NULL, '2.5', '0.60', '0.3', '0.20', '50', '10', '', '', '30', NULL, NULL, '1563760919', 3, '1563760919', 3),
(168, 107, 90, 53, '2.5-4.0', NULL, '0.25', NULL, '1.5', '0.60', '0.25', '0.20', '40-100', '5-25', '40', '25', '20', NULL, NULL, '1563761088', 3, '1563761088', 3),
(169, 108, 49, 54, NULL, '9000', NULL, '4000', '5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563761190', 3, '1563761190', 3),
(170, 108, 73, 54, NULL, '7000', NULL, '4000', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563761254', 3, '1563761254', 3),
(171, 108, 59, 54, NULL, '5000', NULL, '3000', '3', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563761298', 3, '1563761298', 3),
(172, 108, 91, 8, '3.2', NULL, '0.3', NULL, '2', '1.2', '0.25', '0.2', '40-75', '5-20', '50', '40', '45', NULL, NULL, '1563761382', 3, '1563761382', 3),
(173, 109, 49, 54, NULL, '7000', NULL, '3500', '5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563761430', 3, '1563761430', 3),
(174, 109, 92, 54, NULL, '7000', NULL, '4000', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563761478', 3, '1563761478', 3),
(175, 109, 49, 8, '2.2', NULL, '0.25', NULL, '2.4', '1.2', '0.25', '0.2', '40-75', '5-20', '50', '40', '45', NULL, NULL, '1563761568', 3, '1563761568', 3),
(176, 110, 91, 54, NULL, '7000', NULL, '3500', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563761630', 3, '1563761630', 3),
(177, 110, 93, 8, '3.0-5.0', NULL, '0.35', NULL, '3.5', '3.0', '0.5', '0.2', '25-75', '5-12', '50', '40', '25', NULL, NULL, '1563761729', 3, '1563761729', 3),
(178, 110, 94, 8, '3', NULL, '0.3', NULL, '3', '1.2', '0.25', '0.2', '40-75', '5-20', '50', '40', '25', NULL, NULL, '1563761852', 3, '1563761852', 3),
(179, 111, 91, 54, NULL, '10000', NULL, '3000', '7', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563762017', 3, '1563762017', 3),
(180, 111, 94, 8, '3', NULL, '0.3', NULL, '3', '1.2', '0.25', '0.2', '40-75', '5-20', '50', '40', '45', NULL, NULL, '1563762111', 3, '1563762111', 3),
(181, 112, 27, 18, NULL, '12000-15000', NULL, '2500', '6', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563762171', 3, '1563762171', 3),
(182, 112, 49, 18, NULL, '7500-11000', NULL, '2500', '6', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563762225', 3, '1563762225', 3),
(183, 112, 92, 18, NULL, '3500-8000', NULL, '2000', '4.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563762292', 3, '1563762292', 3),
(184, 112, 49, 8, NULL, '3.0-4.0', '0.3', NULL, '3-4.5', '1.2', '0.3', '0.25', '', '', '30', '30', '25', NULL, NULL, '1563762722', 3, '1563762722', 3),
(185, 113, 95, 55, '5.5-6.7', '7000', '0.5-0.7', '3500', '2.6-3.7', '1-1.3', '0.4-0.6', '0.3-0.4', '15-30', '6-10', '40-100', '40-100', '35-55', NULL, NULL, '1563775882', 3, '1563775882', 3),
(186, 113, 49, 56, '5.4-7.9', '3', '0.65-1.05', NULL, '2.7-4.6', '0.45-0.75', '0.25-0.4', '0.25-0.35', '20-30', '6-10', '40-100', '40-100', '25-75', NULL, NULL, '1563776388', 3, '1563776388', 3),
(187, 113, 59, 56, '4.3-5.9', NULL, '0.55-1.0', NULL, '2-4.7', '0.6-1.1', '0.25-0.4', '0.20-0.35', '25-35', '5-10', '45-75', '40-100', '25-75', NULL, NULL, '1563776607', 3, '1563776607', 3),
(188, 114, 49, 57, NULL, '9000', NULL, '4000', '7', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563776702', 3, '1563776702', 3),
(189, 114, 96, 57, NULL, '6000', NULL, '4000', '5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563776777', 3, '1563776777', 3),
(190, 114, 96, 58, NULL, NULL, NULL, NULL, NULL, '1.5', '0.25', '0.6', '25-50', '8-20', '50', '40', '30', NULL, NULL, '1563776899', 3, '1563776899', 3),
(191, 115, 49, 8, '4.0-5.0', NULL, '0.3', NULL, '3.0', '3.0', '0.25', '0.30', '30-100', '4-20', '50', '30', '20', NULL, NULL, '1563777005', 3, '1563777005', 3),
(192, 116, 97, 8, '4.5-6', NULL, '0.35', NULL, '3.9', '1.4', '0.3', '0.4', '25', '7', '50', '50', '25', '< 0.3', '< 0.3', '1563777274', 3, '1563777274', 3),
(193, 116, 98, 8, '4-5.5', NULL, '0.25', NULL, '3.5', '1.4', '0.3', '0.3', '25', '7', '50', '50', '25', '< 0.3', '< 0.3', '1563777473', 3, '1563777473', 3),
(194, 117, 49, 8, '4.0-6.0', NULL, '0.3', NULL, '3.5', '1.0', '0.3', '0.20', '25-75', '8-60', '40', '40', '20', NULL, NULL, '1563777602', 3, '1563777602', 3),
(195, 118, 99, 8, '4.3-5.0', NULL, '0.4', NULL, '5.0', '1.5', '0.25', '0.20', '25-75', '5-25', '40', '15', '30', NULL, NULL, '1563778003', 3, '1563778003', 3),
(196, 119, 100, 8, '5.0', NULL, '0.35', NULL, '4.0', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563778113', 3, '1563778113', 3),
(197, 119, 101, 8, '4.0', NULL, '0.3', NULL, '3.0', '1.5', '0.3', NULL, '15-55', '5-50', '15', '20', '25', '< 0.5', '< 4.0', '1563778211', 3, '1563778211', 3),
(198, 119, 102, 8, '3.0', NULL, '0.3', NULL, '2.0', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563778337', 3, '1563778337', 3),
(199, 120, 49, 8, '2.0-3.5', NULL, '0.2', NULL, '2.5', '2.30', '0.25', '0.20', '25-60', '8-25', '50', '50', '25', NULL, NULL, '1563778931', 3, '1563778931', 3),
(200, 121, 49, 8, '3.1-5.5', NULL, '0.3', NULL, '2.0', '1.3', '0.25', '0.20', '30-100', '4-25', '50', '30', '30', NULL, NULL, '1563779020', 3, '1563779020', 3),
(201, 122, 49, 8, '4.0-5.0', NULL, '0.3', NULL, '3.3', '2.8', '0.3', '0.20', '30-75', '5-30', '50', '50', '25', NULL, NULL, '1563779084', 3, '1563779084', 3),
(202, 123, 95, 55, '4.7-5.6', '10000-12000', '0.45-0.7', '4000', '3.7-7.3', '1-1.3', '0.4-0.6', '0.3-0.4', '15-30', '6-10', '40-100', '40-100', '35-55', '', '', '1563779358', 3, '1563779545', 3),
(203, 123, 79, 56, '4.3-5.1', '7500-10000', '0.45-0.7', '4000', '3.3-6.4', '0.45-0.75', '0.25-0.4', '0.25-0.35', '20-30', '6-10', '40-100', '40-100', '25-75', NULL, NULL, '1563779722', 3, '1563779722', 3),
(204, 123, 59, 56, '3.3-4.8', '5000-10000', '0.35-0.7', '4000', '2.9-7.8', '0.6-1.1', '0.25-0.4', '0.20-0.35', '25-35', '5-10', '45-75', '40-100', '25-75', NULL, NULL, '1563779891', 3, '1563779891', 3),
(205, 124, 100, 8, '5.0', NULL, '0.35', NULL, '4.0', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563779936', 3, '1563779936', 3),
(206, 124, 101, 8, '4.0', NULL, '0.3', NULL, '3.0', '1.5', '0.3', NULL, '15-55', '5-50', '15', '20', '25', '< 0.5', '< 4.0', '1563780037', 3, '1563780037', 3),
(207, 124, 102, 8, '3.0', NULL, '0.3', NULL, '2.0', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563780083', 3, '1563780083', 3),
(208, 125, 27, 8, '3-4.5', NULL, '0.3', NULL, '5', '1', '0.3', '0.2', '5-55', '5-50', '20', '20', '20', '< 0.5', '< 0.5', '1563780193', 3, '1563780193', 3),
(209, 125, 35, 8, '2.5-4.5', NULL, '0.3', NULL, '3', '1', '0.3', '0.2', '5-55', '5-50', '20', '20', '20', '< 0.5', '< 0.5', '1563780281', 3, '1563780281', 3),
(210, 125, 103, 8, '2-4', NULL, '0.3', NULL, '2', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563780334', 3, '1563780334', 3),
(211, 125, 27, 18, NULL, '8000-12000', NULL, '2000-3000', '5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563780396', 3, '1563780396', 3),
(212, 125, 35, 18, NULL, '6000-10000', NULL, '2000-3000', '3', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563780455', 3, '1563780455', 3),
(213, 125, 103, 18, NULL, '2000-6000', NULL, '2000-3000', '2', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563780500', 3, '1563780500', 3),
(214, 126, 27, 8, '3-4.5', '', '0.3', '', '4', '0.4', '0.5', '0.3', '30-60', '10-50', '30', '25', '35', '< 0.5', '< 0.5', '1563780597', 3, '1563780827', 3),
(215, 126, 35, 8, '2.5-4.5', '', '0.3', '', '2.5', '0.4', '0.5', '0.3', '30-60', '10-50', '30', '25', '35', '< 0.5', '< 0.5', '1563780702', 3, '1563780847', 3),
(216, 126, 103, 8, '2-4', NULL, '0.2', NULL, '2', '0.4', '0.5', '0.3', '30-60', '10-50', '30', '25', '35', '< 0.5', '< 0.5', '1563780791', 3, '1563780791', 3),
(217, 126, 27, 18, NULL, '10000-16000', NULL, '3000', '6', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563780898', 3, '1563780898', 3),
(218, 126, 35, 18, NULL, '5000-10000', NULL, '2500', '5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563780939', 3, '1563780939', 3),
(219, 126, 103, 18, NULL, '3000-8000', NULL, '2000', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563780989', 3, '1563780989', 3),
(220, 127, 104, 8, '4', NULL, '0.3', NULL, '5', '0.5', '0.3', '0.2', '25-75', '6', '60', '50', '50', '< 0.5', '< 0.5', '1563781139', 3, '1563781139', 3),
(221, 127, 105, 8, '4', NULL, '0.3', NULL, '4', '0.8', '0.3', '0.2', '25-75', '6', '60', '50', '50', '< 0.5', '< 0.5', '1563781246', 3, '1563781246', 3),
(222, 127, 106, 8, '3.5', NULL, '0.22', NULL, '3.5', '1', '0.3', '0.2', '25-75', '6', '60', '50', '50', '< 0.5', '< 0.5', '1563781328', 3, '1563781328', 3),
(223, 127, 7, 8, '2.5', NULL, '0.2', NULL, '3', '1', '0.3', '0.2', '25-75', '6', '60', '50', '50', '< 0.5', '< 0.5', '1563781397', 3, '1563781397', 3),
(224, 127, 104, 18, NULL, '35000', NULL, '3000', '5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563781451', 3, '1563781451', 3),
(225, 127, 105, 18, NULL, '35000', NULL, '3000', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563781493', 3, '1563781493', 3),
(226, 127, 106, 18, NULL, '35000', NULL, '2200', '3.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563781536', 3, '1563781536', 3),
(227, 127, 7, 18, NULL, '20000', NULL, '2000', '3', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563781568', 3, '1563781568', 3),
(228, 128, 45, 8, NULL, NULL, NULL, NULL, NULL, '1.5', '0.25', '0.25', '35', '10', '40', '40', '40', NULL, NULL, '1563781667', 3, '1563781667', 3),
(229, 129, 107, 18, NULL, '25000-30000', NULL, '3000', '11', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563781728', 3, '1563781728', 3),
(230, 129, 79, 18, NULL, '20000-25000', NULL, '2000', '9', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563781777', 3, '1563781777', 3),
(231, 129, 102, 18, NULL, '10000-15000', NULL, '1200', '7', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563781816', 3, '1563781816', 3),
(232, 130, 107, 18, NULL, '20000-25000', NULL, '2500', '11', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563781889', 3, '1563781889', 3),
(233, 130, 79, 18, NULL, '10000-15000', NULL, '1500', '9', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563781938', 3, '1563781938', 3),
(234, 130, 102, 18, NULL, '3000-5000', NULL, '1000', '7', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563781983', 3, '1563781983', 3),
(235, 131, 49, 8, '3.3-4.5', NULL, '0.23', NULL, '3.1', '0.70', '0.35', '0.25', '25-75', '', '40', '40', '20', NULL, NULL, '1563782052', 3, '1563782052', 3),
(236, 132, 108, 25, '3.0-6.0', NULL, '0.3', NULL, '2.3', '0.9', '0.35', '0.20', '', '', '30', '30', '30', NULL, NULL, '1563782283', 3, '1563782283', 3),
(237, 132, 109, 25, '3.0-4.0', NULL, '0.3', NULL, '2.0', '0.9', '0.35', '0.20', '', '', '30', '30', '30', NULL, NULL, '1563782348', 3, '1563782348', 3),
(238, 133, 49, 8, '3.0-6.0', NULL, '0.3', NULL, '4.0', '3.0', '0.5', '0.20', '25-125', '5-25', '50', '50', '20', NULL, NULL, '1563782439', 3, '1563782439', 3),
(239, 134, 110, 8, '4.0-6.0', NULL, '0.3', NULL, '5.0', '0.70', '0.6', '0.20', '25-60', '5-25', '50', '30', '25', NULL, NULL, '1563782589', 3, '1563782589', 3),
(240, 134, 111, 8, '3.5-5.5', NULL, '0.25', NULL, '4.0', '0.80', '0.7', '0.20', '25-60', '5-25', '50', '30', '25', NULL, NULL, '1563782670', 3, '1563782670', 3),
(241, 135, 51, 8, '4.0-6.0', NULL, '0.3', NULL, '3.0', '1.2', '0.3', '0.20', '25-75', '10-25', '40', '40', '20', NULL, NULL, '1563782740', 3, '1563782740', 3),
(242, 136, 109, 8, '3-5', NULL, '0.35', NULL, '5', '1.5', '0.3', '0.3', '20-200', '5-15', '30', '30', '30', '< 0.2', '< 0.2', '1563782840', 3, '1563782840', 3),
(243, 136, 112, 8, '2.5-4', NULL, '0.25', NULL, '4', '1.5', '0.3', '0.3', '20-200', '5-15', '30', '30', '30', '< 0.2', '< 0.2', '1563782962', 3, '1563782962', 3),
(244, 137, 113, 8, '4.5-5.5', NULL, '0.35', NULL, '4', '1.5', '0.4', '0.3', '20-200', '5-15', '30', '30', '30', '< 0.2', '< 0.2', '1563783052', 3, '1563783052', 3),
(245, 137, 50, 8, '4.2-5.2', NULL, '0.35', NULL, '4', '1.5', '0.4', '0.3', '20-200', '5-15', '30', '30', '30', '< 0.2', '< 0.2', '1563783139', 3, '1563783139', 3),
(246, 137, 114, 8, '3.3-4.5', NULL, '0.25', NULL, '3.5', '1.5', '0.4', '0.3', '20-200', '5-15', '30', '30', '30', '< 0.2', '< 0.2', '1563783226', 3, '1563783226', 3),
(247, 137, 115, 8, '2.5-3.7', NULL, '0.25', NULL, '2', '1.5', '0.4', '0.3', '20-200', '5-15', '30', '30', '30', '< 0.2', '< 0.2', '1563783299', 3, '1563783299', 3),
(248, 137, 113, 18, NULL, '10000-15000', NULL, '3000-4000', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563783354', 3, '1563783354', 3),
(249, 137, 50, 18, NULL, '9000-12000', NULL, '2000-3000', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563783397', 3, '1563783397', 3),
(250, 137, 114, 18, NULL, '6000-8000', NULL, '1500-2500', '3.5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563783450', 3, '1563783450', 3),
(251, 137, 115, 18, NULL, '4000-6000', NULL, '1000-2000', '2', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563783498', 3, '1563783498', 3),
(252, 138, 116, 18, NULL, '10000-17000', NULL, '3000', '7', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563783551', 3, '1563783551', 3),
(253, 138, 117, 18, NULL, '7000-10000', NULL, '3000', '5', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563783605', 3, '1563783605', 3),
(254, 138, 118, 18, NULL, '2000-4000', NULL, '3000', '4', NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '1563783651', 3, '1563783651', 3),
(255, 138, 45, 8, NULL, NULL, NULL, NULL, NULL, '1.5', '0.35', '0.3', '20-40', '5-15', '30', '30', '30', '< 0.2', '< 2.0', '1563783716', 3, '1563783716', 3),
(256, 139, 49, 8, '3.5-5.0', NULL, '0.33', NULL, '3.5', '1.5', '0.3', '0.20', '40-100', '6-15', '40', '40', '20', NULL, NULL, '1563783784', 3, '1563783784', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_dte` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_update` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `postal` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryid` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_type` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` char(13) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `create_dte`, `last_update`, `company`, `title`, `address1`, `address2`, `postal`, `city`, `state`, `langid`, `countryid`, `telephone`, `website`, `birthday`, `status`, `label`, `user_type`, `updated_at`) VALUES
(1, 'Michael Rumack', 'michael@ledgedog.com', '$2y$10$i7OrS7KA1Xmy/0gPILiB7eZujKo2pvOG4XIl2FhOdhcZIhxegLgwi', 'LzRCWe7s9ZQv2FwbqieHxKZKAHFFU0RCtl79LpabF5HPgFVchFbhmhTCBEef', '2016-08-17', '2016-08-21', '', '', '', '', '', '', '', NULL, NULL, '', '', NULL, 1, '', 'admin', '2016-11-17 00'),
(2, 'Andrea Holeman', 'a.holeman@techflo.com', '$2y$10$kARDWilw/mwAcCZGxLB5Feo9qmoCKh2ABlgBqawk9qKyhcppCOIJK', NULL, '1518491324', '1518491324', '', '', '', '', '', '', '', NULL, NULL, '', '', NULL, 1, '', 'admin', ''),
(3, 'Tricia Rumack', 'triciachavez18@gmail.com', '$2y$10$F3hK4TVNGH74IFA.lyrX4OHGfgKxyZ2eL.OoWLtzXbB5DBWxP57Vu', NULL, '1524605225', '1532210941', 'Ledgedog', 'Programmer', '', '', '', '', '', NULL, NULL, '', '', NULL, 1, '', 'admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(10) UNSIGNED NOT NULL,
  `ent_id` int(12) DEFAULT NULL,
  `rest_id` int(6) DEFAULT NULL,
  `phone_brand` varchar(45) DEFAULT NULL,
  `phone_model` varchar(45) DEFAULT NULL,
  `os_version` varchar(5) DEFAULT NULL,
  `carrier` varchar(15) DEFAULT NULL,
  `privacy_policy` tinyint(1) DEFAULT NULL,
  `tos` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compatibility`
--
ALTER TABLE `compatibility`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crop`
--
ALTER TABLE `crop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `deficiency`
--
ALTER TABLE `deficiency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `element`
--
ALTER TABLE `element`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `element_name_UNIQUE` (`element_name`);

--
-- Indexes for table `growth_stage`
--
ALTER TABLE `growth_stage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_desc` (`name_desc`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `product_name_UNIQUE` (`product_name`);

--
-- Indexes for table `product_compatibility`
--
ALTER TABLE `product_compatibility`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_element`
--
ALTER TABLE `product_element`
  ADD KEY `FK_PRODUCT_ELEMENT_TO_PRODUCT_idx` (`product_id`),
  ADD KEY `FK_PRODUCT_ELEMENT_TO_ELEMENT_idx` (`element_id`);

--
-- Indexes for table `sample_unit`
--
ALTER TABLE `sample_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sufficiency`
--
ALTER TABLE `sufficiency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_GROWTH_STAGE` (`growth_stage_id`),
  ADD KEY `FK_CROP_ID` (`crop_id`),
  ADD KEY `FK_SAMPLE_UNIT_IT` (`sample_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_langid_index` (`langid`),
  ADD KEY `users_status_lastname_firstname_index` (`status`),
  ADD KEY `users_status_address1_index` (`status`,`address1`),
  ADD KEY `users_address1_index` (`address1`),
  ADD KEY `users_city_index` (`city`),
  ADD KEY `users_postal_index` (`postal`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compatibility`
--
ALTER TABLE `compatibility`
  MODIFY `id` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `crop`
--
ALTER TABLE `crop`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT for table `deficiency`
--
ALTER TABLE `deficiency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `element`
--
ALTER TABLE `element`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `growth_stage`
--
ALTER TABLE `growth_stage`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `sample_unit`
--
ALTER TABLE `sample_unit`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `sufficiency`
--
ALTER TABLE `sufficiency`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_element`
--
ALTER TABLE `product_element`
  ADD CONSTRAINT `FK_PRODUCT_ELEMENT_TO_ELEMENT` FOREIGN KEY (`element_id`) REFERENCES `element` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PRODUCT_ELEMENT_TO_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sufficiency`
--
ALTER TABLE `sufficiency`
  ADD CONSTRAINT `FK_CROP_ID` FOREIGN KEY (`crop_id`) REFERENCES `crop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_GROWTH_STAGE` FOREIGN KEY (`growth_stage_id`) REFERENCES `growth_stage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SAMPLE_UNIT` FOREIGN KEY (`sample_unit_id`) REFERENCES `sample_unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
