USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[insertar_Producto]    Script Date: 13/2/2021 17:55:08 ******/
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
		--DEclaramos variables para el kardex
		  ,@Fecha DATETIME
		  ,@Motivo VARCHAR(200)
		  ,@Cantidad AS NUMERIC(18,0)
		  ,@id_usuario AS INT
		  ,@Tipo AS VARCHAR(50)
		  ,@Estado VARCHAR(50)
		  ,@Id_caja INT
AS 
--Validamos que no se agreguen productos con el mismo nombre o código de barra.
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
			DECLARE @id_producto INT
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

			--Ahora obtenemos el idProducto que se acaba de ingresar.
			SELECT 
				  @id_producto = SCOPE_IDENTITY()
			--Ahora insertamos en la tabla kardex
			DECLARE @Hay AS NUMERIC(18,2)
			DECLARE @Habia AS NUMERIC(18,2)
			DECLARE @Costo_unt NUMERIC(18,2)

			SET @Hay = (SELECT Stock FROM Producto1 WHERE Producto1.Id_Producto1 = @id_producto AND Producto1.Usa_inventarios = 'SI')
			SET @Costo_unt = (SELECT Producto1.Precio_de_compra FROM Producto1 WHERE Producto1.Id_Producto1 = @id_producto AND Producto1.Usa_inventarios = 'SI')
			SET @Habia = @Hay
			--Ahora vamos a saber si el producto usa Inventario o no.
			SET @Usa_inventarios = (SELECT Usa_inventarios FROM Producto1 WHERE Producto1.Id_Producto1 = @id_producto AND Producto1.Usa_inventarios = 'SI')
			--AHORA en caso de que sí use inventario, entonces pasamos a insertar los datos en tabla KARDEX.
			IF @Usa_inventarios = 'SI'
			BEGIN
			INSERT INTO	
				KARDEX
			VALUES
				(
					 @Fecha
					,@Motivo
					,@Cantidad
					,@id_producto
					,@id_usuario
					,@Tipo
					,@Estado
					,@Costo_unt
					,@Habia
					,@Hay
					,@Id_caja
				)

			END
		END
END