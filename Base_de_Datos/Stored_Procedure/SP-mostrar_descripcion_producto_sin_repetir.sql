USE [URP_SISTEMA_COMPRA]
GO

CREATE PROCEDURE [dbo].[mostrar_descripcion_producto_sin_repetir]
	@buscar VARCHAR(50)
AS
SELECT
	TOP 10 
		Descripcion 
	FROM
		Producto1
	WHERE Descripcion LIKE '%' + @buscar +'%'