--creación de tablas
CREATE TABLE IF NOT EXISTS employees(
	id INT NOT NULL,
	name VARCHAR(250),
	married BOOLEAN,
	genre CHAR(1),
	salary NUMERIC(9,2), 
	birth_date DATE,
	start_at TIME
);

-- Insertar datos en una tabla (strings only with ' ')
INSERT INTO employees (id, name, married, genre, salary, birth_date, start_at) 
VALUES (1, 'Borja', FALSE, 'M', 29999.99, '1994-07-15', '08:00');

INSERT INTO employees (id, name, married, genre, salary, birth_date, start_at) 
VALUES (2, 'Johanna', TRUE, 'F', 39999.99, '1999-12-04', '08:30');
-- Agregar columnas a la tabla (borrar es DROP COLUMN)

ALTER TABLE employees ADD COLUMN email VARCHAR(100) UNIQUE  -- hace que el campo sea único

-- Identificador (añade nuevo id automaticamente) como primary key
CREATE TABLE IF NOT EXISTS employees(
	id SERIAL PRIMARY KEY,
	name VARCHAR(250) NOT NULL  --se tiene que añadir un nombre siempre,
	married BOOLEAN,
	genre CHAR(1),
	salary NUMERIC(9,2) CHECK (salary > 0),  -- se restringe a que el salario sea mayor que 0 (o salary > 12000 por ejem.) 
	birth_date DATE,
	start_at TIME
);

INSERT INTO employees (name, married, genre, salary, birth_date, start_at) 
VALUES ('Borja', FALSE, 'M', 29999.99, '1994-07-15', '08:00');
INSERT INTO employees (name, married, genre, salary, birth_date, start_at) 
VALUES ('Johanna', TRUE, 'F', 39999.99, '1999-12-04', '08:30');

-- Ver datos de una tabla
SELECT * FROM employees
SELECT * FROM employees WHERE id = 2
SELECT * FROM employees WHERE married = TRUE and salary > 10000

-- Renombrar tabla
ALTER TABLE employees RENAME TO employees_2023;
ALTER TABLE employees_2023 RENAME TO employees

-- Borrar tabla
DROP TABLE IF EXISTS employees