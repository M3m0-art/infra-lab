#!/usr/bin/env bash
# Prueba funcional de la infraestructura (Lab 7)
fallos=0

NOMBRE=$(terraform output -raw nombre_contenedor)
URL=$(terraform output -raw url_servidor)

# Prueba 1: el contenedor está corriendo
estado=$(docker inspect -f '{{.State.Running}}' "$NOMBRE" 2>/dev/null)
if [ "$estado" = "true" ]; then
  echo "PASS: el contenedor $NOMBRE está corriendo"
else
  echo "FAIL: el contenedor $NOMBRE no está corriendo"; fallos=1
fi

# Prueba 2: nginx responde con HTTP 200
codigo=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
if [ "$codigo" = "200" ]; then
  echo "PASS: $URL respondió HTTP 200"
else
  echo "FAIL: $URL respondió HTTP $codigo"; fallos=1
fi

exit $fallos
