CREATE TABLE `voiceAPI_Logs` (
  `_id` varchar(255) PRIMARY KEY AUTO_INCREMENT,
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `analyticSessionID` varchar(255),
  `clientCallID` varchar(255),
  `integrationID` varchar(255),
  `lastAction` int,
  `version` int,
  `action_value_action` int,
  `action_changedAt` timestamp,
  `action_voicePositionID` varchar(255),
  `action_phoneNumberID` varchar(255)
);

CREATE TABLE `integration` (
  `_id` varchar(255) PRIMARY KEY,
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `companyID` varchar(255),
  `widgetID` varchar(255),
  `projectID` varchar(255),
  `isEnabled` boolean,
  `isPublic` boolean,
  `home` boolean,
  `back` boolean,
  `close` boolean,
  `closeOnWebsiteClick` boolean,
  `key` varchar(255),
  `position` int,
  `name` varchar(255),
  `smsProvider` int,
  `type` int
);

CREATE TABLE `voicePosition` (
  `_id` varchar(255) PRIMARY KEY,
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `integrationID` varchar(255),
  `smsTemplateID` varchar(255),
  `name` varchar(255)
);

CREATE TABLE `phoneNumber` (
  `_id` varchar(255) PRIMARY KEY AUTO_INCREMENT,
  `createdAt` timestamp,
  `lastUsedAt` timestamp,
  `countryCode` varchar(255),
  `type` int,
  `phoneNumberHash` varchar(255)
);

CREATE TABLE `publicPhoneNumber` (
  `_id` varchar(255) PRIMARY KEY AUTO_INCREMENT,
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `companyID` varchar(255),
  `name` varchar(255),
  `countryCode` varchar(255),
  `type` int,
  `number` int,
  `isEnabled` boolean
);

CREATE TABLE `sms_Logs` (
  `_id` varchar(255) PRIMARY KEY AUTO_INCREMENT,
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `analyticSessionID` varchar(255),
  `integrationID` varchar(255),
  `scenarioID` varchar(255),
  `scenarioPagekey` varchar(255),
  `providerMessageID` varchar(255),
  `smsProvider` int,
  `status` int,
  `statuses_changedAt` timestamp,
  `statuses_status` int,
  `from` varchar(255),
  `to` varchar(255)
);

CREATE TABLE `smsTemplate` (
  `_id` varchar(255) PRIMARY KEY,
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `companyID` varchar(255),
  `integrationID` varchar(255),
  `scenarioID` varchar(255),
  `scenarioPagekey` varchar(255),
  `smsProvider` int,
  `name` varchar(255),
  `text` varchar(255),
  `from` varchar(255)
);

CREATE TABLE `table1` (
  `_id` varchar(255) PRIMARY KEY,
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `companyID` varchar(255),
  `integrationID` varchar(255),
  `scenarioID` varchar(255),
  `scenarioPagekey` varchar(255),
  `smsProvider` int,
  `name` varchar(255),
  `text` varchar(255),
  `from` varchar(255)
);

CREATE TABLE `table2` (
  `_id` varchar(255) PRIMARY KEY,
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `companyID` varchar(255),
  `integrationID` varchar(255),
  `scenarioID` varchar(255),
  `scenarioPagekey` varchar(255),
  `smsProvider` int,
  `name` varchar(255),
  `text` varchar(255),
  `from` varchar(255)
);

CREATE TABLE `table3` (
  `_id` varchar(255) PRIMARY KEY,
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `companyID` varchar(255),
  `integrationID` varchar(255),
  `scenarioID` varchar(255),
  `scenarioPagekey` varchar(255),
  `smsProvider` int,
  `name` varchar(255),
  `text` varchar(255),
  `from` varchar(255)
);

CREATE TABLE `table4` (
  `_id` varchar(255) PRIMARY KEY,
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `companyID` varchar(255),
  `integrationID` varchar(255),
  `scenarioID` varchar(255),
  `scenarioPagekey` varchar(255),
  `smsProvider` int,
  `name` varchar(255),
  `text` varchar(255),
  `from` varchar(255)
);

ALTER TABLE `voiceAPI_Logs` ADD FOREIGN KEY (`integrationID`) REFERENCES `integration` (`_id`);

ALTER TABLE `sms_Logs` ADD FOREIGN KEY (`integrationID`) REFERENCES `integration` (`_id`);

ALTER TABLE `voicePosition` ADD FOREIGN KEY (`integrationID`) REFERENCES `integration` (`_id`);

ALTER TABLE `smsTemplate` ADD FOREIGN KEY (`integrationID`) REFERENCES `integration` (`_id`);

ALTER TABLE `voicePosition` ADD FOREIGN KEY (`smsTemplateID`) REFERENCES `smsTemplate` (`_id`);

ALTER TABLE `voicePosition` ADD FOREIGN KEY (`_id`) REFERENCES `voiceAPI_Logs` (`action_voicePositionID`);

ALTER TABLE `voiceAPI_Logs` ADD FOREIGN KEY (`action_phoneNumberID`) REFERENCES `phoneNumber` (`_id`);

ALTER TABLE `publicPhoneNumber` ADD FOREIGN KEY (`_id`) REFERENCES `phoneNumber` (`_id`);

ALTER TABLE `integration` COMMENT = "Catalog: 21 items";

ALTER TABLE `voicePosition` COMMENT = "Catalog: 49 items";

ALTER TABLE `phoneNumber` COMMENT = "Catalog: X items";

ALTER TABLE `publicPhoneNumber` COMMENT = "Catalog: 1 items";

ALTER TABLE `smsTemplate` COMMENT = "Catalog: 52 items";
