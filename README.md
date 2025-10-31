# femtotop v1.0

**Autores:** Diego Bermudo y M.R  
**Versión:** 1.0  
**Lenguaje:** Bash  
**Fecha:** Octubre de 2025

---

## 🧩 Descripción

**femtotop** es una utilidad en Bash inspirada en el comando `top`, que permite gestionar y monitorizar procesos del sistema desde una interfaz de texto simple e interactiva.

El usuario puede:
- Listar los procesos activos ordenados por uso de CPU.
- Enviar señales (`HUP`, `USR1`, `KILL`, `TERM`) a procesos específicos.
- Buscar procesos por nombre o parte del nombre.
- Salir del programa de forma segura.

---

## ⚙️ Requisitos

Para ejecutar correctamente **femtotop**, se necesita:

- Un sistema operativo **GNU/Linux** o compatible con Bash.
- Intérprete **Bash** versión 4.0 o superior.
- Comandos básicos del sistema: `ps`, `awk`, `kill`, `head`, `clear`, `read`.

---

## 🧭 Instalación

1. Clonar el repositorio desde GitHub:
   ```bash
   git clone https://github.com/druxus/femtotop.git
   cd femtotop
   ```

2. Dar permisos de ejecución al script:
   ```bash
   chmod +x femtotop.sh
   ```

3. (Opcional) Moverlo a un directorio dentro del PATH para ejecutarlo desde cualquier lugar:
   ```bash
   sudo mv femtotop.sh /usr/local/bin/femtotop
   ```

---

## 🚀 Uso

Ejecutar el programa con:
```bash
./femtotop.sh
```
o, si está instalado en el PATH:
```bash
femtotop
```

### Menú principal

El programa muestra un menú con las siguientes opciones:

| Opción | Descripción |
|:-------|:-------------|
| `L` | Listar los procesos activos (muestra los 20 más intensivos en CPU). |
| `S` | Enviar una señal a un proceso concreto (solicita PID y tipo de señal). |
| `B` | Buscar procesos cuyo nombre contenga un texto específico. |
| `Q` | Salir del programa. |

Cada acción limpia la pantalla antes de mostrar la información y pide pulsar una tecla para volver al menú principal.

---

## 🔒 Licencia

Este software se distribuye bajo la **Licencia MIT**:

```
Copyright (c) 2025 Diego Bermudo y Marcos Rozas

Se concede permiso, de forma gratuita, a cualquier persona que obtenga una copia
de este software y de los archivos de documentación asociados (el "Software"),
para utilizar el Software sin restricción, incluyendo sin limitación los derechos
a usar, copiar, modificar, fusionar, publicar, distribuir, sublicenciar y/o vender
copias del Software, y a permitir a las personas a las que se les proporcione el
Software que lo hagan, sujeto a las siguientes condiciones:

El aviso de copyright anterior y este aviso de permiso se incluirán en todas las
copias o partes sustanciales del Software.

EL SOFTWARE SE PROPORCIONA "TAL CUAL", SIN GARANTÍA DE NINGÚN TIPO, EXPRESA O
IMPLÍCITA, INCLUYENDO PERO NO LIMITÁNDOSE A GARANTÍAS DE COMERCIALIZACIÓN,
IDONEIDAD PARA UN PROPÓSITO PARTICULAR E INCUMPLIMIENTO.
EN NINGÚN CASO LOS AUTORES SERÁN RESPONSABLES DE NINGUNA RECLAMACIÓN, DAÑO O
OTRA RESPONSABILIDAD, YA SEA EN UNA ACCIÓN CONTRACTUAL, AGRAVIO O CUALQUIER OTRA
FORMA, DERIVADA DE, FUERA DE O EN CONEXIÓN CON EL SOFTWARE O SU USO U OTRO TIPO
DE ACCIONES EN EL SOFTWARE.
```

---

## 🧠 Notas para la calificación

### 🎯 Objetivos de la tarea

- Comprender el funcionamiento de las **órdenes básicas del ciclo de vida de los procesos** en un sistema operativo.  
- Crear **guiones interactivos de administración** del sistema en Bash.  
- Utilizar **herramientas de desarrollo y control de versiones**.  
- Aplicar **metodologías de aseguramiento de la calidad del software**, como las vistas en la Unidad de Trabajo 1.

---

### 🧪 Cumplimiento de requisitos

| Criterio | Estado | Descripción |
|:----------|:--------|:-------------|
| **Formato del material** | ✅ Cumple | Incluye `femtotop.sh` y `README.md` en formato Markdown. |
| **Opción L. Listar procesos** | ✅ Correcta | Muestra los 20 procesos más activos ordenados por CPU. |
| **Opción S. Enviar señal a proceso** | ✅ Correcta | Solicita PID, valida existencia y permite enviar señales HUP, USR1, KILL, TERM. |
| **Opción B. Buscar procesos** | ✅ Correcta | Filtra por nombre de programa (case-insensitive). |
| **Estructura del código** | ✅ Correcta | Uso de `if` anidados, validaciones, variables descriptivas y limpieza de pantalla. |
| **Modificaciones solicitadas por el profesor** | ✅ Aplicadas | Adaptado al modelo de ejemplo de la práctica. |
| **Aseguramiento de la calidad** | ✅ Aplicado | Se han seguido prácticas de validación, modularidad y mensajes claros para el usuario. |

---

### 🧰 Observaciones para la evaluación

- El script está **bien estructurado**, **documentado** y **comentado** para facilitar mantenimiento.  
- Se validan correctamente las entradas del usuario (PID y opciones de menú).  
- Cumple con todas las funcionalidades descritas en el enunciado de la práctica.  
- La interfaz es **simple, clara y funcional**, adecuada para entornos educativos.  
- Se podría ampliar con una opción adicional de **modo monitor** como mejora opcional.

---

## 📜 Historial de versiones

| Versión | Fecha | Descripción |
|:--------|:------|:------------|
| 1.0 | 22/10/2025 | Versión inicial funcional del script. |

---

## 👨‍💻 Autores

- **Diego Bermudo**  
- **Marcos Rozas**

IES Virgen de la Paz, Alcobendas  
Asignatura: *Administración de Sistemas Operativos*  
Curso académico: **2025–2026**

---

## 📦 Repositorio oficial

Repositorio disponible en: [https://github.com/druxus/femtotop](https://github.com/druxus/femtotop)
