INSERT INTO `categoria` (`nombre`, `image`, `estado`, `created_at`) VALUES
('herramientas mecanicas', '/uploads/1583430725929.jpg', 1, CURRENT_TIMESTAMP),
( 'importacion de materiales', '/uploads/1583430771767.jpg', 1, CURRENT_TIMESTAMP),
( 'sensores industriales', '/uploads/1583430826421.jpg', 1, CURRENT_TIMESTAMP),
( 'medidores electricos', '/uploads/1583431002221.jpg', 1, CURRENT_TIMESTAMP),
( 'herramientas electricas', '/uploads/1583431031756.jpg', 1, CURRENT_TIMESTAMP),
( 'targetas de arduino', '/uploads/1583431054899.jpg', 1, CURRENT_TIMESTAMP),
( 'equipo de proteccion personal', '/uploads/1583431154951.jpg', 1, CURRENT_TIMESTAMP),
( 'elementos electronicos', '/uploads/1583431179167.jpg', 1, CURRENT_TIMESTAMP),
( 'equipos de medicion', '/uploads/1583431200101.jpg', 1, CURRENT_TIMESTAMP),
( 'libros de electronica practica', '/uploads/1583433092117.jpg', 1, CURRENT_TIMESTAMP),
( 'folletos de kits para armar', '/uploads/1583433205927.jpg', 1, CURRENT_TIMESTAMP),
( 'herramientas para suelda electronica', '/uploads/1583433240928.jpg', 1, CURRENT_TIMESTAMP),
( 'modulos para arduino', '/uploads/1583433267717.jpg', 1, CURRENT_TIMESTAMP),
( 'proyectos de desarrollo', '/uploads/1583433300774.jpg', 1, CURRENT_TIMESTAMP),
( 'sensores y actuadores', '/uploads/1583433353237.jpg', 1, CURRENT_TIMESTAMP),
( 'cables', '/uploads/1583433479451.jpg', 1, CURRENT_TIMESTAMP),
( 'equipo de seguridad industrial', '/uploads/1583433504180.jpg', 1, CURRENT_TIMESTAMP);


INSERT INTO `producto` (`idcategoria`, `nombre`, `image`, `precio`, `stock`, `estado`, `created_at`) VALUES
(1, 'alicate', '/uploads/1585263187695.jpeg', 15, 3, 1, '2020-03-26'),
(1, 'lima', '/uploads/1585263747605.jpg', 15, 3, 1, '2020-03-26'),
(3, 'sensor optico', '/uploads/1585266770706.jpg', 30, 12, 1, '2020-03-26');