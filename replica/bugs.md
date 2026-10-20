# Incidencias reproducidas y resueltas

B01 · S2 · Dibujos de dos puntos incompletos al hacer clic rápidamente.
Pasos: elegir tendencia o rectángulo y marcar dos puntos consecutivos. Esperado: crear el objeto. Real: la biblioteca interpretaba la secuencia como doble clic y omitía el segundo evento de clic. Corrección: manejar pointerup para dibujo independientemente del detector de doble clic; permitir anotaciones encima de objetos existentes. Regresión conservada: F03-H2. Resuelto en 1.0.0.

B02 · S3 · Nombre accesible de marca y agrupación de controles.
Pasos: ejecutar axe en la vista inicial. Esperado: nombre coherente y landmarks válidos. Real: etiqueta redundante y región sin agrupar. Corrección: nombre derivado del texto, marca decorativa oculta y región exclusiva para los controles. Regresión: UI-E1. Resuelto en 1.0.0.

Problemas de pruebas, no de producto: selectores ambiguos de encabezado Bitcoin y selector implícito del catálogo. Se corrigieron utilizando rol/nivel y nombre accesible explícito. Los tests restauran un espacio de referencia antes de cada recorrido para evitar contaminación entre casos.

No se mantiene un S1 o S2 abierto conocido. Limitaciones funcionales deliberadas en features.csv y README, sin afirmar que sean equivalentes al producto completo.
