#!/bin/bash

volver_menu="read -n 1 -s -p \"Pulse cualquier tecla para volver al menú principal\""

while true; do
        echo
        echo "femtotop v. 1.0 (creado por Diego Bermudo y M.R)"
        echo
        echo "L. Listar procesos"
        echo "S. Enviar señal a proceso"
        echo "B. Buscar procesos"
        echo "Q. Salir"
        echo
        read -p "Introduzca opción: " opcion


if [ "$opcion" = "L" ]; then
        clear
        ps -e -o pid,user,comm,%cpu --sort=-%cpu | head -n 21
        echo
        eval "$volver_menu"

elif [ "$opcion" = "S" ]; then
        clear
        read -p "Introduce el PID del proceso: " pid
        if  ps -p "$pid" > /dev/null 2>&1; then
                clear
                echo "Seleccione la señal a enviar al proceso $pid:"
                echo
                echo "(H)UP"
                echo "(U)SR1"
                echo "(K)ILL"
                echo "(T)ERM"
                echo
                read -p "Introduzca la señal: " senal
                if [ "$senal" = "H" ]; then
                        kill -HUP "$pid"
                        echo "Señal HUP enviada al proceso $pid"
                elif [ "$senal" = "U" ]; then
                        kill -USR1 "$pid"
                        echo "Señal USR1 enviada al proeso $pid"
                elif [ "$senal" = "K" ]; then
                        kill -KILL "$pid"
                        echo "Señal KILL enviada al proceso $pid"
                elif [ "$senal" = "T" ]; then
                        kill -TERM "$pid"
                        echo "Señal TERM enviada al proceso $pid"
                else
                        echo "Señal no válida: $senal"
                fi
        else
                echo "Proceso con PID $pid no encontrado en el sistema"
        fi
        echo
        eval "$volver_menu"

elif [ "$opcion" = "B" ]; then
        clear
        read -p "Introduce un texto para buscar un proceso: " buscar_texto
        resultados=$(ps -e -o pid,user,comm,%cpu --sort=-%cpu | awk -v busq="$buscar_texto" 'NR==1 || index(tolower($3), tolower(busq))')

        num_lineas=$(echo "$resultados" | wc -l)

        if [ "$num_lineas" -gt 1 ]; then
                clear
                echo "Procesos que contienen '$buscar_texto':"
                echo
                echo "$resultados" | head -n 21
        else
                echo "No existen procesos cuyo programa contenga $buscar_texto"
        fi
                echo
                eval "$volver_menu"

elif [ "$opcion" = "Q" ]; then
        clear
        echo "Saliendo de femtotop..."
        exit 0
else
        echo "Opcion $opcion inválida"
        eval "$volver_menu"

fi

done