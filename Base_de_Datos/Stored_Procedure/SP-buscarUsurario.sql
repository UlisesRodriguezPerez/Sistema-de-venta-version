USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[buscar_usuario]    Script Date: 9/2/2021 15:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[buscar_usuario]
	@letra VARCHAR(50)
AS
SELECT	
	 idUsuario
	,Nombres_y_Apellidos AS Nombres 
	,Login
	,Password
	,Icono 
	,Nombre_de_icono 
	,Correo 
	,rol  
FROM USUARIO2

WHERE 
	Nombres_y_Apellidos + Login      LIKE '%'+ @letra +'%' AND Estado = 'ACTIVO'
