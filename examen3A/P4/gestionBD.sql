create user XabierArtola identified by 'examen';
grant select on xabiera.* to XabierArtola;
grant update (LOCALIDAD) on xabiera.CLIENTES to XabierArtola;
create user UsuarioExterno identified by 'externo';
grant select, insert, update, delete on xabiera.* to UsuarioExterno;
grant select, insert, update, delete ON xabiera.* to UsuarioExterno @'10.18.124.89';
