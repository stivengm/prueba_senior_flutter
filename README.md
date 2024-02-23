# Prueba Técnica - Desarrollador Senior Flutter Treebu

Este proyecto está desarrollador en Flutter con el lenguaje de programación Dart con versión 3.19.1.

## Requisitos para ejecución de proyecto

- Instalar y configurar Flutter en el computador. [Link Flutter](https://flutter.dev/docs/get-started/install)
- Instalar y configurar Android Studio. [Link Android Studio](https://developer.android.com/studio)

> Versión de Flutter: 3.19.1

## Instrucciones de uso Aplicación - Pruebas

### Pantalla Login
Los campos `Email` tiene la acción en el teclado para pasar al siguiente campo de texto y el campo `Contraseña` tiene la acción de cerrar el teclado, en este caso al ingresar a cualquiera de estos dos campos y al dar tap en la pantalla en otro lado elimina el focus del campo y sale de este, para iniciar sesión deberá ingresar de email `admin@treebu.com.co` y de contraseña `administrador2024%` de lo contrario generará un error la autenticación (mock) con un `SnackBar` avisándole que están erróneas las credenciales.


### Pantalla Home
En el home aparecerán unos registros predeterminados (JSON mock), en la parte superior están los filtros y al dar tap ahí y seleccionar una opción sepodrá filtrar por Todas, Pendiente, En Proceso y Completado.
En la parte inferior hay un `FloatingActionButton` que será para añadir una tarea a la lista, al dar tap allí se navegará a una pantalla para poner los datos de la tarea y al dar a `Guardar tarea` se almacena la tarea en memoria, aparece un `SnackBar` diciéndole que la tarea se agregó a la lista y retorna a la pantalla HOME.

Para editar una tarea tendrá que dar tap a la tarjeta de la tarea y esto mostrará un `AlertDialog` para únicamente cambiar el estado de la tarea, en este caso si la tarea ya se encuentra en el estado `COMPLETADO` no se podrá cambiar este estado y aparecerá el botón `Aceptar`, en caso de que la tarea se encuentre en estado `PENDIENTE` o `EN PROCESO` dejará cambiar el estado de la tarea y el botón será `Guardar`, en su defecto para derrar el `AlertDialog` deberá tocar por fuera del mismo.

En la parte superior derecha en el `AppBar` hay un botón con un icono de reload, este se usa para almacenar una variable en el BLoC en `true` para restablecer los valores pre-determinados de las listas mock, si se presiona se puede hacer el `PullToRefresh` para actualizar esta lista, en caso de no presionarlo estará en `false` y el pullToRefresh dejará las listas sin ningún cambio.


