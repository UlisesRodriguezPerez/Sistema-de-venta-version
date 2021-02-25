USE [URP_SISTEMA_COMPRA]
GO
CREATE PROCEDURE [dbo].[validar_usuario]
	 @password VARCHAR(50)
	,@login VARCHAR(50)
AS
SELECT * FROM USUARIO2
WHERE  
	Password = @password AND Login = @Login AND Estado ='ACTIVO'