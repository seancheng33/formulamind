/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : formula_mind

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-06-13 20:18:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for batch
-- ----------------------------
DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `batch_serials` int(11) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  `batch_code` varchar(10) DEFAULT NULL,
  `batch_quantity` double DEFAULT NULL,
  `Operator_name` varchar(50) DEFAULT NULL,
  `batch_date` date DEFAULT NULL,
  `binfo` longtext,
  PRIMARY KEY (`bid`),
  KEY `pid` (`pid`),
  CONSTRAINT `batch_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for batch_details
-- ----------------------------
DROP TABLE IF EXISTS `batch_details`;
CREATE TABLE `batch_details` (
  `bdid` int(11) NOT NULL AUTO_INCREMENT,
  `bserials` int(11) DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `bcode` varchar(10) DEFAULT NULL,
  `chem_name` varchar(50) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `qty-required` double DEFAULT NULL,
  PRIMARY KEY (`bdid`),
  KEY `bid` (`bserials`),
  KEY `pdid` (`pname`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for chemical
-- ----------------------------
DROP TABLE IF EXISTS `chemical`;
CREATE TABLE `chemical` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) DEFAULT NULL,
  `sid` int(6) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) DEFAULT NULL,
  `pcode` varchar(10) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `pinfo` longtext,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_details
-- ----------------------------
DROP TABLE IF EXISTS `product_details`;
CREATE TABLE `product_details` (
  `pdid` int(11) NOT NULL AUTO_INCREMENT,
  `pcode` varchar(255) DEFAULT NULL,
  `pname` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `chem_name` varchar(11) DEFAULT NULL,
  `chem_price` double(11,0) DEFAULT NULL,
  `percent` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`pdid`),
  KEY `pid` (`pname`),
  KEY `chem_id` (`chem_name`),
  CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`pname`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `sid` int(6) NOT NULL AUTO_INCREMENT,
  `sname` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `suburb` varchar(15) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `screatedate` date DEFAULT NULL,
  `smodifydate` date DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
