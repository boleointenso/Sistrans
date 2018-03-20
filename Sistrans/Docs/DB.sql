DROP TABLE ALOHANDES CASCADE CONSTRAINTS;
DROP TABLE USUARIO CASCADE CONSTRAINTS;
DROP TABLE CLIENTE CASCADE CONSTRAINTS;
DROP TABLE OPERADOR CASCADE CONSTRAINTS;
DROP TABLE HOTEL CASCADE CONSTRAINTS;
DROP TABLE VIVIENDAUNIVERSITARIA CASCADE CONSTRAINTS;
DROP TABLE APARTAMENTO CASCADE CONSTRAINTS;
DROP TABLE HABITACION CASCADE CONSTRAINTS;
DROP TABLE HOSTAL CASCADE CONSTRAINTS;
DROP TABLE SERVICIOHABITACION CASCADE CONSTRAINTS;
DROP TABLE SERVICIOHOTEL CASCADE CONSTRAINTS;
DROP TABLE CONTRATO CASCADE CONSTRAINTS;
DROP TABLE PERSONANATURAL CASCADE CONSTRAINTS;
DROP TABLE HOTELOFRECE CASCADE CONSTRAINTS;
DROP TABLE HABITACIONOFRECE CASCADE CONSTRAINTS;
DROP TABLE VIVIENDA CASCADE CONSTRAINTS;

CREATE TABLE HABITACIONOFRECE 
(
  IDSERVICIOHABITACION NUMBER NOT NULL,
  IDHABITACION NUMBER NOT NULL,
  IDHABITACIONOFRECE NUMBER,
  CONSTRAINT HABITACIONOFRECE_PK PRIMARY KEY (IDHABITACIONOFRECE)
);
CREATE TABLE HOTELOFRECE 
(
  IDSERVICIOHOTEL NUMBER,
  IDHOTEL NUMBER,
  IDHOTELOFRECE NUMBER,
  CONSTRAINT HOTELOFRECE_PK PRIMARY KEY (IDHOTELOFRECE)
);
CREATE TABLE ALOHANDES 
(
  IDALOHANDES NUMBER ,
  CONSTRAINT ALOHANDES_PK PRIMARY KEY (IDALOHANDES)
);
CREATE TABLE USUARIO
(
  CONTRASENA VARCHAR2(255 BYTE) NOT NULL,
  IDUSUARIO NUMBER ,
  USUARIO varchar2(255 BYTE),
  CONSTRAINT USUARIO_PK PRIMARY KEY (IDUSUARIO)
);
CREATE TABLE OPERADOR
(
  CONTRASENA VARCHAR2(255 BYTE)  NOT NULL,
  IDOPERADOR NUMBER ,
  USUARIO VARCHAR2(255 BYTE),
  CONSTRAINT OPERADOR_PK PRIMARY KEY (IDOPERADOR)
);
CREATE TABLE CLIENTE
(
  CONTRASENA VARCHAR2(255 BYTE)  NOT NULL,
  IDCLIENTE NUMBER ,
  USUARIO VARCHAR2(255 BYTE),
  NOMBRE VARCHAR2(255 BYTE) NOT NULL,
  CONSTRAINT CLIENTE_PK PRIMARY KEY (IDCLIENTE)
);
CREATE TABLE HOTEL
(
  UBICACION VARCHAR2(255 BYTE) NOT NULL, 
  DESCRIPCION VARCHAR2(255 BYTE),
  NOMBRE VARCHAR2(255 BYTE)  NOT NULL,
  CONTRASENA VARCHAR2(255 BYTE)  NOT NULL,
  IDHOTEL NUMBER ,
  USUARIO VARCHAR2(255 BYTE),
  CONSTRAINT HOTEL_PK PRIMARY KEY (IDHOTEL)
);
CREATE TABLE VIVIENDAUNIVERSITARIA
(
  CONTRASENA VARCHAR2(255 BYTE) NOT NULL,
  IDVIVIENDAUNIVERSITARIA NUMBER ,
  NOMBRE VARCHAR2(255 BYTE)  NOT NULL,
  HORAATENCION VARCHAR2(255 BYTE)  NOT NULL,
  DESCRIPCION VARCHAR2(255 BYTE),
  USUARIO VARCHAR2(255 BYTE),
  CONSTRAINT VIVIENDAUNIVERSITARIA_PK PRIMARY KEY (IDVIVIENDAUNIVERSITARIA)
);
CREATE TABLE HOSTAL
(
  CONTRASENA VARCHAR2(255 BYTE) NOT NULL,
  IDHOSTAL NUMBER ,
  NOMBRE VARCHAR2(255 BYTE) NOT NULL,
  DESCRIPCION VARCHAR2(255 BYTE),
  HORAATENCION VARCHAR2(255 BYTE) NOT NULL, 
  UBICACION VARCHAR2(255 BYTE) NOT NULL,
  USUARIO VARCHAR2(255 BYTE),
  CONSTRAINT HOSTAL_PK PRIMARY KEY (IDHOSTAL)
);
CREATE TABLE PERSONANATURAL
(
  CONTRASENA VARCHAR2(255 BYTE) NOT NULL,
  IDPERSONANATURAL NUMBER , 
  NOMBRE VARCHAR2(255 BYTE) NOT NULL,
  UNIANDINO NUMBER NOT NULL,
  USUARIO VARCHAR2(255 BYTE),
  CHECK (0<=UNIANDINO),
  CHECK (1>=UNIANDINO),
  CONSTRAINT PESONANATURAL_PK PRIMARY KEY (IDPERSONANATURAL)
);
CREATE TABLE HABITACION
(
  PRECIO NUMBER NOT NULL,
  UBICACION VARCHAR2(255 BYTE) NOT NULL,
  TAMANO NUMBER,
  DESCRIPCION VARCHAR2(255 BYTE), 
  IDHABITACION NUMBER , 
  IDOPERADOR NUMBER NOT NULL,
  CHECK (0<PRECIO),
  CHECK (0<TAMANO),
  CONSTRAINT HABITACION_PK PRIMARY KEY (IDHABITACION)
);
CREATE TABLE CONTRATO
(  
  COSTO NUMBER NOT NULL,
  FECHAFINAL DATE NOT NULL,
  FECHAINIC Date NOT NULL,
  NOCHES NUMBER,
  DESCRIPCION VARCHAR2(255 BYTE) NOT NULL,
  IDCONTRATO NUMBER ,
  IDOPERADOR NUMBER NOT NULL,
  IDCLIENTE NUMBER NOT NULL,
  IDHABITACION NUMBER,
  IDAPARTAMENTO NUMBER,
  CHECK (FECHAINIC<FECHAINIC),
  CONSTRAINT CONTRATO_PK PRIMARY KEY (IDCONTRATO)
);
CREATE TABLE APARTAMENTO
(
  PRECIO NUMBER NOT NULL, 
  TAMANO NUMBER NOT NULL, 
  UBICACION VARCHAR2(255 BYTE) NOT NULL,
  DESCRIPCION VARCHAR2(255 BYTE),
  IDAPARTAMENTO NUMBER,
  IDPERSONANATURAL NUMBER NOT NULL,
  CHECK (0<PRECIO),
  CHECK (0<TAMANO),
  CONSTRAINT APARTAMENTO_PK PRIMARY KEY (IDAPARTAMENTO)
);
CREATE TABLE SERVICIOHABITACION
(
  DESCRIPCION VARCHAR2(255 BYTE),
  IDSERVICIOHABITACION NUMBER,
  TIPO VARCHAR2(255 BYTE) NOT NULL,
  CONSTRAINT SERVICIOHABITACION_PK PRIMARY KEY (IDSERVICIOHABITACION)
);
CREATE TABLE SERVICIOHOTEL
(
  DESCRIPCION VARCHAR2(255 BYTE),
  IDSERVICIOHOTEL NUMBER,
  TIPO VARCHAR2(255 BYTE) NOT NULL,
  CONSTRAINT SERVICIOHOTEL_PK PRIMARY KEY (IDSERVICIOHOTEL)
);
CREATE TABLE VIVIENDA
(
  DESCRIPCION VARCHAR2(255 BYTE),
  NUMEROHABITACIONES NUMBER NOT NULL,
  UBICACION VARCHAR2(255 BYTE) NOT NULL,
  MENAJE VARCHAR2(255 BYTE),
  PRECIO NUMBER NOT NULL,
  TAMANO NUMBER NOT NULL,
  IDVIVIENDA NUMBER,
  IDPERSONANATURAL NUMBER NOT NULL,
  CHECK (0<PRECIO),
  CHECK (0<NUMEROHABITACIONES),
  CHECK (0<TAMANO),
  CONSTRAINT VIVIENDA_PK PRIMARY KEY (IDVIVIENDA)
);

ALTER TABLE HABITACIONOFRECE ADD CONSTRAINT HABITACIONOFRECE_FK1 FOREIGN KEY (IDHABITACION) REFERENCES HABITACION(IDHABITACION);
ALTER TABLE HABITACIONOFRECE ADD CONSTRAINT HABITACIONOFRECE_FK2 FOREIGN KEY (IDSERVICIOHABITACION) REFERENCES SERVICIOHABITACION(IDSERVICIOHABITACION);

ALTER TABLE HOTELOFRECE ADD CONSTRAINT HOTELOFRECE_FK1 FOREIGN KEY (IDHOTEL) REFERENCES HOTEL(IDHOTEL);
ALTER TABLE HOTELOFRECE ADD CONSTRAINT HOTELOFRECE_FK2 FOREIGN KEY (IDSERVICIOHOTEL) REFERENCES SERVICIOHOTEL(IDSERVICIOHOTEL);

ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_FK1 FOREIGN KEY (IDHABITACION) REFERENCES HABITACION(IDHABITACION);

ALTER TABLE HABITACION ADD CONSTRAINT HABITACION_FK2 FOREIGN KEY (IDOPERADOR) REFERENCES OPERADOR(IDOPERADOR);

ALTER TABLE CONTRATO ADD CONSTRAINT CONTRATO_FK1 FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE);
ALTER TABLE CONTRATO ADD CONSTRAINT CONTRATO_FK2 FOREIGN KEY (IDOPERADOR) REFERENCES OPERADOR(IDOPERADOR);
ALTER TABLE CONTRATO ADD CONSTRAINT CONTRATO_FK3 FOREIGN KEY (IDHABITACION) REFERENCES HABITACION(IDHABITACION);
ALTER TABLE CONTRATO ADD CONSTRAINT CONTRATO_FK4 FOREIGN KEY (IDAPARTAMENTO) REFERENCES APARTAMENTO(IDAPARTAMENTO);

ALTER TABLE APARTAMENTO ADD CONSTRAINT APARTAMENTO_FK1 FOREIGN KEY (IDPERSONANATURAL) REFERENCES PERSONANATURAL(IDPERSONANATURAL);

ALTER TABLE VIVIENDA ADD CONSTRAINT VIVIENDA_FK1 FOREIGN KEY (IDPERSONANATURAL) REFERENCES PERSONANATURAL(IDPERSONANATURAL);

COMMIT;
