#!/bin/bash

getinfo()
{
  clear
  echo -------------------------------------------------------------------
  echo Universidad de los Andes
  echo Departamento de Sistemas y Computación
  echo http://www.uniandes.edu.co
  echo Autor: Ing Joshsua González
  echo Todos los derechos reservados © Copyright
  echo Bogotá - Colombia
  echo -------------------------------------------------------------------
  sleep 3
  echo
  read -p "Ingrese la Dirección IP a configurar: (Ej. 192.168.0.X) " staticip
  sleep 1
  read -p "Ingrese la mascara de red:   (Ej. 255.255.255.0) " netmask
  sleep 1
# *===========================================================================*
#  Configuración ETH0
# *===========================================================================*
sudo -s ifconfig eth0 $staticip netmask $netmask
# *===========================================================================*
# -Fin- Configuración ETH0
# *===========================================================================*
  read -p "Ingrese el gateway:          (Ej. 192.168.0.1) " routerip
  sleep 1
# *===========================================================================*
#  Configuración Gateway
# *===========================================================================*
sudo -s route add default gw $routerip
# *===========================================================================*
# -Fin- Configuración Gateway
# *===========================================================================*
  read -p "Ingrese la dirección IP del DNS primario: (Ej. 8.8.8.8) " DNS_IP
  sleep 1
#  read -p "Ingrese la dirección IP del DNS secundario: " DNS_IP2
#  sleep 1
  echo Configurando...
  sleep 2
#Comienzo de configuración DNS
sudo -s chmod 777 /etc/resolv.conf
sudo -s cat << EOF > /etc/resolv.conf
#-------------------------------------------------------------------
# Universidad de los Andes
# Departamento de Sistemas y Computación
# http://www.uniandes.edu.co
# Autor: Ing Joshsua González
# Todos los derechos reservados © Copyright
# Bogotá - Colombia
#-------------------------------------------------------------------
#
# Configuración de servidores de Resolución de Nombres DNS
nameserver $DNS_IP
# -Fin-
EOF
}

writeinterfacefile()
{
cat << EOF > $1
#-------------------------------------------------------------------
# Universidad de los Andes
# Departamento de Sistemas y Computación
# http://www.uniandes.edu.co
# Autor: Ing Joshsua González
# Todos los derechos reservados © Copyright
# Bogotá - Colombia
#-------------------------------------------------------------------
#
auto lo
iface lo inet loopback
# The primary network interface
auto eth0
iface eth0 inet dhcp

#Configuración Estática de direccionamiento IP
iface eth0 inet static
address $staticip
netmask $netmask
gateway $routerip
EOF
#don't use any space before of after 'EOF' in the previous line

  echo ""
  echo "Your informatons was saved in '$1' file."
  echo ""
  exit 0

}

file="/home/ipconfig.txt"
if [ ! -f $file ]; then
  echo ""
  echo "The file '$file' doesn't exist!"
  echo ""
  exit 1
fi

clear

getinfo
clear
echo -------------------------------------------------------------------
echo Universidad de los Andes
echo Departamento de Sistemas y Computación
echo http://www.uniandes.edu.co
echo Autor: Ing Joshsua González
echo Todos los derechos reservados © Copyright
echo Bogotá - Colombia
echo -------------------------------------------------------------------
sleep 3
echo ""
echo "Su Configuración de red es la siguiente"
echo *------------------------------------------------------------------*
echo "Dirección IP =   $staticip"
echo "Direccionamiento GATEWAY =   $routerip"
echo "Máscara de Red = $netmask"
echo "DNS Primario =	$DNS_IP"
echo "DNS Secundario =	$DNS_IP2"
echo *------------------------------------------------------------------*
echo ""

while true; do
  read -p "Esta información es correcta? [s/n]: " sn
  case $sn in
    [Ss]* ) writeinterfacefile $file;;
    [Nn]* ) getinfo;;
        * ) echo "Por favor ingrese si o no! [s/n]";;
  esac
done
