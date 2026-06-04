#!/bin/bash

set -e

echo "Deshabilitando sistema de solo lectura..."
sudo steamos-readonly disable

echo "Reinicializando claves PGP de pacman..."
sudo rm -rf /etc/pacman.d/gnupg
sudo pacman-key --init
sudo pacman-key --populate archlinux

echo "Instalando usbip..."
sudo pacman -S --noconfirm usbip

echo "Cargando módulos..."
sudo modprobe usbip-host
sudo modprobe usbip-core

echo "Configurando carga automática al arrancar..."
echo usbip-host | sudo tee /etc/modules-load.d/usbip.conf >/dev/null
echo usbip-core | sudo tee -a /etc/modules-load.d/usbip.conf >/dev/null

echo ""
echo "Instalación completada."
echo "Módulos configurados para cargarse automáticamente en cada arranque."

echo "Habilitando sistema de solo lectura..."
sudo steamos-readonly enable
