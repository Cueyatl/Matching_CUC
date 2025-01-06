-- 1. Crear la base de datos (opcional, si no quieres hacerlo manual)
CREATE DATABASE IF NOT EXISTS TinderUniversityDB;

-- 2. Usar la base de datos
USE TinderUniversityDB;

-- 3. Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    genero VARCHAR(20) NOT NULL,                  
    carrera VARCHAR(100) NOT NULL,
    altura DECIMAL(5,2) NOT NULL,
    preferencia_sexual VARCHAR(50) NOT NULL,      
    instagram VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(200) NOT NULL
);

-- 4. Crear la tabla de likes
CREATE TABLE IF NOT EXISTS likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    usuario_likeado_id INT NOT NULL,
    fecha_like TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'pendiente',
    CONSTRAINT fk_usuario
        FOREIGN KEY (usuario_id) 
        REFERENCES usuarios (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_usuario_likeado
        FOREIGN KEY (usuario_likeado_id)
        REFERENCES usuarios (id)
        ON DELETE CASCADE
);

-- 5. Insertar datos de ejemplo
INSERT INTO usuarios (nombre, edad, genero, carrera, altura, preferencia_sexual, instagram, email, contrasena)
VALUES
('Ana Gómez', 22, 'Femenino', 'Ingeniería', 160.00, 'Hombres', 'ana_ig', 'ana@example.com', '1234'),
('Carlos Pérez', 23, 'Masculino', 'Derecho', 175.50, 'Mujeres', 'carlos_ig', 'carlos@example.com','abcd'),
('María López', 21, 'Femenino', 'Medicina', 165.30, 'Ambos', 'maria_ig', 'maria@example.com', 'hola');

INSERT INTO likes (usuario_id, usuario_likeado_id, estado)
VALUES
(1, 2, 'pendiente'),
(2, 1, 'pendiente'),
(2, 3, 'pendiente');
