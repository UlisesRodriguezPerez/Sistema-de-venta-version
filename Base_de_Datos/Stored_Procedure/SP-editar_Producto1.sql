USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[editar_Producto1]    Script Date: 13/2/2021 10:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[editar_Producto1]
	 @Id_Producto1 INT
	,@Descripcion VARCHAR(50)
	,@Imagen VARCHAR(50)		         
    ,@Id_grupo INT
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

IF EXISTS 
	(
		SELECT 
			Descripcion 
		FROM 
			Producto1  
		WHERE 
			(
				Descripcion = @Descripcion AND Id_Producto1 <> @Id_Producto1 
			) 
	)

	RAISERROR ('YA EXISTE UN PRODUCTO  CON ESTE NOMBRE, POR FAVOR INGRESE DE NUEVO', 16,1)

ELSE IF EXISTS 
	(
		SELECT 
			Codigo  
		FROM 
			Producto1  
		WHERE 
			(
				Codigo  = @Codigo  AND Id_Producto1 <> @Id_Producto1 
			)
	)

	RAISERROR ('YA EXISTE UN PRODUCTO  CON ESTE CODIGO, POR FAVOR INGRESE DE NUEVO/ SE GENERARA CODIGO AUTOMATICO', 16,1)

ELSE IF EXISTS 
	(
		SELECT 
			 Descripcion
			,Codigo  
		FROM 
			Producto1  
		WHERE 
			(
				Descripcion <> @Descripcion AND Id_Producto1 = @Id_Producto1 ) OR (Codigo <> @Codigo AND Id_Producto1 = @Id_Producto1
			)
	)

UPDATE 
	Producto1 
SET  
	 Descripcion = @Descripcion
	,Imagen =  @Imagen		         
	,Id_grupo = @Id_grupo
	,Usa_inventarios = @Usa_inventarios
	,Stock = @Stock
	,Precio_de_compra = @Precio_de_compra
	,Fecha_de_vencimiento = @Fecha_de_vencimiento
	,Precio_de_venta = @Precio_de_venta
	,Codigo = @Codigo
	,Se_vende_a = @Se_vende_a
	,Impuesto = @Impuesto
	,Stock_minimo = @Stock_minimo
	,Precio_mayoreo = @Precio_mayoreo 
	,A_partir_de = @A_partir_de 
WHERE 
	id_Producto1 = @Id_Producto1