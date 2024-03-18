#!/bin/bash

while true; do
    echo "Menú:"
    echo "Programa hecho por Jpalacios8 (Jpalacios810 en twitter)"
    echo "1. Instalar Tailscale"
    echo "2. Iniciar Tailscale"
    echo "3. Ejecutar 'tailscale up'"
    echo "4. Mostrar IP del servidor"
    echo "5. Salir"

    read -p "Selecciona una opción: " opcion

    case $opcion in
        1)
            echo "Instalando Tailscale..."
            sudo bash /workspaces/MC-Server/src/tailscale/script.sh
            ;;
        2)
            echo "Iniciando Tailscale en segundo plano..."
            sudo bash /workspaces/MC-Server/src/tailscale/iniciar.sh > tailscale_log.txt 2>&1 &
            echo "Tailscale se está iniciando en segundo plano. Puedes continuar utilizando el menú."
            ;;
        3)
            echo "Ejecutando 'tailscale up'..."
            sudo tailscale up
            ;;
        4)
            echo "Obteniendo IP del servidor..."
            ip_servidor=$(tailscale ip)
            echo "La IP del servidor es $ip_servidor"
            ;;
        5)
            echo "Saliendo del menú."
            break
            ;;
        *)
            echo "Opción no válida. Por favor, selecciona una opción válida."
            ;;
    esac
done

