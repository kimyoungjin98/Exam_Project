CREATE DATABASE TODO;

CREATE USER todoList@localhost identified by '1234';

GRANT all privileges on *.* to todoList@localhost;