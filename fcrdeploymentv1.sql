USE [K2UAT_Apps_IOM]
GO
/****** Object:  Schema [fcr]    Script Date: 11/11/2024 11:21:37 ******/
CREATE SCHEMA [fcr]
GO
/****** Object:  Table [fcr].[FinancialCrimeReferral.Request]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fcr].[FinancialCrimeReferral.Request](
	[Id] [uniqueidentifier] NOT NULL,
	[Entities] [nvarchar](max) NULL,
	[EntitiesJson] [nvarchar](max) NULL,
	[WarningMessages] [text] NULL,
	[UltimateBeneficialOwners] [nvarchar](500) NULL,
	[CONReference] [nvarchar](500) NULL,
	[ServicesProvided] [nvarchar](500) NULL,
	[DetailFeesPayableToIQEQ] [text] NULL,
	[AnyChangesStructureOrServices] [nvarchar](255) NULL,
	[AnyChangesStructureOrServicesDetails] [nvarchar](1000) NULL,
	[AdverseMediaCheckDetails] [nvarchar](1000) NULL,
	[TransactionType] [nvarchar](500) NULL,
	[Currency] [nvarchar](500) NULL,
	[Amount] [decimal](12, 2) NULL,
	[AccFromHolderName] [nvarchar](500) NULL,
	[AccFromBankName] [nvarchar](500) NULL,
	[AccFromAccountNumber] [nvarchar](500) NULL,
	[AccFromAddress] [nvarchar](500) NULL,
	[AccToHolderName] [nvarchar](500) NULL,
	[AccToBankName] [nvarchar](500) NULL,
	[AccToAccountNumber] [nvarchar](500) NULL,
	[AccToAddress] [nvarchar](500) NULL,
	[IsThereAnyAdditionalInfoRelevant] [nvarchar](255) NULL,
	[IsThereAnyAdditionalInfoRelevantFullDetails] [nvarchar](1000) NULL,
	[ManagerDisplayName] [nvarchar](500) NULL,
	[ManagerFQN] [nvarchar](500) NULL,
	[ManagerEmail] [nvarchar](500) NULL,
	[ManagerDateApproved] [datetime] NULL,
	[ManagerComments] [nvarchar](500) NULL,
	[ReferralReference] [nvarchar](500) NULL,
	[Status] [nvarchar](255) NULL,
	[Stage] [nvarchar](255) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
	[CreatedByEmail] [nvarchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](255) NULL,
 CONSTRAINT [PK__FCR_Request] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [fcr].[vwFinancialCrimeReferralRequests]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [fcr].[vwFinancialCrimeReferralRequests] as
select
	   [Id]
	  ,[Entities]
      ,[WarningMessages]
      ,[UltimateBeneficialOwners]
      ,[CONReference]
      ,[TransactionType]
      ,[ManagerEmail]
      ,[ReferralReference]
      ,[Status]
      ,[Stage]
      ,[CreatedOn]
      ,[CreatedBy]
  FROM [fcr].[FinancialCrimeReferral.Request]
GO
/****** Object:  Table [dbo].[FormsErrorLog]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormsErrorLog](
	[ErrorID] [uniqueidentifier] NOT NULL,
	[ErrorType] [nvarchar](200) NULL,
	[ErrorDetails] [nvarchar](max) NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[ScreenHeight] [nvarchar](50) NULL,
	[ScreenWidth] [nvarchar](50) NULL,
	[Platform] [nvarchar](50) NULL,
	[UserAgent] [nvarchar](250) NULL,
	[BrowserCulture] [nvarchar](50) NULL,
	[CurrentUserFQN] [nvarchar](100) NULL,
	[Timestamp] [datetime] NULL,
	[Mode] [nvarchar](50) NULL,
	[RuntimeURL] [nvarchar](50) NULL,
	[FormName] [nvarchar](100) NULL,
	[Status] [nvarchar](50) NULL,
	[AssignedTo] [nvarchar](50) NULL,
	[Application] [nvarchar](100) NULL,
	[Parameters] [nvarchar](500) NULL,
 CONSTRAINT [PK_FormsErrorLog] PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [fcr].[FinancialCrimeReferral.Audit]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fcr].[FinancialCrimeReferral.Audit](
	[Id] [uniqueidentifier] NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[Audit] [nvarchar](2000) NULL,
	[Action] [nvarchar](500) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](255) NULL,
 CONSTRAINT [PK__FCR__Audit] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fcr].[FinancialCrimeReferral.Documents]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fcr].[FinancialCrimeReferral.Documents](
	[Id] [uniqueidentifier] NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[Document] [nvarchar](max) NULL,
	[Filename] [nvarchar](255) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__fcr_Documents] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [fcr].[FinancialCrimeReferral.Notes]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fcr].[FinancialCrimeReferral.Notes](
	[Id] [uniqueidentifier] NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](255) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fcr].[LookupItems]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fcr].[LookupItems](
	[Id] [uniqueidentifier] NOT NULL,
	[Lookup] [nvarchar](500) NOT NULL,
	[LookupItem] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](255) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FormsErrorLog] ADD  DEFAULT (newid()) FOR [ErrorID]
GO
ALTER TABLE [fcr].[FinancialCrimeReferral.Audit] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [fcr].[FinancialCrimeReferral.Documents] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [fcr].[FinancialCrimeReferral.Notes] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [fcr].[FinancialCrimeReferral.Request] ADD  CONSTRAINT [DF__FinancialCri__Id__12FDD1B2]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [fcr].[LookupItems] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  StoredProcedure [fcr].[GetDashboardIndicators]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     Procedure [fcr].[GetDashboardIndicators]
as
begin

select
(select Count(Id) as InProgress from [fcr].[FinancialCrimeReferral.Request] where [fcr].[FinancialCrimeReferral.Request].[Status] = 'Active' ) InProgress,
(select Count(Id) as Overdue from [fcr].[FinancialCrimeReferral.Request] where [fcr].[FinancialCrimeReferral.Request].[Status] = 'Active' and DATEDIFF(DAY,CreatedOn,GETDATE()) > 7 ) Overdue,
(select Count(Id) as Completed from [fcr].[FinancialCrimeReferral.Request] where [fcr].[FinancialCrimeReferral.Request].[Stage] = 'Completed' ) Completed

end
GO
/****** Object:  StoredProcedure [fcr].[GetLookups]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     Procedure [fcr].[GetLookups]
as
begin

SELECT distinct
      [Lookup]
  FROM [fcr].[LookupItems]

end
GO
/****** Object:  StoredProcedure [fcr].[spGeFinancialCrimeReferralRequests]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [fcr].[spGeFinancialCrimeReferralRequests] 
(
    @pUserEmail nvarchar(500),
    @pUserIsMLRO bit = 0,
    @pStatus nvarchar(255)
)
AS
BEGIN
    SELECT
           [Id],
           [Entities],
           [WarningMessages],
           [UltimateBeneficialOwners],
           [CONReference],
           [TransactionType],
           [ManagerEmail],
           [ReferralReference],
           [Status],
           [Stage],
           [CreatedOn],
           [CreatedBy]
    FROM [fcr].[FinancialCrimeReferral.Request]
    WHERE 
        (
            (@pStatus = 'Active' AND [Status] = @pStatus)
            OR 
            (@pStatus <> 'Active' AND [Stage] = 'Completed')
        )
        AND
        (
            (@pUserIsMLRO = 1) 
            OR 
            (CreatedByEmail = @pUserEmail) 
            OR 
            (ManagerEmail = @pUserEmail)
        );
END
GO
/****** Object:  StoredProcedure [fcr].[spListSelectedEntities]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   Procedure [fcr].[spListSelectedEntities]
(
 @pListEntities nvarchar(max) = '[]',
 @pAddEntity nvarchar(500) = NULL,
 @pDeleteEntity nvarchar(500) = NULL
)
AS
BEGIN

	if (@pAddEntity is not null)
	begin
		;with tbl1 as (select EntityKey, FullName, ManagerEmail,Warning from OPENJSON(@pListEntities) with (
							EntityKey nvarchar(500) N'$.EntityKey',
							FullName nvarchar(500) N'$.FullName',
							ManagerEmail nvarchar(500) N'$.ManagerEmail',
							Warning nvarchar(500) N'$.Warning'
						) union all
						select EntityKey, FullName, ManagerEmail,Warning from OPENJSON(@pAddEntity) with (
							EntityKey nvarchar(500) N'$.EntityKey',
							FullName nvarchar(500) N'$.FullName',
							ManagerEmail nvarchar(500) N'$.ManagerEmail',
							Warning nvarchar(500) N'$.Warning'
						))
		select @pListEntities = (select * from tbl1 for JSON PATH) 
	end

	if (@pDeleteEntity is not null)
	begin
		;with tbl1 as  (select EntityKey, FullName, ManagerEmail,Warning from OPENJSON(@pListEntities) with (
									EntityKey nvarchar(500) N'$.EntityKey',
									FullName nvarchar(500) N'$.FullName',
									ManagerEmail nvarchar(500) N'$.ManagerEmail',
									Warning nvarchar(500) N'$.Warning'
								) where EntityKey <> 
													(select top 1 EntityKey from OPENJSON(@pDeleteEntity) with (
														EntityKey nvarchar(500) N'$.EntityKey'
													)))
		select @pListEntities = (select * from tbl1 for JSON PATH) 
	end

	select EntityKey, FullName, ManagerEmail,Warning, @pListEntities as ListEntities from OPENJSON(@pListEntities) with (
																					EntityKey nvarchar(500) N'$.EntityKey',
																					FullName nvarchar(500) N'$.FullName',
																					ManagerEmail nvarchar(500) N'$.ManagerEmail',
																					Warning nvarchar(500) N'$.Warning') 

END
GO
/****** Object:  StoredProcedure [fcr].[spOutstandingReport]    Script Date: 11/11/2024 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [fcr].[spOutstandingReport]
(
 @pDateRange nvarchar(255),
 @pStatus nvarchar(255) = NULL
 )
AS
BEGIN

 DECLARE @StartDate DATE, @EndDate DATE;

 -- Determine the date range based on @pDateRange
    IF @pDateRange = 'Last 90 Days'
    BEGIN
        SET @StartDate = DATEADD(DAY, -90, GETDATE());
        SET @EndDate = CAST(DATEADD(DAY,1,GETDATE()) AS DATE);
    END
    ELSE IF @pDateRange = 'Last 60 Days'
    BEGIN
        SET @StartDate = DATEADD(DAY, -60, GETDATE());
        SET @EndDate = CAST(DATEADD(DAY,1,GETDATE()) AS DATE);
    END
    ELSE IF @pDateRange = 'This Month'
    BEGIN
        SET @StartDate = DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1);
        SET @EndDate = EOMONTH(GETDATE());
    END
    ELSE IF @pDateRange = 'Last Month'
    BEGIN
        SET @StartDate = DATEFROMPARTS(YEAR(DATEADD(MONTH, -1, GETDATE())), MONTH(DATEADD(MONTH, -1, GETDATE())), 1);
        SET @EndDate = EOMONTH(DATEADD(MONTH, -1, GETDATE()));
    END
	ELSE IF @pDateRange = 'Today'
    BEGIN
        SET @StartDate = CAST(GETDATE() AS DATE);
        SET @EndDate = CAST(DATEADD(DAY,1,GETDATE()) AS DATE);
    END
	    ELSE IF @pDateRange = 'This Year'
    BEGIN
        SET @StartDate = DATEFROMPARTS(YEAR(GETDATE()), 1, 1);
        SET @EndDate = DATEFROMPARTS(YEAR(GETDATE()), 12, 31);
    END
    ELSE IF @pDateRange = 'Last Year'
    BEGIN
        SET @StartDate = DATEFROMPARTS(YEAR(DATEADD(YEAR, -1, GETDATE())), 1, 1);
        SET @EndDate = DATEFROMPARTS(YEAR(DATEADD(YEAR, -1, GETDATE())), 12, 31);
    END

SELECT
	   [Id]
      ,[Entities]
      ,[WarningMessages]
      ,[UltimateBeneficialOwners]
      ,[CONReference]
      ,[ServicesProvided]
      ,[DetailFeesPayableToIQEQ]
      ,[AnyChangesStructureOrServices]
      ,[AnyChangesStructureOrServicesDetails]
      ,[AdverseMediaCheckDetails]
      ,[TransactionType]
      ,[Currency]
      ,[Amount]
      ,[AccFromHolderName]
      ,[AccFromBankName]
      ,[AccFromAccountNumber]
      ,[AccFromAddress]
      ,[AccToHolderName]
      ,[AccToBankName]
      ,[AccToAccountNumber]
      ,[AccToAddress]
      ,[IsThereAnyAdditionalInfoRelevant]
      ,[IsThereAnyAdditionalInfoRelevantFullDetails]
      ,[ManagerDisplayName]
      ,[ManagerFQN]
      ,[ManagerEmail]
      ,[ManagerDateApproved]
      ,[ManagerComments]
      ,[ReferralReference]
      ,[Status]
      ,[Stage]
      ,[CreatedOn]
      ,[CreatedBy]
FROM [fcr].[FinancialCrimeReferral.Request]
WHERE (@pStatus IS NULL OR [Status] = @pStatus)
AND (createdOn BETWEEN @StartDate AND @EndDate)
ORDER BY createdOn DESC

END
GO
