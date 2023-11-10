-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `grupo9` DEFAULT CHARACTER SET UTF8MB4 ;
USE `grupo9` ;

-- -----------------------------------------------------
-- Table `mydb`.`Rubro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo9`.`Rubro` (
  `idRubro` INT NOT NULL,
  `Rubro` VARCHAR(45) NULL,
  PRIMARY KEY (`idRubro`),
  UNIQUE INDEX `idRubro_UNIQUE` (`idRubro` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo9`.`Clientes` (
  `idCliente` INT NOT NULL,
  `nombreCliente` VARCHAR(45) NULL,
  `Domicilio` VARCHAR(45) NULL,
  `mail` VARCHAR(45) NULL,
  `cantidadEmpleados` INT NULL,
  `rubro` INT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `rubro_idx` (`rubro` ASC) VISIBLE,
  CONSTRAINT `rubro`
    FOREIGN KEY (`rubro`)
    REFERENCES `grupo9`.`Rubro` (`idRubro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ClienteSucursales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grupo9`.`ClienteSucursales` (
  `idClienteSucursales` INT NOT NULL,
  `CantSucursalesCapital` INT NULL,
  `CantSucursalesInterior` INT NULL,
  `tipoRelacionSucursalCliente` VARCHAR(45) NULL,
  `cliente` INT NULL,
  PRIMARY KEY (`idClienteSucursales`),
  UNIQUE INDEX `idClienteSucursales_UNIQUE` (`idClienteSucursales` ASC) VISIBLE,
  INDEX `cliente_idx` (`cliente` ASC) VISIBLE,
  CONSTRAINT `cliente`
    FOREIGN KEY (`cliente`)
    REFERENCES `grupo9`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Rubro (idRubro, Rubro)
VALUES
(1, 'Electricidad'),
(2, 'Telecomunicaciones'),
(3, 'Redes'),
(4, 'Telefonía IP'),
(5, 'Miscelaneas');

INSERT INTO Clientes (idCLiente, nombreCliente, Domicilio, mail, cantidadEmpleados, Rubro)
VALUES
(2, 'ElectroTodo', 'Virrey del Pino 1434', 'et@yahoo.com', 5, 1),
(3, 'Conectar S.A.', 'Agüero 37', 'conectar@fibertel.com', 10, 2),
(4, 'Metro SRL', 'Cerrito esq San Juan', '-', 12, 3),
(5, 'MyIP', 'Salguero 3421', 'MIP@hotmail.com', 3, 2),
(6, 'Router & Switch', 'Las Heras esq Austria', 'RS@google.com', 4, NULL),
(7, 'Sat', 'Cabildo esq Juramento', '-', 1, NULL),
(8, 'Cableado SRL', 'Guemes 234', NULL, 7, 4);

INSERT INTO ClienteSucursales(idClienteSucursales, CantSucursalesCapital, CantSucursalesInterior, tipoRelacionSucursalCliente, cliente)
VALUES
(2, 30, 4, 'Principal', 2),
(3, 0, 12, 'Principal', 3),
(5, 9, 0, 'Secundaria', 4),
(6, 25, 0, 'Secundaria', 5),
(7, 0, 2, 'Terciaria', 6);

-- A)
SELECT * FROM Clientes;

-- B)
SELECT cliente, CantSucursalesCapital FROM ClienteSucursales 
ORDER BY CantSucursalesCapital DESC;

-- C)
SELECT nombreCliente, rubro FROM Clientes
WHERE rubro IS NOT NULL;

-- D)
SELECT nombreCliente, rubro, cantidadEmpleados FROM Clientes 
WHERE nombreCliente LIKE 'M%';

-- E)
SELECT * FROM Clientes 
WHERE rubro IS NULL;

SELECT * FROM Clientes 
WHERE rubro IS NOT NULL;

-- F)
SELECT * FROM Clientes AS c
RIGHT OUTER JOIN Rubro AS r ON c.idCliente = r.idRubro;

-- G)


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


