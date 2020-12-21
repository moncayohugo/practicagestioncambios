SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[freporte] (@JefeId int)
RETURNS @tabReporte TABLE (empid int primary key,
   apellido varchar(20) NOT NULL,
   nombre varchar(20) NOT NULL,
   jefe int
)
/* Retorna un conjunto de filas de todos los empleados que tienen como jefe al empleado con Id que entra como parámetro -  campo jefe*/
AS
BEGIN
   INSERT @tabReporte
   SELECT empleadoid, apellido,nombre, reporta_a
   FROM empleados 
	where reporta_a = @JefeId
   RETURN
END
GO
