CREATE TABLE [dbo].[PRODUCTOS]
(
[PRODUCTOID] [int] NOT NULL,
[PROVEEDORID] [int] NOT NULL,
[CATEGORIAID] [int] NOT NULL,
[DESCRIPCION] [char] (50) COLLATE Modern_Spanish_CI_AS NULL,
[PRECIOUNIT] [money] NOT NULL,
[EXISTENCIA] [int] NOT NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[updPRODUCTOS]
ON [dbo].[PRODUCTOS]  
FOR update AS
  
    IF update (preciounit) 

    BEGIN
    -- registro actual
    INSERT INTO auditproductos
        (audit_log_type,
        audit_productoid, 
		audit_preciounit)
        SELECT    'OLD', 
        del.productoid, 
		del.preciounit
        FROM deleted del
  
    -- registro nuevo o actualizado
    INSERT INTO auditproductos
        (audit_log_type,
        audit_productoid, 
		audit_preciounit)
        SELECT    'NEW', 
        ins.productoid, 
		ins.preciounit
        FROM inserted ins
    END
  
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY NONCLUSTERED  ([PRODUCTOID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD CONSTRAINT [FK_PRODUCTO_CATE_PROD_CATEGORI] FOREIGN KEY ([CATEGORIAID]) REFERENCES [dbo].[CATEGORIAS] ([CATEGORIAID])
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD CONSTRAINT [FK_PRODUCTO_PROV_PROD_PROVEEDO] FOREIGN KEY ([PROVEEDORID]) REFERENCES [dbo].[PROVEEDORES] ([PROVEEDORID])
GO
