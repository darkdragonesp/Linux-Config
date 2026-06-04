#!/bin/bash

set -e

echo "Dispositivos USB disponibles:"
usbip list -l

echo ""
echo "Iniciando usbipd en segundo plano..."
sudo usbipd -D

echo ""
echo "Vinculando dispositivo USB con busid 1-3..."
sudo usbip bind --busid 1-3

echo ""
echo "Proceso completado."
