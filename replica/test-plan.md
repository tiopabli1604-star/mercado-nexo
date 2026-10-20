# Plan y evidencia de pruebas

Fecha: 2026-10-20. Contra Mercado Nexo local en producción; no se automatizó la web de TradingView. Los recorridos usan el proveedor público real, por lo que requieren Internet y pueden verse afectados por su disponibilidad.

| Caso | Cobertura |
|---|---|
| F01-H1 | Buscar BTC/ETH, cambiar intervalo, velas/línea, gráfico real y captura de escritorio |
| F02-H1 | Añadir RSI, editar y eliminar |
| F02-H2 | Render de SMA, EMA, RSI, MACD y Bollinger simultáneos sin errores JavaScript |
| F03-H1 | Nivel horizontal, deshacer/rehacer, persistencia tras recarga y eliminación |
| F03-H2 | Línea, rectángulo, texto, dibujo por coordenadas, bloqueo y ocultación |
| F04-H1 | Lista vacía, creación, instrumento, recarga y eliminación |
| F05-H1/F06-H1 | Regla real, condición cumplida, registro persistente y deduplicación por regla |
| F07-H1 | Pausar y reactivar, eliminar y rechazar Host no autorizado |
| F08-H1 | Renombrar espacio, recargar y exportar copia JSON |
| F09-N1 | Proveedor sin datos: mostrar error, no dibujar cotizaciones ficticias, reconectar |
| UI-E1 | Escape en diálogo, axe en escritorio y móvil, viewport 390×844 sin desbordamiento |
| API-N1 | Rechazar instrumento inválido, regla incompleta y escritura desde Origin externo |

Seis pruebas unitarias adicionales: semillas SMA/EMA; RSI Wilder con referencia conocida y casos planos; Bollinger poblacional y MACD; semántica de cruces; documentos malformados; transformaciones de dibujos con huecos temporales.

Las suites de navegador detectan excepciones JavaScript. axe se ejecuta en escritorio, móvil y panel de objetos. Capturas propias en clone-screens. La comparación visual con el original no se ejecutó por falta de referencias del mismo estado y tamaño. No se certifica la accesibilidad interna del canvas ni colores que el usuario elija después.

Pendientes que no se presentan como verificados: entrega de notificaciones en cada sistema operativo, recuperación después de una suspensión larga, disponibilidad continua del proveedor, conflictos entre editores simultáneos y soporte para otras bolsas. No hay email, cuentas ni pagos que probar.
