USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[mostrar_grupos]    Script Date: 13/2/2021 10:55:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[mostrar_grupos]

	@buscar VARCHAR(50)
AS 
BEGIN
	SELECT 
		 Idline
		,Linea  
	AS 
		Grupo 
	FROM 
		Grupo_de_Productos  
	WHERE 
		Linea  LIKE  '%' + @buscar +'%'
END