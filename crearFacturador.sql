USE ODS;

DROP TABLE IF EXISTS ODS.ODS_DM_METODOS_PAGO;

CREATE TABLE IF NOT EXISTS ODS.ODS_DM_METODOS_PAGO(
ID_METODO_PAGO INT(10) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
DE_METODO_PAGO VARCHAR(512),
FC_INSERT DATETIME,
FC_MODIFICACION DATETIME);

DROP TABLE IF EXISTS ODS.ODS_DM_CICLOS_FACTURACION;

CREATE TABLE IF NOT EXISTS ODS.ODS_DM_CICLOS_FACTURACION(
ID_CICLO_FACTURACION INT(10) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
DE_CICLO_FACTURACION VARCHAR(512),
FC_INSERT DATETIME,
FC_MODIFICACION DATETIME);

DROP TABLE IF EXISTS ODS.ODS_HC_FACTURAS;

/* Declarar campo cantidad con decimal para que me adminta decimales en los importes de las facturas */
CREATE TABLE IF NOT EXISTS ODS.ODS_HC_FACTURAS (
ID_FACTURA INT(10) UNSIGNED NOT NULL PRIMARY KEY,
ID_CLIENTE INT(11),
FC_INICIO DATETIME,
FC_FIN DATETIME,
FC_ESTADO DATETIME,
FC_PAGO DATETIME,
ID_CICLO_FACTURACION INT(10) UNSIGNED,
ID_METODO_PAGO INT(10) UNSIGNED,
CANTIDAD DECIMAL(10, 2),
FC_INSERT DATETIME,
FC_MODIFICACION DATETIME);


ALTER TABLE ODS.ODS_HC_FACTURAS ADD INDEX fk_fac_cli_idx (ID_CLIENTE ASC);
ALTER TABLE ODS.ODS_HC_FACTURAS ADD CONSTRAINT fk_fac_cli FOREIGN KEY (ID_CLIENTE)
	REFERENCES ODS.ODS_HC_CLIENTES (ID_CLIENTE) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE ODS.ODS_HC_FACTURAS ADD INDEX fk_fac_ciclo_fac_idx (ID_CICLO_FACTURACION ASC);
ALTER TABLE ODS.ODS_HC_FACTURAS ADD CONSTRAINT fk_fac_ciclo_fac FOREIGN KEY (ID_CICLO_FACTURACION)
	REFERENCES ODS.ODS_DM_CICLOS_FACTURACION (ID_CICLO_FACTURACION) ON DELETE NO ACTION ON UPDATE NO ACTION;
    
ALTER TABLE ODS.ODS_HC_FACTURAS ADD INDEX fk_fac_mpago_idx (ID_METODO_PAGO ASC);
ALTER TABLE ODS.ODS_HC_FACTURAS ADD CONSTRAINT fk_fac_mpago FOREIGN KEY (ID_METODO_PAGO)
	REFERENCES ODS.ODS_DM_METODOS_PAGO (ID_METODO_PAGO) ON DELETE NO ACTION ON UPDATE NO ACTION;