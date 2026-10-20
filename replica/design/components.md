# Componentes y diseño propio

No hay capturas del original; las medidas de esta interfaz son decisiones propias, no mediciones de TradingView. Tema de tinta con acento lima, tipografía de sistema y marca Nexo. Diseño por roles en tokens.json/tokens.css. No se usa Tailwind: los tokens CSS se importan directamente en style.css.

Button: primary/outline/quiet/danger; estados normal, hover, focus-visible, disabled y busy. IconButton tiene etiqueta y tooltip, usa Lucide. Formularios: label asociado, límites y validación HTML más validación de servidor. Modal: role=dialog, nombre, foco inicial, ciclo de Tab, Escape y restauración del foco. Toast: role=status. Lista: botones con selección visible y nombre completo. Indicadores: catálogo, parámetros, color y eliminación. Gráfico: biblioteca canvas; información textual OHLC equivalente en cabecera. Dibujo: SVG y formulario de coordenadas para teclado, edición numérica, visibilidad y bloqueo. Paneles plegables en móvil.

Primitivas se definieron en main.jsx antes de montar sus superficies. Paleta y componentes se comprueban con contrast.py y axe. Los ejes canvas y paletas de color elegidas libremente por el usuario requieren juicio visual, no quedan certificados por axe. Evidencia propia en clone-screens; no hay comparación pixel a pixel contra el original.
