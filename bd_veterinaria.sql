/*
 Navicat Premium Data Transfer

 Source Server         : petvet
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3308
 Source Schema         : regmas

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 26/06/2023 15:46:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for consultas
-- ----------------------------
DROP TABLE IF EXISTS `consultas`;
CREATE TABLE `consultas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_doctor` int NULL DEFAULT NULL,
  `id_paciente` int NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `hora` time NULL DEFAULT NULL,
  `sintomas` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `diagnostico` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_paciente`(`id_paciente` ASC) USING BTREE,
  INDEX `id_doctor`(`id_doctor` ASC) USING BTREE,
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `responsable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consultas
-- ----------------------------
INSERT INTO `consultas` VALUES (1, 2, 1, '2011-03-23', '15:03:00', 'DESCOMPENSACION', 'GOLPE DE CALOR');
INSERT INTO `consultas` VALUES (2, 3, 2, '2020-01-12', '13:15:00', 'DIARREAS Y VOMITOS', 'PARVOVIRUS');
INSERT INTO `consultas` VALUES (3, 1, 3, '2022-12-12', '06:20:00', 'FATIGA, PERDIDA DE APETITO', 'GRIPE CANINA');
INSERT INTO `consultas` VALUES (4, 1, 4, '2023-05-20', '18:15:00', ' pérdida de pelo alrededor de las orejas, problemas de equilibrio, dolor, pérdida auditiva.', 'infeccion de oido');
INSERT INTO `consultas` VALUES (5, 2, 5, '2023-04-15', '13:20:00', 'Secreciones en los ojos similares al pus, fiebre, pérdida de apetito, secreciones nasales, letargo, vómitos, diarrea, neumonía', 'moquillo');
INSERT INTO `consultas` VALUES (6, 3, 6, '2023-05-25', '19:15:00', 'Convulsiones, agresión', 'rabia');
INSERT INTO `consultas` VALUES (7, 2, 7, '2023-06-01', '14:30:00', 'Bultos, mal olor, secreciones, hinchazón,', 'cancer ');
INSERT INTO `consultas` VALUES (8, 1, 8, '2023-01-20', '10:10:00', 'Aumento de sed y ganas de orinar, cambios de apetito, pérdida de peso', 'diabetes');
INSERT INTO `consultas` VALUES (9, 2, 9, '2022-12-20', '15:30:00', 'Secreciones oculares y nasales, congestión, sed, pérdida de apetito, fiebre, orejas, encías y piel amarillentas', 'hepatitis');
INSERT INTO `consultas` VALUES (10, 3, 10, '2023-05-30', '20:10:00', 'Vómitos, diarrea', 'parvovirus');
INSERT INTO `consultas` VALUES (11, 3, 11, '2023-06-01', '21:30:00', 'Tos, estornudos.', 'bordetella');
INSERT INTO `consultas` VALUES (12, 2, 12, '2023-06-01', '16:10:00', 'DESCOMPENSACION', 'GOLPE DE CALOR');
INSERT INTO `consultas` VALUES (13, 3, 13, '2022-12-08', '20:15:00', 'DIARREAS Y VOMITOS', 'PARVOVIRUS');
INSERT INTO `consultas` VALUES (14, 1, 14, '2022-12-25', '10:45:00', 'FATIGA, PERDIDA DE APETITO', 'GRIPE CANINA');
INSERT INTO `consultas` VALUES (15, 1, 15, '2023-05-20', '09:30:00', ' pérdida de pelo alrededor de las orejas, problemas de equilibrio, dolor, pérdida auditiva.', 'infeccion de oido');
INSERT INTO `consultas` VALUES (16, 2, 16, '2023-06-01', '16:45:00', ' pérdida de pelo alrededor de las orejas, problemas de equilibrio, dolor, pérdida auditiva.', 'infeccion de oido');
INSERT INTO `consultas` VALUES (17, 1, 17, '2023-03-25', '11:20:00', 'Secreciones en los ojos similares al pus, fiebre, pérdida de apetito, secreciones nasales, letargo, vómitos, diarrea, neumonía', 'moquillo');
INSERT INTO `consultas` VALUES (18, 3, 18, '2023-05-28', '18:30:00', 'Convulsiones, agresión', 'rabia');
INSERT INTO `consultas` VALUES (19, 2, 19, '2023-06-02', '15:45:00', 'Bultos, mal olor, secreciones, hinchazón,', 'cancer ');
INSERT INTO `consultas` VALUES (20, 1, 20, '2023-05-29', '10:20:00', 'Aumento de sed y ganas de orinar, cambios de apetito, pérdida de peso', 'diabetes');
INSERT INTO `consultas` VALUES (21, 1, 21, '2023-05-30', '09:20:00', 'Secreciones oculares y nasales, congestión, sed, pérdida de apetito, fiebre, orejas, encías y piel amarillentas', 'hepatitis');
INSERT INTO `consultas` VALUES (22, 2, 22, '2022-12-29', '16:10:00', 'Vómitos, diarrea', 'parvovirus');
INSERT INTO `consultas` VALUES (23, 2, 23, '2023-05-18', '13:00:00', 'Tos, estornudos.', 'bordetella');
INSERT INTO `consultas` VALUES (24, 3, 24, '2023-03-29', '21:00:00', 'n/n', 'desparatizacion');
INSERT INTO `consultas` VALUES (25, 3, 25, '2023-04-16', '19:30:00', 'n/n', 'revicion sutinaria');
INSERT INTO `consultas` VALUES (26, 2, 26, '2023-06-20', '15:00:00', 'diarrea, falta de apetito, aumento de ritmo cardiaco y fiebre', 'mastitis');
INSERT INTO `consultas` VALUES (27, 1, 27, '2023-05-19', '11:26:00', 'perdida de apetitps, caida de pelo, vomitos y obstruccion intestinal', 'parasitos intestinales ');
INSERT INTO `consultas` VALUES (28, 1, 28, '2023-05-16', '09:15:00', 'rascado constante, llagas en la piel, erupcion en la piel', 'sarna');
INSERT INTO `consultas` VALUES (29, 2, 29, '2023-06-12', '16:00:00', 'bajo pero, ojos irritados, bajo peso', 'desnutricion');
INSERT INTO `consultas` VALUES (30, 3, 30, '2023-06-20', '20:00:00', NULL, 'desparatizacion');

-- ----------------------------
-- Table structure for doctores
-- ----------------------------
DROP TABLE IF EXISTS `doctores`;
CREATE TABLE `doctores`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ci` int NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ap_paterno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ap_materno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `sexo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `telefono` int NULL DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `correo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id_turno` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_turno`(`id_turno` ASC) USING BTREE,
  CONSTRAINT `doctores_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctores
-- ----------------------------
INSERT INTO `doctores` VALUES (1, 42615987, 'raul', 'valdez', 'sarmiento', '1987-05-24', 'masculino', 78954628, 'av coronel', 'la paz', 'raul@gmail.com', 3);
INSERT INTO `doctores` VALUES (2, 2316849, 'laura', 'hernandez', 'lipe', '1990-11-11', 'femenino', 62459632, 'av hernando siles', 'la paz', 'laura@gmail.com', 1);
INSERT INTO `doctores` VALUES (3, 32615984, 'sandra', 'velardez', 'zurita', '1989-06-08', 'femenino', 63251452, NULL, NULL, NULL, 2);

-- ----------------------------
-- Table structure for paciente
-- ----------------------------
DROP TABLE IF EXISTS `paciente`;
CREATE TABLE `paciente`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `raza` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `edad` int NULL DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `rasgos` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `sexo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id_responsable` int NOT NULL,
  `tipo_animal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_responsable`(`id_responsable` ASC) USING BTREE,
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`id_responsable`) REFERENCES `responsable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paciente
-- ----------------------------
INSERT INTO `paciente` VALUES (1, 'ROKI', 'PITBUL', 3, 'NEGRO', 'MEDIANO', 'MACHO', 3, 'perro');
INSERT INTO `paciente` VALUES (2, 'lola', 'cocker', 2, 'cafe', 'patas cortas y sin cola', 'hembra', 1, 'perro');
INSERT INTO `paciente` VALUES (3, 'SHADOW', 'SAN BERNARDO', 1, 'CAFE, NEGRO Y BLANCO', NULL, 'MACHO', 2, 'perro');
INSERT INTO `paciente` VALUES (4, 'lulu', 'angora', 1, 'blanco', 'alvino', 'hembra', 3, 'gato');
INSERT INTO `paciente` VALUES (5, 'luna', 'papagayo', 2, 'verde', 'pico corto', 'hembra', 4, 'loro');
INSERT INTO `paciente` VALUES (6, 'alvin', 'alvino', 3, 'blanco', 'patas cortas', 'machi', 5, 'perro');
INSERT INTO `paciente` VALUES (7, 'coco', 'siames', 2, 'beis con cafe', 'ojos azules', 'macho', 6, 'gato');
INSERT INTO `paciente` VALUES (8, 'lupe', 'himalayo', 1, 'cafe con blanco', 'cola negra', 'hembra', 7, 'gato');
INSERT INTO `paciente` VALUES (9, 'kari', 'angora', 5, 'negro', NULL, 'hembra', 8, 'gato');
INSERT INTO `paciente` VALUES (10, 'rodolfo', 'galgo', 4, 'cafe oscuro', 'orejas largas', 'macho', 9, 'perro');
INSERT INTO `paciente` VALUES (11, 'cerafin', 'labrador', 1, 'cafe claro', 'cola corta', 'macho', 10, 'perro');
INSERT INTO `paciente` VALUES (12, 'milu', 'mestizo', 2, 'plomo', 'patas cortas', 'hembra', 11, 'gato');
INSERT INTO `paciente` VALUES (13, 'figaro', 'mastizo', 1, 'negro con blanco', 'patas cortas', 'macho', 12, 'gato');
INSERT INTO `paciente` VALUES (14, 'facherito', 'dalamata', 7, 'blanco con negro', 'patas largas', 'macho', 13, 'perro');
INSERT INTO `paciente` VALUES (15, 'princesa', 'shar pei', 1, 'cafe', 'cola larga', 'hembra', 14, 'perro');
INSERT INTO `paciente` VALUES (16, 'turron', 'chihuahua', 1, 'negro', 'orejas largas', 'macho', 2, 'perro');
INSERT INTO `paciente` VALUES (17, 'lulu', 'dorada', 1, 'dorado', 'alas cortas', 'hembra', 5, 'pez dorado');
INSERT INTO `paciente` VALUES (18, 'pocoyo', 'hammster', 1, 'cafe', NULL, 'macho', 8, 'hammster');
INSERT INTO `paciente` VALUES (19, 'leydi', 'chapie', 8, 'blanco', 'mediano', 'hemdra', 15, 'perro');
INSERT INTO `paciente` VALUES (20, 'negra', 'angora', 3, 'negro', NULL, 'hembra', 16, 'gato');
INSERT INTO `paciente` VALUES (21, 'choco', 'beagle', 6, 'cafe, negro y blanco', NULL, 'macho', 17, 'perro');
INSERT INTO `paciente` VALUES (22, 'maylo', 'galgo', 4, 'cafe claro', 'patas largas', 'macho', 1, 'perro');
INSERT INTO `paciente` VALUES (23, 'cuko', 'boxer', 5, 'negro', 'oreja partida', 'macho', 18, 'perro');
INSERT INTO `paciente` VALUES (24, 'rambo', 'pastor aleman', 3, 'cafe y  negro', NULL, 'macho', 19, 'perro');
INSERT INTO `paciente` VALUES (25, 'raul', 'shar pei', 1, 'plomo', 'sin cola', 'macho', 20, 'perro');
INSERT INTO `paciente` VALUES (26, 'leon', 'cocker', 2, 'cafe', 'sin cola', 'macho', 10, 'perro');
INSERT INTO `paciente` VALUES (27, 'dorado', 'dorado', 1, 'dorado', NULL, 'macho', 11, 'pes');
INSERT INTO `paciente` VALUES (28, 'beyli', 'dalmata', 9, 'blanco y negro', NULL, 'hembra', 21, 'perro');
INSERT INTO `paciente` VALUES (29, 'dragon', 'gran danes', 3, 'negro', 'cola cortada', 'macho', 22, 'perro');
INSERT INTO `paciente` VALUES (30, 'mini', 'mestizo', 4, 'beis y blanco', NULL, 'hembra', 23, 'gato');
INSERT INTO `paciente` VALUES (31, 'chimuelo', 'chihuahu', 1, 'negro', NULL, 'macho', 24, 'perro');
INSERT INTO `paciente` VALUES (32, 'bruno', 'rottweiler', 4, 'negro con cafe', NULL, 'macho', 25, 'perro');
INSERT INTO `paciente` VALUES (33, 'capuchino', 'angora', 2, 'cafe', NULL, 'macho', 26, 'gato');
INSERT INTO `paciente` VALUES (34, 'rosa', 'mestizo', 2, 'beis', NULL, 'hembra', 27, 'gato');
INSERT INTO `paciente` VALUES (35, 'tulipan', 'angora', 3, 'cale y negro', NULL, 'hembra', 28, 'gato');
INSERT INTO `paciente` VALUES (36, 'geronimo', 'husky', 7, 'plomo y blanco', 'ojos calestes', 'macho', 29, 'perro');
INSERT INTO `paciente` VALUES (37, 'sanson', 'cucker', 1, 'negro', NULL, 'macho', 30, 'perro');
INSERT INTO `paciente` VALUES (38, 'balu', 'labrador', 3, 'beis', NULL, 'macho', 20, 'perro');

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `fecha_adquirida` date NULL DEFAULT NULL,
  `fecha_vencimiento` date NULL DEFAULT NULL,
  `cantidad` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `marca` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id_recepcionista` int NULL DEFAULT NULL,
  `precio` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_recepcionista`(`id_recepcionista` ASC) USING BTREE,
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_recepcionista`) REFERENCES `recepcionistas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES (1, 'comida para perro', '2022-12-20', '2024-10-05', '15 bolsas de 15 kilo', 'dogchou', 1, 150);
INSERT INTO `producto` VALUES (2, 'comida para perro', '2022-12-25', '2024-02-18', '10 bolsas de 15 kilo', 'bravo', 1, 160);
INSERT INTO `producto` VALUES (3, 'comida para perro', '2022-12-30', '2024-05-10', '12 bolsas de 10 kilo', 'pedigre', 1, 17);
INSERT INTO `producto` VALUES (4, 'comida para perro', '2023-01-20', '2024-09-01', '20 bolsas de 10 kilo', 'ricocan', 2, 200);
INSERT INTO `producto` VALUES (5, 'comida para perro', '2023-01-30', '2023-12-12', '15 bolsas de 18 kilo', 'huesitos', 2, 150);
INSERT INTO `producto` VALUES (6, 'comida para gato', '2023-02-15', '2023-01-28', '10 bolsas de 15 kilo', 'catchou', 3, 120);
INSERT INTO `producto` VALUES (7, 'comida para gato', '2023-02-16', '2024-05-08', '12 bolsas de 12 kilo', 'pedigri', 3, 150);
INSERT INTO `producto` VALUES (8, 'comida para gato', '2022-12-25', '2024-12-14', '15 bolsas de 18 kilo', 'monello', 2, 130);
INSERT INTO `producto` VALUES (9, 'comida para gato', '2022-12-30', '2024-11-29', '15 bolsas de 15 kilo', 'bravo cat', 2, 150);
INSERT INTO `producto` VALUES (10, 'comida para gato', '2023-03-18', '2025-01-01', '20 bolsas de 18 kilo', 'catt', 2, 180);
INSERT INTO `producto` VALUES (11, 'ropa para gato talla1', '2022-03-28', '0000-00-00', '15 unidades', NULL, 1, 250);
INSERT INTO `producto` VALUES (12, 'ropa para gato talla2', '2022-03-28', '0000-00-00', '15 unidades', NULL, 1, 240);
INSERT INTO `producto` VALUES (13, 'ropa para gato talla3', '2022-03-28', NULL, '10 unidades', NULL, 2, 214);
INSERT INTO `producto` VALUES (14, 'ropa para gato talla4', '2022-03-28', NULL, '10 unidades', NULL, 1, 180);
INSERT INTO `producto` VALUES (15, 'ropa para perro talla1', '2022-03-28', NULL, '15 unidades', NULL, 3, 160);
INSERT INTO `producto` VALUES (16, 'ropa para perro talla2', '2022-03-28', NULL, '15 unidades', NULL, 2, 170);
INSERT INTO `producto` VALUES (17, 'ropa para perro talla3', '2022-06-28', NULL, '15 unidades', NULL, 1, 240);
INSERT INTO `producto` VALUES (18, 'ropa para perro talla4', '2022-06-28', NULL, '15 unidades', NULL, 2, 250);
INSERT INTO `producto` VALUES (19, 'ropa para perro talla5', '2022-06-28', NULL, '15 unidades', NULL, 3, 280);
INSERT INTO `producto` VALUES (20, 'plato para perro', '2023-01-05', NULL, '30 unidades', NULL, 3, 250);
INSERT INTO `producto` VALUES (21, 'correas', '2022-07-18', NULL, '30 unidades', NULL, 2, 190);
INSERT INTO `producto` VALUES (22, 'juguete para perros', '2022-08-13', NULL, '24 unidades', NULL, 1, 300);
INSERT INTO `producto` VALUES (23, 'shampoo para perro', '2022-10-02', '2024-12-03', '12 unidades', 'brillo', 2, 400);
INSERT INTO `producto` VALUES (24, 'shampoo para gato', '2022-10-02', '2025-01-01', '10 unidades', 'brillo', 3, 350);
INSERT INTO `producto` VALUES (25, 'sepillos para pelo', '2022-10-02', NULL, '40 unidades', NULL, NULL, 300);
INSERT INTO `producto` VALUES (26, 'sepillo para dientes', '2022-09-19', NULL, '30 unidades', NULL, NULL, 350);
INSERT INTO `producto` VALUES (27, 'zapatos para perros ', '2022-12-15', NULL, '12 juegos', NULL, NULL, 150);
INSERT INTO `producto` VALUES (28, 'colchon para perro', '2022-07-30', NULL, '30 unidades', NULL, NULL, 580);
INSERT INTO `producto` VALUES (29, 'colchon para gato', '2022-05-20', NULL, '30 unidades', NULL, NULL, 560);
INSERT INTO `producto` VALUES (30, 'bosal', '2022-10-12', NULL, '24 unidades', NULL, NULL, 360);

-- ----------------------------
-- Table structure for recepcionistas
-- ----------------------------
DROP TABLE IF EXISTS `recepcionistas`;
CREATE TABLE `recepcionistas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ci` int NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ap_paterno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ap_materno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `sexo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `telefono` int NULL DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `correo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id_turno` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_turno`(`id_turno` ASC) USING BTREE,
  CONSTRAINT `recepcionistas_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recepcionistas
-- ----------------------------
INSERT INTO `recepcionistas` VALUES (1, 48215963, 'carla', 'mamani', 'choque', '1992-10-10', 'femenino', 62514893, 'av chacaltaya', 'el alto', 'carla@gmail.com', 1);
INSERT INTO `recepcionistas` VALUES (2, 12364587, 'milton', 'sarabia', 'colque', '1994-08-12', ' masculino', 77152694, 'av junin', 'la paz', 'milton@gmail.com', 3);
INSERT INTO `recepcionistas` VALUES (3, 52614582, 'graciela', 'apaza', 'sannchez', '1990-09-27', 'femenino', 66521632, 'av. quijarro', 'el alto', 'graciela@gmail.com', 2);

-- ----------------------------
-- Table structure for recetas
-- ----------------------------
DROP TABLE IF EXISTS `recetas`;
CREATE TABLE `recetas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NULL DEFAULT NULL,
  `medicamento` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `dosis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `indicaciones` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_consulta`(`id_consulta` ASC) USING BTREE,
  CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recetas
-- ----------------------------
INSERT INTO `recetas` VALUES (1, 1, 'SUEROS DE IDRATACION', '50 ML', 'DAR DOSIS 2 VECES POR DIA DURANTE 2 DIAS ');
INSERT INTO `recetas` VALUES (2, 2, 'PASTILLAS DE CARBON INYECCION DE AMOXICILINA', '3 PASTILLAS, 1 AMPOLLA ', 'DAS PAS PASTILLAS 1 POR DIA DURANTE 3 DIAS ');
INSERT INTO `recetas` VALUES (3, 3, 'ANTIBIOTICOS, ANTITUSIGENOS', '2 AMPOLLAS ', '1 POR DIA DURANTE 2 DIAS ');
INSERT INTO `recetas` VALUES (4, 4, 'antibioticos , antihongos', '3 pastillas y crema antihongos ', 'mantener limpia la sona y aplicar la crema 1 ves al dia ');
INSERT INTO `recetas` VALUES (5, 5, 'sueros de idratacion, antitusigenos', '5 ml ', '1 inyeccion por da durante 5 dias ');
INSERT INTO `recetas` VALUES (6, 6, 'no exixte tratamiento', NULL, NULL);
INSERT INTO `recetas` VALUES (7, 7, 'Quimioterapia, cirugía, radiación o terapia natural.', NULL, NULL);
INSERT INTO `recetas` VALUES (8, 8, 'Medicamentos orales, inyecciones de insulina, cambios en la dieta, esterilización', '1 por dia', 'cumplir con las docis');
INSERT INTO `recetas` VALUES (9, 9, 'Antibióticos, medicamentos antiinflamatorios o inmunosupresores, fluidos intravenosos, hospitalizaci', '1 por dia durante 2 semanas', 'hospitalizacion');
INSERT INTO `recetas` VALUES (10, 10, 'Fluidos intravenosos, medicamentos', '1 por dia durante 5 dias', 'control por 5 dias ');
INSERT INTO `recetas` VALUES (11, 11, 'Antibióticos', '1 por dia durante 6 dias ', 'control po 5 dias ');
INSERT INTO `recetas` VALUES (12, 12, 'SUEROS DE IDRATACION', '50 ML', 'DAR DOSIS 2 VECES POR DIA DURANTE 2 DIAS ');
INSERT INTO `recetas` VALUES (13, 13, 'PASTILLAS DE CARBON INYECCION DE AMOXICILINA', '3 PASTILLAS, 1 AMPOLLA', 'DAS PAS PASTILLAS 1 POR DIA DURANTE 3 DIAS');
INSERT INTO `recetas` VALUES (14, 14, 'ANTIBIOTICOS, ANTITUSIGENOS', '2 AMPOLLAS', '1 POR DIA DURANTE 2 DIAS ');
INSERT INTO `recetas` VALUES (15, 5, 'antibioticos , antihongos', '3 pastillas y crema antihongos ', 'mantener limpia la sona y aplicar la crema 1 ves al dia ');
INSERT INTO `recetas` VALUES (16, 16, 'antibioticos , antihongos', '3 pastillas y crema antihon', 'mantener limpia la sona y aplicar la crema 1 ves al dia ');
INSERT INTO `recetas` VALUES (17, 17, 'sueros de idratacion, antitusigenos', '5 ml ', '1 inyeccion por da durante 5 dias ');
INSERT INTO `recetas` VALUES (18, 18, 'no exixte tratamiento', NULL, NULL);
INSERT INTO `recetas` VALUES (19, 19, 'Quimioterapia, cirugía, radiación o terapia natural.', NULL, NULL);
INSERT INTO `recetas` VALUES (20, 20, 'Medicamentos orales, inyecciones de insulina, cambios en la dieta, esterilización', '1 por dia', 'cumplir con las docis');
INSERT INTO `recetas` VALUES (21, 21, 'Antibióticos, medicamentos antiinflamatorios o inmunosupresores, fluidos intravenosos', '1 por dia durante 2 semanas', 'hospitalizacion');
INSERT INTO `recetas` VALUES (22, 22, 'Fluidos intravenosos, medicamentos', '1 por dia durante 5 dias', 'control por 5 dias ');
INSERT INTO `recetas` VALUES (23, 23, 'desparacitante', '1', NULL);
INSERT INTO `recetas` VALUES (24, 24, 'n/n', NULL, NULL);
INSERT INTO `recetas` VALUES (25, 25, 'antibioticos', '1 cada 8 horas', 'competar el tratamiento ayudar con comporesas frias en las mamas ');
INSERT INTO `recetas` VALUES (26, 26, 'antibioticos', '1 por dia', '');
INSERT INTO `recetas` VALUES (27, 27, 'laxantes y sueros', '1 por dia', 'aplicar los parasitantes');
INSERT INTO `recetas` VALUES (28, 28, 'topicos, ivermectina, moxidectina', '2 por dia', 'mantener limpias las zonas afectadas');
INSERT INTO `recetas` VALUES (29, 29, 'sueros energeticos', '1 por dia', 'alimentacion valanceada, complemeto alimentos liquidos');
INSERT INTO `recetas` VALUES (30, 30, 'desparacitante', NULL, NULL);

-- ----------------------------
-- Table structure for reservas
-- ----------------------------
DROP TABLE IF EXISTS `reservas`;
CREATE TABLE `reservas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NULL DEFAULT NULL,
  `id_doctor` int NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `hora` time NULL DEFAULT NULL,
  `observacion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_paciente`(`id_paciente` ASC) USING BTREE,
  INDEX `id_doctor`(`id_doctor` ASC) USING BTREE,
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `responsable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservas
-- ----------------------------
INSERT INTO `reservas` VALUES (1, 8, 1, '2023-06-28', '09:15:00', NULL);
INSERT INTO `reservas` VALUES (2, 15, 1, '2023-07-01', '11:00:00', NULL);
INSERT INTO `reservas` VALUES (3, 22, 3, '2023-07-02', '20:00:00', NULL);
INSERT INTO `reservas` VALUES (4, 5, 1, '2023-06-27', '10:00:00', NULL);
INSERT INTO `reservas` VALUES (5, 7, 2, '2023-06-28', '15:20:00', NULL);
INSERT INTO `reservas` VALUES (6, 3, 3, '2023-07-01', '19:30:00', NULL);
INSERT INTO `reservas` VALUES (7, 9, 2, '2023-07-03', '16:30:00', NULL);
INSERT INTO `reservas` VALUES (8, 21, 1, '2023-06-27', '10:30:00', NULL);
INSERT INTO `reservas` VALUES (9, 11, 2, '2023-08-01', '13:00:00', NULL);
INSERT INTO `reservas` VALUES (10, 2, 1, '2023-07-02', '03:45:00', NULL);
INSERT INTO `reservas` VALUES (11, 17, 3, '2023-06-09', '18:00:00', NULL);
INSERT INTO `reservas` VALUES (12, 11, 3, '2023-06-30', '19:00:00', NULL);
INSERT INTO `reservas` VALUES (13, 9, 2, '2023-06-30', '17:15:00', NULL);
INSERT INTO `reservas` VALUES (14, 16, 2, '2023-07-03', '14:30:00', NULL);
INSERT INTO `reservas` VALUES (15, 24, 1, '2023-06-29', '08:30:00', NULL);
INSERT INTO `reservas` VALUES (16, 30, 1, '2023-07-01', '11:00:00', NULL);
INSERT INTO `reservas` VALUES (17, 18, 3, '2023-07-02', '20:30:00', NULL);
INSERT INTO `reservas` VALUES (18, 19, 2, '2023-07-15', '16:15:00', NULL);
INSERT INTO `reservas` VALUES (19, 26, 1, '2023-07-10', '11:45:00', NULL);
INSERT INTO `reservas` VALUES (20, 30, 2, '2023-06-30', '15:45:00', NULL);

-- ----------------------------
-- Table structure for responsable
-- ----------------------------
DROP TABLE IF EXISTS `responsable`;
CREATE TABLE `responsable`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ci` int NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ap_paterno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ap_materno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `sexo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `telefono` int NULL DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `correo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id_recepcionista` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_recepcionista`(`id_recepcionista` ASC) USING BTREE,
  CONSTRAINT `responsable_ibfk_1` FOREIGN KEY (`id_recepcionista`) REFERENCES `recepcionistas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of responsable
-- ----------------------------
INSERT INTO `responsable` VALUES (1, 48267951, 'CARLA', 'QUIJARRO', 'ARGOLLO', '1990-12-13', 'FEMENINO', 75924681, 'AV CHACALTAYA', 'EL ALTO', 'carla@gmail.com', 1);
INSERT INTO `responsable` VALUES (2, 23615999, 'mauricio', 'mamani', 'zabaleta', '1985-08-11', 'masculino', 74956321, 'av ballivian', 'la paz', 'mauricio@gmail.com', 2);
INSERT INTO `responsable` VALUES (3, 36215625, 'tatiana', 'quispe', 'mercado', '1988-09-18', 'fememnino', 77745522, 'av armonia', 'la paz', 'tatiana@gmail.com', 1);
INSERT INTO `responsable` VALUES (4, 44125589, 'JUAN', 'ILLANES', 'ROCA', '1992-05-17', 'MASCULINO', 76662589, 'AV LOS ANGELES', 'LA PAZ', 'juan@gmail.com', 2);
INSERT INTO `responsable` VALUES (5, 22031569, 'henrry', 'vargas', 'vargas', '1976-12-05', 'masculino', 77785231, 'av. pichupichu', 'el alto', 'henrry@gmail.com', 3);
INSERT INTO `responsable` VALUES (6, 12516651, 'micaela', 'chuquimia', 'flores', '1960-05-30', 'femenino', 74859563, 'calle rojas', 'la paz', 'micaela@gmail.com', 1);
INSERT INTO `responsable` VALUES (7, 45824692, 'sara', 'surco', 'mamanni', '1987-12-12', 'femenino', 66258963, 'av santos dumont', 'beni', 'sara@gmail.com', 1);
INSERT INTO `responsable` VALUES (8, 13215326, 'jhonatan', 'chino', 'diaz', '1988-06-15', 'masculino', 78495663, 'av santa cruz', 'la paz', 'jhonata@gmail.com', 2);
INSERT INTO `responsable` VALUES (9, 14741895, 'wilson', 'huanca', 'huallpa', '1995-11-24', 'masculino', 66523662, 'calle florida', 'el alto', 'wilson@gmail.com', 3);
INSERT INTO `responsable` VALUES (10, 28463215, 'ramiro', 'copa', 'peralta', '1980-08-11', 'masculino', 70155556, 'calle velazco', 'la paz', 'ramino@gmail.com', 2);
INSERT INTO `responsable` VALUES (11, 15256845, 'nelson', 'chara', 'ari', '1999-07-21', 'masculino', 70151555, 'av garcilazo', 'cochabamba', 'nelson@gmail.com', 1);
INSERT INTO `responsable` VALUES (12, 12584962, 'ariel', 'colque', 'mollericona', '1989-10-25', 'femenino', 78459222, 'calle ruiz', 'la paz', 'ariel@gmail.com', 3);
INSERT INTO `responsable` VALUES (13, 15846255, 'claudia', 'jancko', 'torrez', '1989-06-12', 'femenino', 60256315, 'av retamas', 'tarija', 'claudia@gmail.com', 2);
INSERT INTO `responsable` VALUES (14, 22365565, 'luceli', 'yujra', 'navarro', '1994-01-22', 'femenino', 60251589, 'av los pinos', 'sucre', 'luceli@gmail.com', 1);
INSERT INTO `responsable` VALUES (15, 14215552, 'juan', 'aro', 'yiana', '1997-07-31', 'masculino', 66302306, 'av camacho', 'oruro', 'juan@gmail.com', 1);
INSERT INTO `responsable` VALUES (16, 23236589, 'roberto', 'yahuasi', 'canaviri', '1998-04-28', 'masculino', 76932659, 'calle coroico', 'beni', 'roberto@gmail.com', 2);
INSERT INTO `responsable` VALUES (17, 11596325, 'mario', 'vargas', 'calani', '1995-10-06', 'masculino', 77154854, 'calle zuares', 'la paz', 'mario@gmail.com', 2);
INSERT INTO `responsable` VALUES (18, 12584632, 'xiomara', 'rodriguez', 'medeyro', '1991-09-15', 'femenino', 77112533, 'calle calacoto', 'sucre', 'xiomara@gmail.com', 1);
INSERT INTO `responsable` VALUES (19, 12546325, 'veronica', 'choque', 'bonifacio', '1986-11-29', 'femenino', 74854785, 'av junin', 'santa cruz', 'veronica@gmail.com', 1);
INSERT INTO `responsable` VALUES (20, 85954862, 'paola', 'condori', 'escobar', '1985-02-02', 'femenino', 74858487, 'av tarija', 'cochabamba', 'paola@gmail.com', 3);
INSERT INTO `responsable` VALUES (21, 15265644, 'claudia', 'tolava', 'corpa', '1994-12-08', 'femenino', 63625965, 'calde velardes', 'la paz', 'claudiaaa@gmail.com', 3);
INSERT INTO `responsable` VALUES (22, 12549622, 'roxana', 'huaygua', 'limachi', '1991-06-02', 'femenino', 69859748, 'av 16 de julio', 'tarija', 'roxana@gmail.com', 3);
INSERT INTO `responsable` VALUES (23, 15452622, 'marco', 'sinka', 'humiri', '1991-08-08', 'masculino', 66325985, 'calle beni', 'tatija', 'marco@gmail.com', 3);
INSERT INTO `responsable` VALUES (24, 23655854, 'luis', 'chejo', 'zabaleta', '1987-10-13', 'masculino', 77849589, 'av robles', 'santa  cruz', 'luis@gmail.com', 1);
INSERT INTO `responsable` VALUES (25, 21263325, 'jose', 'ali', 'nina', '1986-07-08', 'masculino', 76485496, 'av tores', 'beni', 'jose@gamil.com', 2);
INSERT INTO `responsable` VALUES (26, 12365965, 'severo', 'canasa', 'ticonipa', '1993-09-27', 'masculino', 66625896, 'calle riosino', 'cochabamba ', 'severo@gamil.com', 3);
INSERT INTO `responsable` VALUES (27, 12363695, 'luz', 'mercado', 'velazco', '1996-07-30', 'femenino', 63258966, 'calle juan pablo', 'la paz', 'luz@gmail.com', 1);
INSERT INTO `responsable` VALUES (28, 89659588, 'yasira', 'zurita', 'arapa', '1985-01-11', 'femenino', 77155264, 'av siles', 'el alto', 'yhasira@gmail.com', 2);
INSERT INTO `responsable` VALUES (29, 78478969, 'mireya', 'plata', 'rojas', '1997-02-22', 'femenino', 77849589, 'av villegas', 'la paz', 'mireya@gmail.com', 1);
INSERT INTO `responsable` VALUES (30, 36265963, 'ruben', 'quisbert', 'huanaco', '2001-12-14', 'masculino', 77859658, 'av callapa', 'la paz', 'ruben@gmail.com', 3);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '1', 'administrador');
INSERT INTO `roles` VALUES (2, '2', 'doctor');
INSERT INTO `roles` VALUES (3, '3', 'resepcionista');

-- ----------------------------
-- Table structure for turnos
-- ----------------------------
DROP TABLE IF EXISTS `turnos`;
CREATE TABLE `turnos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `turno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `hora_inicio` time NULL DEFAULT NULL,
  `hora_final` time NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of turnos
-- ----------------------------
INSERT INTO `turnos` VALUES (1, 'mañana', '08:20:00', '16:10:00');
INSERT INTO `turnos` VALUES (2, 'tarde', '15:00:00', '21:00:00');
INSERT INTO `turnos` VALUES (3, 'noche', '21:00:00', '06:00:00');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int NOT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `contraseña` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id_rol` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_rol`(`id_rol` ASC) USING BTREE,
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (101, '1111', '111111', 1);
INSERT INTO `usuarios` VALUES (102, '2222', '222222', 2);
INSERT INTO `usuarios` VALUES (103, '3333', '333333', 2);
INSERT INTO `usuarios` VALUES (104, '4444', '444444', 3);
INSERT INTO `usuarios` VALUES (105, '5555', '555555', 3);

SET FOREIGN_KEY_CHECKS = 1;
