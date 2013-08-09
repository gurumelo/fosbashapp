#!/bin/bash
echo -n "Nombre o ruta de la aplicación: "
read NOMBREA

mkdir $NOMBREA

echo "Generando index"

cat > $NOMBREA/index.html << EOF
<!DOCTYPE html>
<html>
<head>
	<title>$NOMBREA</title>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"/>
	<meta charset="utf-8">
</head>
<body>

</body>
</html>
EOF

echo "Generado index"

echo -n "Nombre para la aplicación: "
read NOMBRE
echo -n "Descripción para la aplicación: "
read DESCRIPCION
echo -n "Nombre de quien escribe el código: "
read DEV
echo -n "URL: "
read URL

echo "Generando manifest"

cat > $NOMBREA/manifest.webapp << EOF
{ 
	"name": "$NOMBRE",
	"description": "$DESCRIPCION",
	"launch_path": "/index.html",
	"developer": {
		"name": "$DEV",
		"url": "$URL"
	},
	"icons": {
		"16": "/img/icon16.png",
		"32": "/img/icon32.png",
		"48": "/img/icon48.png",
		"64": "/img/icon64.png",
		"128": "/img/icon128.png"
	},
	"installs_allowed_from": ["*"],
	"default_locale": "en"
}
EOF

echo "Generado manifest"
tree $NOMBREA
