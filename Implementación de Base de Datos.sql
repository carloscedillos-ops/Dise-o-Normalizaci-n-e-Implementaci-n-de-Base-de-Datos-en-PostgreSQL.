

CREATE TABLE Categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE Productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT REFERENCES Categorias(id_categoria)
);

CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);

CREATE TABLE Ventas (
    id_venta SERIAL PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT REFERENCES Clientes(id_cliente),
    total DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE Detalle_Ventas (
    id_detalle SERIAL PRIMARY KEY,
    id_venta INT REFERENCES Ventas(id_venta),
    id_producto INT REFERENCES Productos(id_producto),
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);


-- DML: Inserción de Datos (Data Manipulation Language)


-- 10 Categorías
INSERT INTO Categorias (nombre_categoria) VALUES 
('Laptops'), ('Smartphones'), ('Monitores'), ('Teclados'), ('Mouses'), 
('Audio'), ('Cámaras'), ('Impresoras'), ('Cables'), ('Almacenamiento');

-- 10 Productos
INSERT INTO Productos (nombre, precio, stock, id_categoria) VALUES 
('MacBook Air', 999.99, 15, 1), ('iPhone 15', 899.00, 20, 2), 
('Monitor LG 27"', 250.00, 10, 3), ('Teclado Mecánico', 80.00, 50, 4), 
('Mouse Pro', 50.00, 40, 5), ('Airpods Pro', 249.00, 30, 6), 
('Sony Alpha', 1200.00, 5, 7), ('Epson EcoTank', 300.00, 8, 8), 
('Cable HDMI 2.1', 15.00, 100, 9), ('SSD 1TB', 110.00, 25, 10);

-- 10 Clientes
INSERT INTO Clientes (nombre, email, telefono) VALUES 
('Juan Perez', 'juan@mail.com', '123456'), ('Maria Lopez', 'maria@mail.com', '654321'),
('Carlos Ruiz', 'carlos@mail.com', '987654'), ('Ana Sosa', 'ana@mail.com', '112233'),
('Luis Diaz', 'luis@mail.com', '445566'), ('Elena Gil', 'elena@mail.com', '778899'),
('Pedro Pax', 'pedro@mail.com', '001122'), ('Sofia Mar', 'sofia@mail.com', '334455'),
('Mario Sol', 'mario@mail.com', '667788'), ('Laura Paz', 'laura@mail.com', '990011');

-- 10 Ventas
INSERT INTO Ventas (id_cliente, total) VALUES 
(1, 999.99), (2, 899.00), (3, 250.00), (4, 80.00), (5, 50.00),
(6, 249.00), (7, 1200.00), (8, 300.00), (9, 15.00), (10, 110.00);

-- 10 Detalles de Venta
INSERT INTO Detalle_Ventas (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(1, 1, 1, 999.99), (2, 2, 1, 899.00), (3, 3, 1, 250.00), (4, 4, 1, 80.00),
(5, 5, 1, 50.00), (6, 6, 1, 249.00), (7, 7, 1, 1200.00), (8, 8, 1, 300.00),
(9, 9, 1, 15.00), (10, 10, 1, 110.00);