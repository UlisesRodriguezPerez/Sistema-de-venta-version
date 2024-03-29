USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[insertar_Grupo]    Script Date: 13/2/2021 10:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[insertar_Grupo]
	@Grupo VARCHAR(50),
	@Por_defecto VARCHAR(50)
AS
IF EXISTS 
	(
		SELECT 
			Linea 
		FROM 
			Grupo_de_Productos  
		WHERE 
			Linea = @Grupo  
	)
	RAISERROR ('YA EXISTE UN GRUPO CON ESTE NOMBRE, Ingrese de nuevo', 16,1)
ELSE
	INSERT INTO 
		Grupo_de_Productos  
	VALUES 
		(
			 @Grupo
			,@Por_defecto
		)
