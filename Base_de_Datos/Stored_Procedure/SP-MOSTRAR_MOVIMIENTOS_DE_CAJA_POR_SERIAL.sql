USE [URP_SISTEMA_COMPRA]
GO
/****** Object:  StoredProcedure [dbo].[MOSTRAR_MOVIMIENTOS_DE_CAJA_POR_SERIAL]    Script Date: 10/2/2021 18:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[MOSTRAR_MOVIMIENTOS_DE_CAJA_POR_SERIAL]

	@serial VARCHAR(50)

AS
SELECT 
	 USUARIO2.Login
	,USUARIO2.Nombres_y_Apellidos     
FROM 
	MOVIMIENTOCAJACIERRE 
INNER JOIN USUARIO2 ON USUARIO2.idUsuario=MOVIMIENTOCAJACIERRE.Id_usuario
INNER JOIN Caja ON Caja.Id_Caja =MOVIMIENTOCAJACIERRE.Id_caja 
WHERE 
	Caja.Serial_PC = @serial AND MOVIMIENTOCAJACIERRE.Estado = 'CAJA APERTURADA' 