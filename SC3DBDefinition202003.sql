--
-- ------------------------------------------------------
-- Edit this. Replace ????
--

--
-- Database name
--

-- SELECT @SC3DB:='????';

--
-- Event parameters publicID
-- The publicID must be the same in the setting.xml
--

-- SELECT @SC3DBParameters:='smi:igf.edu.pl/????#eventParameters';

--
-- End of definitions
-- ------------------------------------------------------

-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: SC3DB
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `SC3DB`
--

CREATE DATABASE IF NOT EXISTS @SC3DB /*!40100 DEFAULT CHARACTER SET latin1 */;

USE @SC3DB;

--
-- Table structure for table `Amplitude`
--

DROP TABLE IF EXISTS `Amplitude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Amplitude` (
  `publicID` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` char(16) COLLATE utf8_bin DEFAULT NULL,
  `amplitude_value` double DEFAULT NULL,
  `amplitude_uncertainty` double unsigned DEFAULT NULL,
  `amplitude_lowerUncertainty` double unsigned DEFAULT NULL,
  `amplitude_upperUncertainty` double unsigned DEFAULT NULL,
  `amplitude_confidenceLevel` double unsigned DEFAULT NULL,
  `amplitude_used` tinyint(1) NOT NULL DEFAULT '0',
  `timeWindow_reference` datetime DEFAULT NULL,
  `timeWindow_reference_ms` int(11) DEFAULT NULL,
  `timeWindow_begin` double DEFAULT NULL,
  `timeWindow_end` double DEFAULT NULL,
  `timeWindow_used` tinyint(1) NOT NULL DEFAULT '0',
  `period_value` double DEFAULT NULL,
  `period_uncertainty` double unsigned DEFAULT NULL,
  `period_lowerUncertainty` double unsigned DEFAULT NULL,
  `period_upperUncertainty` double unsigned DEFAULT NULL,
  `period_confidenceLevel` double unsigned DEFAULT NULL,
  `period_used` tinyint(1) NOT NULL DEFAULT '0',
  `snr` double DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pickID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_networkCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_stationCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_locationCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_channelCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_used` tinyint(1) NOT NULL DEFAULT '0',
  `filterID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `methodID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `scalingTime_value` datetime DEFAULT NULL,
  `scalingTime_value_ms` int(11) DEFAULT NULL,
  `scalingTime_uncertainty` double unsigned DEFAULT NULL,
  `scalingTime_lowerUncertainty` double unsigned DEFAULT NULL,
  `scalingTime_upperUncertainty` double unsigned DEFAULT NULL,
  `scalingTime_confidenceLevel` double unsigned DEFAULT NULL,
  `scalingTime_used` tinyint(1) NOT NULL DEFAULT '0',
  `magnitudeHint` char(16) COLLATE utf8_bin DEFAULT NULL,
  `category` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `evaluationMode` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `evaluationStatus` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicID`),
  KEY `pickID` (`pickID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `Amplitude_ibfk_1` FOREIGN KEY (`pickID`) REFERENCES `Pick` (`publicID`) ON DELETE SET NULL,
  CONSTRAINT `Amplitude_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Event` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AmplitudeReference`
--

DROP TABLE IF EXISTS `AmplitudeReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AmplitudeReference` (
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `referenceID` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`parentID`,`referenceID`),
  KEY `referenceID` (`referenceID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `AmplitudeReference_ibfk_1` FOREIGN KEY (`referenceID`) REFERENCES `Amplitude` (`publicID`) ON DELETE CASCADE,
  CONSTRAINT `AmplitudeReference_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `StationMagnitude` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Arrival`
--

DROP TABLE IF EXISTS `Arrival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Arrival` (
  `publicID` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pickID` varchar(255) COLLATE utf8_bin NOT NULL,
  `phase_code` char(32) COLLATE utf8_bin NOT NULL,
  `timeCorrection` double DEFAULT NULL,
  `azimuth` double DEFAULT NULL,
  `distance` double unsigned DEFAULT NULL,
  `takeOffAngle` double DEFAULT NULL,
  `timeResidual` double DEFAULT NULL,
  `horizontalSlownessResidual` double DEFAULT NULL,
  `backazimuthResidual` double DEFAULT NULL,
  `timeUsed` tinyint(1) DEFAULT NULL,
  `horizontalSlownessUsed` tinyint(1) DEFAULT NULL,
  `backazimuthUsed` tinyint(1) DEFAULT NULL,
  `weight` double unsigned DEFAULT NULL,
  `earthModelID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `preliminary` tinyint(1) DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  `timeWeight` double DEFAULT NULL,
  `takeoffAngle_value` double DEFAULT NULL,
  `takeoffAngle_uncertainty` double unsigned DEFAULT NULL,
  `takeoffAngle_lowerUncertainty` double unsigned DEFAULT NULL,
  `takeoffAngle_upperUncertainty` double unsigned DEFAULT NULL,
  `takeoffAngle_confidenceLevel` double unsigned DEFAULT NULL,
  `takeoffAngle_used` tinyint(1) NOT NULL DEFAULT '0',
  `incidenceAngle_value` double DEFAULT NULL,
  `incidenceAngle_uncertainty` double unsigned DEFAULT NULL,
  `incidenceAngle_lowerUncertainty` double unsigned DEFAULT NULL,
  `incidenceAngle_upperUncertainty` double unsigned DEFAULT NULL,
  `incidenceAngle_confidenceLevel` double unsigned DEFAULT NULL,
  `incidenceAngle_used` tinyint(1) NOT NULL DEFAULT '0',
  `backazimuthWeight` double unsigned DEFAULT NULL,
  `horizontalSlownessWeight` double unsigned DEFAULT NULL,
  PRIMARY KEY (`publicID`),
  UNIQUE KEY `_parentID_pickID` (`parentID`,`pickID`),
  KEY `pickID` (`pickID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `Arrival_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Origin` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `_oid` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `text` blob NOT NULL,
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_used` tinyint(1) NOT NULL DEFAULT '0',
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`_oid`),
  KEY `parentID` (`parentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompositeTime`
--

DROP TABLE IF EXISTS `CompositeTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompositeTime` (
  `_oid` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `year_value` int(11) DEFAULT NULL,
  `year_uncertainty` int(10) unsigned DEFAULT NULL,
  `year_lowerUncertainty` int(10) unsigned DEFAULT NULL,
  `year_upperUncertainty` int(10) unsigned DEFAULT NULL,
  `year_confidenceLevel` double unsigned DEFAULT NULL,
  `year_used` tinyint(1) NOT NULL DEFAULT '0',
  `month_value` int(11) DEFAULT NULL,
  `month_uncertainty` int(10) unsigned DEFAULT NULL,
  `month_lowerUncertainty` int(10) unsigned DEFAULT NULL,
  `month_upperUncertainty` int(10) unsigned DEFAULT NULL,
  `month_confidenceLevel` double unsigned DEFAULT NULL,
  `month_used` tinyint(1) NOT NULL DEFAULT '0',
  `day_value` int(11) DEFAULT NULL,
  `day_uncertainty` int(10) unsigned DEFAULT NULL,
  `day_lowerUncertainty` int(10) unsigned DEFAULT NULL,
  `day_upperUncertainty` int(10) unsigned DEFAULT NULL,
  `day_confidenceLevel` double unsigned DEFAULT NULL,
  `day_used` tinyint(1) NOT NULL DEFAULT '0',
  `hour_value` int(11) DEFAULT NULL,
  `hour_uncertainty` int(10) unsigned DEFAULT NULL,
  `hour_lowerUncertainty` int(10) unsigned DEFAULT NULL,
  `hour_upperUncertainty` int(10) unsigned DEFAULT NULL,
  `hour_confidenceLevel` double unsigned DEFAULT NULL,
  `hour_used` tinyint(1) NOT NULL DEFAULT '0',
  `minute_value` int(11) DEFAULT NULL,
  `minute_uncertainty` int(10) unsigned DEFAULT NULL,
  `minute_lowerUncertainty` int(10) unsigned DEFAULT NULL,
  `minute_upperUncertainty` int(10) unsigned DEFAULT NULL,
  `minute_confidenceLevel` double unsigned DEFAULT NULL,
  `minute_used` tinyint(1) NOT NULL DEFAULT '0',
  `second_value` double DEFAULT NULL,
  `second_uncertainty` double unsigned DEFAULT NULL,
  `second_lowerUncertainty` double unsigned DEFAULT NULL,
  `second_upperUncertainty` double unsigned DEFAULT NULL,
  `second_confidenceLevel` double unsigned DEFAULT NULL,
  `second_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`_oid`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `CompositeTime_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Origin` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataUsed`
--

DROP TABLE IF EXISTS `DataUsed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataUsed` (
  `_oid` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `waveType` varchar(64) COLLATE utf8_bin NOT NULL,
  `stationCount` int(10) unsigned DEFAULT NULL,
  `componentCount` int(10) unsigned DEFAULT NULL,
  `shortestPeriod` double DEFAULT NULL,
  `longestPeriod` double DEFAULT NULL,
  PRIMARY KEY (`_oid`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `DataUsed_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `MomentTensor` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
  `publicID` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parentID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `preferredOriginID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `preferredMagnitudeID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `preferredFocalMechanismID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `typeCertainty` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  `_author` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`publicID`),
  KEY `preferredOriginID` (`preferredOriginID`),
  KEY `preferredMagnitudeID` (`preferredMagnitudeID`),
  KEY `preferredFocalMechanismID` (`preferredFocalMechanismID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `Event_ibfk_1` FOREIGN KEY (`parentID`) REFERENCES `EventParameters` (`publicID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Event_author before insert on Event for each row set new._author=user() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `EventDescription`
--

DROP TABLE IF EXISTS `EventDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventDescription` (
  `_oid` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `text` varchar(128) COLLATE utf8_bin NOT NULL,
  `type` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`_oid`),
  UNIQUE KEY `parentID_type` (`parentID`,`type`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `EventDescription_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Event` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EventParameters`
--

DROP TABLE IF EXISTS `EventParameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventParameters` (
  `publicID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(1023) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventParameters`
--

LOCK TABLES `EventParameters` WRITE;
/*!40000 ALTER TABLE `EventParameters` DISABLE KEYS */;
INSERT INTO `EventParameters` VALUES ('@SC3DBParameters','2017-12-07 13:45:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `EventParameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FocalMechanism`
--

DROP TABLE IF EXISTS `FocalMechanism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FocalMechanism` (
  `publicID` varchar(255) COLLATE utf8_bin NOT NULL,
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `triggeringOriginID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_value` double DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_uncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_lowerUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_upperUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_confidenceLevel` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_value` double DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_uncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_lowerUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_upperUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_confidenceLevel` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_value` double DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_uncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_lowerUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_upperUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_confidenceLevel` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane1_used` tinyint(1) NOT NULL DEFAULT '0',
  `nodalPlanes_nodalPlane2_strike_value` double DEFAULT NULL,
  `nodalPlanes_nodalPlane2_strike_uncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_strike_lowerUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_strike_upperUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_strike_confidenceLevel` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_value` double DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_uncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_lowerUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_upperUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_confidenceLevel` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_value` double DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_uncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_lowerUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_upperUncertainty` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_confidenceLevel` double unsigned DEFAULT NULL,
  `nodalPlanes_nodalPlane2_used` tinyint(1) NOT NULL DEFAULT '0',
  `nodalPlanes_preferredPlane` int(11) DEFAULT NULL,
  `nodalPlanes_used` tinyint(1) NOT NULL DEFAULT '0',
  `principalAxes_tAxis_azimuth_value` double DEFAULT NULL,
  `principalAxes_tAxis_azimuth_uncertainty` double unsigned DEFAULT NULL,
  `principalAxes_tAxis_azimuth_lowerUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_tAxis_azimuth_upperUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_tAxis_azimuth_confidenceLevel` double unsigned DEFAULT NULL,
  `principalAxes_tAxis_plunge_value` double DEFAULT NULL,
  `principalAxes_tAxis_plunge_uncertainty` double unsigned DEFAULT NULL,
  `principalAxes_tAxis_plunge_lowerUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_tAxis_plunge_upperUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_tAxis_plunge_confidenceLevel` double unsigned DEFAULT NULL,
  `principalAxes_tAxis_length_value` double DEFAULT NULL,
  `principalAxes_tAxis_length_uncertainty` double unsigned DEFAULT NULL,
  `principalAxes_tAxis_length_lowerUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_tAxis_length_upperUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_tAxis_length_confidenceLevel` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_azimuth_value` double DEFAULT NULL,
  `principalAxes_pAxis_azimuth_uncertainty` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_azimuth_lowerUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_azimuth_upperUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_azimuth_confidenceLevel` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_plunge_value` double DEFAULT NULL,
  `principalAxes_pAxis_plunge_uncertainty` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_plunge_lowerUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_plunge_upperUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_plunge_confidenceLevel` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_length_value` double DEFAULT NULL,
  `principalAxes_pAxis_length_uncertainty` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_length_lowerUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_length_upperUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_pAxis_length_confidenceLevel` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_azimuth_value` double DEFAULT NULL,
  `principalAxes_nAxis_azimuth_uncertainty` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_azimuth_lowerUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_azimuth_upperUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_azimuth_confidenceLevel` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_plunge_value` double DEFAULT NULL,
  `principalAxes_nAxis_plunge_uncertainty` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_plunge_lowerUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_plunge_upperUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_plunge_confidenceLevel` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_length_value` double DEFAULT NULL,
  `principalAxes_nAxis_length_uncertainty` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_length_lowerUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_length_upperUncertainty` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_length_confidenceLevel` double unsigned DEFAULT NULL,
  `principalAxes_nAxis_used` tinyint(1) NOT NULL DEFAULT '0',
  `principalAxes_used` tinyint(1) NOT NULL DEFAULT '0',
  `azimuthalGap` double unsigned DEFAULT NULL,
  `stationPolarityCount` int(10) unsigned DEFAULT NULL,
  `misfit` double unsigned DEFAULT NULL,
  `stationDistributionRatio` double unsigned DEFAULT NULL,
  `methodID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `evaluationMode` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `evaluationStatus` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicID`),
  KEY `triggeringOriginID` (`triggeringOriginID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `FocalMechanism_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Event` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Magnitude`
--

DROP TABLE IF EXISTS `Magnitude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Magnitude` (
  `publicID` varchar(255) COLLATE utf8_bin NOT NULL,
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `magnitude_value` double NOT NULL,
  `magnitude_uncertainty` double unsigned DEFAULT NULL,
  `magnitude_lowerUncertainty` double unsigned DEFAULT NULL,
  `magnitude_upperUncertainty` double unsigned DEFAULT NULL,
  `magnitude_confidenceLevel` double unsigned DEFAULT NULL,
  `type` char(16) COLLATE utf8_bin DEFAULT NULL,
  `originID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `methodID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `stationCount` int(10) unsigned DEFAULT NULL,
  `azimuthalGap` double unsigned DEFAULT NULL,
  `evaluationMode` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `evaluationStatus` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `Magnitude_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Event` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MomentTensor`
--

DROP TABLE IF EXISTS `MomentTensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MomentTensor` (
  `publicID` varchar(255) COLLATE utf8_bin NOT NULL,
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `derivedOriginID` varchar(255) COLLATE utf8_bin NOT NULL,
  `momentMagnitudeID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `scalarMoment_value` double DEFAULT NULL,
  `scalarMoment_uncertainty` double unsigned DEFAULT NULL,
  `scalarMoment_lowerUncertainty` double unsigned DEFAULT NULL,
  `scalarMoment_upperUncertainty` double unsigned DEFAULT NULL,
  `scalarMoment_confidenceLevel` double unsigned DEFAULT NULL,
  `scalarMoment_used` tinyint(1) NOT NULL DEFAULT '0',
  `tensor_Mrr_value` double DEFAULT NULL,
  `tensor_Mrr_uncertainty` double unsigned DEFAULT NULL,
  `tensor_Mrr_lowerUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mrr_upperUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mrr_confidenceLevel` double unsigned DEFAULT NULL,
  `tensor_Mtt_value` double DEFAULT NULL,
  `tensor_Mtt_uncertainty` double unsigned DEFAULT NULL,
  `tensor_Mtt_lowerUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mtt_upperUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mtt_confidenceLevel` double unsigned DEFAULT NULL,
  `tensor_Mpp_value` double DEFAULT NULL,
  `tensor_Mpp_uncertainty` double unsigned DEFAULT NULL,
  `tensor_Mpp_lowerUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mpp_upperUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mpp_confidenceLevel` double unsigned DEFAULT NULL,
  `tensor_Mrt_value` double DEFAULT NULL,
  `tensor_Mrt_uncertainty` double unsigned DEFAULT NULL,
  `tensor_Mrt_lowerUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mrt_upperUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mrt_confidenceLevel` double unsigned DEFAULT NULL,
  `tensor_Mrp_value` double DEFAULT NULL,
  `tensor_Mrp_uncertainty` double unsigned DEFAULT NULL,
  `tensor_Mrp_lowerUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mrp_upperUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mrp_confidenceLevel` double unsigned DEFAULT NULL,
  `tensor_Mtp_value` double DEFAULT NULL,
  `tensor_Mtp_uncertainty` double unsigned DEFAULT NULL,
  `tensor_Mtp_lowerUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mtp_upperUncertainty` double unsigned DEFAULT NULL,
  `tensor_Mtp_confidenceLevel` double unsigned DEFAULT NULL,
  `tensor_used` tinyint(1) NOT NULL DEFAULT '0',
  `variance` double DEFAULT NULL,
  `varianceReduction` double DEFAULT NULL,
  `doubleCouple` double DEFAULT NULL,
  `clvd` double DEFAULT NULL,
  `iso` double DEFAULT NULL,
  `greensFunctionID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `filterID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sourceTimeFunction_type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `sourceTimeFunction_duration` double DEFAULT NULL,
  `sourceTimeFunction_riseTime` double DEFAULT NULL,
  `sourceTimeFunction_decayTime` double DEFAULT NULL,
  `sourceTimeFunction_used` tinyint(1) NOT NULL DEFAULT '0',
  `methodID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `inversionType` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `category` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `method` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `cmtName` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `cmtVersion` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicID`),
  KEY `derivedOriginID` (`derivedOriginID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `MomentTensor_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `FocalMechanism` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Origin`
--

DROP TABLE IF EXISTS `Origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Origin` (
  `publicID` varchar(255) COLLATE utf8_bin NOT NULL,
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time_value` datetime NOT NULL,
  `time_value_ms` int(11) NOT NULL,
  `time_uncertainty` double unsigned DEFAULT NULL,
  `time_lowerUncertainty` double unsigned DEFAULT NULL,
  `time_upperUncertainty` double unsigned DEFAULT NULL,
  `time_confidenceLevel` double unsigned DEFAULT NULL,
  `latitude_value` double NOT NULL,
  `latitude_uncertainty` double unsigned DEFAULT NULL,
  `latitude_lowerUncertainty` double unsigned DEFAULT NULL,
  `latitude_upperUncertainty` double unsigned DEFAULT NULL,
  `latitude_confidenceLevel` double unsigned DEFAULT NULL,
  `longitude_value` double NOT NULL,
  `longitude_uncertainty` double unsigned DEFAULT NULL,
  `longitude_lowerUncertainty` double unsigned DEFAULT NULL,
  `longitude_upperUncertainty` double unsigned DEFAULT NULL,
  `longitude_confidenceLevel` double unsigned DEFAULT NULL,
  `depth_value` double DEFAULT NULL,
  `depth_uncertainty` double unsigned DEFAULT NULL,
  `depth_lowerUncertainty` double unsigned DEFAULT NULL,
  `depth_upperUncertainty` double unsigned DEFAULT NULL,
  `depth_confidenceLevel` double unsigned DEFAULT NULL,
  `depth_used` tinyint(1) NOT NULL DEFAULT '0',
  `depthType` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `timeFixed` tinyint(1) DEFAULT NULL,
  `epicenterFixed` tinyint(1) DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `referenceSystemID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `methodID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `earthModelID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `quality_associatedPhaseCount` int(10) unsigned DEFAULT NULL,
  `quality_usedPhaseCount` int(10) unsigned DEFAULT NULL,
  `quality_associatedStationCount` int(10) unsigned DEFAULT NULL,
  `quality_usedStationCount` int(10) unsigned DEFAULT NULL,
  `quality_depthPhaseCount` int(10) unsigned DEFAULT NULL,
  `quality_standardError` double unsigned DEFAULT NULL,
  `quality_azimuthalGap` double unsigned DEFAULT NULL,
  `quality_secondaryAzimuthalGap` double unsigned DEFAULT NULL,
  `quality_groundTruthLevel` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `quality_maximumDistance` double unsigned DEFAULT NULL,
  `quality_minimumDistance` double unsigned DEFAULT NULL,
  `quality_medianDistance` double unsigned DEFAULT NULL,
  `quality_used` tinyint(1) NOT NULL DEFAULT '0',
  `uncertainty_horizontalUncertainty` double unsigned DEFAULT NULL,
  `uncertainty_minHorizontalUncertainty` double unsigned DEFAULT NULL,
  `uncertainty_maxHorizontalUncertainty` double unsigned DEFAULT NULL,
  `uncertainty_azimuthMaxHorizontalUncertainty` double unsigned DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_semiMajorAxisLength` double DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_semiMinorAxisLength` double DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_semiIntermediateAxisLength` double DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_majorAxisPlunge` double DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_majorAxisAzimuth` double DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_majorAxisRotation` double DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_used` tinyint(1) NOT NULL DEFAULT '0',
  `uncertainty_preferredDescription` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `uncertainty_used` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `evaluationMode` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `evaluationStatus` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicID`),
  KEY `time_value` (`time_value`),
  KEY `time_value_ms` (`time_value_ms`),
  KEY `publicID` (`publicID`),
  KEY `Origin_ibfk_2` (`parentID`),
  CONSTRAINT `Origin_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Event` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pick`
--

DROP TABLE IF EXISTS `Pick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pick` (
  `publicID` varchar(255) COLLATE utf8_bin NOT NULL,
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time_value` datetime NOT NULL,
  `time_value_ms` int(11) NOT NULL,
  `time_uncertainty` double unsigned DEFAULT NULL,
  `time_lowerUncertainty` double unsigned DEFAULT NULL,
  `time_upperUncertainty` double unsigned DEFAULT NULL,
  `time_confidenceLevel` double unsigned DEFAULT NULL,
  `waveformID_networkCode` char(8) COLLATE utf8_bin NOT NULL,
  `waveformID_stationCode` char(8) COLLATE utf8_bin NOT NULL,
  `waveformID_locationCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_channelCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `filterID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `methodID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `horizontalSlowness_value` double DEFAULT NULL,
  `horizontalSlowness_uncertainty` double unsigned DEFAULT NULL,
  `horizontalSlowness_lowerUncertainty` double unsigned DEFAULT NULL,
  `horizontalSlowness_upperUncertainty` double unsigned DEFAULT NULL,
  `horizontalSlowness_confidenceLevel` double unsigned DEFAULT NULL,
  `horizontalSlowness_used` tinyint(1) NOT NULL DEFAULT '0',
  `backazimuth_value` double DEFAULT NULL,
  `backazimuth_uncertainty` double unsigned DEFAULT NULL,
  `backazimuth_lowerUncertainty` double unsigned DEFAULT NULL,
  `backazimuth_upperUncertainty` double unsigned DEFAULT NULL,
  `backazimuth_confidenceLevel` double unsigned DEFAULT NULL,
  `backazimuth_used` tinyint(1) NOT NULL DEFAULT '0',
  `incidenceAngle_value` double DEFAULT NULL,
  `incidenceAngle_uncertainty` double unsigned DEFAULT NULL,
  `incidenceAngle_lowerUncertainty` double unsigned DEFAULT NULL,
  `incidenceAngle_upperUncertainty` double unsigned DEFAULT NULL,
  `incidenceAngle_confidenceLevel` double unsigned DEFAULT NULL,
  `incidenceAngle_used` tinyint(1) NOT NULL DEFAULT '0',
  `slownessMethodID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `onset` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `phaseHint_code` char(32) COLLATE utf8_bin DEFAULT NULL,
  `phaseHint_used` tinyint(1) NOT NULL DEFAULT '0',
  `polarity` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `evaluationMode` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `evaluationStatus` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicID`),
  KEY `time_value` (`time_value`),
  KEY `time_value_ms` (`time_value_ms`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `Pick_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Event` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SpectralParameter`
--

DROP TABLE IF EXISTS `SpectralParameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpectralParameter` (
  `publicID` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` char(16) COLLATE utf8_bin DEFAULT NULL,
  `spectralLevel_value` double DEFAULT NULL,
  `spectralLevel_uncertainty` double unsigned DEFAULT NULL,
  `spectralLevel_lowerUncertainty` double unsigned DEFAULT NULL,
  `spectralLevel_upperUncertainty` double unsigned DEFAULT NULL,
  `spectralLevel_confidenceLevel` double unsigned DEFAULT NULL,
  `cornelFrequency1_value` double DEFAULT NULL,
  `cornelFrequency1_uncertainty` double unsigned DEFAULT NULL,
  `cornelFrequency1_lowerUncertainty` double unsigned DEFAULT NULL,
  `cornelFrequency1_upperUncertainty` double unsigned DEFAULT NULL,
  `cornelFrequency1_confidenceLevel` double unsigned DEFAULT NULL,
  `cornelFrequency1_used` tinyint(1) NOT NULL DEFAULT '0',
  `cornelFrequency2_value` double DEFAULT NULL,
  `cornelFrequency2_uncertainty` double unsigned DEFAULT NULL,
  `cornelFrequency2_lowerUncertainty` double unsigned DEFAULT NULL,
  `cornelFrequency2_upperUncertainty` double unsigned DEFAULT NULL,
  `cornelFrequency2_confidenceLevel` double unsigned DEFAULT NULL,
  `cornelFrequency2_used` tinyint(1) NOT NULL DEFAULT '0',
  `timeWindow_reference` datetime DEFAULT NULL,
  `timeWindow_reference_ms` int(11) DEFAULT NULL,
  `timeWindow_begin` double DEFAULT NULL,
  `timeWindow_end` double DEFAULT NULL,
  `timeWindow_used` tinyint(1) NOT NULL DEFAULT '0',
  `taperID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `period_value` double DEFAULT NULL,
  `period_uncertainty` double unsigned DEFAULT NULL,
  `period_lowerUncertainty` double unsigned DEFAULT NULL,
  `period_upperUncertainty` double unsigned DEFAULT NULL,
  `period_confidenceLevel` double unsigned DEFAULT NULL,
  `period_used` tinyint(1) NOT NULL DEFAULT '0',
  `snr` double DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pickID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_networkCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_stationCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_locationCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_channelCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_used` tinyint(1) NOT NULL DEFAULT '0',
  `filterID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `methodID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `scalingTime_value` datetime DEFAULT NULL,
  `scalingTime_value_ms` int(11) DEFAULT NULL,
  `scalingTime_uncertainty` double unsigned DEFAULT NULL,
  `scalingTime_lowerUncertainty` double unsigned DEFAULT NULL,
  `scalingTime_upperUncertainty` double unsigned DEFAULT NULL,
  `scalingTime_confidenceLevel` double unsigned DEFAULT NULL,
  `scalingTime_used` tinyint(1) NOT NULL DEFAULT '0',
  `magnitudeHint` char(16) COLLATE utf8_bin DEFAULT NULL,
  `category` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `evaluationMode` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `evaluationStatus` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicID`),
  KEY `pickID` (`pickID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `SpectralParameter_ibfk_1` FOREIGN KEY (`pickID`) REFERENCES `Pick` (`publicID`) ON DELETE SET NULL,
  CONSTRAINT `SpectralParameter_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Event` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SpectralParameterReference`
--

DROP TABLE IF EXISTS `SpectralParameterReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpectralParameterReference` (
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `referenceID` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`parentID`,`referenceID`),
  KEY `referenceID` (`referenceID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `SpectralParameterReference_ibfk_1` FOREIGN KEY (`referenceID`) REFERENCES `SpectralParameter` (`publicID`) ON DELETE CASCADE,
  CONSTRAINT `SpectralParameterReference_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `StationMagnitude` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StationMagnitude`
--

DROP TABLE IF EXISTS `StationMagnitude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StationMagnitude` (
  `publicID` varchar(255) COLLATE utf8_bin NOT NULL,
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `originID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `magnitude_value` double NOT NULL,
  `magnitude_uncertainty` double unsigned DEFAULT NULL,
  `magnitude_lowerUncertainty` double unsigned DEFAULT NULL,
  `magnitude_upperUncertainty` double unsigned DEFAULT NULL,
  `magnitude_confidenceLevel` double unsigned DEFAULT NULL,
  `type` char(16) COLLATE utf8_bin DEFAULT NULL,
  `methodID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_networkCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_stationCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_locationCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_channelCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_used` tinyint(1) NOT NULL DEFAULT '0',
  `creationInfo_agencyID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_creationTime` datetime DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_modificationTime` datetime DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) DEFAULT NULL,
  `creationInfo_version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `StationMagnitude_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Event` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StationMagnitudeContribution`
--

DROP TABLE IF EXISTS `StationMagnitudeContribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StationMagnitudeContribution` (
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stationMagnitudeID` varchar(255) COLLATE utf8_bin NOT NULL,
  `residual` double DEFAULT NULL,
  `weight` double unsigned DEFAULT NULL,
  PRIMARY KEY (`parentID`,`stationMagnitudeID`),
  KEY `StationMagnitudeContribution_ibfk_1` (`stationMagnitudeID`),
  CONSTRAINT `StationMagnitudeContribution_ibfk_1` FOREIGN KEY (`stationMagnitudeID`) REFERENCES `StationMagnitude` (`publicID`) ON DELETE CASCADE,
  CONSTRAINT `StationMagnitudeContribution_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Magnitude` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WaveformReference`
--

DROP TABLE IF EXISTS `WaveformReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WaveformReference` (
  `_oid` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` varchar(255) COLLATE utf8_bin NOT NULL,
  `_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `waveformID_networkCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_stationCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_locationCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_channelCode` char(8) COLLATE utf8_bin DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`_oid`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `WaveformReference_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `FocalMechanism` (`publicID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Definision of SC3DB 2020.01.28 
