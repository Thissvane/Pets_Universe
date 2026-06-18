DROP DATABASE IF EXISTS PetsUniverse;
CREATE DATABASE PetsUniverse;
USE PetsUniverse;

CREATE TABLE TipoUsuario (
    id_TipoUsuario int not null auto_increment,
    nombreTipo varchar(50),
    descripcion varchar (45),
    primary key (id_TipoUsuario)
);

CREATE TABLE TipoDocumento (
    id_TipoDocumento int not null auto_increment,
    nombreTipo varchar(50),
    descripcion varchar (45),
    primary key (id_TipoDocumento)
);

CREATE TABLE Especie (
    id_Especie int not null auto_increment,
    nombreEspecie varchar(50),
    descripcion varchar (45),
    primary key (id_Especie)
);

CREATE TABLE TipoServicio (
    id_TipoServicio int not null auto_increment,
    codigo varchar(45),
    descripcion varchar(45),
    primary key (id_TipoServicio)
);

CREATE TABLE Estados (
    id_Estados int not null auto_increment,
    nombreEstados varchar(45),
    primary key (id_Estados)
);

CREATE TABLE Horario (
    id_Horario int not null auto_increment,
    diaSemana int,
    HoraInicio time,
    HoraFin time,
    primary key (id_Horario)
);

CREATE TABLE TipoNotificacion (
    id_TipoNotificacion int not null auto_increment,
    codigo varchar(45),
    nombreTipo varchar(50),
    descripcion varchar (45),
    primary key (id_TipoNotificacion)
);

CREATE TABLE Raza (
    id_Raza INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(45),
    Descripcion VARCHAR(45),
    id_Especie INT NOT NULL,
    PRIMARY KEY (id_Raza),
    FOREIGN KEY (id_Especie) REFERENCES Especie(id_Especie)
);

CREATE TABLE Usuario (
    id_Usuario INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(45),
    Apellidos VARCHAR(45),
    NumDocumentoIdentidad VARCHAR(20),
    NumTelefono VARCHAR(10),
    Email VARCHAR(45),
    Clave VARCHAR(45),
    id_TipoDocumento INT NOT NULL,
    id_TipoUsuario INT NOT NULL,
    PRIMARY KEY (id_Usuario),
    FOREIGN KEY (id_TipoDocumento) REFERENCES TipoDocumento(id_TipoDocumento),
    FOREIGN KEY (id_TipoUsuario) REFERENCES TipoUsuario(id_TipoUsuario)
);

CREATE TABLE Servicio (
    id_Servicio INT NOT NULL AUTO_INCREMENT,
    Descripcion VARCHAR(45),
    DuracionEstimada INT,
    Activo TINYINT,
    id_TipoServicio INT NOT NULL,
    PRIMARY KEY (id_Servicio),
    FOREIGN KEY (id_TipoServicio) REFERENCES TipoServicio(id_TipoServicio)
);

CREATE TABLE Mascota (
    id_Mascota INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(20),
    Edad VARCHAR(10),
    Peso VARCHAR(45),
    id_Raza INT NOT NULL,
    id_Usuario INT NOT NULL,
    PRIMARY KEY (id_Mascota),
    FOREIGN KEY (id_Raza) REFERENCES Raza(id_Raza),
    FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario)
);

CREATE TABLE Veterinario (
    id_Veterinario INT NOT NULL AUTO_INCREMENT,
    Especialidad VARCHAR(45),
    NumLicencia VARCHAR(45),
    FirmaDigital VARCHAR(45),
    id_Usuario INT NOT NULL,
    id_Horario INT NOT NULL,
    PRIMARY KEY (id_Veterinario),
    FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario),
    FOREIGN KEY (id_Horario) REFERENCES Horario(id_Horario)
);

CREATE TABLE Cita (
    id_Cita INT NOT NULL AUTO_INCREMENT,
    Fecha DATE,
    Hora TIME,
    Status_autorizacion TINYINT,
    observaciones_tesoreria VARCHAR(200),
    id_Usuario INT NOT NULL,
    id_Servicio INT NOT NULL,
    id_Estados INT NOT NULL,
    id_Veterinario INT NOT NULL,
    PRIMARY KEY (id_Cita),
    FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario),
    FOREIGN KEY (id_Servicio) REFERENCES Servicio(id_Servicio),
    FOREIGN KEY (id_Estados) REFERENCES Estados(id_Estados),
    FOREIGN KEY (id_Veterinario) REFERENCES Veterinario(id_Veterinario)
);

CREATE TABLE Notificacion (
    id_Notificacion INT NOT NULL AUTO_INCREMENT,
    Asunto VARCHAR(200),
    Mensaje VARCHAR(45),
    id_TipoNotificacion INT NOT NULL,
    id_Cita INT NOT NULL,
    PRIMARY KEY (id_Notificacion),
    FOREIGN KEY (id_TipoNotificacion) REFERENCES TipoNotificacion(id_TipoNotificacion),
    FOREIGN KEY (id_Cita) REFERENCES Cita(id_Cita)
);
