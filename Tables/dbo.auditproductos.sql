CREATE TABLE [dbo].[auditproductos]
(
[audit_log_id] [uniqueidentifier] NULL CONSTRAINT [DF__auditprod__audit__49C3F6B7] DEFAULT (newid()),
[audit_log_type] [char] (3) COLLATE Modern_Spanish_CI_AS NOT NULL,
[audit_productoid] [int] NOT NULL,
[audit_preciounit] [money] NULL,
[audit_user] [sys].[sysname] NOT NULL CONSTRAINT [DF__auditprod__audit__4AB81AF0] DEFAULT (suser_sname()),
[audit_changed] [datetime] NULL CONSTRAINT [DF__auditprod__audit__4BAC3F29] DEFAULT (getdate())
) ON [PRIMARY]
GO
