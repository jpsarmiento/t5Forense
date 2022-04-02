#!/bin/bash
echo "La configuracion de red debe estar realizada previamente con el script IP-STATIC.sh..."
ssh neptuno@192.168.239.6
sudo -s
cd
date > fechaInicio.txt
hostname > hostname.txt
cd /proc
cat version uptime meminfo filesystems cpuinfo > /home/sedna/procFiles.txt
cd
uptime > uptime.txt
w >> uptime.txt
netstat > conexionesRed.txt
netstat -an > puertos.txt
lsof > ficherosSistema.txt
lsof -u neptuno > ficherosNeptuno.txt
lsof | more > TCP-UDP.txt
lsof -i > internetConexiones.txt
who > usersLog.txt
who -uH > inactividadUsers.txt
who -q > usersLog.txt
lastlog > historialLogs.txt
netstat -rn > tablaEnrutamiento.txt
route > rutasNeptuno.txt
top -n 1 > procesosEjecucion
history > historialComandos.txt
lsmod > modulosKernelCargados.txt
df -k > sistemasArchivos.txt
uname -a > systemVersion.txt
cat /etc/rsyslog.conf > syslogsConf.txt
cat /etc/passwd > cuentasUsuarios.txt
date > fechaFin.txt
echo "Ejecucion terminada..."
echo "Puede ver los archivos resultantes del proceso en el directorio /home/neptuno..."
