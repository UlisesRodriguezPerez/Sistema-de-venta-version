USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[insertar_Producto]    Script Date: 13/2/2021 10:55:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[insertar_Producto]                
           @Descripcion VARCHAR(50)
		  ,@Imagen VARCHAR(50)			         
          ,@Id_grupo AS INT
		  ,@Usa_inventarios VARCHAR(50)
		  ,@Stock VARCHAR(50)
          ,@Precio_de_compra NUMERIC(18,2)
          ,@Fecha_de_vencimiento VARCHAR(50)
          ,@Precio_de_venta NUMERIC(18,2)
          ,@Codigo VARCHAR(50)
          ,@Se_vende_a VARCHAR(50)
          ,@Impuesto VARCHAR(50)
          ,@Stock_minimo NUMERIC(18,2)
          ,@Precio_mayoreo NUMERIC(18,2)
		  ,@A_partir_de NUMERIC(18,2)
AS 
BEGIN
	IF EXISTS 
		(
			SELECT 
				 Descripcion
				,Codigo  
			FROM 
				Producto1  
			WHERE 
				Descripcion = @Descripcion OR Codigo=@Codigo  
		)
	RAISERROR ('YA EXISTE UN PRODUCTO  CON ESTE NOMBRE/CODIGO, POR FAVOR INGRESE DE NUEVO/ SE GENERARA CODIGO AUTOMATICO', 16,1)
	ELSE
		BEGIN
			INSERT INTO 
				Producto1
			VALUES
				(
					 @Descripcion       
					,@Imagen
					,@Id_grupo 
					,@Usa_inventarios
					,@Stock
				    ,@Precio_de_compra
				    ,@Fecha_de_vencimiento
				    ,@Precio_de_venta
				    ,@Codigo
				    ,@Se_vende_a
				    ,@Impuesto
				    ,@Stock_minimo
				    ,@Precio_mayoreo
				    ,@A_partir_de
				)

		END
END