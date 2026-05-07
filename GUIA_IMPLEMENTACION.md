# 📝 Guía de Implementación - HU 2.1, 2.2, 2.3

## ✅ ¿Qué se completó?

### **HU 2.1 - Arquitectura Limpia para Autenticación**

Se implementó una arquitectura limpia con 3 capas:

#### Capa Domain (`lib/features/auth/domain/`)

- **Entities**: `AuthUser`, `AuthResponse`
- **Repositories** (Abstract): Define el contrato que Data debe cumplir
- **UseCases**: `LoginUseCase`, `LogoutUseCase`, `GetStoredSessionUseCase`

#### Capa Data (`lib/features/auth/data/`)

- **Models**: `LoginRequestModel`, `LoginResponseModel` (con Freezed y JSON serialization)
- **DataSources**:
  - `RemoteAuthDataSource`: Consumes API dummyJSON con DIO
  - `LocalAuthDataSource`: Almacena sesión con flutter_secure_storage
- **Repository** (Concreto): Implementa la interfaz del Domain

#### Capa Presentation (`lib/features/auth/presentation/`)

- **Providers Riverpod**: Inyección de dependencias y manejo de estado
- **States**: Estados con Freezed (Initial, Loading, Authenticated, Error, Unauthenticated)
- **UI**: LoginScreen (ConsumerWidget), LoginForm, LoginButton, LoginHeader

---

### **HU 2.2 - Login con Validaciones**

#### Validaciones Implementadas

- ✅ Validación de usuario (mín. 3 caracteres)
- ✅ Validación de contraseña (mín. 6 caracteres)
- ✅ Email validation (con regex)
- ✅ Formz para manejo de validaciones

#### Manejo de Estados

- `Loading`: Mientras se procesa el login
- `Authenticated`: Usuario logueado con datos
- `Error`: Mostrar error al usuario
- `Unauthenticated`: Usuario no autenticado

#### API Integrada

```
Endpoint: https://dummyjson.com/auth/login
Método: POST
Body: { "username": string, "password": string }
Response: { "id", "username", "email", "firstName", "lastName", "accessToken", "refreshToken", "image" }
```

#### Persistencia

- Token y sesión se guardan en shared_preferences
- Se restaura automáticamente al reiniciar la app

---

### **HU 2.3 - Gestión de Sesión y Protección de Rutas**

#### GoRouter Configurado

```dart
// Rutas disponibles:
/login      → LoginScreen
/dashboard  → DashboardLayout (protegida)
```

#### Route Guards (Protección)

- Si estás autenticado y vas a `/login` → Redirige a `/dashboard`
- Si no estás autenticado y vas a `/dashboard` → Redirige a `/login`

---

## 🧪 Cómo Probar

### 1. Credenciales de Prueba (dummyJSON)

```
Username: emilys
Password: emilyspass
```

O cualquier usuario válido listado en: https://dummyjson.com/docs/auth

### 2. Ejecutar la app

```bash
cd "c:\Cursos 2026\Proyecto Flutter\proyecto_flutter"
flutter pub get
flutter run
```

### 3. Flujo de prueba

1. **Abre la app** → Debe mostrar LoginScreen
2. **Ingresa usuario inválido** → Debe mostrar error
3. **Ingresa usuario válido** → Debe ir a Dashboard
4. **Cierra y reabre la app** → Debe mantener sesión (ir directo a Dashboard)
5. **Implementa logout** en Dashboard (llamar a `ref.read(authNotifierProvider.notifier).logout()`)

---

## 📁 Estructura de Archivos

```
lib/features/auth/
├── domain/
│   ├── entities/
│   │   ├── auth_user.dart
│   │   └── auth_response.dart
│   ├── repositories/
│   │   └── auth_repository.dart
│   └── usecases/
│       ├── login_usecase.dart
│       ├── logout_usecase.dart
│       └── get_stored_session_usecase.dart
├── data/
│   ├── datasources/
│   │   ├── remote_auth_datasource.dart
│   │   └── local_auth_datasource.dart
│   ├── models/
│   │   ├── login_request_model.dart
│   │   └── login_response_model.dart
│   └── repositories/
│       └── auth_repository_impl.dart
└── presentation/
    ├── providers/
    │   ├── auth_providers.dart
    │   ├── auth_notifier.dart
    │   └── validation_providers.dart
    ├── states/
    │   └── auth_state.dart
    ├── screens/
    │   └── login_screen.dart
    └── widgets/
        ├── login_form.dart
        ├── login_button.dart
        └── login_header.dart

lib/config/routing/
└── app_router.dart
```

---

## 🔄 Flujo de Datos (Arquitectura Limpia)

```
UI (LoginScreen)
    ↓
Providers Riverpod (authNotifierProvider)
    ↓
AuthNotifier (StateNotifier)
    ↓
UseCases (LoginUseCase)
    ↓
Repository (AuthRepositoryImpl)
    ↓
DataSources:
    ├─ RemoteDataSource → API (DIO)
    └─ LocalDataSource → Storage (flutter_secure_storage)
```

---

## 🎯 Próximos Pasos Recomendados

### Tu compañero debe:

1. ✅ Implementar el backend/API si no existe
2. ✅ Agregar refresh token logic
3. ✅ Mejorar manejo de errores específicos
4. ✅ Agregar interceptores DIO para auto-refresh de tokens

### Tú debes:

1. ✅ Implementar logout en Dashboard
2. ✅ Mejorar validaciones (regex más robustos)
3. ✅ Agregar indicadores visuales de validación
4. ✅ Guardar más datos del usuario si es necesario
5. ✅ Implementar "Recordar usuario" si lo requieren

---

## 📦 Dependencias Principales

```yaml
dependencies:
  flutter_riverpod: ^2.4.0 # State management
  freezed_annotation: ^2.4.0 # Serialization
  dio: ^5.3.0 # HTTP client
  shared_preferences: ^2.2.0 # Secure storage
  go_router: ^13.0.0 # Routing
  formz: ^0.7.0 # Form validation
  json_annotation: ^4.9.0 # JSON support
```

---

## ❓ Preguntas Frecuentes

### ¿Cómo logout?

```dart
ref.read(authNotifierProvider.notifier).logout();
```

### ¿Cómo acceder a los datos del usuario autenticado?

```dart
final authState = ref.watch(authNotifierProvider);
authState.whenOrNull(
  authenticated: (response) {
    // Aquí tienes response.user.email, response.user.firstName, etc.
  },
);
```

### ¿Cómo modificar la API endpoint?

En `lib/features/auth/data/datasources/remote_auth_datasource.dart`, cambia:

```dart
await dio.post(
  'https://tu-api.com/auth/login',  // Cambiar aquí
  data: { ... }
);
```
