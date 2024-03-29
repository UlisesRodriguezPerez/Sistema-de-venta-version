USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[editar_usuario]    Script Date: 8/2/2021 20:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[editar_usuario]
	@idUsuario INT,
	@nombres VARCHAR(50) ,
	@Login VARCHAR(50),
	@Password VARCHAR(50),
	@Icono IMAGE,
	@Nombre_de_icono VARCHAR(max),
	@Correo VARCHAR(max),
	@Rol VARCHAR(max)
AS
IF EXISTS 
	(SELECT Login,idUsuario  FROM USUARIO2 WHERE (Login=@Login and idUsuario <>@idUsuario AND Estado='ACTIVO')  OR (Nombres_y_Apellidos =@nombres AND idUsuario <>@idUsuario AND Estado = 'ACTIVO'))
RAISERROR('YA EXISTE UN USUARIO CON ESE LOGIN O CON ESE ICONO, POR FAVOR INGRESE DE NUEVO',16,1 )

ELSE
	UPDATE 
		USUARIO2 
	SET
		 Nombres_y_Apellidos=@nombres 
		,Password =@Password 
		,Icono=@Icono 
		,Nombre_de_icono =@Nombre_de_icono
		,Correo =@Correo 
		,Rol=@rol 
		,Login =@Login
	 WHERE 
		idUsuario=@idUsuario 

