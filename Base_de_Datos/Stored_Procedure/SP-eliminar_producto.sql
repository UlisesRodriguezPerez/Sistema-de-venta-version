USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[eliminar_producto]    Script Date: 13/2/2021 10:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[eliminar_producto]
	@idproducto  INT
AS
DELETE FROM 
	Producto1  
WHERE 
	Id_Producto1 = @idproducto 