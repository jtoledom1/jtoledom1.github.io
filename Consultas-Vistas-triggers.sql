use aerolinea;

select HoraLlegada from Horarios H
Join Vuelos V
on H.id_Horario=V.id_Horario
Where HoraLlegada like '17%'; --Se consultan los vuelos que lleguen a las 17 hrs sin importar los minutos

select H.Fecha,h.HoraPartida from Horarios H
Join Vuelos V
on H.id_Horario=V.id_Horario
Where HoraPartida like '17%' 
and Fecha between '2024-04-28' and '2024-04-30'; --Se consultan vuelos que lleguen a las 17 hrs, en un rango de días

select H.id_Horario,h.fecha from Horarios H
Join Vuelos V
on H.id_Horario=V.id_Horario
Where H.id_Horario like '%2%'; --Se consultan  los vuelos cuyo id de horario contenga un 2 en cualquier posición

select H.id_Horario,h.fecha from Horarios H
Join Vuelos V
on H.id_Horario=V.id_Horario
Where H.id_Horario like '%2%'
and Fecha between '2024-04-01' and '2024-04-30';--Se consultan  los vuelos cuyo id de horario contenga un 2 en cualquier posición, cuya fecha este en Abril

Select V.Id_Vuelo, C.Ciudad_destino, C.Ciudad_partida from Vuelos V
Join Detalle_CiudVuelos DCV
on v.Id_Vuelo=DCV.Id_Vuelo
Join Ciudades C
on DCV.Id_Ciudad=c.id_Ciudad; --Se consultan  los vuelos y las ciudades a las que van

Select V.Id_Vuelo, v.costo,C.Ciudad_destino, C.Ciudad_partida from Vuelos V
Join Detalle_CiudVuelos DCV
on v.Id_Vuelo=DCV.Id_Vuelo
Join Ciudades C
on DCV.Id_Ciudad=c.id_Ciudad; --Se consultan los precios de los vuelos y a dónde van

select CA.Categoria,ca.AsientosDisponibles, CA.CostoAd, A.Mod_Avion from CategoriasAsientos CA, Aviones A
Where CA.id_Avion=A.id_Avion; --Se consultan los asientos disponibles por avión

Select V.Id_Vuelo, costo,Aerolinea,TipoVuelo,Ciudad_destino,Ciudad_Partida,Categoria,CostoAd,AsientosDisponibles,Mod_Avion 
from Vuelos V, Detalle_CiudVuelos DCV, Ciudades C, CategoriasAsientos CA, Aviones A
Where v.Id_Vuelo=DCV.Id_Vuelo and DCV.Id_Ciudad=c.id_Ciudad and CA.id_Avion=A.id_Avion and CA.Id_Vuelo=V.Id_Vuelo
AND v.Id_Vuelo=1;--Selecciona INFORMACIÓN DE UN VUELO ESPECÍFICO

Select V.Id_Vuelo, costo,Aerolinea,TipoVuelo,Ciudad_destino,Ciudad_Partida,Categoria,CostoAd,AsientosDisponibles,Mod_Avion 
from Vuelos V, Detalle_CiudVuelos DCV, Ciudades C, CategoriasAsientos CA, Aviones A
Where v.Id_Vuelo=DCV.Id_Vuelo and DCV.Id_Ciudad=c.id_Ciudad and CA.id_Avion=A.id_Avion and CA.Id_Vuelo=V.Id_Vuelo
AND Categoria='Ejecutiva';--Selecciona los vuelos cuyos espacios sean específicos a la categoría del vuelo

Select V.Aerolinea,V.Id_Vuelo  from Vuelos V Join CategoriasAsientos CA
on CA.Id_Vuelo= V.Id_Vuelo;--Selecciona las aerolineas que tienen categorias de asientos

Create View View_vuelo_Aerolinea With encryption as
Select V.Aerolinea,V.Id_Vuelo  from Vuelos V Join CategoriasAsientos CA
on CA.Id_Vuelo= V.Id_Vuelo
Where Categoria='Ejecutiva';--Selecciona aerolineas con vuelos Ejecutivos

Create View View_Detalles_Vuelo With encryption as
Select c.Ciudad_Partida,C.Ciudad_destino,H.Fecha,V.costo from Vuelos V,Horarios H, Detalle_CiudVuelos DCV,Ciudades C
WHere
H.id_Horario=V.id_Horario AND
v.Id_Vuelo=DCV.Id_Vuelo AND
DCV.Id_Ciudad=c.id_Ciudad;--Selecciona detalles importantes/generales correspondientes a los vuelos 

Create View View_Llegada_17hrs With encryption as
select v.Id_Vuelo from Horarios H
Join Vuelos V
on H.id_Horario=V.id_Horario
Where HoraLlegada like '17%';--vuelos que llegan a las 17hrs

Create View View_primeraclase With encryption as
Select V.Aerolinea,V.Id_Vuelo, AsientosDisponibles,H.Fecha,H.HoraPartida  from Vuelos V Join CategoriasAsientos CA
on CA.Id_Vuelo= V.Id_Vuelo
join Horarios H
on H.id_Horario=v.id_Horario
where 
Categoria='Primera Clase';--Selecciona informacion de la primera clase 

Create View View_ClaseEjecutiva With encryption as
Select V.Aerolinea,V.Id_Vuelo, AsientosDisponibles,H.Fecha,H.HoraPartida  from Vuelos V Join CategoriasAsientos CA
on CA.Id_Vuelo= V.Id_Vuelo
join Horarios H
on H.id_Horario=v.id_Horario
where 
Categoria='Ejecutiva';--Selecciona informacion de la clase ejecutiva

Create Trigger TriggerActualizarUsuario
On Usuarios
After Update
As RAISERROR('Se modificó al usuario',16, 10);

Create Trigger TriggerInsertarUsuario
On Usuarios
After insert
as
Print 'Se insertó al usuario';

Create Trigger TriggerEliminarUsuario
On Usuarios
After delete
as
Print 'Se eliminó al usuario';

Create Trigger TriggerInsertarVuelo
On vuelos
After insert
as
Print 'Se insertó el vuelo'
;

select OBJECT_NAME(parent_id) as Parent_Object_Name,* from sys.triggers --consulta los triggers de una BD 