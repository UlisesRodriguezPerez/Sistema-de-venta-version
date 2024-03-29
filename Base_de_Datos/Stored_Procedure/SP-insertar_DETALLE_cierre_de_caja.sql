USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[insertar_DETALLE_cierre_de_caja]    Script Date: 10/2/2021 18:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[insertar_DETALLE_cierre_de_caja]
	  @fechaini DATETIME
	 ,@fechafin DATETIME
	 ,@fechacierre DATETIME 
	 ,@ingresos NUMERIC(18,2)
     ,@egresos NUMERIC(18,2)
	 ,@saldo NUMERIC(18,2)
	 ,@idusuario INT
	 ,@totalcaluclado NUMERIC(18,2)
	 ,@totalreal NUMERIC(18,2) 
	 ,@estado AS VARCHAR(50)
	 ,@diferencia AS NUMERIC(18,2)
	 ,@id_caja AS INT   
AS BEGIN

	IF EXISTS 
		(
			SELECT 
				Estado 
			FROM 
				MOVIMIENTOCAJACIERRE 
			WHERE  
				MOVIMIENTOCAJACIERRE.Estado='CAJA APERTURADA'
		)
	RAISERROR ('Ya Fue Iniciado el Turno de esta Caja', 16,1)
	ELSE
	BEGIN
		INSERT INTO 
			MOVIMIENTOCAJACIERRE 
		VALUES 
			(
				 @fechaini
				,@fechafin
				,@fechacierre 
				,@ingresos
				,@egresos
				,@saldo
				,@idusuario
				,@totalcaluclado
				,@totalreal	
				,@estado
				,@diferencia
				,@id_caja 
			)
	END
END

