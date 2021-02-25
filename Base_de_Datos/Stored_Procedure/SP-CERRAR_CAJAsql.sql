USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[CERRAR_CAJA]    Script Date: 10/2/2021 18:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[CERRAR_CAJA]
	@idcaja AS INTEGER,
	@fechafin DATETIME,
	@fechacierre DATETIME

AS 
UPDATE 
	MOVIMIENTOCAJACIERRE 
SET 
	Estado ='CAJA CERRADA'
WHERE 
	Id_caja =@idcaja AND Estado='CAJA APERTURADA'