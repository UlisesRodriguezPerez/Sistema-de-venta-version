USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[insertar_usuario]    Script Date: 8/2/2021 20:18:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[insertar_usuario]
	 @nombres VARCHAR(50)
	,@Login VARCHAR(50)
	,@Password VARCHAR(50)
	,@Icono IMAGE
	,@Nombre_de_icono VARCHAR(max)
	,@Correo VARCHAR(max)
	,@Rol VARCHAR(max)
	,@Estado varchar(50)
AS
IF EXISTS 
	(SELECT Login FROM USUARIO2 WHERE Login=@Login AND Estado = 'ACTIVO')
RAISERROR('YA EXISTE UN USUARIO CON ESE LOGIN O CON ESE ICONO, POR FAVOR INGRESE DE NUEVO',16,1 )
ELSE
	INSERT INTO 
		USUARIO2 
	VALUES
		(
		 @nombres
		,@Login
		,@Password
		,@Icono
		,@Nombre_de_icono
		,@Correo
		,@Rol
		,@Estado
		)

