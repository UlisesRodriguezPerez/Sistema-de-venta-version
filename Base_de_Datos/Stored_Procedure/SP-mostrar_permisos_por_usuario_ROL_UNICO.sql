USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[mostrar_permisos_por_usuario_ROL_UNICO]    Script Date: 10/2/2021 18:33:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[mostrar_permisos_por_usuario_ROL_UNICO]
	@LOGIN VARCHAR(50)
AS 
SELECT 
	USUARIO2.Rol 
FROM 
	USUARIO2 
WHERE 
	USUARIO2.LOGIN =@LOGIN and USUARIO2.Estado ='ACTIVO'