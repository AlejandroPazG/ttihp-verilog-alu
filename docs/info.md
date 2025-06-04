# FSM de Llenado y Sellado de Botellas

Este diseño implementa una solución automatizada para el llenado y sellado de botellas utilizando dos máquinas de estados finitos (FSMs):

- **FSM tipo Moore**: Controla el proceso de llenado.
- **FSM tipo Mealy**: Controla el proceso de sellado.

Ambas FSMs están sincronizadas por un prescaler que genera una señal de reloj lenta desde una entrada de 100 MHz, permitiendo una visualización clara de los estados en hardware.

## Entradas

- `ui[0]`: Señal `startfill` – Inicia el llenado.
- `ui[1]`: Señal `productook` – Indica que hay producto disponible para sellar.

## Salidas

- `uo[0]`: `llenando` – LED encendido durante el llenado.
- `uo[1]`: `sellando` – LED encendido durante el sellado.
- `uo[2]`: `LED_sello` – LED encendido cuando se completa el sellado.
- `uo[3:5]`: `state_filler` – Estado de la FSM de llenado (3 bits).
- `uo[6:7]`: `state_sealer` – Bits menos significativos del estado de la FSM de sellado (faltaría uno si fueran 3 bits).

## Autor

**AlejandroPazG**

Este diseño fue realizado como parte del proyecto de evaluación final para TinyTapeout utilizando el nodo Sky130.
