# Documento de Decisiones Técnicas - HU 3.1, 3.2, 3.3

## HU 3.1 – Modularización por Features

Se decidió separar la aplicación por features para facilitar que cada miembro del equipo trabaje de forma independiente.

### Por qué features

La app se divide en carpetas principales: auth, dashboard, transfers, history. Cada una tiene su propia estructura de Domain, Data y Presentation.

Ventajas:
- Cada dev trabaja en una feature sin pisar el código de otros
- Es fácil agregar nuevas features después
- Cada parte se puede testear de forma aislada
- El código es más organizado y fácil de encontrar

### Estructura dentro de cada feature

```
lib/features/[feature]/
├── domain/          # Lógica de negocio pura
├── data/            # APIs y almacenamiento
└── presentation/    # Pantallas y widgets
```

### Carpeta Core

En `lib/core/` está el código que se reutiliza en toda la app: temas, colores, widgets comunes, y el LocaleProvider para idiomas.

Esto evita duplicación y facilita cambios globales.

---

## HU 3.2 – Dashboard de Productos y Saldos

El dashboard muestra cuentas y tarjetas del usuario. Para manejarlo usamos Provider (ChangeNotifier) en lugar de Riverpod porque es más simple y no necesita toda la potencia de Riverpod.

### Gestión de Estado

Dashboard usa Provider con estos estados:
- `isLoading`: cuando está cargando datos
- `errorMessage`: si algo falla
- `products`: la lista de cuentas

Cuando el usuario llega al dashboard, se cargan los datos y se muestran con un CircularProgressIndicator mientras se está fetcheando.

### Datos Mock

Los datos de las cuentas se guardan en SharedPreferences (almacenamiento local). De esta forma:
- La app funciona sin backend en desarrollo
- Los datos persisten aunque cierres la app
- Es fácil reemplazar con una API real después

### Caché

Si fallan los datos de la API, mostramos los últimos datos guardados en caché. El usuario ve un LinearProgressIndicator indicando que está usando datos en caché.

Con pull-to-refresh el usuario puede forzar actualización manualmente.

---

## HU 3.3 – Internacionalización

La app soporta Español e Inglés. Para eso usamos gen_l10n que es el sistema oficial de Flutter.

### Cómo funciona

En `lib/l10n/` están los archivos `.arb`:
- `app_es.arb`: todas las strings en español
- `app_en.arb`: todas las strings en inglés

Cuando ejecutas `flutter run`, genera automáticamente las clases `AppLocalizations` que puedes usar en la app.

### Cambiar idioma

El usuario elige idioma en la pantalla de login con el widget `LoginLanguageSelector`. 

El `LocaleProvider` guarda la elección en SharedPreferences para recordarla la próxima vez.

Cuando cambias idioma, toda la app se actualiza sin reiniciar.

### Usar traducciones en código

En cualquier pantalla haces:

```dart
final l10n = AppLocalizations.of(context)!;
Text(l10n.loginSuccess);
```

Así es type-safe y el IDE te autocompleta las traducciones disponibles.

---

## Implementación completada

- Estructura de features funcionando
- Dashboard con datos mock
- i18n en español e inglés
- Selector de idioma en login

---
