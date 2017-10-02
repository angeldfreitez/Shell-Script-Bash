#!/bin/bash
	
	#variables
		log=/home/daniel/Minecraft-PE
	#===============

function Lista_Log(){
	oldIFS=$IFS    
	IFS=$'\n'     
	i=0
	#/home/daniel/Minecraft-PE
	#/media/daniel/DATA/SCRITS/TERMINADOS
	cp /home/daniel/Minecraft-PE/server.log /home/daniel/Minecraft-PE/srv.log
	for linea in $(cat /home/daniel/Minecraft-PE/srv.log)
		do
			B=`echo $linea | grep -o "Server thread/EMERGENCY"`
			if [ ${#B} -ne 0 ]
			then
				Errores_log[$a]=${linea:49}
				a=$(($a+1))
			fi
		done
	IFS=$old_IFS
	rm /home/daniel/Minecraft-PE/srv.log
	}

function Lista_Errores(){
	oldIFS=$IFS     # conserva el separador de campo
	IFS=$'\n'     # nuevo separador de campo, el caracter fin de línea
	i=0
	for linea in $(cat /home/daniel/Minecraft-PE/Lista_Errores.txt)
		do
   			Errores_lista[$i]=$linea
   			i=$(($i+1))
		done
	IFS=$old_IFS     # restablece el separador de campo predeterminado	
	}

	Lista_Errores
	Lista_Log


	for (( i = 0; i < ${#Errores_log[@]}; i++ )); do #lista de errores en log
		for (( q = 0; q < ${#Errores_lista[@]}; q++ )); do #lista de errores que se tienen
			if [[ "${Errores_lista[$q]}" != "${Errores_log[$i]}" ]]; then 
				if [[ $q -eq `expr ${#Errores_lista[@]} - 1` ]]; then
					if [[ $agregado = false ]]; then
						
						if [[ "${#Errores_lista[$q]}" -gt "3" ]]; then
							echo ${Errores_log[$i]} >> /home/daniel/Minecraft-PE/Lista_Errores.txt
							Lista_Errores
							echo NUEVO ERROR AGREGADO:: ${Errores_log[$i]}
							q=0
							error=1
						fi
					fi
				fi
			else
				agregado=true
			fi	
		done
		agregado=false
	done

	if [[ ${#Errores_log[@]} -ge "1" ]]; then
		service minecraftpe rcon_p
		error=false
	fi
