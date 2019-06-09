-- Trigger AnotarDebeClientes
DELIMITER $$ 
create trigger AnotarDebeClientes 
after insert on pedidos
for each row
begin

update productos set STOCK_DISPONIBLE = STOCK_DISPONIBLE-new.unidades where PRODUCTO_NO=new.PRODUCTO_NO;
update clientes set DEBE= DEBE+new.UNIDADES*(select PRECIO_ACTUAL from productos where PRODUCTO_NO=new.PRODUCTO_NO) where CLIENTE_NO=new.CLIENTE_NO;

end; $$
