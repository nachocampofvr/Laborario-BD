
--Laboratorio 1

CREATE TABLE Municipio
(
  Cod_Municipio VARCHAR NOT NULL,
  Abreviatura VARCHAR NOT NULL,
  Latitud VARCHAR NOT NULL,
  Longitud INT NOT NULL,
  PRIMARY KEY (Cod_Municipio)
);

CREATE TABLE Nacionalidad
(
  Código_ISO INT NOT NULL,
  PRIMARY KEY (Código_ISO)
);

CREATE TABLE Personas
(
  NIF VARCHAR NOT NULL,
  Fecha_Nacimiento DATE NOT NULL,
  Nombre VARCHAR NOT NULL,
  Apellido_1 VARCHAR NOT NULL,
  Apellido_2 VARCHAR NOT NULL,
  Sexo CHAR NOT NULL,
  Cod_Municipio VARCHAR NOT NULL,
  Cód._catastro VARCHAR NOT NULL,
  Ser_Cabeza_Familia_NIF VARCHAR NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (Cod_Municipio) REFERENCES Municipio(Cod_Municipio),
  FOREIGN KEY (Cód._catastro) REFERENCES Vivienda(Cód._catastro),
  FOREIGN KEY (Ser_Cabeza_Familia_NIF) REFERENCES Personas(NIF)
);

CREATE TABLE Vivienda
(
  Orientación VARCHAR NOT NULL,
  Nº_de_habitaciones INT NOT NULL,
  Superficie VARCHAR NOT NULL,
  Cód._catastro VARCHAR NOT NULL,
  Portal INT NOT NULL,
  Nº INT NOT NULL,
  Calle VARCHAR NOT NULL,
  Altura INT NOT NULL,
  Letra INT NOT NULL,
  Cód._postal VARCHAR NOT NULL,
  Cód._registral VARCHAR NOT NULL,
  NIF VARCHAR NOT NULL,
  PRIMARY KEY (Cód._catastro),
  FOREIGN KEY (NIF) REFERENCES Personas(NIF)
);

CREATE TABLE Proviene_de
(
  Código_ISO INT NOT NULL,
  NIF VARCHAR NOT NULL,
  PRIMARY KEY (Código_ISO, NIF),
  FOREIGN KEY (Código_ISO) REFERENCES Nacionalidad(Código_ISO),
  FOREIGN KEY (NIF) REFERENCES Personas(NIF)
);


--Laboratorio 2

CREATE TABLE Alumno
(
  Num_Matrícula VARCHAR NOT NULL,
  FechaNacimiento DATE NOT NULL,
  Teléfono INT NOT NULL,
  Nombre VARCHAR NOT NULL,
  PRIMARY KEY (Num_Matrícula)
);

CREATE TABLE Profesor
(
  Id_P VARCHAR NOT NULL,
  NIF_P VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  Apellido1 VARCHAR NOT NULL,
  Apellido2 VARCHAR NOT NULL,
  Especialidad VARCHAR NOT NULL,
  Teléfono INT NOT NULL,
  PRIMARY KEY (Id_P)
);

CREATE TABLE Asignatura
(
  Código_Asignatura VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  Apellido1 VARCHAR NOT NULL,
  Apellido2 VARCHAR NOT NULL,
  Id_P VARCHAR NOT NULL,
  PRIMARY KEY (Código_Asignatura),
  FOREIGN KEY (Id_P) REFERENCES Profesor(Id_P)
);

CREATE TABLE Matricular
(
  FechaMatricula INT NOT NULL,
  Num_Matrícula VARCHAR NOT NULL,
  Código_Asignatura VARCHAR NOT NULL,
  PRIMARY KEY (FechaMatricula),
  FOREIGN KEY (Num_Matrícula) REFERENCES Alumno(Num_Matrícula),
  FOREIGN KEY (Código_Asignatura) REFERENCES Asignatura(Código_Asignatura),
  UNIQUE (Num_Matrícula, Código_Asignatura)
);

-- Laboratorio 3

CREATE TABLE Región
(
  Id.R VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  PRIMARY KEY (Id.R)
);

CREATE TABLE Provincia
(
  CódigoProvincia VARCHAR NOT NULL,
  Nombre_provincia VARCHAR NOT NULL,
  Id.R VARCHAR NOT NULL,
  PRIMARY KEY (CódigoProvincia),
  FOREIGN KEY (Id.R) REFERENCES Región(Id.R)
);

CREATE TABLE Localidad
(
  Código_localidad VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  CódigoProvincia VARCHAR NOT NULL,
  PRIMARY KEY (Código_localidad),
  FOREIGN KEY (CódigoProvincia) REFERENCES Provincia(CódigoProvincia)
);

CREATE TABLE Empleados
(
  Id_e VARCHAR NOT NULL,
  DNI-e VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  Teléfono INT NOT NULL,
  Salario INT NOT NULL,
  Código_localidad VARCHAR NOT NULL,
  PRIMARY KEY (Id_e),
  FOREIGN KEY (Código_localidad) REFERENCES Localidad(Código_localidad)
);

-- Laboratorio 4

CREATE TABLE Departamento
(
  Código_D VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  Localización VARCHAR NOT NULL,
  PRIMARY KEY (Código_D)
);

CREATE TABLE Empleado
(
  ID_E VARCHAR NOT NULL,
  DNI_E VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  Teléfono INT NOT NULL,
  Salario INT NOT NULL,
  Código_D VARCHAR NOT NULL,
  Ser_Jefe_ID_E VARCHAR NOT NULL,
  PRIMARY KEY (ID_E),
  FOREIGN KEY (Código_D) REFERENCES Departamento(Código_D),
  FOREIGN KEY (Ser_Jefe_ID_E) REFERENCES Empleado(ID_E)
);

-- Laboratorio 5

CREATE TABLE Equipo_industrial
(
  Código VARCHAR NOT NULL,
  NIF VARCHAR NOT NULL,
  NIF VARCHAR NOT NULL,
  PRIMARY KEY (Código),
  FOREIGN KEY (NIF) REFERENCES Instalador(NIF),
  FOREIGN KEY (NIF) REFERENCES Cliente(NIF)
);

CREATE TABLE Instalador
(
  NIF VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  Dirección VARCHAR NOT NULL,
  Teléfono INT NOT NULL,
  Número INT NOT NULL,
  Código VARCHAR NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (Código) REFERENCES Equipo_industrial(Código)
);

CREATE TABLE Cliente
(
  NIF VARCHAR NOT NULL,
  Dirección VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  Teléfono INT NOT NULL,
  Fecha DATE NOT NULL,
  Código VARCHAR NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (Código) REFERENCES Equipo_industrial(Código)
);

-- Laboratorio 6

CREATE TABLE Empleados
(
  Datos_personales VARCHAR NOT NULL,
  DNI VARCHAR NOT NULL,
  Tlf INT NOT NULL,
  PRIMARY KEY (DNI)
);

CREATE TABLE Periodistas
(
  Datos_personales VARCHAR NOT NULL,
  Dni VARCHAR NOT NULL,
  tlf INT NOT NULL,
  especialidad VARCHAR NOT NULL,
  PRIMARY KEY (Dni)
);

CREATE TABLE Sucursales
(
  Domicilio VARCHAR NOT NULL,
  tlf INT NOT NULL,
  CodSucursal VARCHAR NOT NULL,
  DNI VARCHAR NOT NULL,
  PRIMARY KEY (CodSucursal),
  FOREIGN KEY (DNI) REFERENCES Empleados(DNI)
);

CREATE TABLE Revistas
(
  Fecha DATE NOT NULL,
  Nºejemplares INT NOT NULL,
  Nºpaginas INT NOT NULL,
  Periodicidad INT NOT NULL,
  Titulo VARCHAR NOT NULL,
  Nºregistro INT NOT NULL,
  CodSucursal VARCHAR NOT NULL,
  PRIMARY KEY (Nºregistro),
  FOREIGN KEY (CodSucursal) REFERENCES Sucursales(CodSucursal)
);

CREATE TABLE Escriben
(
  Nºregistro INT NOT NULL,
  Dni VARCHAR NOT NULL,
  PRIMARY KEY (Nºregistro, Dni),
  FOREIGN KEY (Nºregistro) REFERENCES Revistas(Nºregistro),
  FOREIGN KEY (Dni) REFERENCES Periodistas(Dni)
);

-- Laboratorio 7

CREATE TABLE Producto
(
  IDunico VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  Precioactual FLOAT NOT NULL,
  stock INT NOT NULL,
  nombreproveedor VARCHAR NOT NULL,
  PRIMARY KEY (IDunico)
);

CREATE TABLE Ventas
(
  id VARCHAR NOT NULL,
  fecha DATE NOT NULL,
  cliente VARCHAR NOT NULL,
  descuento INT NOT NULL,
  monto_final INT NOT NULL,
  IDunico VARCHAR NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (IDunico) REFERENCES Producto(IDunico)
);

CREATE TABLE Categoria
(
  id VARCHAR NOT NULL,
  nombre VARCHAR NOT NULL,
  descripción VARCHAR NOT NULL,
  IDunico VARCHAR NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (IDunico) REFERENCES Producto(IDunico)
);

CREATE TABLE Proveedor
(
  Codunico VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  Direccion VARCHAR NOT NULL,
  tlf INT NOT NULL,
  pag_web VARCHAR NOT NULL,
  IDunico VARCHAR NOT NULL,
  PRIMARY KEY (Codunico),
  FOREIGN KEY (IDunico) REFERENCES Producto(IDunico)
);

CREATE TABLE cliente
(
  Comunico VARCHAR NOT NULL,
  nombre VARCHAR NOT NULL,
  dirección VARCHAR NOT NULL,
  id VARCHAR NOT NULL,
  PRIMARY KEY (nombre),
  FOREIGN KEY (id) REFERENCES Ventas(id)
);

CREATE TABLE cliente_telefonos
(
  telefonos INT NOT NULL,
  nombre VARCHAR NOT NULL,
  PRIMARY KEY (telefonos, nombre),
  FOREIGN KEY (nombre) REFERENCES cliente(nombre)
);

-- Laboratorio 8

CREATE TABLE Profesor
(
  NIF VARCHAR NOT NULL,
  Fecha_Nacimiento DATE NOT NULL,
  Nacionalidad VARCHAR NOT NULL,
  Sexo CHAR NOT NULL,
  Nº_de_hijos INT NOT NULL,
  Salario FLOAT NOT NULL,
  Acreditación VARCHAR NOT NULL,
  PRIMARY KEY (NIF)
);

CREATE TABLE Curso
(
  Código_de_curso VARCHAR NOT NULL,
  Denominacion VARCHAR NOT NULL,
  Descripción VARCHAR NOT NULL,
  Nº_horas INT NOT NULL,
  Coste FLOAT NOT NULL,
  NIF VARCHAR NOT NULL,
  PRIMARY KEY (Código_de_curso),
  FOREIGN KEY (NIF) REFERENCES Profesor(NIF)
);

CREATE TABLE Prerrequisito
(
  Estudios VARCHAR NOT NULL,
  Código_de_curso VARCHAR,
  PRIMARY KEY (Estudios),
  FOREIGN KEY (Código_de_curso) REFERENCES Curso(Código_de_curso)
);

CREATE TABLE Alumnos
(
  NIF VARCHAR NOT NULL,
  Edad INT NOT NULL,
  Código_de_curso VARCHAR NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (Código_de_curso) REFERENCES Curso(Código_de_curso)
);

CREATE TABLE Recomendación
(
  Estudios VARCHAR NOT NULL,
  PRIMARY KEY (Estudios),
  FOREIGN KEY (Estudios) REFERENCES Prerrequisito(Estudios)
);

CREATE TABLE Obligatorio
(
  Estudios VARCHAR NOT NULL,
  PRIMARY KEY (Estudios),
  FOREIGN KEY (Estudios) REFERENCES Prerrequisito(Estudios)
);

CREATE TABLE Edición
(
  Código_de_Edición VARCHAR NOT NULL,
  Lugar VARCHAR NOT NULL,
  Fecha DATE NOT NULL,
  Formato INT NOT NULL,
  Horario INT NOT NULL,
  Numero_de_horas INT NOT NULL,
  Código_de_curso VARCHAR NOT NULL,
  PRIMARY KEY (Código_de_curso),
  FOREIGN KEY (Código_de_curso) REFERENCES Curso(Código_de_curso),
  UNIQUE (Código_de_Edición)
);

-- Laboratorio 9

CREATE TABLE Motorizaciones
(
  Coste_ FLOAT NOT NULL,
  PRIMARY KEY (Coste_)
);

CREATE TABLE Gasolina
(
  Coste_ FLOAT NOT NULL,
  PRIMARY KEY (Coste_),
  FOREIGN KEY (Coste_) REFERENCES Motorizaciones(Coste_)
);

CREATE TABLE Eléctrico
(
  Coste_ FLOAT NOT NULL,
  PRIMARY KEY (Coste_),
  FOREIGN KEY (Coste_) REFERENCES Motorizaciones(Coste_)
);

CREATE TABLE Diesel
(
  Coste_ FLOAT NOT NULL,
  PRIMARY KEY (Coste_),
  FOREIGN KEY (Coste_) REFERENCES Motorizaciones(Coste_)
);

CREATE TABLE Gas
(
  Coste_ FLOAT NOT NULL,
  PRIMARY KEY (Coste_),
  FOREIGN KEY (Coste_) REFERENCES Motorizaciones(Coste_)
);

CREATE TABLE Hidrógeno
(
  Coste_ FLOAT NOT NULL,
  PRIMARY KEY (Coste_),
  FOREIGN KEY (Coste_) REFERENCES Motorizaciones(Coste_)
);

-- Laboratorio 10

CREATE TABLE Medios_de_Transporte
(
  Antigüedad INT NOT NULL,
  PRIMARY KEY (Antigüedad)
);

CREATE TABLE Terrestre
(
  Antigüedad INT NOT NULL,
  PRIMARY KEY (Antigüedad),
  FOREIGN KEY (Antigüedad) REFERENCES Medios_de_Transporte(Antigüedad)
);

CREATE TABLE Anfibio
(
  FechaNac DATE NOT NULL,
  PRIMARY KEY (FechaNac)
);

CREATE TABLE Aeroterrestre
(
  FechaNac DATE NOT NULL,
  Antigüedad INT NOT NULL,
  PRIMARY KEY (FechaNac),
  FOREIGN KEY (Antigüedad) REFERENCES Terrestre(Antigüedad)
);

CREATE TABLE Aéreo
(
  Longitud INT NOT NULL,
  Antigüedad INT NOT NULL,
  FechaNac DATE NOT NULL,
  PRIMARY KEY (Antigüedad),
  FOREIGN KEY (Antigüedad) REFERENCES Medios_de_Transporte(Antigüedad),
  FOREIGN KEY (FechaNac) REFERENCES Aeroterrestre(FechaNac),
  UNIQUE (Longitud)
);

CREATE TABLE Acuático
(
  Longitud INT NOT NULL,
  Antigüedad INT NOT NULL,
  FechaNac DATE NOT NULL,
  PRIMARY KEY (Antigüedad),
  FOREIGN KEY (Antigüedad) REFERENCES Medios_de_Transporte(Antigüedad),
  FOREIGN KEY (FechaNac) REFERENCES Anfibio(FechaNac),
  UNIQUE (Longitud)
);

-- Laboratorio 11

CREATE TABLE Documentos_Administrativos
(
  Código_Documentos.A INT NOT NULL,
  PRIMARY KEY (Código_Documentos.A)
);

CREATE TABLE Curso
(
  CodCurso INT NOT NULL,
  PRIMARY KEY (CodCurso)
);

CREATE TABLE Matrícula
(
  Codigo_de_matrícula VARCHAR NOT NULL,
  CodCurso INT NOT NULL,
  PRIMARY KEY (Codigo_de_matrícula),
  FOREIGN KEY (CodCurso) REFERENCES Curso(CodCurso)
);

CREATE TABLE Pago
(
  Código_Pago VARCHAR NOT NULL,
  Importe FLOAT NOT NULL,
  Codigo_de_matrícula VARCHAR NOT NULL,
  PRIMARY KEY (Código_Pago),
  FOREIGN KEY (Codigo_de_matrícula) REFERENCES Matrícula(Codigo_de_matrícula)
);

CREATE TABLE Alumno
(
  NIF INT NOT NULL,
  Código_Documentos.A INT NOT NULL,
  Codigo_de_matrícula VARCHAR NOT NULL,
  CodCurso INT NOT NULL,
  Código_Pago VARCHAR NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (Código_Documentos.A) REFERENCES Documentos_Administrativos(Código_Documentos.A),
  FOREIGN KEY (Codigo_de_matrícula) REFERENCES Matrícula(Codigo_de_matrícula),
  FOREIGN KEY (CodCurso) REFERENCES Curso(CodCurso),
  FOREIGN KEY (Código_Pago) REFERENCES Pago(Código_Pago)
);

CREATE TABLE Tarjeta_Identidad
(
  Codigo_Tarjeta VARCHAR NOT NULL,
  NIF INT NOT NULL,
  PRIMARY KEY (Codigo_Tarjeta),
  FOREIGN KEY (NIF) REFERENCES Alumno(NIF)
);

CREATE TABLE Grado
(
  Código_de_Grado INT NOT NULL,
  NIF INT NOT NULL,
  PRIMARY KEY (Código_de_Grado),
  FOREIGN KEY (NIF) REFERENCES Alumno(NIF)
);

-- Laboratorio 12

CREATE TABLE Criptomoneda
(
  Codigo_Criptomoneda INT NOT NULL,
  PRIMARY KEY (Codigo_Criptomoneda)
);

CREATE TABLE Registro
(
  CodRegistro VARCHAR NOT NULL,
  PRIMARY KEY (CodRegistro)
);

CREATE TABLE Transacciones_Digitales
(
  Código_T.Digital VARCHAR NOT NULL,
  PRIMARY KEY (Código_T.Digital)
);

CREATE TABLE Ingresos
(
  Código_T.Digital VARCHAR NOT NULL,
  PRIMARY KEY (Código_T.Digital),
  FOREIGN KEY (Código_T.Digital) REFERENCES Transacciones_Digitales(Código_T.Digital)
);

CREATE TABLE Intercambios
(
  Código_T.Digital VARCHAR NOT NULL,
  PRIMARY KEY (Código_T.Digital),
  FOREIGN KEY (Código_T.Digital) REFERENCES Transacciones_Digitales(Código_T.Digital)
);

CREATE TABLE Pagos
(
  Código_T.Digital VARCHAR NOT NULL,
  PRIMARY KEY (Código_T.Digital),
  FOREIGN KEY (Código_T.Digital) REFERENCES Transacciones_Digitales(Código_T.Digital)
);

CREATE TABLE Algoritmo
(
  Código_Algoritmo VARCHAR NOT NULL,
  PRIMARY KEY (Código_Algoritmo)
);

CREATE TABLE Wallet
(
  Clave_Pública VARCHAR NOT NULL,
  Clave_Privada VARCHAR NOT NULL,
  CodRegistro VARCHAR NOT NULL,
  PRIMARY KEY (Clave_Pública),
  FOREIGN KEY (CodRegistro) REFERENCES Registro(CodRegistro)
);

CREATE TABLE Propietario
(
  Clave_Pública VARCHAR NOT NULL,
  Codigo_Criptomoneda INT NOT NULL,
  PRIMARY KEY (Clave_Pública),
  FOREIGN KEY (Clave_Pública) REFERENCES Wallet(Clave_Pública),
  FOREIGN KEY (Codigo_Criptomoneda) REFERENCES Criptomoneda(Codigo_Criptomoneda)
);

CREATE TABLE Usuario
(
  Clave_Pública VARCHAR NOT NULL,
  CodRegistro VARCHAR NOT NULL,
  PRIMARY KEY (Clave_Pública),
  FOREIGN KEY (Clave_Pública) REFERENCES Wallet(Clave_Pública),
  FOREIGN KEY (CodRegistro) REFERENCES Registro(CodRegistro)
);

-- Laboratorio 13

CREATE TABLE Motor
(
  ID_Motor VARCHAR NOT NULL,
  PRIMARY KEY (ID_Motor)
);

CREATE TABLE Híbrido
(
  Consumo INT NOT NULL,
  Autonomía INT NOT NULL,
  ID_Motor VARCHAR NOT NULL,
  PRIMARY KEY (ID_Motor),
  FOREIGN KEY (ID_Motor) REFERENCES Motor(ID_Motor)
);

CREATE TABLE Térmico
(
  Consumo INT NOT NULL,
  ID_Motor VARCHAR NOT NULL,
  PRIMARY KEY (ID_Motor),
  FOREIGN KEY (ID_Motor) REFERENCES Motor(ID_Motor)
);

CREATE TABLE Eléctrico
(
  Autonomia INT NOT NULL,
  ID_Motor VARCHAR NOT NULL,
  PRIMARY KEY (ID_Motor),
  FOREIGN KEY (ID_Motor) REFERENCES Motor(ID_Motor)
);

CREATE TABLE Fabricante
(
  FechaNac DATE NOT NULL,
  PRIMARY KEY (FechaNac)
);

CREATE TABLE Escudería
(
  CodEscudería VARCHAR NOT NULL,
  PRIMARY KEY (CodEscudería)
);

CREATE TABLE Fabricar
(
  FechaNac DATE NOT NULL,
  ID_Motor VARCHAR NOT NULL,
  PRIMARY KEY (FechaNac, ID_Motor),
  FOREIGN KEY (FechaNac) REFERENCES Fabricante(FechaNac),
  FOREIGN KEY (ID_Motor) REFERENCES Motor(ID_Motor)
);

CREATE TABLE Coche
(
  FechaFabricación DATE NOT NULL,
  CodEscudería VARCHAR NOT NULL,
  ID_Motor VARCHAR NOT NULL,
  PRIMARY KEY (FechaFabricación),
  FOREIGN KEY (CodEscudería) REFERENCES Escudería(CodEscudería),
  FOREIGN KEY (ID_Motor) REFERENCES Motor(ID_Motor)
);

CREATE TABLE Fabricar
(
  FechaNac DATE NOT NULL,
  FechaFabricación DATE NOT NULL,
  PRIMARY KEY (FechaNac, FechaFabricación),
  FOREIGN KEY (FechaNac) REFERENCES Fabricante(FechaNac),
  FOREIGN KEY (FechaFabricación) REFERENCES Coche(FechaFabricación)
);

-- Laboratorio 14

CREATE TABLE Nacionalidad
(
  Capital VARCHAR NOT NULL,
  PRIMARY KEY (Capital)
);

CREATE TABLE Personas
(
  Fecha_Nac DATE NOT NULL,
  NIF VARCHAR NOT NULL,
  Sexo CHAR NOT NULL,
  Capital VARCHAR NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (Capital) REFERENCES Nacionalidad(Capital)
);

CREATE TABLE Alumnos
(
  FechaNac DATE NOT NULL,
  NIF VARCHAR NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Personas(NIF),
  UNIQUE (FechaNac)
);

CREATE TABLE Profesores
(
  Acreditación VARCHAR NOT NULL,
  Salario FLOAT NOT NULL,
  Num_Hijos INT NOT NULL,
  NIF VARCHAR NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Personas(NIF),
  UNIQUE (Acreditación)
);

CREATE TABLE Curso
(
  Denominación VARCHAR NOT NULL,
  Descripción VARCHAR NOT NULL,
  Num_Horas INT NOT NULL,
  Cód_Curso VARCHAR NOT NULL,
  Coste FLOAT NOT NULL,
  Haber_realizado_Cód_Curso VARCHAR,
  PRIMARY KEY (Cód_Curso),
  FOREIGN KEY (Haber_realizado_Cód_Curso) REFERENCES Curso(Cód_Curso)
);

CREATE TABLE Ediciones
(
  Núm_horas INT NOT NULL,
  Horarios INT NOT NULL,
  Lugares VARCHAR NOT NULL,
  Formatos INT NOT NULL,
  Cód_Curso VARCHAR NOT NULL,
  PRIMARY KEY (Formatos),
  FOREIGN KEY (Cód_Curso) REFERENCES Curso(Cód_Curso)
);

CREATE TABLE Fecha
(
  Año INT NOT NULL,
  Mes INT NOT NULL,
  Día CHAR NOT NULL,
  Formatos INT NOT NULL,
  PRIMARY KEY (Día),
  FOREIGN KEY (Formatos) REFERENCES Ediciones(Formatos)
);

CREATE TABLE Impartido
(
  NIF VARCHAR NOT NULL,
  Cód_Curso VARCHAR NOT NULL,
  PRIMARY KEY (NIF, Cód_Curso),
  FOREIGN KEY (NIF) REFERENCES Profesores(NIF),
  FOREIGN KEY (Cód_Curso) REFERENCES Curso(Cód_Curso)
);

-- Laboratorio 15

CREATE TABLE Conflicto_
(
  Nombre VARCHAR NOT NULL,
  Cod_conflicto VARCHAR NOT NULL,
  Num_países_ INT NOT NULL,
  Num_muertos INT NOT NULL,
  PRIMARY KEY (Cod_conflicto)
);

CREATE TABLE Países_
(
  Capital VARCHAR NOT NULL,
  PRIMARY KEY (Capital)
);

CREATE TABLE Muertos/heridos
(
  FechaMuerte DATE NOT NULL,
  Cod_conflicto VARCHAR NOT NULL,
  PRIMARY KEY (FechaMuerte),
  FOREIGN KEY (Cod_conflicto) REFERENCES Conflicto_(Cod_conflicto)
);

CREATE TABLE Económicos
(
  Materias_primas_disputadas INT NOT NULL,
  Cod_conflicto VARCHAR NOT NULL,
  PRIMARY KEY (Cod_conflicto),
  FOREIGN KEY (Cod_conflicto) REFERENCES Conflicto_(Cod_conflicto),
  UNIQUE (Materias_primas_disputadas)
);

CREATE TABLE Religiosos
(
  Numero_religiones_afectadas INT NOT NULL,
  Cod_conflicto VARCHAR NOT NULL,
  PRIMARY KEY (Cod_conflicto),
  FOREIGN KEY (Cod_conflicto) REFERENCES Conflicto_(Cod_conflicto),
  UNIQUE (Numero_religiones_afectadas)
);

CREATE TABLE Raciales
(
  Etnias_enfrentadas INT NOT NULL,
  Cod_conflicto VARCHAR NOT NULL,
  PRIMARY KEY (Cod_conflicto),
  FOREIGN KEY (Cod_conflicto) REFERENCES Conflicto_(Cod_conflicto),
  UNIQUE (Etnias_enfrentadas)
);

CREATE TABLE Territoriales
(
  Numero_regiones_afectadas INT NOT NULL,
  Cod_conflicto VARCHAR NOT NULL,
  PRIMARY KEY (Cod_conflicto),
  FOREIGN KEY (Cod_conflicto) REFERENCES Conflicto_(Cod_conflicto),
  UNIQUE (Numero_regiones_afectadas)
);

CREATE TABLE Grupos_armados
(
  Fecha_incorporación DATE NOT NULL,
  Fecha_salida DATE NOT NULL,
  Código_armado VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  PRIMARY KEY (Código_armado)
);

CREATE TABLE Organizaciones_mediadoras
(
  Fecha_incorporación DATE NOT NULL,
  Fecha_salida DATE NOT NULL,
  Nombre VARCHAR NOT NULL,
  Gubernamental VARCHAR NOT NULL,
  No_gubernamental_ VARCHAR NOT NULL,
  internacional VARCHAR NOT NULL,
  Personas_desplegadas INT NOT NULL,
  Medica VARCHAR NOT NULL,
  Diplomatica VARCHAR NOT NULL,
  Presencial VARCHAR NOT NULL,
  Dialoga VARCHAR NOT NULL,
  PRIMARY KEY (Nombre)
);

CREATE TABLE División
(
  Barcos INT NOT NULL,
  Hombres INT NOT NULL,
  Aviones INT NOT NULL,
  Tanques INT NOT NULL,
  Bajas INT NOT NULL,
  Código_armado VARCHAR NOT NULL,
  FOREIGN KEY (Código_armado) REFERENCES Grupos_armados(Código_armado)
);

CREATE TABLE Lider_político
(
  Nombre VARCHAR NOT NULL,
  Cod_grupo_armado VARCHAR NOT NULL,
  Apoyos INT NOT NULL,
  Dialoga VARCHAR NOT NULL,
  Código_armado VARCHAR NOT NULL,
  PRIMARY KEY (Cod_grupo_armado),
  FOREIGN KEY (Código_armado) REFERENCES Grupos_armados(Código_armado)
);

CREATE TABLE Traficantes_de_armas
(
  Nombre VARCHAR NOT NULL,
  Número_de_sumistro INT NOT NULL,
  PRIMARY KEY (Nombre)
);

CREATE TABLE Jefes_militares
(
  Cod_militar VARCHAR NOT NULL,
  rango INT NOT NULL,
  Nombre_Jefe VARCHAR NOT NULL,
  Cod_grupo_armado VARCHAR NOT NULL,
  PRIMARY KEY (Cod_militar),
  FOREIGN KEY (Cod_grupo_armado) REFERENCES Lider_político(Cod_grupo_armado)
);

CREATE TABLE Intervienen_
(
  Cod_conflicto VARCHAR NOT NULL,
  Código_armado VARCHAR NOT NULL,
  PRIMARY KEY (Cod_conflicto, Código_armado),
  FOREIGN KEY (Cod_conflicto) REFERENCES Conflicto_(Cod_conflicto),
  FOREIGN KEY (Código_armado) REFERENCES Grupos_armados(Código_armado)
);

CREATE TABLE Dialoga
(
  Cod_grupo_armado VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  PRIMARY KEY (Cod_grupo_armado, Nombre),
  FOREIGN KEY (Cod_grupo_armado) REFERENCES Lider_político(Cod_grupo_armado),
  FOREIGN KEY (Nombre) REFERENCES Organizaciones_mediadoras(Nombre)
);

CREATE TABLE _Armas
(
  Nombre VARCHAR NOT NULL,
  Indicador_capacidad VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  PRIMARY KEY (Indicador_capacidad),
  FOREIGN KEY (Nombre) REFERENCES Traficantes_de_armas(Nombre)
);

CREATE TABLE Suministran
(
  Número_total INT NOT NULL,
  Indicador_capacidad VARCHAR NOT NULL,
  Código_armado VARCHAR NOT NULL,
  PRIMARY KEY (Indicador_capacidad, Código_armado),
  FOREIGN KEY (Indicador_capacidad) REFERENCES _Armas(Indicador_capacidad),
  FOREIGN KEY (Código_armado) REFERENCES Grupos_armados(Código_armado)
);

-- Laboratorio 16

CREATE TABLE Banco
(
  CodBanco VARCHAR NOT NULL,
  PRIMARY KEY (CodBanco)
);

CREATE TABLE Sucursales
(
  Nombre VARCHAR NOT NULL,
  Ciudad VARCHAR NOT NULL,
  CodBanco VARCHAR NOT NULL,
  PRIMARY KEY (Nombre),
  FOREIGN KEY (CodBanco) REFERENCES Banco(CodBanco)
);

CREATE TABLE Activos
(
  CodActivos VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  CodBanco VARCHAR NOT NULL,
  PRIMARY KEY (CodActivos),
  FOREIGN KEY (Nombre) REFERENCES Sucursales(Nombre),
  FOREIGN KEY (CodBanco) REFERENCES Banco(CodBanco)
);

CREATE TABLE Empleados
(
  Id_empleado VARCHAR NOT NULL,
  telefono INT NOT NULL,
  Apellido_1 VARCHAR NOT NULL,
  Apellido_2 VARCHAR NOT NULL,
  Id_empleado VARCHAR NOT NULL,
  Antigüedad_ INT NOT NULL,
  dia_ INT NOT NULL,
  mes INT NOT NULL,
  año INT NOT NULL,
  CodBanco VARCHAR NOT NULL,
  PRIMARY KEY (Id_empleado),
  FOREIGN KEY (CodBanco) REFERENCES Banco(CodBanco)
);

CREATE TABLE Cuentas
(
  Número_de_cuenta INT NOT NULL,
  Saldo FLOAT NOT NULL,
  Dia INT NOT NULL,
  Mes INT NOT NULL,
  Año INT NOT NULL,
  PRIMARY KEY (Número_de_cuenta)
);

CREATE TABLE Cuentas_corrientes
(
  Interes INT NOT NULL,
  Número_de_cuenta INT NOT NULL,
  PRIMARY KEY (Número_de_cuenta),
  FOREIGN KEY (Número_de_cuenta) REFERENCES Cuentas(Número_de_cuenta),
  UNIQUE (Interes)
);

CREATE TABLE Cuentas_ahorro
(
  Descubierto INT NOT NULL,
  Número_de_cuenta INT NOT NULL,
  PRIMARY KEY (Número_de_cuenta),
  FOREIGN KEY (Número_de_cuenta) REFERENCES Cuentas(Número_de_cuenta),
  UNIQUE (Descubierto)
);

CREATE TABLE Clientes
(
  Id-Cliente VARCHAR NOT NULL,
  Nombre VARCHAR NOT NULL,
  Calle VARCHAR NOT NULL,
  Ciudad VARCHAR NOT NULL,
  CodBanco VARCHAR NOT NULL,
  PRIMARY KEY (Id-Cliente),
  FOREIGN KEY (CodBanco) REFERENCES Banco(CodBanco)
);

CREATE TABLE Prestamos
(
  Numero INT NOT NULL,
  Importe FLOAT NOT NULL,
  Número_de_pagos INT NOT NULL,
  Nombre VARCHAR NOT NULL,
  Id-Cliente VARCHAR NOT NULL,
  PRIMARY KEY (Numero),
  FOREIGN KEY (Nombre) REFERENCES Sucursales(Nombre),
  FOREIGN KEY (Id-Cliente) REFERENCES Clientes(Id-Cliente)
);

CREATE TABLE Pagos
(
  Número_de_pago INT NOT NULL,
  Mes INT NOT NULL,
  Dia INT NOT NULL,
  Año INT NOT NULL,
  Importe FLOAT NOT NULL,
  Numero INT NOT NULL,
  PRIMARY KEY (Número_de_pago),
  FOREIGN KEY (Numero) REFERENCES Prestamos(Numero)
);

CREATE TABLE Banquero_particular
(
  CodBanquero INT NOT NULL,
  PRIMARY KEY (CodBanquero)
);

CREATE TABLE Responsable_de_prestamos
(
  CodBanquero INT NOT NULL,
  PRIMARY KEY (CodBanquero),
  FOREIGN KEY (CodBanquero) REFERENCES Banquero_particular(CodBanquero)
);

CREATE TABLE Banquero_personal
(
  CodBanquero INT NOT NULL,
  PRIMARY KEY (CodBanquero),
  FOREIGN KEY (CodBanquero) REFERENCES Banquero_particular(CodBanquero)
);

CREATE TABLE Asocian
(
  Id-Cliente VARCHAR NOT NULL,
  Número_de_cuenta INT NOT NULL,
  PRIMARY KEY (Id-Cliente, Número_de_cuenta),
  FOREIGN KEY (Id-Cliente) REFERENCES Clientes(Id-Cliente),
  FOREIGN KEY (Número_de_cuenta) REFERENCES Cuentas(Número_de_cuenta)
);