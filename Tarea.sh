#!/bin/bash

echo
echo "***************"\\" Elija una opcion /***************"
echo
echo "               1 Agregar un grupo"
echo "              2 Agregar un usuario "
echo "        3 Agregar un usuario a un grupo"
read x
  case $x in
      1|1) 
echo -n "Ingrese el nombre del grupo: "
read groupname
sudo addgroup $groupname
sudo mkdir /home/$groupname

	
      ;;
      2|2)
         
read -p "Ingrese el nombre de usuario: " username
read -p "Ingrese la contraseña: " password
sudo egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo "$username ya existe!"
exit 1
else
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
sudo useradd -m -p $pass $username
#permisos 
#chmood g+r-w-x $username
[ $? -eq 0 ] && echo "El usuario se ha agregado al sistema!" || echo "No se ha podido agregar el usuario!"
fi

      ;;
      3|3)
         
echo -n "Ingrese el nombre del usuario: "
read usu
echo -n "Ingrese el nombre del grupo: "
read gru
sudo addgroup $usu $gru
      ;;
      

	*)
         echo "desconozco esa opción vuelve a intentar"
      ;;
  esac
