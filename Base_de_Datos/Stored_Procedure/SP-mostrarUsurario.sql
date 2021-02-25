USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[mostrar_usuario]    Script Date: 8/2/2021 20:33:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[mostrar_usuario]
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
FROM 
	USUARIO2
WHERE
	Estado = 'ACTIVO'