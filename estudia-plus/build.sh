#!/bin/sh
# Genera index.html autónomo (React 18.3.1 incluido, funciona sin internet).
set -e
cd "$(dirname "$0")"
R=${REACT_DIR:-node_modules}
{
printf '<!doctype html>\n<html lang="es">\n<head>\n<meta charset="UTF-8" />\n<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" />\n<meta name="theme-color" content="#e0189a" />\n<meta name="description" content="Planificador de estudio para ESO y Bachillerato (Andalucía)." />\n<meta name="apple-mobile-web-app-capable" content="yes" />\n<meta name="apple-mobile-web-app-title" content="Estudia+" />\n<title>Estudia+ · Planificador de estudio</title>\n<style>'
cat src/style.css
printf '</style>\n</head>\n<body>\n<div id="root"></div>\n<noscript>Estudia+ necesita JavaScript para funcionar.</noscript>\n<script>'
cat "$R/react/umd/react.production.min.js"
printf '</script>\n<script>'
cat "$R/react-dom/umd/react-dom.production.min.js"
printf '</script>\n<script>'
cat src/app.js
printf '</script>\n</body>\n</html>\n'
} > index.html
