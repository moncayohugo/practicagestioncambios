SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create function [dbo].[funidprod] (@codprod int)
returns table
as
return (select SUM(cantidad)as 'total' 
		from DETALLE_ORDENES 
		where PRODUCTOID = @codprod) 
GO
