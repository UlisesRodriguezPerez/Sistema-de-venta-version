USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[eliminar_usuario]    Script Date: 8/2/2021 20:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[eliminar_usuario]
	 @idusuario INT
	,@login VARCHAR(50)
AS
IF EXISTS
	(SELECT Login FROM USUARIO2 WHERE @login ='admin')
RAISERROR('El Usuario *Admin* es Inborrable, si se borraria Eliminarias el Acceso al Sistema de porvida, Accion Denegada', 16,1)
ELSE
	UPDATE 
		USUARIO2 
	SET
		Estado='ELIMINADO'
	WHERE
		idUsuario =@idusuario AND Login <>'admin'
