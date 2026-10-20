# Mercado Nexo — arquitectura implementada

Fecha: 2026-10-20. Entrada: recon.md y features.csv.

## Decisiones

React 19 + Vite 7 para la interfaz; Express 5 sobre Node 24 para API, ficheros y evaluación; SQLite integrado en Node para persistencia; Lightweight Charts 5 con atribución para el visor; SVG propio para dibujos. CSS por roles de color, sin framework de estilos. API pública de Coinbase para ocho pares USD. Un solo proceso y una sola base de datos; sin cuentas, pagos o servicios gestionados, adecuado al uso local personal solicitado.

La biblioteca pública de gráficos está autorizada bajo Apache-2.0; no es el código de la web propietaria. Se usa su API documentada. Fuentes: https://tradingview.github.io/lightweight-charts/docs y https://docs.cdp.coinbase.com/api-reference/exchange-api/rest-api/products/get-product-candles .

## Almacenamiento real

Tres tablas, no diez: las diez entidades conceptuales del recon se agrupan según uso. Instrumentos son catálogo fijo; barras y cotizaciones se mantienen en caché; espacio/estudios/dibujos/listas se guardan en un documento validado. Reglas y eventos tienen tablas independientes. El esquema exacto está en schema.sql y se aplica idempotentemente al iniciar.

UUID de reglas/eventos generado en servidor. Fechas ISO UTC; instantes de barras en segundos Unix. Valores de mercado IEEE-754 usados para análisis, no contabilidad ni liquidación. No se procesan órdenes ni transferencias. Un único propietario implícito: usuario del sistema operativo. No hay aislamiento multiusuario y no se expone fuera de loopback. Los eventos conservan su snapshot al borrar la regla; la ausencia de FK en eventos es intencional. UNIQUE(ruleId) asegura un disparo por regla.

## API

Todas las rutas son de acceso local. GET /api/products devuelve catálogo (F01/F04); GET /api/quotes devuelve últimas cotizaciones y estadísticas (F01/F04/F09); GET /api/candles recibe symbol e interval y devuelve OHLCV (F01/F02/F03); GET/PUT /api/state lee o sustituye el documento validado (F02/F03/F04/F08); GET /api/alerts devuelve reglas, eventos y salud del worker (F06/F07); POST /api/alerts valida y crea regla (F05); PATCH /api/alerts/:id pausa/reactiva (F07); DELETE /api/alerts/:id elimina (F07); GET /api/health informa salud del proceso (F09). Diez combinaciones método/ruta. El sitio SPA se sirve en /.

No se admite un host arbitrario. Las mutaciones desde un Origin diferente se rechazan. Validación anidada y límite de cuerpo de 2 MB. Nada de datos personales en URL o logs. El servidor no ofrece acceso a la carpeta .data.

## Trabajo en segundo plano

Cada 15 s, un bucle no solapable recorre reglas activas. Lee ticker fresco para precio o velas cerradas para SMA/EMA/RSI. Una condición de cruce necesita una muestra previa; no inventa una al activar. Registra evento y estado triggered en una transacción SQLite. Muestra anterior y última identidad de muestra se conservan al reiniciar. La instantánea de configuración no depende del estado del visor. Al pausar y reactivar se reinicia la muestra previa. La caducidad se procesa en UTC.

Los datos de velas se cachean 60 s; tickers 12 s; estadísticas 60 s. Se exige cotización reciente en reglas de precio. El muestreo no detecta todos los cruces intraperiodo. Sin red no hay disparos sintéticos. En navegador se consulta el historial cada 5 s; las notificaciones necesitan permiso. No hay canal remoto.

## Límites y decisiones difíciles

No hay timezone de bolsa para otros mercados: los ocho instrumentos cotizan 24/7 y el gráfico está en UTC. Las barras pueden tener huecos y no se rellenan. Los anclajes de dibujos guardan tiempo y precio; la transformación interpola sobre barras existentes. RSI usa suavizado Wilder; Bollinger desviación poblacional; MACD 12/26/9.

Estado de espacio: última escritura gana. Uso de una pestaña recomendado. Las alertas persisten por separado; no se exportan con el JSON del espacio. Los datos de proveedor no se redistribuyen ni se guardan en Git. Despliegue remoto, autenticación, reconciliación de pestañas y notificaciones externas requerirían ampliar la arquitectura.

## Orden ejecutado

1. Shell y fuente real, S01–S03/S14, F01/F09.
2. Estudios y dibujo, S04–S07, F02/F03.
3. Listas y espacio persistente, S08/S09/S13, F04/F08.
4. Reglas y evaluador transaccional, S10–S12, F05–F07.
5. Móvil, teclado, validación, pruebas y empaquetado.
