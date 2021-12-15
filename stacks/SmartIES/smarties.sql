CREATE DATABASE ies;
CREATE TABLE rack
(
	time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	conveyorid VARCHAR (16),
	rackid SERIAL,
	workorder VARCHAR (32),
	salesorder VARCHAR (32),
	color VARCHAR (32),
	customer VARCHAR (32),
	speed float,
	Jsontag JSONB
);
SELECT create_hypertable('rack', 'time');
CREATE INDEX ON rack(rackid, workorder, salesorder, colour, customer, time) ;

CREATE TABLE measures
(
	time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	plant VARCHAR (16),
	area VARCHAR (16),
	equipment VARCHAR (16),
	probe VARCHAR (16),
	deviceid VARCHAR (32),
	ver VARCHAR (32),
	jsontag JSONB,
	measurementid VARCHAR (64),
	value float,
	jsonvalue JSONB
);
SELECT create_hypertable('measures', 'time',chunk_time_interval => INTERVAL '1 day');
CREATE INDEX ON measures(time,measurementid,plant,area,equipment,deviceid) ;

CREATE TABLE parameters
(
    par_name character varying(32) ,
    par_value json
);

CREATE TABLE paros
(
    paros_plant character varying(3) ,
    paros_actividad character varying(16) ,
    paros_area character varying(16) ,
    paros_seg bigint,
    paros_inicio timestamp with time zone,
    paros_final timestamp with time zone,
    paros_pulsador character varying(16) ,
    paros_comentario character varying(96) ,
    paros_descripcion character varying(64) ,
    paros_timestamp timestamp with time zone,
    paros_categoria character varying(32) ,
    paros_categoriaifs character varying(32),
    paros_punto character varying(3),
    paros_equipo integer,
    paros_codigo character varying(2) 
);

CREATE TABLE partesprensa
(
    ppnombretrabajador character varying ,
    ppjefeequipo character varying ,
    ppfechaparte date,
    pprecurso character varying ,
    ppequipo character varying,
    ppoperacion character varying ,
    ppmatriz character varying ,
    ppduracionh double precision,
    ppntochos integer,
    ppkgbrutos double precision,
    ppkgutiles double precision,
    ppchatarra double precision,
    pppesometro double precision,
    ppnsalidas integer,
    ppdestinomatriz character varying ,
    ppmatrizllena boolean,
    ppcodparo character varying ,
    pptipoparo character varying ,
    ppcodfallomatriz character varying ,
    ppobs character varying ,
    pphorainicio timestamp with time zone,
    pphorafinal timestamp with time zone,
    ppkgh integer,
    ppsilueta character varying 
)
