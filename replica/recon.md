# Recon: TradingView — web para uso propio

Fecha: 2026-10-20. Skill: replica-recon.
Alcance confirmado: gráficos, indicadores, dibujos, listas de seguimiento y alertas. Proyecto independiente de Trazo de Mesa. Este expediente describe la investigación; todavía no hay una aplicación TradingView implementada.

## Fuentes públicas

| Ref. | Fuente | URL | Aporta |
|---|---|---|---|
| A | Supergráficos | https://es.tradingview.com/support/solutions/43000746464/ | Organización y accesos |
| B | Diseños | https://es.tradingview.com/support/solutions/43000746975/ | Guardar y recuperar configuraciones |
| C | Listas | https://es.tradingview.com/support/folders/43000549989/ | Gestión e importación/exportación |
| D | Configurar alertas | https://es.tradingview.com/support/solutions/43000595315/ | Condiciones y configuración congelada |
| E | Alertas de precio | https://es.tradingview.com/support/solutions/43000763313/ | Operadores de precio |
| F | Alertas técnicas | https://es.tradingview.com/support/solutions/43000763315/ | Indicadores y dependencia temporal |
| G | Datos adicionales | https://es.tradingview.com/support/solutions/43000471705/ | Permisos y mercados en tiempo real |
| H | Funcionalidades | https://es.tradingview.com/features/ | Alertas evaluadas en servidores |
| I | Precios | https://es.tradingview.com/pricing/ | Capacidades sujetas a planes |
| J | Condiciones | https://es.tradingview.com/policies/ | Restricciones de reutilización |
| K | Intervalos | https://es.tradingview.com/support/solutions/43000543883/ | Configuración temporal |
| L | Portal español | https://es.tradingview.com/ | Contexto del producto |

Método: lectura de documentación pública. Sin acceso a cuentas, código del producto, endpoints privados ni descargas masivas. No se ha operado la interfaz del original ni capturado pantallas. Lo documentado no se presenta como observado en ejecución. Los detalles de implementación, los estados de error y los objetivos de clics siguientes son propuestas propias para validar, no hechos verificados del original. No se fijan precios ni cuotas comerciales.

## Bucle principal

Elegir un instrumento, interpretar su gráfico con indicadores y dibujos, conservarlo en una lista y recibir un evento cuando se cumpla una condición de alerta.

## Inventario: 14 superficies

Una superficie puede ser un panel o diálogo, no necesariamente una página. A documenta los accesos principales; B–F detallan sus funciones. En todas las filas: estados vistos en ejecución = ninguno. La última columna enumera estados que debe cubrir la réplica.

| ID | Superficie | Acceso documentado o propuesto | Propósito | Componentes | Estados por validar |
|---|---|---|---|---|---|
| S01 | Espacio de análisis | Supergráficos, A | Trabajar con una serie | Gráfico, barras, panel lateral | Cargando, datos, vacío, error |
| S02 | Buscar instrumento | Nombre del símbolo, A | Seleccionar activo y mercado | Buscador, resultados | Sin coincidencias, seleccionado |
| S03 | Intervalo y tipo | Barra superior, A/K | Cambiar representación | Selectores | Activo, no disponible |
| S04 | Catálogo de indicadores | Barra superior, A | Añadir estudio | Buscador, categorías | Vacío, encontrado, añadido |
| S05 | Ajustes de indicador | Control del estudio; detalle propuesto | Cambiar parámetros y estilo | Campos, colores | Válido, inválido, calentamiento |
| S06 | Herramientas de dibujo | Barra izquierda, A | Anotar precios y fechas | Paleta, cursor | Inactivo, primer punto, completado |
| S07 | Objetos y propiedades | Panel de objetos, A | Editar y organizar anotaciones | Lista, estilo, bloqueo | Selección, oculto, bloqueado |
| S08 | Lista de seguimiento | Barra derecha, A/C | Vigilar y abrir instrumentos | Tabla, selector de lista | Vacía, poblada, datos antiguos |
| S09 | Gestión de listas | Menú de listas, C | Crear y editar colección | Nombre, búsqueda, orden | Duplicado, borrar, importación inválida |
| S10 | Crear o editar alerta | Barra superior o administrador, D | Definir condición | Condición, umbral, caducidad | Válida, inválida, sin proveedor |
| S11 | Administrador de alertas | Barra derecha, A/D | Gestionar reglas | Tabla, acciones, filtros | Activa, pausada, vencida, disparada |
| S12 | Historial de eventos | Detalle propuesto del administrador | Entender disparos | Fecha, valor, regla | Sin eventos, evento, fallo de entrega |
| S13 | Diseños guardados | Menú de diseños, B | Recuperar trabajo | Nombre, guardar, abrir | Nuevo, guardado, pendiente, fallo |
| S14 | Ajustes y estado de datos | Configuración A; estado propio | Interpretar origen y frescura | Tema, zona horaria, proveedor | Demo, histórico, retrasado, conectado, desconectado |

Distribución funcional de referencia: selección y estudios arriba; anotación a la izquierda; gráfico central; listas y alertas a la derecha; tiempo y escala abajo. Es una estructura de navegación documentada en A, no una medición visual de tamaños o colores. La réplica tendrá marca, iconografía y textos propios.

## Flujos: 9 objetivos

Los conteos son objetivos estimados para la réplica, sin contar escritura ni gestos de arrastre. No son mediciones del original.

| ID | Objetivo y recorrido | Clics objetivo | Casos límite y aceptación propuesta |
|---|---|---:|---|
| F01 | Seleccionar instrumento e intervalo: S01→S02→S03→S01 | 4 | Distinguir bolsas con igual ticker; resolver símbolo sin datos; conservar contexto |
| F02 | Añadir y ajustar estudio: S01→S04→S05→S01 | 5 | Periodo inválido; historial insuficiente muestra ausencia de valor, nunca cero inventado |
| F03 | Dibujar y editar: S01→S06→S07→S01 | 6 | Cancelar, seleccionar, mover, bloquear, borrar y deshacer; mantener posición al cambiar zoom |
| F04 | Crear lista y añadir instrumento: S08→S09→S02→S08 | 5 | Lista vacía, duplicados y ticker ambiguo; seleccionar fila actualiza el gráfico |
| F05 | Crear alerta: S01→S10→S11 | 4 | Validar umbral y caducidad; guardar una copia de parámetros independiente del gráfico |
| F06 | Recibir evento: S11→S12 | 1 para consultar | Evaluación automática; reconexión no duplica eventos; registrar instante, valor y origen |
| F07 | Pausar o modificar regla: S11→S10→S11 | 3–4 | Editar genera revisión; regla pausada no emite; expiración coherente |
| F08 | Guardar y recuperar diseño: S01→S13→S01 | 4 | Recarga conserva estudios, dibujos y símbolo; error de escritura no muestra guardado |
| F09 | Entender pérdida de datos: S01→S14→S01 | 2 | Mostrar última actualización y motivo; al reconectar no interpretar huecos como precios |

## Componentes propuestos

| Componente | Variantes | Estados | Superficies |
|---|---|---|---|
| Botón y botón de icono | Principal, discreto, destructivo | Normal, foco, desactivado, ocupado | Todas |
| Buscador de instrumento | Diálogo, añadir a lista | Buscando, vacío, error, resultado con bolsa | S02/S09 |
| Selector temporal | Favoritos, menú | Activo, disponible, sin historial | S03 |
| Visor de series | Velas, línea, volumen | Cargando, navegando, sin datos, desconectado | S01 |
| Leyenda de estudio | Superpuesto, panel separado | Visible, oculto, sin suficientes barras | S01/S05 |
| Paleta y anclajes | Línea, horizontal, rectángulo, texto | Dibujando, seleccionado, bloqueado | S06/S07 |
| Tabla lateral | Lista, reglas, eventos | Vacía, ordenada, seleccionada | S08/S11/S12 |
| Formulario | Estudio, alerta, diseño | Modificado, inválido, guardando, error | S05/S10/S13 |
| Distintivo de datos | Demo, histórico, retrasado, vivo | Actual, obsoleto, desconectado | S01/S08/S14 |
| Aviso accesible | Confirmación, validación, evento | Visible, descartado | Todas |

Comportamiento transversal propio: navegación por teclado, foco visible, etiquetas en iconos, contraste verificable, paneles plegables y aviso antes de eliminar una colección con contenido. En pantallas pequeñas se prioriza el gráfico y se abre un panel cada vez; esto es una decisión propuesta, pendiente de diseño.

## Modelo inferido: 10 entidades

Son entidades para nuestra implementación; no describen la base de datos de TradingView.

| Entidad | Campos sugeridos | Evidencia y confianza |
|---|---|---|
| Instrument | id, ticker, exchange, name, assetType, currency, tickSize, timezone, session | Búsqueda A y permisos G; alta en conceptos, esquema propio |
| Bar | instrumentId, timeframe, timeUtc, open, high, low, close, volume, provider, final | Series A/K; media; precisión y normalización por definir |
| DataConnection | id, provider, mode, delaySeconds, status, lastReceivedAt, capabilities | G; media; controles operativos propuestos |
| Workspace | id, name, instrumentId, timeframe, chartType, viewport, settings, updatedAt, schemaVersion | Diseños B; alta en contenido, versionado propuesto |
| IndicatorInstance | id, workspaceId, kind, inputs, style, pane, visible | A/F; media; catálogo mínimo propio |
| Drawing | id, workspaceId, instrumentId, type, anchorsTimePrice, style, locked, visible | A; media; anclajes propuestos |
| Watchlist | id, name, createdAt, updatedAt | C; alta en concepto |
| WatchlistItem | id, watchlistId, instrumentId, position | C; media; orden explícito propuesto |
| AlertRule | id, instrumentId, condition, threshold, indicatorSnapshot, timeframe, frequency, expiresAt, state, revision | D/E/F; alta en configuración; revisiones propias |
| AlertEvent | id, ruleId, ruleRevision, evaluatedAt, observedValue, barTime, dedupeKey, deliveryState | Alertas H; media; historial y deduplicación propios |

Relaciones propuestas: Workspace 1:N IndicatorInstance y Drawing; Instrument 1:N Bar, Drawing, WatchlistItem y AlertRule; Watchlist 1:N WatchlistItem; AlertRule 1:N AlertEvent. Un instrumento puede pertenecer a varias listas. No hay cuentas de bróker ni órdenes.

## Decisiones funcionales para arquitectura

Este apartado define objetivos propios; no afirma equivalencia completa con TradingView.

- Gráficos iniciales: velas y línea, volumen, cursor con OHLCV, desplazamiento, zoom, ajuste a datos y escalas lineal/logarítmica. Intervalos iniciales propuestos: 1m, 5m, 15m, 1h, 4h y 1D, únicamente cuando el proveedor tenga cobertura o sea válida su agregación. No fabricar barras para cubrir huecos.
- Catálogo mínimo propuesto: SMA, EMA, RSI, MACD y bandas de Bollinger, con parámetros y colores. Validar cada fórmula contra conjuntos conocidos, incluidos calentamiento, desviación estándar y suavizado. No prometer compatibilidad con scripts del original.
- Dibujos mínimos: línea de tendencia, horizontal, rectángulo y texto. Anclar a tiempo/precio, mantener por instrumento y diseño y permitir editar, ocultar, bloquear, eliminar, deshacer y rehacer.
- Listas: crear, renombrar, borrar, añadir/quitar y reordenar instrumentos; mostrar última cotización y variación solo si hay referencia válida. El último cierre no se llama precio en vivo.
- Alertas: condiciones iniciales de precio mayor/menor, cruce ascendente y descendente. Añadir condiciones sobre los indicadores del catálogo al cierre de barra como segunda cobertura del mismo módulo. Guardar configuración de indicador e intervalo en la regla: D documenta que editar el gráfico no modifica una alerta ya creada.
- La evaluación de alertas debe separarse del renderizado. H documenta ejecución en servidores. Para cumplir mientras se cierra el navegador hacen falta un proceso persistente, datos disponibles y un canal de entrega. Un evaluador solo en pestaña abierta se marcará como parcial, nunca como equivalente a esa capacidad.
- Definir antes de implementar: semántica del primer valor (sin cruce previo), frecuencia, caducidad UTC, recuperación tras cortes y comportamiento de reglas ante datos retrasados. Mostrar estado suspendido si no se puede evaluar. Persistir eventos antes de notificar y deduplicarlos por regla/revisión/condición temporal.
- Entrega inicial propuesta: historial dentro de la aplicación y notificación del navegador cuando esté disponible. Notificar fuera de una sesión abierta requiere decidir canal y despliegue en arquitectura; no se promete entrega por navegador cerrado sin esa infraestructura.
- Datos: G aclara que los permisos de tiempo real de ciertas bolsas son adicionales al plan del producto. Nuestra fuente será independiente y autorizada. Proveedor, mercados, profundidad histórica, ajustes corporativos, coste y cobertura de intervalos siguen sin seleccionar. Una muestra sintética se etiquetará DEMO; un CSV histórico no habilita alertas en vivo.
- Persistencia: guardar diseños, objetos, listas y reglas; prever exportación de copia propia. Las credenciales del proveedor van en servidor o almacén de secretos, nunca en un repositorio o archivo exportado.

## Matriz y alcance excluido

Ver features.csv. Todas las capacidades elegibles comienzan en no; no se ha construido ni verificado ninguna. Las exclusiones se marcan skip con motivo. Las prioridades describen el orden propuesto para este uso personal, no los planes de pago del original.

Excluido: operaciones reales, simulador de órdenes, conexiones a brókers, Pine Script y su ecosistema, noticias, red social, datos fundamentales, escáneres y reproducción histórica interactiva. Tampoco se reutilizan marca, código, contenidos o contratos de datos del original. J contiene restricciones de reutilización; este reconocimiento usa documentación pública y la futura implementación será propia.

## Tamaño y riesgos

14 superficies, 9 flujos y 10 entidades propuestas. Tamaño L para este alcance; la paridad completa con TradingView sería XL y queda fuera del objetivo. No es una estimación de fecha de entrega.

Tres partes más difíciles:
1. Coherencia de datos y cálculos: sesiones, zonas horarias, ajustes, precisión, huecos, agregaciones e indicadores reproducibles.
2. Dibujos editables sobre un gráfico móvil: transformación de coordenadas, selección, deshacer y persistencia estable.
3. Alertas fiables: evaluación independiente de la pestaña, continuidad del proveedor, configuración congelada, deduplicación y entrega verificable.

Pendientes para replica-architect: elegir biblioteca y licencia, proveedor y mercados concretos, persistencia, worker y canal de notificación; fijar contratos de datos y pruebas de aceptación. Estos pendientes no impiden cerrar el reconocimiento documental, pero sí impiden prometer cotizaciones en vivo y alertas continuas funcionando.

## Validación pendiente del original

No hay auditoría visual ni conteos de clics observados. Comprobar en una futura sesión pública o cuenta propia: posiciones y tamaños reales, diálogos, estados vacíos, teclado, móvil, límites por plan y controles de listas. El expediente permite diseñar la funcionalidad; todavía no sustenta una afirmación de fidelidad visual.
