#!/bin/bash

# Configuración
VERSION="1.0"
AUTORES="Diego Bermudo y Marcos Rozas"
MAX_PROCESSES=20

# Funciones
mostrar_menu() {
    echo
    echo "femtotop v. $VERSION (creado por $AUTORES)"
    echo
    echo "L. Listar procesos"
    echo "S. Enviar señal a proceso"
    echo "B. Buscar procesos"
    echo "Q. Salir"
    echo
}

pausa() {
    read -n 1 -s -p "Pulse cualquier tecla para volver al menú principal"
    clear
}

listar_procesos() {
    clear
    ps -e -o pid,user,comm,%cpu --sort=-%cpu | head -n $((MAX_PROCESSES + 1))
}

enviar_senal() {
    clear
    read -p "Introduce el PID del proceso: " pid
    
    if ! ps -p "$pid" > /dev/null 2>&1; then
        echo "Proceso con PID $pid no encontrado en el sistema"
        return 1
    fi
    
    clear
    echo "Seleccione la señal a enviar al proceso $pid:"
    echo
    echo "(H)UP"
    echo "(U)SR1"
    echo "(K)ILL"
    echo "(T)ERM"
    echo
    read -p "Introduzca la señal: " senal
    
    case "$senal" in
        H) signal="HUP";;
        U) signal="USR1";;
        K) signal="KILL";;
        T) signal="TERM";;
        *) echo "Señal no válida: $senal"; return 1;;
    esac
    
    kill -$signal "$pid" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Señal $signal enviada al proceso $pid"
    else
        echo "Error al enviar señal $signal al proceso $pid"
    fi
}

buscar_procesos() {
    clear
    read -p "Introduce un texto para buscar un proceso: " buscar_texto
    
    if [ -z "$buscar_texto" ]; then
        echo "Texto de búsqueda vacío"
        return 1
    fi
    
    resultados=$(ps -e -o pid,user,comm,%cpu --sort=-%cpu | \
                awk -v busq="$buscar_texto" 'NR==1 || tolower($3) ~ tolower(busq)')
    
    num_lineas=$(echo "$resultados" | wc -l)
    
    if [ "$num_lineas" -gt 1 ]; then
        clear
        echo "Procesos que contienen '$buscar_texto':"
        echo
        echo "$resultados" | head -n $((MAX_PROCESSES + 1))
    else
        echo "No existen procesos cuyo programa contenga '$buscar_texto'"
    fi
}

procesar_opcion() {
    case "$1" in
        L) 
            listar_procesos
            ;;
        S)
            enviar_senal
            ;;
        B)
            buscar_procesos
            ;;
        Q)
            clear
            echo "Saliendo de femtotop..."
            exit 0
            ;;
        *)
            echo "Opción '$1' inválida"
            ;;
    esac
}

# Programa principal
clear
while true; do
    mostrar_menu
    read -p "Introduzca opción: " opcion
    procesar_opcion "$opcion"
    echo
    pausa
done
