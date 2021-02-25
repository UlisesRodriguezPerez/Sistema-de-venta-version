USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[editar_dinero_caja_inicial]    Script Date: 10/2/2021 18:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[editar_dinero_caja_inicial]
	 @Id_caja AS INTEGER
	,@saldo NUMERIC(18,2)
AS
UPDATE 
	MOVIMIENTOCAJACIERRE  
SET 
	Saldo_queda_en_caja =@saldo
WHERE 
	Id_caja =@Id_caja AND Estado ='CAJA APERTURADA'