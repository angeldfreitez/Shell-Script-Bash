
#!/bin/bash


#cuando hay un errer aparece 
#esto es un error >>>> [Server thread/WARNING]: "ACA VA EL ERROR"

function Lista_Errores()
{
	oldIFS=$IFS     # conserva el separador de campo
	IFS=$'\n'     # nuevo separador de campo, el caracter fin de línea
	i=0
	for linea in $(cat /home/daniel/Escritorio/pruebas/Lista_Errores)
		do
   			Errores[$i]=$linea
   			i=$(($i+1))
		done
	IFS=$old_IFS     # restablece el separador de campo predeterminado	
}

function nuevo_error(){

	Lista_Errores

	oldIFS=$IFS     # conserva el separador de campo
	IFS=$'\n'     # nuevo separador de campo, el caracter fin de línea
	i=0
	for linea in $(cat /media/daniel/DATA/pruebas/server.log)
		do
			B=`echo $linea | grep -o "Server thread/EMERGENCY"`
			if [ ${#B} -ne 0 ]
			then
				K[$a]=${linea:49}
				a=$(($a+1))
			fi
		done
	IFS=$old_IFS

	a=0
	#Falta comparar el arreglo de error con los 
	#errores que ya estan para sacar nuevos errores

}
while error=false
do
	Lista_Errores

	contador=0
	for e in $(cat /home/daniel/Escritorio/pruebas/Lista_Errores)
		do
			for a in #aca va la lista de logs
			do
				if(a -eq e)
					then
					error=true
			done

			if(error -eq true)
				then
				echo "Se detecto un Error"
				#Reinicio del server cada vez que se dectecte un error
				exit 0
			else
				contador=$contador+1
		done

	if(error -eq false)
		then
			echo "Revision de errores a la fecha $date completa"
			echo "no se detecto ningun error"
		slepp #6horas
		error=false


done

