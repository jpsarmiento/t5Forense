#!/bin/bash
echo "La configuracion de red debe estar realizada previamente con el script IP-STATIC.sh..."
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
lsof -u sedna > ficherosSEDNA.txt
lsof | more > TCP-UDP.txt
lsof -i > internetConexiones.txt
who > usersLog.txt
who -uH > inactividadUsers.txt
who -q > usersLog.txt
lastlog > historialLogs.txt
netstat -rn > tablaEnrutamiento.txt
route > rutasSEDNA.txt
top -n 1 > procesosEjecucion
history > historialComandos.txt
lsmod > modulosKernelCargados.txt
df -k > sistemasArchivos.txt
uname -a > systemVersion.txt
cat /etc/rsyslog.conf > syslogsConf.txt
cat /var/log/mail.log > mailLog.txt
cat /var/log/boot.log > bootLog.txt
cat /etc/passwd > cuentasUsuarios.txt
date > fechaFin.txt
echo "Ejecucion terminada..."
echo "Puede ver los archivos resultantes del proceso en el directorio /home/sedna..."
