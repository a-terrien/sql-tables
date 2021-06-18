CREATE TABLE "voiceAPI_Logs" (
  "_id" SERIAL PRIMARY KEY,
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "analyticSessionID" varchar,
  "clientCallID" varchar,
  "integrationID" varchar,
  "lastAction" int,
  "version" int,
  "action_value_action" int,
  "action_changedAt" timestamp,
  "action_voicePositionID" varchar,
  "action_phoneNumberID" varchar
);

CREATE TABLE "integration" (
  "_id" varchar PRIMARY KEY,
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "companyID" varchar,
  "widgetID" varchar,
  "projectID" varchar,
  "isEnabled" boolean,
  "isPublic" boolean,
  "home" boolean,
  "back" boolean,
  "close" boolean,
  "closeOnWebsiteClick" boolean,
  "key" varchar,
  "position" int,
  "name" varchar,
  "smsProvider" int,
  "type" int
);

CREATE TABLE "voicePosition" (
  "_id" varchar PRIMARY KEY,
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "integrationID" varchar,
  "smsTemplateID" varchar,
  "name" varchar
);

CREATE TABLE "phoneNumber" (
  "_id" SERIAL PRIMARY KEY,
  "createdAt" timestamp,
  "lastUsedAt" timestamp,
  "countryCode" varchar,
  "type" int,
  "phoneNumberHash" varchar
);

CREATE TABLE "publicPhoneNumber" (
  "_id" SERIAL PRIMARY KEY,
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "companyID" varchar,
  "name" varchar,
  "countryCode" varchar,
  "type" int,
  "number" int,
  "isEnabled" boolean
);

CREATE TABLE "sms_Logs" (
  "_id" SERIAL PRIMARY KEY,
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "analyticSessionID" varchar,
  "integrationID" varchar,
  "scenarioID" varchar,
  "scenarioPagekey" varchar,
  "providerMessageID" varchar,
  "smsProvider" int,
  "status" int,
  "statuses_changedAt" timestamp,
  "statuses_status" int,
  "from" varchar,
  "to" varchar
);

CREATE TABLE "smsTemplate" (
  "_id" varchar PRIMARY KEY,
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "companyID" varchar,
  "integrationID" varchar,
  "scenarioID" varchar,
  "scenarioPagekey" varchar,
  "smsProvider" int,
  "name" varchar,
  "text" varchar,
  "from" varchar
);

CREATE TABLE "table1" (
  "_id" varchar PRIMARY KEY,
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "companyID" varchar,
  "integrationID" varchar,
  "scenarioID" varchar,
  "scenarioPagekey" varchar,
  "smsProvider" int,
  "name" varchar,
  "text" varchar,
  "from" varchar
);

CREATE TABLE "table2" (
  "_id" varchar PRIMARY KEY,
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "companyID" varchar,
  "integrationID" varchar,
  "scenarioID" varchar,
  "scenarioPagekey" varchar,
  "smsProvider" int,
  "name" varchar,
  "text" varchar,
  "from" varchar
);

CREATE TABLE "table3" (
  "_id" varchar PRIMARY KEY,
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "companyID" varchar,
  "integrationID" varchar,
  "scenarioID" varchar,
  "scenarioPagekey" varchar,
  "smsProvider" int,
  "name" varchar,
  "text" varchar,
  "from" varchar
);

CREATE TABLE "table4" (
  "_id" varchar PRIMARY KEY,
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "companyID" varchar,
  "integrationID" varchar,
  "scenarioID" varchar,
  "scenarioPagekey" varchar,
  "smsProvider" int,
  "name" varchar,
  "text" varchar,
  "from" varchar
);

ALTER TABLE "voiceAPI_Logs" ADD FOREIGN KEY ("integrationID") REFERENCES "integration" ("_id");

ALTER TABLE "sms_Logs" ADD FOREIGN KEY ("integrationID") REFERENCES "integration" ("_id");

ALTER TABLE "voicePosition" ADD FOREIGN KEY ("integrationID") REFERENCES "integration" ("_id");

ALTER TABLE "smsTemplate" ADD FOREIGN KEY ("integrationID") REFERENCES "integration" ("_id");

ALTER TABLE "voicePosition" ADD FOREIGN KEY ("smsTemplateID") REFERENCES "smsTemplate" ("_id");

ALTER TABLE "voicePosition" ADD FOREIGN KEY ("_id") REFERENCES "voiceAPI_Logs" ("action_voicePositionID");

ALTER TABLE "voiceAPI_Logs" ADD FOREIGN KEY ("action_phoneNumberID") REFERENCES "phoneNumber" ("_id");

ALTER TABLE "publicPhoneNumber" ADD FOREIGN KEY ("_id") REFERENCES "phoneNumber" ("_id");

COMMENT ON TABLE "integration" IS 'Catalog: 21 items';

COMMENT ON TABLE "voicePosition" IS 'Catalog: 49 items';

COMMENT ON TABLE "phoneNumber" IS 'Catalog: X items';

COMMENT ON TABLE "publicPhoneNumber" IS 'Catalog: 1 items';

COMMENT ON TABLE "smsTemplate" IS 'Catalog: 52 items';
