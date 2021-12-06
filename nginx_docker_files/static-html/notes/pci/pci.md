# Payment Card Industy Security Standards Council (SSC)

## PCI PTS

## PCI PA DSS

## PCI DSS (version 3.2.1)

El propósito es ayudar a las organizaciones a proteger la información de los clientes de sus tarjetas de crédito y débito. Aunque no se excluyen otras como de despensas

### Tipos de negocios
Existe para **comercio** y para **Proveedor de servicio**

**Comercio como retail**, gasolinera, farmacias que aceptan tarjetas de pago

**Provedores de servicio**, empresas que procesan, transmiten, almacenan e intercambian información de tarjeta habiente

### Qué son los datos de tajetahabiente

- nombre de la persona (no se puede guardar en claro)
- número de cuenta (PAN)
- fecha de expiración 
- código de servicio
- código de seguridad o validación 3 o 4 dígitos (no está permitido almacenar)

### Datos confidenciales de autenticación 
Ningúno de estos puede ser almacenado ni en logs ni nada (no hay ninguna justificación).
- Contenido del track
- CVV - este autentica transacciones con tarjeta no presente 
- PIN / Bloqueo de PIN, el que ponemos en el cajero automático o con tarjeta presente

### Consejos de implmentación
Para implementar el PCI
- Definir el alcance
    - Es transversal, puede tocar distintos procesos
- Crear un plan de alcance para atender los requerimientos no cumplidos
- Crear diagramas de flujo de datos CHD, crear los diagramas de red del alcance PCI
- Crear y/o actualizar el inventario de componentes dentro del entorno (CDE)
- Implementación Controles de Seguridad BAU - Business As Usual
- Elaborar el inventario de proveedores y enfocarse en el cumpliminento de proveedores

### 12 requisitos PCI

Separados en 6 categorias

- Desarrollar y mantener sistemas y redes seguros
    - Req 1  Instalar y mantener una configuración de firewall para protegerlos datos del titular de tarjeta
        - No conectar ambientes PCI a Internat
        - DMZ para servidores expuestos
        - Ejemplo de evidencia: 
        - 1.1.1 Pólitica y procedimiento para autorizar cambios
        - 1.1.2 Diagrama de red
        - 1.1.3 Diagrama de flujo de datos
        - 1.1.4 Normas de configuración de FW 
        - 1.1.5 Evidencia de grupos y perfiles de acceso en FW
        - 1.1.6 Lista de puertos y servicios habilitados para su administración, lista de puertos y servicios habilitados para la transmisión de información
        - 1.1.7 Informe de revisión de reglas
        - 1.2.1 Inventario de reglas, identificar conexoines de entradas y salidas
        - 1.2.2 
        - 1.3.1-5 Identificacioń de DMZ (diagramas), revisión de conexiones de entradas y salidas
        - 1.3.6 Normas de configuración, diagramas de red, revisión de reglas
        - 1.3.7 Normas de configuracioń, diagrama de red, revisión de reglas, identificar reglas de NAT
        - 1.4 Inventario que contengan firewall personal, Diagrama de red, configuración de los acess point.
        - 1.5 
    - Req 2 .- No utilizar los parámetros de seguridad y contraseñas suministradas por defecto para los proveedores
        - Ejemplos de evidencia
        - 2.1 Inventario de equipos, Checklist de revisión de hardening (por ejemplo de CIS)
        - 2.1.1 Estándar de configuración para equipos de redes inalámbricas, Checklist de revisión de hardening de Access points
        - 2.2 Estándar de configuración de seguridad, Checklist de revisión de hardening
        - 2.2.1-4 Estándar de configuración de seguridad, Checklist de revisión de hardening, Normas de seguridad (CIS, NIST)
        - 2.2.5 Estándar de configuracioń de seguridad, Checklist de revisión de hardening, Normas de seguridad (CIS, NIST)
        - 2.3 Evidencia del sistema de autenticación, evidencia de la aplicación de MFA
        - 2.4 LLeve un inventario de los componenetes del sistema que están dentro del alcance de la PCI DSS
        - 2.5 Mediante sniffing
- Proteger los datos de titular de la tarjeta
    - Req 3 .- Proteger los datos almacenados de tarjetahabiente
        - **3.1** Limitar el almacenamiento
        - Procesos para eliminar datos cuando ya no se necesiten
        - **3.2** No almacene datos confidenciales de autenticación después de recibir la autorización 
    - Reg 4 .- Conexiones con terceros seguras, proteger los datos de tarjetas en las transmisiones
- Mantener un programa de administración de vulnerabilidad
- Implementar medidas sólidas de control de acceso
- Supervisar y evaluar las redes con regularidad
- Mantener un pólitica de seguridad de información

> ROC y AOC Report of Compliance, Atentance of Compliance (el resumen), puede ser de cumplimiento y no cumplimiento

> SAC es un cuestionario de autoevaluación, 

> CDE Card Data Enviroment, pueden ser equipos, procesos, personas, etc.

> Amazon paga una cota de riesgo para guardar el CVV. 

> Se deben eliminar los datos despues de finalizada la transacción

> Cuando son cargos recurrentes el comercio avisa al banco que va a estar cobrando recurrentemente por lo tanto el comercio no guarda los datos 

> PCI DSS es una certificación anual

> ISO 27000 no establece una periodicidad

> ISO 27000 puede certificar con observaciones

> PCI es binario, se cumple o no se cumple. Se debe documentar los controles que no pudieron ser cumplidos

> PCI no lo llama segmentación, sino que solicita un aislamiento que normalmente se cumple mediante VLANs, NACS, listas de accesos, listas blancas, etc...

> PCI nunca dice el cómo implementar la norma

> El hardening es Ad hoc pero basado en templates ya probados como los del CIS

> La norma exige no usar equipos con múltiples funciones, e.g. un web server y FTP server en la misma máquina

> Matriz de responsabilidades del proveedor cuando se trata de una solución en la nube, debe contar con AOC, las responsabilidades son del proveedor, compartida o del cliente. Cada proveedor publica su matriz mapeada al PCI DSS.

> El MFA es mandatorio a los usuarios administradores y a los que tienen acceso a la CDE, puede ser a nivel de equipo o a nivel de red. Factor necesario de la norma - usuario y contraseña, segundo factor - algo que tienes(token,sms), algo que eres(huella dactilar, íris)  
---

**Bold**
*Italic*
- lista
- lista

|columna1|columan2|
|------|--------|
|elemento1| elemento2|
| hola | como |
|texto  | texto 2 |

