# Mercado Nexo

Aplicación web local de análisis de mercados inspirada en las funciones principales de TradingView. Código e interfaz propios; no es el servicio oficial.

## Abrir

Con el servidor arrancado: http://127.0.0.1:3001

En Windows, doble clic en `Abrir Mercado Nexo.cmd`. Si aún no está instalado: Node.js 24 o superior, `npm ci`, `npm run build`, `npm start`. El iniciador abre la página; deja la ventana del servidor abierta.

## Lo que funciona

- Ocho pares USD de Coinbase: BTC, ETH, SOL, XRP, ADA, DOGE, LINK y AVAX, con datos reales de su API pública.
- Velas o línea, volumen, zoom, cursor OHLC, seis intervalos, escala logarítmica.
- SMA, EMA, RSI, MACD y bandas de Bollinger configurables.
- Tendencias, niveles, rectángulos y texto; edición por puntos o por coordenadas, colores, ocultación, bloqueo y deshacer.
- Listas editables y persistentes con orden propio.
- Alertas de precio y de SMA/EMA/RSI: cruces y umbrales, caducidad, pausa y reactivación, historial y deduplicación.
- Guardado automático de un espacio, exportación/restauración JSON, interfaz adaptable y diálogos accesibles.

## Datos y alertas

Los precios se consultan cada 15 segundos; las velas cada 60 segundos, hasta 300 por petición. Los intervalos son 1m, 5m, 15m, 1h, 6h y 1D. No se simulan cotizaciones si falla la conexión. No es un flujo de cada tick: pueden ocurrir cruces entre dos consultas que no se detecten. Las horas del gráfico son UTC; el historial muestra la hora local.

Una regla se dispara una sola vez. Para volver a vigilar una condición después de dispararse o caducar, crea otra. Los indicadores de alerta se calculan sobre velas cerradas y sus parámetros quedan guardados independientemente del gráfico. Se admite hasta 100 reglas activas.

El evaluador vive en el proceso Node, no en la pestaña: continúa con el navegador cerrado mientras el servidor siga funcionando. No se evalúa con el equipo apagado, suspendido o sin conexión. Las notificaciones del navegador necesitan permiso y una página abierta; al regresar puedes consultar los eventos persistidos. No incluye correo, SMS ni push remoto.

## Almacenamiento

SQLite local en `.data/nexo.sqlite`. Para una copia completa de reglas, eventos y espacio, detén el servidor y copia la carpeta `.data` completa. La exportación JSON desde la interfaz incluye espacio, dibujos y listas; no las alertas. Hay un espacio activo; para conservar varias configuraciones usa las copias JSON. Entre dos pestañas gana la última escritura: usa una para editar.

No hay login porque se sirve exclusivamente en `127.0.0.1`. No publiques este servidor en Internet sin añadir autenticación y controles de acceso. La aplicación no contiene claves ni solicita cuenta de Coinbase. El repositorio excluye la base de datos personal.

## Comandos

- `npm start`: compilación de producción ya generada, puerto 3001.
- `npm run dev`: servidor con Vite.
- `npm run build`: genera `dist/`.
- `npm test`: cálculos y validación.
- `npm run test:e2e`: recorridos con Chromium; requiere servidor arrancado e Internet para datos reales. Ejecutar sobre una copia de prueba: cambia temporalmente el espacio y crea eventos de QA.

Variables opcionales: `PORT` y `DATA_DIR`. No se requieren servicios de pago.

## Límites

Sin acciones, forex, otros exchanges, brókers, órdenes, Pine Script, comunidad ni noticias. No hay edición directa de reglas: pausa/elimina y crea una nueva. No se afirma paridad total ni semejanza exacta con TradingView.

Ver `replica/` para investigación, arquitectura, cobertura, validación y limitaciones.

## Atribución

Motor de gráficos: Lightweight Charts™ de TradingView, Apache-2.0. Su código de biblioteca se usa bajo licencia pública; el sitio propietario no se copia. [TradingView](https://www.tradingview.com/). Iconos: Lucide, ISC. Datos: Coinbase Exchange. Consulta `THIRD-PARTY-NOTICES.md`.
