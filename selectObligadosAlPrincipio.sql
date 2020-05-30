/*Base de datos localhost*/
INSERT INTO `eurekakits`.`tipopago` (`nombre`, `estado`, `created_at`) VALUES ('Paypal', '1', '2020-05-22');
INSERT INTO `eurekakits`.`tipopago` (`nombre`, `estado`, `created_at`) VALUES ('Transferencia Bancaria', '1', '2020-05-22');
INSERT INTO `eurekakits`.`tipopago` (`nombre`, `estado`, `created_at`) VALUES ('Efectivo', '1', '2020-05-22');
INSERT INTO `categoria` (`nombre`, `image`, `estado`, `created_at`) VALUES ('herramientas mecanicas', '/uploads/1583430725929.jpg', 1, CURRENT_TIMESTAMP);
INSERT INTO `eurekakits`.`dto` (`dto`, `estado`, `created_at`) VALUES ('5', '1', '2020-05-23');

/*Base de datos remota*/
INSERT INTO `bl8lar3zrndtt8sgnjxe`.`tipopago` (`nombre`, `estado`, `created_at`) VALUES ('Paypal', '1', '2020-05-22');
INSERT INTO `bl8lar3zrndtt8sgnjxe`.`tipopago` (`nombre`, `estado`, `created_at`) VALUES ('Transferencia Bancaria', '1', '2020-05-22');
INSERT INTO `bl8lar3zrndtt8sgnjxe`.`tipopago` (`nombre`, `estado`, `created_at`) VALUES ('Efectivo', '1', '2020-05-22');
INSERT INTO `categoria` (`nombre`, `image`, `estado`, `created_at`) VALUES ('herramientas mecanicas', '/uploads/1583430725929.jpg', 1, CURRENT_TIMESTAMP);
INSERT INTO `bl8lar3zrndtt8sgnjxe`.`dto` (`dto`, `estado`, `created_at`) VALUES ('5', '1', '2020-05-23');