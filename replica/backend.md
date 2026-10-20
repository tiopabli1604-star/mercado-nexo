# Backend y límites de acceso

- [x] Datos reales a través de API pública oficial de Coinbase, sin claves ni endpoints de TradingView.
- [x] SQLite persistente, WAL y transacción al disparar. UNIQUE(ruleId) para idempotencia.
- [x] Validación del servidor: símbolos, intervalos, condiciones, periodos, fechas, anclajes y documentos anidados. Cuerpo máximo 2 MB.
- [x] Escucha exclusivamente 127.0.0.1; Host permitido y comprobación de Origin en mutaciones.
- [x] Secretos, datos personales, node_modules y dist fuera de Git.
- [x] Indicadores y cruces con pruebas unitarias.
- [x] Auditoría de dependencias: cero vulnerabilidades al comprobar.
- [x] Copias de espacio en JSON y procedimiento de copia completa de SQLite en README.
- No aplican pagos, correo, OAuth, webhooks ni cuentas múltiples. No existe un segundo usuario web: el límite de acceso es la sesión local del sistema operativo. No es un despliegue público autenticado.
- Sin copias automáticas externas. Las copias completas las gestiona el usuario.

Variables opcionales: PORT y DATA_DIR. El proceso del servidor debe seguir activo para evaluar alertas. No hay notificación por correo o push remoto.
