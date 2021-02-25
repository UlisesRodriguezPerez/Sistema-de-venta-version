USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[mostrar_cajas_por_Serial_de_DiscoDuro]    Script Date: 10/2/2021 18:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc  [dbo].[mostrar_cajas_por_Serial_de_DiscoDuro]
	@Serial AS VARCHAR(50)
AS
SELECT 
	 Id_Caja
	,Descripcion 
FROM 
	Caja 
WHERE 
	Serial_PC = @Serial