CREATE TABLE [voiceAPI_Logs] (
  [_id] nvarchar(255) PRIMARY KEY IDENTITY(1, 1),
  [createdAt] timestamp,
  [updatedAt] timestamp,
  [analyticSessionID] nvarchar(255),
  [clientCallID] nvarchar(255),
  [integrationID] nvarchar(255),
  [lastAction] int,
  [version] int,
  [action_value_action] int,
  [action_changedAt] timestamp,
  [action_voicePositionID] nvarchar(255),
  [action_phoneNumberID] nvarchar(255)
)
GO

CREATE TABLE [integration] (
  [_id] nvarchar(255) PRIMARY KEY,
  [createdAt] timestamp,
  [updatedAt] timestamp,
  [companyID] nvarchar(255),
  [widgetID] nvarchar(255),
  [projectID] nvarchar(255),
  [isEnabled] boolean,
  [isPublic] boolean,
  [home] boolean,
  [back] boolean,
  [close] boolean,
  [closeOnWebsiteClick] boolean,
  [key] nvarchar(255),
  [position] int,
  [name] nvarchar(255),
  [smsProvider] int,
  [type] int
)
GO

CREATE TABLE [voicePosition] (
  [_id] nvarchar(255) PRIMARY KEY,
  [createdAt] timestamp,
  [updatedAt] timestamp,
  [integrationID] nvarchar(255),
  [smsTemplateID] nvarchar(255),
  [name] nvarchar(255)
)
GO

CREATE TABLE [phoneNumber] (
  [_id] nvarchar(255) PRIMARY KEY IDENTITY(1, 1),
  [createdAt] timestamp,
  [lastUsedAt] timestamp,
  [countryCode] nvarchar(255),
  [type] int,
  [phoneNumberHash] nvarchar(255)
)
GO

CREATE TABLE [publicPhoneNumber] (
  [_id] nvarchar(255) PRIMARY KEY IDENTITY(1, 1),
  [createdAt] timestamp,
  [updatedAt] timestamp,
  [companyID] nvarchar(255),
  [name] nvarchar(255),
  [countryCode] nvarchar(255),
  [type] int,
  [number] int,
  [isEnabled] boolean
)
GO

CREATE TABLE [sms_Logs] (
  [_id] nvarchar(255) PRIMARY KEY IDENTITY(1, 1),
  [createdAt] timestamp,
  [updatedAt] timestamp,
  [analyticSessionID] nvarchar(255),
  [integrationID] nvarchar(255),
  [scenarioID] nvarchar(255),
  [scenarioPagekey] nvarchar(255),
  [providerMessageID] nvarchar(255),
  [smsProvider] int,
  [status] int,
  [statuses_changedAt] timestamp,
  [statuses_status] int,
  [from] nvarchar(255),
  [to] nvarchar(255)
)
GO

CREATE TABLE [smsTemplate] (
  [_id] nvarchar(255) PRIMARY KEY,
  [createdAt] timestamp,
  [updatedAt] timestamp,
  [companyID] nvarchar(255),
  [integrationID] nvarchar(255),
  [scenarioID] nvarchar(255),
  [scenarioPagekey] nvarchar(255),
  [smsProvider] int,
  [name] nvarchar(255),
  [text] nvarchar(255),
  [from] nvarchar(255)
)
GO

CREATE TABLE [table1] (
  [_id] nvarchar(255) PRIMARY KEY,
  [createdAt] timestamp,
  [updatedAt] timestamp,
  [companyID] nvarchar(255),
  [integrationID] nvarchar(255),
  [scenarioID] nvarchar(255),
  [scenarioPagekey] nvarchar(255),
  [smsProvider] int,
  [name] nvarchar(255),
  [text] nvarchar(255),
  [from] nvarchar(255)
)
GO

CREATE TABLE [table2] (
  [_id] nvarchar(255) PRIMARY KEY,
  [createdAt] timestamp,
  [updatedAt] timestamp,
  [companyID] nvarchar(255),
  [integrationID] nvarchar(255),
  [scenarioID] nvarchar(255),
  [scenarioPagekey] nvarchar(255),
  [smsProvider] int,
  [name] nvarchar(255),
  [text] nvarchar(255),
  [from] nvarchar(255)
)
GO

CREATE TABLE [table3] (
  [_id] nvarchar(255) PRIMARY KEY,
  [createdAt] timestamp,
  [updatedAt] timestamp,
  [companyID] nvarchar(255),
  [integrationID] nvarchar(255),
  [scenarioID] nvarchar(255),
  [scenarioPagekey] nvarchar(255),
  [smsProvider] int,
  [name] nvarchar(255),
  [text] nvarchar(255),
  [from] nvarchar(255)
)
GO

CREATE TABLE [table4] (
  [_id] nvarchar(255) PRIMARY KEY,
  [createdAt] timestamp,
  [updatedAt] timestamp,
  [companyID] nvarchar(255),
  [integrationID] nvarchar(255),
  [scenarioID] nvarchar(255),
  [scenarioPagekey] nvarchar(255),
  [smsProvider] int,
  [name] nvarchar(255),
  [text] nvarchar(255),
  [from] nvarchar(255)
)
GO

ALTER TABLE [voiceAPI_Logs] ADD FOREIGN KEY ([integrationID]) REFERENCES [integration] ([_id])
GO

ALTER TABLE [sms_Logs] ADD FOREIGN KEY ([integrationID]) REFERENCES [integration] ([_id])
GO

ALTER TABLE [voicePosition] ADD FOREIGN KEY ([integrationID]) REFERENCES [integration] ([_id])
GO

ALTER TABLE [smsTemplate] ADD FOREIGN KEY ([integrationID]) REFERENCES [integration] ([_id])
GO

ALTER TABLE [voicePosition] ADD FOREIGN KEY ([smsTemplateID]) REFERENCES [smsTemplate] ([_id])
GO

ALTER TABLE [voicePosition] ADD FOREIGN KEY ([_id]) REFERENCES [voiceAPI_Logs] ([action_voicePositionID])
GO

ALTER TABLE [voiceAPI_Logs] ADD FOREIGN KEY ([action_phoneNumberID]) REFERENCES [phoneNumber] ([_id])
GO

ALTER TABLE [publicPhoneNumber] ADD FOREIGN KEY ([_id]) REFERENCES [phoneNumber] ([_id])
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Catalog: 21 items',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'integration';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Catalog: 49 items',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'voicePosition';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Catalog: X items',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'phoneNumber';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Catalog: 1 items',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'publicPhoneNumber';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Catalog: 52 items',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'smsTemplate';
GO
