USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[editar_Grupo]    Script Date: 13/2/2021 10:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[editar_Grupo]
	 @id INT
	,@Grupo VARCHAR(50)

AS
IF EXISTS 
	(
		SELECT 
			Linea 
		FROM 
			Grupo_de_Productos  
		WHERE 
			Linea = @Grupo AND Idline<>@id  
	)
	RAISERROR ('YA EXISTE UN GRUPO CON ESTE NOMBRE, Ingrese de nuevo', 16,1)
ELSE
	UPDATE  
		Grupo_de_Productos 
	SET 
		Linea = @grupo
	WHERE 
		Idline = @id