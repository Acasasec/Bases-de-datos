select * from clientes;
select * from pedidos;
select * from productos;
select * from historia_pedidos;


create table HISTORIA_PEDIDOS(
	n_ped integer(4),
	n_cli integer(4),
	a_pagar integer(8),
	primary key(n_ped)
);



delimiter |
create trigger OtroPedido after insert on pedidos
for each row begin
	insert into historia_pedidos (n_ped, n_cli, a_pagar)
		values
			((select max(pedido_no) from pedidos),
			(select cliente_no from clientes),
			(select pe.unidades * pr.precio_actual from pedidos pe inner join productos pr));
	update clientes
		set debe=(debe+historia_pedidos.a_pagar)
		where historia_pedidos.n_cli=clientes.CLIENTE_NO;
end;
|
delimiter ;

drop trigger OtroPedido;


insert into pedidos	values (1018, 20, 102, 3, 2005-12-27);

