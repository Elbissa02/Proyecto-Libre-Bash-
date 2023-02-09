#!/bin/bash
menu(){
	echo "----------Instalar y configurar software-----------"
	echo ""
	echo "1. Instalar synaptic"
	echo "2. Actualización del sistema"
	echo ""
	echo "--------Configuración de cuentas y equipos---------"
	echo ""
	echo "3. Crear un usuario"
	echo "4. Modificar usuarios"
	echo "5. Eliminar usuarios"
	echo "6. Crear grupo"
	echo "7. Modificar grupo"
	echo "8. Eliminar grupo"
	echo ""
	echo "-----------Supervisión del rendimiento-------------"
	echo ""
	echo "9. Visualizar la estadísticas de la memoria virtual"
	echo "10. Lista de archivos abiertos"
	echo "11. Seguimiento de procesos"
	echo "12. Ver espacio disponible/ocupado en el disco duro"
	echo ""
	echo "13. Salir"
	echo ""
}

synaptic(){
	echo ""
	echo "Durante la instalación aparecerán unas ventanas, seleccione todo por defecto"
	echo ""
	sudo apt install synaptic
	echo ""
	echo "========== Instalación completada con éxito =========="
	echo ""
	echo ""
}

actualizar(){
	echo ""
	sudo apt update
	sudo apt upgrade 
	echo ""
	echo "========== Actualización completada con éxito =========="
	echo ""
	echo ""
}

crear_usu(){
	echo ""
	read -p "Indica un nombre para el usuario: " nombre
	sudo useradd $nombre
	echo ""
	cat /etc/passwd | grep $nombre
	echo ""
	echo "========== Usuario creado con éxito =========="
	echo ""
	echo ""
}

modi_usu(){
	echo ""
	echo "1. Cambiar nombre del usuario"
	echo "2. Cambiar contraseña del usuario"
	echo "3. Bloquear la contraseña de un usuario"
	echo "4. Desbloquear la contraseña de un usuario"
	echo "5. Salir"
	echo ""
	read -p "Elija una opción: " opcion
	echo ""
	if [ $opcion = 1 ]
	then 
		echo ""
		read -p "Introduzca el nombre del usuario que deseas cambiar: " nombre_antiguo
		echo ""
		read -p "Introduzca el nuevo nombre: " nombre_nuevo
		echo ""
		sudo usermod -l $nombre_nuevo $nombre_antiguo
		cat /etc/passwd | grep $nombre_nuevo
		echo ""
		echo "========== Nombre del usuario cambiado con éxito =========="
		echo ""
		echo ""
	elif [ $opcion = 2 ]
	then
		echo ""
		read -p "Introduzca el usuario al que desea cambiarle la contraseña: " usuario
		echo ""
		read -p "Introduzca la nueva contraseña: " contrasena
		echo ""
		sudo usermod -p $contrasena $usuario
		echo ""
		echo "========== Contraseña cambiada con éxito =========="
		echo ""
		echo ""
	elif [ $opcion = 3 ]
	then
		echo ""
		read -p "Indica el usuario al que desea bloquear la contraseña: " usuario
		echo ""
		sudo usermod -L $usuario
		echo ""
		echo "========== Contraseña bloqueada con éxito =========="
		echo ""
		echo ""
	elif [ $opcion = 4 ]
	then
		echo ""
		read -p "Indica el usuario al que desea desbloquear la contraseña: " usuario
		echo ""
		sudo usermod -U $usuario
		echo ""
		echo "========== Contraseña desbloqueada con éxito =========="
		echo ""
		echo ""
	fi
}

eliminar_usu(){
	echo ""
	read -p "Indica el nombre del usuario que desea eliminar: " nombre
	sudo userdel $nombre
	echo ""
	echo "========== Usuario eliminado con éxito =========="
	echo ""
	echo ""
}

crear_gru(){
	echo ""
	read -p "Indica un nombre para el grupo:  " nombre
	sudo groupadd $nombre
	echo ""
	echo "========== Grupo creado con éxito =========="
	echo ""
	echo ""
}

modi_gru(){
	echo ""
	echo "1. Modificar el nombre del grupo"
	echo "2. Eliminar la contraseña de un grupo"
	echo "3. Añadir usuarios a un grupo"
	echo "4. Eliminar usuarios de un grupo"
	echo "5. Hacer administrador a un usuario del grupo"
	echo "6. Salir"
	echo ""
	read -p "Elíja una opción: " opcion
	echo ""
	if [ $opcion = 1 ]
	then
		echo ""
		read -p "Indica el grupo al que desea cambiar el nombre: " grupo_antiguo
		echo ""
		read -p "Introduzca el nuevo nombre del grupo: " grupo_nuevo
		echo "" 
		sudo groupmod -n $grupo_nuevo $grupo_antiguo
		echo ""
		echo "========== Nombre modificado con éxito =========="
		echo ""
		echo ""
	elif [ $opcion = 2 ]
	then
		echo ""
		read -p "Indica el grupo al que desea eliminar la contraseña: " grupo
		echo ""
		sudo gpasswd -r $grupo
		echo ""
		echo "========== Contraseña eliminada con éxito =========="
		echo ""
		echo ""
	elif [ $opcion = 3 ]
	then 
		echo ""
		read -p "Indica el usuario que desea añadir: " usuario
		echo ""
		read -p "Indica el grupo donde quiere que se añada el usuario: " grupo
		echo ""
		sudo gpasswd -a $usuario $grupo
		echo ""
		echo "========== Usuario añadido con éxito =========="
		echo ""
		echo ""
	elif [ $opcion = 4 ]
	then 
		echo ""
		read -p "Indica el usuario que desea eliminar: " usuario
		echo ""
		read -p "Indica el grupo donde se encuentra el usuario introducido: " grupo
		echo ""
		sudo gpasswd -d $usuario $grupo
		echo ""
		echo "========== Usuario eliminado con éxito =========="
		echo ""
		echo ""
	elif [ $opcion = 5 ]
	then 
		echo ""
		read -p "Indica el usuario al que desea como administrador: " usuario
		echo ""
		read -p "Indica el grupo donde se encuentra el usuario introducido: " grupo
		echo ""
		sudo gpasswd -A $usuario $grupo
		echo ""
		echo "========== El usuario se a convertido como administrador con éxito =========="
		echo ""
		echo ""
	fi
}

eliminar_gru(){
	echo ""
	read -p "Indica el nombre del grupo que desea eliminar: " nombre
	sudo groupdel $nombre
	echo ""
	echo "========== Grupo eliminado con éxito =========="
	echo ""
	echo ""
}

mem_virtual(){
	echo ""
	vmstat
	echo ""
}

arch_abiertos(){
	echo ""
	lsof
	echo ""
	
}

procesos(){
	echo ""
	htop
	echo ""
}

disco_duro(){
	echo ""
	df -h
	echo ""
}

while true;do
	menu
	read -p "Seleccione una de las opciones del menú: " opcion
	case $opcion in
		1)clear;synaptic;;
		2)clear;actualizar;;
		3)clear;crear_usu;;
		4)clear;modi_usu;;
		5)clear;eliminar_usu;;
		6)clear;crear_gru;;
		7)clear;modi_gru;;
		8)clear;eliminar_gru;;
		9)clear;mem_virtual;;
		10)clear;arch_abiertos;;
		11)clear;procesos;;
		12)clear;disco_duro;;
		13)exit;;
		*)echo "No existe";break;;
	esac
done




