<?php
// BACKEND CONFIG
// HTTP
define('HTTP_SERVER', 'http://localhost/banhang/admin/');
define('HTTP_CATALOG', 'http://localhost/banhang/');
define('HTTP_IMAGE', 'http://localhost/banhang/image/');
define('HTTP_ADMIN', 'http://localhost/banhang/admin/');

// HTTPS
define('HTTPS_SERVER', HTTP_SERVER);
define('HTTPS_CATALOG', HTTP_CATALOG);
define('HTTPS_IMAGE', HTTP_IMAGE);
define('HTTPS_ADMIN', HTTP_ADMIN);

// DIR
define('DIR_CATALOG', 'C:/xampp/htdocs/banhang/catalog/');
define('DIR_APPLICATION', 'C:/xampp/htdocs/banhang/admin/');
define('DIR_SYSTEM', 'C:/xampp/htdocs/banhang/system/');
define('DIR_DATABASE', DIR_SYSTEM.'database/');
define('DIR_LANGUAGE', DIR_APPLICATION.'language/');
define('DIR_TEMPLATE', DIR_APPLICATION.'view/template/');
define('DIR_CONFIG', DIR_SYSTEM.'config/');
define('DIR_IMAGE', 'C:/xampp/htdocs/banhang/image/');
define('DIR_CACHE', DIR_SYSTEM.'cache/');
define('DIR_DOWNLOAD', DIR_SYSTEM.'download/');
define('DIR_LOGS', DIR_SYSTEM.'logs/');
define('DIR_MODIFICATION', DIR_SYSTEM.'modification/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'thuocgiamcan');
define('DB_PREFIX', 'oc_');
?>