--Verifcando totalidad en Jardineria, la tabla tomada ha sido detalle_pedido debido a que es la que más registros e información posee
--Los valores son los mismos 318
SELECT [ID_detalle_pedido]
      ,[ID_pedido]
      ,[ID_producto]
      ,[cantidad]
      ,[precio_unidad]
      ,[numero_linea]
  FROM [jardineria].[dbo].[detalle_pedido]

SELECT [ID_pedido]
      ,[ID_producto]
      ,[ID_empleado]
      ,[ID_oficina]
      ,[ID_cliente]
      ,[cantidad]
      ,[precio_unidad]
      ,[estado]
      ,[Fecha_pedido]
      ,[Fecha_esperada]
      ,[Fecha_entrega]
  FROM [DMPedidos].[dbo].[FACT_Pedido] 


--Verificando que la cantidad del producto con ID_producto = 58 sea igual tanto en detalle_producto tanto como en FACT_Pedido
--Son dos filas

SELECT [ID_detalle_pedido]
      ,[ID_pedido]
      ,[ID_producto]
      ,[cantidad]
      ,[precio_unidad]
      ,[numero_linea]
FROM [jardineria].[dbo].[detalle_pedido] 
WHERE ID_producto = 58

SELECT [ID_pedido]
      ,[ID_producto]
      ,[ID_empleado]
      ,[ID_oficina]
      ,[ID_cliente]
      ,[cantidad]
      ,[precio_unidad]
      ,[estado]
      ,[Fecha_pedido]
      ,[Fecha_esperada]
      ,[Fecha_entrega]
FROM [DMPedidos].[dbo].[FACT_Pedido] 
WHERE ID_producto = 58


--Verificando la cantidad de productos que existen con la Fecha_pedido = '2006-01-17' y que el ID_producto = 58
--Son 0 filas


SELECT [ID_detalle_pedido]
      ,dp.[ID_pedido]
      ,[ID_producto]
      ,[cantidad]
      ,[precio_unidad]
      ,[numero_linea]
	  ,p.Fecha_pedido
FROM [jardineria].[dbo].[detalle_pedido] dp
LEFT JOIN [jardineria].[dbo].[pedido] p ON dp.ID_pedido = p.ID_pedido
WHERE dp.ID_producto = 58 AND p.Fecha_pedido = '2006-01-17'

SELECT [ID_pedido]
      ,[ID_producto]
      ,[ID_empleado]
      ,[ID_oficina]
      ,[ID_cliente]
      ,[cantidad]
      ,[precio_unidad]
      ,[estado]
      ,[Fecha_pedido]
      ,[Fecha_esperada]
      ,[Fecha_entrega]
FROM [DMPedidos].[dbo].[FACT_Pedido] 
WHERE ID_producto = 58 AND Fecha_pedido = '2006-01-17'


--Verificando la cantidad de productos que existen con la Fecha_pedido = '2006-01-17' 
--Son 4 filas

SELECT [ID_detalle_pedido]
      ,dp.[ID_pedido]
      ,[ID_producto]
      ,[cantidad]
      ,[precio_unidad]
      ,[numero_linea]
	  ,p.Fecha_pedido
FROM [jardineria].[dbo].[detalle_pedido] dp
LEFT JOIN [jardineria].[dbo].[pedido] p ON dp.ID_pedido = p.ID_pedido
WHERE p.Fecha_pedido = '2006-01-17'

SELECT [ID_pedido]
      ,[ID_producto]
      ,[ID_empleado]
      ,[ID_oficina]
      ,[ID_cliente]
      ,[cantidad]
      ,[precio_unidad]
      ,[estado]
      ,[Fecha_pedido]
      ,[Fecha_esperada]
      ,[Fecha_entrega]
FROM [DMPedidos].[dbo].[FACT_Pedido] 
WHERE Fecha_pedido = '2006-01-17'
