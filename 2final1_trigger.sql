

create table HISTORICO_PEDIDOS(
	num_ped number(4),
	num_prod number(4),
	unidades_no_s number(8),
	primary key(num_ped)
);


create or replace trigger PedidoNuevo after insert on pedidos
for each row
declare
v_unid number(8);
v_stockDisp number(8);
v_nuevoPedido number(8);
begin
select pr.stock_disponible into v_stockDisp from productos pr inner join pedidos pe on pr.producto_no=pe.producto_no where pr.producto_no=:new.producto_no;

select :new.unidades into v_nuevoPedido from pedidos;
if v_nuevoPedido > v_stockDisp then

insert into historico_pedidos values
(:new.pedido_no, :new.producto_no, 0);
update productos set stock_disponible=stock_disponible-(select unidades from pedidos);

else
select pe.unidades-pr.stock_disponible into v_unid from productos pr inner join pedidos pe on pr.producto_no=pe.producto_no;
insert into historico_pedidos values
(:new.pedido_no, :new.producto_no, v_unid);
update productos set stock_disponible=0;

end if;
end;
