SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create function [dbo].[fun_cliente_orden] (@nomcli varchar(30))
returns table 
as 
return 
     select count(*) as 'clientes'
	 from ordenes o join clientes c
	 on (o.clienteid = c.clienteid)
	 and nombrecia = @nomcli 
GO
