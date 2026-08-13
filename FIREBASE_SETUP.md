# Configuración de Firebase

El código de las HU 4.1, 4.2 y 4.3 está integrado. Para conectarlo a tu proyecto:

1. Instala Firebase CLI y FlutterFire CLI.
2. Ejecuta `flutterfire configure` desde la raíz del proyecto.
3. Si el comando genera `lib/firebase_options.dart`, inicializa Firebase con
   `DefaultFirebaseOptions.currentPlatform` en `lib/main.dart` (necesario para web).
4. En Firebase Authentication habilita **Correo/contraseña** y crea un usuario.
5. Crea Cloud Firestore y ejecuta `firebase deploy --only firestore` para publicar
   las reglas y el índice compuesto incluidos en este repositorio.
6. En Apple activa Push Notifications y Background Modes > Remote notifications,
   y sube la clave APNs a Firebase. En Android verifica que
   `android/app/google-services.json` haya sido generado.

## Documento de transacción

Colección `transactions`, con documentos como:

```json
{
  "userId": "UID_DE_FIREBASE_AUTH",
  "type": "expense",
  "amountInCents": -5000,
  "currency": "USD",
  "description": "Transferencia a Juan Pérez",
  "createdAt": "Timestamp de Firestore",
  "status": "completed"
}
```

Los importes se almacenan en centavos para evitar errores de precisión. Los tokens
FCM se guardan automáticamente en `users/{uid}/devices/{token}`.

El envío de notificaciones debe realizarse desde un entorno confiable (Cloud
Functions o servidor con Firebase Admin SDK), nunca desde la aplicación cliente.
