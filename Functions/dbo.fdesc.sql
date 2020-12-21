SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create function [dbo].[fdesc] (@ordenid int)
returns money
as
begin 
   declare @vdesc money, @totvta money
   select @totvta = SUM(cantidad * preciounit) 
   from PRODUCTOS p join DETALLE_ORDENES do
   on (do.PRODUCTOID = p.PRODUCTOID) 
   where do.ORDENID = @ordenid
   
   select @vdesc = @totvta * descuento / 100 
   from ORDENES 
   where ORDENID = @ordenid  

   return @vdesc
end  
GO
