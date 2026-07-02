# Sistema de Gestión de Flotas — Documentación Segunda Entrega

> **Leyenda de estado por sección:**
> - ✅ ESTÁ BIEN — Contenido correcto, sin cambios
> - ⚠️ SE CORRIGE — Tenía errores o placeholders "n" que se completan aquí
> - ❌ SE AGREGA — Sección nueva o completamente vacía en el PDF

---

## 1. Definiciones y Acrónimos ✅ ESTÁ BIEN

| Término | Definición |
|---------|------------|
| ABM | Alta, Baja, Modificación |
| BLL | Business Logic Layer — Capa de lógica de negocio |
| DAL | Data Access Layer — Capa de acceso a datos |
| BE | Business Entities — Capa de entidades de dominio |
| SL | Services Layer — Capa de servicios transversales |
| UI | User Interface — Capa de presentación (WinForms) |
| SHA256 | Algoritmo de hash criptográfico unidireccional |
| DVH | Dígito Verificador Horizontal — firma de integridad por fila |
| DVV | Dígito Verificador Vertical — firma de integridad de la tabla |
| DCU | Diagrama de Casos de Uso |
| DS | Diagrama de Secuencia |
| DC | Diagrama de Clases |
| DER | Diagrama Entidad-Relación |
| DF | Descripción de Funciones |
| ECU | Especificación de Caso de Uso |

---

## 2. Tabla de Roles ⚠️ SE CORRIGE (faltaban roles)

| Rol | Descripción | Permisos principales |
|-----|-------------|----------------------|
| Administrador | Usuario con acceso completo al sistema | ABM usuarios, Bitácora, Gestión de Perfiles, Idiomas, Historial |
| Usuario Genérico | Usuario con acceso restringido según asignación | Acceso solo a las funcionalidades que el Administrador le asigne mediante el sistema Composite |

---

## 3. Requisitos No Funcionales ✅ ESTÁ BIEN

| ID | Requisito | Descripción |
|----|-----------|-------------|
| RNF-01 | Seguridad de contraseñas | Las contraseñas se almacenan siempre como hash SHA256, nunca en texto plano |
| RNF-02 | Integridad de datos | El sistema calcula y verifica DVH por fila y DVV por tabla para detectar modificaciones directas en la BD |
| RNF-03 | Control de acceso | Los botones del menú se habilitan o deshabilitan en función de los permisos del usuario logueado (via Composite) |
| RNF-04 | Registro de actividad | Toda operación relevante se registra en la bitácora de sesión |
| RNF-05 | Soporte multiidioma | Los textos de la interfaz son configurables desde la BD; se pueden agregar nuevos idiomas sin modificar el código |
| RNF-06 | Trazabilidad | Cada modificación sobre un usuario queda registrada a nivel de campo en el historial de cambios |

---

## 4. T01 — Arquitectura Base ✅ ESTÁ BIEN

### 4.1 Diagrama de Arquitectura

`<ver gráfico T01.1 del drawio_graficos.md>`

El sistema se organiza en 5 capas con dependencias unidireccionales. La regla es: cada capa solo puede hacer referencia a la capa inmediatamente inferior, nunca saltar capas. La UI nunca accede directamente al DAL.

| Proyecto (Namespace) | Capa | Responsabilidad |
|----------------------|------|-----------------|
| `Ingenieria.De.Software` | Presentación (UI) | Formularios WinForms. Muestra datos y captura eventos del usuario |
| `Capa_de_Aplicación(BLL)` | Lógica de negocio | Validaciones, reglas de negocio, orquestación de operaciones |
| `Capa_de_Acceso_a_Datos(DAL)` | Acceso a datos | Ejecución de SQL, manejo de DataSet, DAO genérico |
| `Capa_de_Servicios(SL)` | Servicios transversales | Encriptado, sesión activa, verificación de integridad |
| `Capa_de_Dominio(BE)` | Dominio / Entidades | Clases POCO: `Usuario`, `ComponentePermiso`, `RegistroBitacora`, etc. |

**Flujo de dependencias:** UI → BLL → (DAL + SL) → BE

### 4.2 Mapa de Navegación

`<ver gráfico T01.2 del drawio_graficos.md>`

| Origen | Acción | Destino |
|--------|--------|---------|
| Form1 | Login exitoso | Form2 |
| Form2 | BTNgestUsuarios | FormGestionUsuarios |
| Form2 | BTNbitacora | FormBitacora |
| Form2 | BTNgestRolesPerm | FormPermisosRoles |
| Form2 | BTNidioma | FormIdioma |
| Form2 | BTNcerrar | Form1 (logout) |
| FormGestionUsuarios | BTNcrearUsu / BTNmodUsu / BTNeliminarUsu | FormUsuarioABM |
| FormGestionUsuarios | BTNhistorial | FormHistorialUsuario |
| FormPermisosRoles | BTNabrirrolusuario | FormAsignacionPermisos |

---

## 5. T02 — Gestión de Login / Logout ✅ ESTÁ BIEN

### 5.1 Descripción de Funciones (DF)

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Ingreso de credenciales | UI | Form1 presenta campos de usuario y contraseña con placeholders |
| Validación de campos | BLL | Se verifica que los campos no estén vacíos |
| Búsqueda del usuario | DAL | UsuarioDAL busca por nombre de usuario en la BD |
| Verificación de contraseña | SL | CryptoManager.Compare() hashea el ingreso y lo compara con el hash almacenado |
| Control de intentos | BLL | Contador de intentos fallidos; al tercero se bloquea la cuenta |
| Verificación de integridad | SL | ValidadorDeIntegridad.VerificarDVH() detecta manipulación directa en la BD |
| Inicio de sesión | SL | SessionManager.Login() registra el usuario activo en el Singleton de sesión |
| Cierre de sesión | SL | SessionManager.Logout() limpia la sesión activa |

### 5.2 Diagrama de Casos de Uso (DCU)

`<ver gráfico T02.1 del drawio_graficos.md>`

### 5.3 Especificación de Caso de Uso — CU-02.1 Iniciar Sesión

| Campo | Detalle |
|-------|---------|
| **Actor** | Usuario del sistema |
| **Precondición** | La aplicación está abierta en Form1 |
| **Postcondición** | La sesión queda activa y se abre Form2 |

**Flujo normal:**
1. El usuario ingresa su nombre de usuario y contraseña en Form1.
2. Presiona "Ingresar".
3. El sistema verifica que ambos campos tengan contenido.
4. UsuarioBLL busca el usuario por nombre en la BD.
5. Se verifica que el usuario exista y esté activo (`Activo = true`).
6. CryptoManager.Compare() verifica la contraseña contra el hash almacenado.
7. ValidadorDeIntegridad verifica que el DVH del registro coincida con el calculado.
8. SessionManager.Login() registra la sesión activa.
9. Form1 se oculta y se abre Form2 con el nombre del usuario en pantalla.

**FA1 — Credenciales incorrectas:** Se incrementa el contador de intentos. Se muestra mensaje genérico de error.
**FA2 — 3 intentos fallidos:** La cuenta queda bloqueada temporalmente. Se informa al usuario.
**FA3 — Usuario inactivo:** Se informa que la cuenta no está habilitada.
**FA4 — DVH inválido (BloqueoDV = true):** Se deniega el acceso. El administrador debe realizar el desbloqueo.

### 5.4 Especificación de Caso de Uso — CU-02.2 Cerrar Sesión

| Campo | Detalle |
|-------|---------|
| **Actor** | Usuario del sistema |
| **Precondición** | Hay una sesión activa en SessionManager |
| **Postcondición** | La sesión queda vacía y Form1 vuelve a ser visible |

**Flujo normal:**
1. El usuario presiona "Cerrar Sesión" en Form2.
2. SessionManager.Logout() limpia la referencia al usuario activo.
3. Form2 se cierra y Form1 vuelve a mostrarse.

### 5.5 Diagrama de Secuencia — Login

`<ver gráfico T02.2 del drawio_graficos.md>`

### 5.6 Diagrama de Clases — Login / Sesión

`<ver gráfico T02.3 del drawio_graficos.md>`

---

## 6. T02 — ABM de Usuarios ⚠️ SE CORRIGE (flujos tenían placeholder "1. n")

### 6.1 Alta de Usuario

**DF:**

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Apertura del formulario | UI | BTNcrearUsu llama a `llamarAMB(Alta)`, que abre FormUsuarioABM con campos vacíos |
| Ingreso de datos | UI | El operador ingresa nombre, contraseña, selecciona nivel de permisos, marca cuenta como activa |
| Validación de credenciales | BLL | UsuarioBLL.ValidarCredenciales() verifica formato y longitud |
| Hasheo de contraseña | SL | CryptoManager.Hash() aplica SHA256 a la contraseña |
| Inserción en BD (paso 1) | DAL | UsuarioDAL.Guardar() ejecuta INSERT; el DAL asigna el Id real al objeto en memoria |
| Cálculo de DVH | SL | ValidadorDeIntegridad.CalcularDVH() usa el Id definitivo (no el 0 inicial) |
| Actualización de DVH (paso 2) | DAL | UsuarioDAL.Guardar() ejecuta UPDATE para persistir el DVH correcto |
| Recálculo de DVV | BLL | DigitoVerificadorBLL.RecalcularUsuariosDVV() actualiza la firma de la tabla |
| Registro de auditoría | BLL | GestorDeAuditoria.RegistrarAlta() guarda el estado inicial en HistorialCambios |
| Registro de bitácora | SL | SessionManager.RegistrarActividad() registra la operación de alta |

**ECU CU-02.3 Alta de Usuario:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | El administrador está en FormGestionUsuarios |
| **Postcondición** | El usuario queda persistido con DVH correcto y DVV recalculado |

1. El administrador presiona "Crear Usuario".
2. Se abre FormUsuarioABM; el título indica "Crear Nuevo Usuario".
3. El administrador ingresa nombre de usuario, contraseña, selecciona nivel de permisos y activa la cuenta.
4. Presiona "Confirmar".
5. UsuarioBLL valida el formato de las credenciales y hashea la contraseña con SHA256.
6. Se ejecuta INSERT en BD. El DAL asigna el Id real al objeto Usuario.
7. Con el Id correcto se calcula el DVH y se ejecuta UPDATE para persistirlo.
8. Se recalcula el DVV de la tabla.
9. Se registra el alta en el historial de auditoría y en la bitácora de sesión.
10. FormUsuarioABM se cierra y FormGestionUsuarios recarga la grilla.

**FA1 — Nombre de usuario ya existente:** UsuarioBLL lanza excepción con el mensaje de error.
**FA2 — Campos de contraseña vacíos:** La validación falla antes de persistir cualquier dato.

---

### 6.2 Modificación de Usuario

**DF:**

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Selección | UI | El administrador selecciona un usuario de la grilla y presiona "Modificar" |
| Carga de datos actuales | UI | FormUsuarioABM se abre con los datos del usuario precargados |
| Captura del estado anterior | BLL | UsuarioBLL llama a ObtenerPorId() para guardar el estado previo a la modificación |
| Edición | UI | El administrador modifica nombre, contraseña (opcional), permisos o estado activo |
| Validación y persistencia | BLL/DAL | UsuarioBLL valida y UsuarioDAL.Guardar() ejecuta UPDATE |
| Recálculo de firmas | SL/BLL | DVH se recalcula y DVV se actualiza |
| Registro diferencial | BLL | GestorDeAuditoria.RegistrarCambios() compara estado anterior vs nuevo y guarda solo los campos que cambiaron |
| Registro de bitácora | SL | SessionManager.RegistrarActividad() |

**ECU CU-02.4 Modificación de Usuario:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | El administrador está en FormGestionUsuarios con al menos un usuario en la grilla |
| **Postcondición** | Los datos del usuario quedan actualizados y el cambio registrado en el historial |

1. El administrador selecciona un usuario de la grilla y presiona "Modificar".
2. Se abre FormUsuarioABM con los datos actuales cargados. El título indica "Modificación de Usuario".
3. El administrador modifica los campos que desea (nombre, contraseña, permisos, estado activo, BloqueoDV).
4. Presiona "Confirmar".
5. UsuarioBLL captura el estado anterior con ObtenerPorId().
6. Valida y persiste el nuevo estado con UPDATE en BD.
7. Se recalculan DVH y DVV.
8. GestorDeAuditoria compara estado anterior vs nuevo y registra solo los campos que cambiaron.
9. Se registra la actividad en la bitácora.
10. FormUsuarioABM se cierra y la grilla se recarga.

**FA1 — Nombre de usuario duplicado:** Error de validación, no se guarda.
**FA2 — El administrador cancela:** BTNcancelar cierra el formulario sin guardar cambios.

---

### 6.3 Baja de Usuario

**DF:**

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Selección | UI | El administrador selecciona un usuario y presiona "Eliminar" |
| Apertura en modo lectura | UI | FormUsuarioABM muestra los datos sin permitir edición; panel de título en rojo con advertencia |
| Validación de auto-eliminación | BLL | Se verifica que el usuario a eliminar no sea el mismo usuario de la sesión activa |
| Eliminación en BD | DAL | UsuarioBLL.Eliminar() ejecuta DELETE |
| Recálculo de DVV | BLL | DigitoVerificadorBLL recalcula la firma de la tabla |
| Registro | BLL/SL | GestorDeAuditoria.RegistrarBaja() + SessionManager.RegistrarActividad() |

**ECU CU-02.5 Baja de Usuario:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | El administrador está en FormGestionUsuarios con un usuario seleccionado |
| **Postcondición** | El usuario queda eliminado de la BD y el DVV recalculado |

1. El administrador selecciona un usuario y presiona "Eliminar".
2. Se abre FormUsuarioABM en modo Baja: todos los campos están bloqueados, el panel de título es rojo y el botón dice "Eliminar".
3. El formulario advierte que la eliminación permanente no es recomendable.
4. El administrador confirma presionando "Eliminar".
5. El sistema verifica que el usuario a eliminar no sea el usuario actualmente logueado.
6. UsuarioBLL.Eliminar() ejecuta DELETE en la BD.
7. Se recalcula el DVV de la tabla.
8. Se registra la baja en la auditoría y en la bitácora.
9. FormUsuarioABM se cierra y la grilla se recarga.

**FA1 — El administrador intenta eliminar su propia cuenta:** El sistema bloquea la operación y sugiere desactivar la cuenta (`Activo = false`) en su lugar.
**FA2 — El administrador cancela:** Se cierra el formulario sin realizar ninguna acción.

### 6.4 Diagrama de Secuencia — Alta de Usuario

`<ver gráfico T02.4 del drawio_graficos.md>`

---

## 7. T03 — Gestión de Encriptado ✅ ESTÁ BIEN

### 7.1 Encriptado de contraseñas (SHA256)

El sistema utiliza el algoritmo **SHA256** (unidireccional) para proteger las contraseñas. La clase `CryptoManager` en la capa de servicios expone dos métodos:

| Método | Firma | Descripción |
|--------|-------|-------------|
| Hash | `Hash(string texto): string` | Aplica SHA256 y retorna el hash hexadecimal |
| Compare | `Compare(string texto, string hash): bool` | Hashea el texto y lo compara con el hash almacenado |

La contraseña nunca se almacena en texto plano. Al crear o modificar un usuario, se hashea antes de persistir. Al hacer login, se hashea el ingreso del usuario y se compara con el hash de la BD.

### 7.2 Dígito Verificador Horizontal (DVH)

El DVH se calcula para cada registro de usuario concatenando sus campos y aplicando el algoritmo de módulo 11.

**Campos incluidos en el cálculo:** Id, NombreUsuario, Contraseña (hash), Activo, Permisos concatenados, BloqueoDV.

**Algoritmo:**
1. Concatenar todos los campos en una cadena de caracteres.
2. Recorrer los dígitos de izquierda a derecha multiplicando cada uno por los factores 2, 3, 4, 5, 6, 7 (cíclico).
3. Sumar todos los productos.
4. Calcular `residuo = suma mod 11`.
5. Si `residuo == 0` → DVH = "0"; si `residuo == 10 o 11` → DVH = "X"; en otro caso → DVH = `(11 - residuo).ToString()`.

El DVH se persiste en la columna `DVH` de la tabla Usuario. Al hacer login, se recalcula y se compara. Si hay discrepancia, se activa `BloqueoDV = true`.

**Nota de implementación:** Para los usuarios nuevos (Alta), el DVH se calcula en dos pasos: primero se hace INSERT para obtener el Id real asignado por la BD, y luego se calcula el DVH con ese Id y se actualiza con UPDATE. Esto evita que el DVH quede calculado con Id = 0.

### 7.3 Dígito Verificador Vertical (DVV)

El DVV se calcula sumando todos los DVH de la tabla y se persiste en la tabla `DigitoVerificador`. Se recalcula cada vez que se hace un ABM de usuarios.

### 7.4 Desbloqueo Masivo

El botón "Desbloqueo Masivo" en FormGestionUsuarios permite restablecer la integridad del sistema cuando hay inconsistencias generalizadas (por ejemplo, eliminaciones directas en SSMS). El proceso itera sobre todos los usuarios, limpia el flag `BloqueoDV`, y recalcula DVH y DVV desde cero.

---

## 8. T06a — Gestión de Bitácora ✅ ESTÁ BIEN

*Esta sección estaba completa en el PDF con DF, DCU, ECU, DS, DC, DER y descripción del algoritmo. Copiar tal cual desde el PDF.*

---

## 9. T04 — Gestión de Perfiles de Usuario (Composite) ⚠️ SE CORRIGE

### 9.1 Aplicación del patrón Composite

El patrón Composite se aplica para modelar la estructura jerárquica de permisos. Permite tratar de forma uniforme permisos individuales y grupos de permisos, sin que el código deba distinguirlos.

| Clase / Interfaz | Tipo | Capa | Rol en el patrón |
|------------------|------|------|------------------|
| `ComponentePermiso` | Clase abstracta (Componente) | BE | Define la interfaz uniforme: Id, Nombre, NombreInterno, Hijos, AgregarHijo, QuitarHijo |
| `PermisoSimple` | Hoja (Leaf) | BE | Permiso atómico. No tiene hijos reales; AgregarHijo y QuitarHijo lanzan excepción |
| `Rol` | Contenedor (Composite) | BE | Contiene una lista de ComponentePermiso (puede mezclar hojas y sub-roles) |
| `PermisoBLL` | Lógica | BLL | Validaciones, detección de referencias circulares, persistencia |
| `PermisoDAL` | Acceso a datos | DAL | CRUD en tablas Componente y ComponenteHijo (relación padre-hijo) |
| `FormPermisosRoles` | UI | UI | ABM de Roles y Patentes; árbol visual TreeView para configurar estructura |
| `FormAsignacionPermisos` | UI | UI | Asignación de Roles completos a usuarios individuales |

**Evaluación de permisos en runtime:** `Usuario.TienePermiso(string nombreInterno)` recorre recursivamente la lista de permisos del usuario. Si en cualquier nivel del árbol encuentra un `PermisoSimple` con el `NombreInterno` buscado, retorna `true`. Esto permite que los botones del menú se habiliten/deshabiliten automáticamente según los permisos reales del usuario, incluyendo permisos heredados de sub-roles.

**Validación de referencias circulares:** Antes de agregar un componente hijo a un rol, `PermisoBLL.ReferenciaCircular()` recorre recursivamente el árbol del componente a agregar, verificando que el rol padre no esté contenido dentro de él. Esto previene ciclos infinitos en la estructura de permisos.

### 9.2 Diagrama de Clases — Composite

`<ver gráfico T04.1 del drawio_graficos.md>`

---

### 9.3 CU-04.1 Alta de Rol

**DF:**

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Ingreso del nombre | UI | El administrador escribe el nombre del nuevo Rol en TXTnomRol |
| Validación | BLL | PermisoBLL.GuardarComponente() verifica que el nombre no esté vacío |
| Persistencia | DAL | PermisoDAL.GuardarComponente() ejecuta INSERT con EsFamilia = true |
| Actualización de UI | UI | Se recargan CMBroles y LBXcomponentes para reflejar el nuevo rol |

**ECU CU-04.1:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | El administrador está en FormPermisosRoles |
| **Postcondición** | El nuevo Rol queda disponible en el catálogo para asignarle componentes |

1. El administrador ingresa el nombre del rol en el campo de texto correspondiente.
2. Presiona "Crear Rol".
3. PermisoBLL.GuardarComponente() valida que el nombre no sea vacío ni en blanco.
4. PermisoDAL inserta el componente con EsFamilia = true.
5. La UI recarga la lista de componentes y el combo de roles.
6. El nuevo rol queda disponible para configuración.

**FA1 — Nombre vacío o en blanco:** Validación falla; no se persiste nada.

---

### 9.4 CU-04.2 Alta de Patente (Permiso Simple)

**DF:**

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Ingreso de datos | UI | El administrador ingresa nombre visible (TXTnomPatente) y nombre interno (TXTinternopatente), ej: "Menu_Usuarios" |
| Validación | BLL | PermisoBLL verifica que ambos campos estén completos. Un PermisoSimple sin NombreInterno no puede evaluar permisos en runtime |
| Persistencia | DAL | PermisoDAL guarda el componente como EsFamilia = false |
| Actualización de UI | UI | LBXcomponentes se recarga |

**ECU CU-04.2:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | El administrador está en FormPermisosRoles |
| **Postcondición** | La nueva patente queda en el catálogo lista para ser asignada a roles |

1. El administrador ingresa el nombre visible y el nombre interno del permiso.
2. Presiona "Crear Patente".
3. PermisoBLL valida que ambos campos tengan contenido.
4. PermisoDAL inserta la patente como EsFamilia = false.
5. La patente aparece en LBXcomponentes.

**FA1 — NombreInterno vacío:** Validación falla. Un PermisoSimple sin NombreInterno no puede ser evaluado por `TienePermiso()` en runtime.

---

### 9.5 CU-04.3 Asignación de Componente a Rol

**DF:**

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Selección de rol | UI | El administrador elige el Rol en CMBroles; el árbol muestra la estructura actual |
| Selección de componente | UI | El administrador elige un componente de LBXcomponentes |
| Detección de ciclos | BLL | PermisoBLL.ReferenciaCircular() recorre recursivamente el árbol del componente a agregar |
| Persistencia | DAL | PermisoDAL.AgregarHijo() ejecuta INSERT en la tabla ComponenteHijo |
| Actualización del árbol | UI | ArbolPermisos se recarga con la nueva estructura |

**ECU CU-04.3:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | Existen al menos un Rol y un componente en el catálogo |
| **Postcondición** | El componente queda como hijo del Rol seleccionado |

1. El administrador selecciona un Rol en CMBroles. El árbol muestra los permisos actuales.
2. El administrador selecciona un componente (patente o sub-rol) de LBXcomponentes.
3. Presiona "Agregar al Rol".
4. PermisoBLL.ReferenciaCircular() verifica recursivamente que no se genere un ciclo infinito.
5. Si no hay ciclo, el hijo se agrega en memoria y se persiste en BD.
6. El TreeView se recarga mostrando la nueva estructura del rol.

**FA1 — Referencia circular detectada:** Error con mensaje descriptivo; la operación se cancela y la memoria se revierte.

---

### 9.6 CU-04.4 Quitar Componente de Rol

**ECU CU-04.4:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | El administrador está viendo el árbol de un Rol con al menos un hijo |
| **Postcondición** | El componente queda desvinculado del Rol |

1. El administrador selecciona un nodo del árbol (que no sea el nodo raíz).
2. Presiona "Quitar del Rol".
3. El sistema identifica el padre directo del nodo y el componente a quitar.
4. QuitarComponenteDeRol() elimina la relación en memoria y en BD.
5. El árbol se recarga.

**FA1 — Se selecciona el nodo raíz:** No se puede quitar el contenedor base. La operación no se ejecuta.

---

### 9.7 CU-04.5 Asignación de Rol a Usuario

**DF:**

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Selección de usuario | UI | El administrador selecciona un usuario en CMBusuarios |
| Carga de permisos actuales | UI | ArbolPermisosUsuario muestra los roles ya asignados con su estructura interna |
| Selección de rol | UI | El administrador elige un Rol del catálogo en LBXpermisosDisponibles |
| Validación de tipo | BLL | Solo se permiten Roles completos, no patentes individuales directamente |
| Validación de duplicados | BLL | Se verifica que el rol no esté ya asignado directamente al usuario |
| Persistencia | BLL/DAL | UsuarioBLL.Guardar() persiste la nueva lista de permisos; recalcula DVH y DVV |

**ECU CU-04.5:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | El administrador está en FormAsignacionPermisos (abierto desde FormPermisosRoles) |
| **Postcondición** | El Rol queda asociado al usuario; las firmas digitales se actualizan |

1. El administrador abre FormAsignacionPermisos.
2. Selecciona un usuario del combo. El árbol muestra sus roles actuales.
3. Selecciona un Rol de la lista de roles disponibles.
4. Presiona "Asignar".
5. El sistema valida que sea un Rol (no una patente suelta) y que no esté duplicado.
6. El rol se agrega a la lista de permisos del usuario en memoria.
7. UsuarioBLL.Guardar() persiste el cambio y recalcula DVH y DVV.
8. El árbol del usuario se recarga.

**FA1 — Se intenta asignar una patente directamente:** Error informativo. Las patentes solo se pueden usar dentro de un Rol.
**FA2 — El rol ya está asignado directamente:** Mensaje informativo; no se duplica.

---

### 9.8 CU-04.6 Revocar Rol de Usuario

**ECU CU-04.6:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | El usuario tiene al menos un Rol asignado |
| **Postcondición** | El Rol queda revocado; las firmas digitales se recalculan |

1. El administrador selecciona un nodo raíz del árbol del usuario (un permiso directo).
2. Presiona "Revocar".
3. El sistema quita el rol de la lista del usuario y persiste el cambio.
4. DVH y DVV se recalculan.
5. El árbol del usuario se recarga.

**FA1 — Se selecciona un nodo hijo (permiso heredado de un sub-rol):** El sistema informa que solo se puede revocar el Rol contenedor completo, no los permisos que hereda de él.

---

## 10. T05 — Gestión de Idiomas (Observer) ❌ SE AGREGA

### 10.1 Aplicación del patrón Observer

El patrón Observer se aplica para actualizar dinámicamente los textos de la interfaz al cambiar el idioma de la aplicación, sin necesidad de cerrar y reabrir los formularios.

| Clase / Interfaz | Tipo | Capa | Rol en el patrón |
|------------------|------|------|------------------|
| `GestorDeIdioma` | Subject + Singleton | BLL | Mantiene la lista de observadores; al cambiar idioma carga el diccionario desde DAL y notifica a todos |
| `IObservadorDeIdioma` | Interface | BLL | Contrato `ActualizarIdioma(Dictionary<string,string>)` que implementan los formularios |
| `Form1` | Observador concreto | UI | Actualiza labels, botones y textos placeholder del login |
| `Form2` | Observador concreto | UI | Actualiza título y botones del menú principal |
| `FormGestionUsuarios` | Observador concreto | UI | Actualiza título, botones y encabezados de columnas de la grilla |
| `FormIdioma` | Observador concreto | UI | Actualiza sus propios controles; además administra el catálogo de idiomas |
| `IdiomaDAL` | Acceso a datos | DAL | Lee y escribe en la tabla `Etiqueta`; detecta columnas disponibles vía INFORMATION_SCHEMA |

**Persistencia de traducciones:** Las traducciones se almacenan en la tabla `Etiqueta` de SQL Server, con una columna por idioma (`Español`, `Ingles`, etc.). Cada fila tiene una clave única que identifica el elemento de la interfaz. Agregar un nuevo idioma se hace con `ALTER TABLE Etiqueta ADD [NuevoIdioma] NVARCHAR(200)`, sin tocar el código fuente.

**Ciclo de vida de los observadores:** Al abrir un formulario, este se suscribe en `GestorDeIdioma`. Al cerrarlo, se desuscribe. Esto garantiza que solo reciban notificaciones los formularios actualmente abiertos.

**Seguridad contra inyección SQL:** El nombre de un nuevo idioma es validado con Regex `^[\p{L}\s]+$` antes de usarlo en consultas dinámicas. Nombres con números o símbolos son rechazados.

### 10.2 Diagrama de Clases — Observer

`<ver gráfico T05.1 del drawio_graficos.md>`

---

### 10.3 CU-05.1 Cambiar Idioma

**DF:**

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Selección de idioma | UI | El usuario elige un idioma del ComboBox en FormIdioma y presiona "Aplicar" |
| Carga del diccionario | DAL | IdiomaDAL.ObtenerDiccionario() ejecuta SELECT de la columna del idioma elegido desde la tabla Etiqueta |
| Cambio de estado | BLL | GestorDeIdioma actualiza `idiomaActual` y `textosActuales` en memoria |
| Notificación a observadores | BLL | GestorDeIdioma.Notificar() recorre la lista y llama a `ActualizarIdioma()` en cada formulario suscripto |
| Actualización de controles | UI | Cada formulario reemplaza los textos de sus labels, botones y título sin cerrarse |

**ECU CU-05.1:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Usuario del sistema |
| **Precondición** | El usuario está en FormIdioma (abierto desde Form2) |
| **Postcondición** | Todos los formularios abiertos muestran los textos en el nuevo idioma |

1. El usuario abre FormIdioma desde el menú principal.
2. El sistema carga en el ComboBox los idiomas disponibles, leídos de las columnas de la tabla `Etiqueta`.
3. El usuario selecciona un idioma (ej: "Ingles") y presiona "Aplicar".
4. `GestorDeIdioma.CambiarIdioma("Ingles")` consulta a `IdiomaDAL` y carga el diccionario clave→texto.
5. `GestorDeIdioma` recorre su lista de observadores y llama a `ActualizarIdioma()` en cada formulario abierto.
6. Form2, FormGestionUsuarios y otros formularios suscriptos actualizan sus controles en tiempo real.

**FA1 — El idioma seleccionado tiene traducciones incompletas:** Los controles cuya clave no tiene traducción no se actualizan; el resto cambia normalmente.

---

### 10.4 CU-05.2 Cargar Nuevo Idioma

**DF:**

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Ingreso del nombre | UI | El administrador escribe el nombre del idioma en TXTnuevoIdioma (ej: "Portugues") |
| Validación del nombre | DAL | IdiomaDAL.ValidarNombreIdioma() aplica Regex `^[\p{L}\s]+$`; rechaza números y símbolos |
| Alteración del esquema | DAL | `ALTER TABLE Etiqueta ADD [NombreIdioma] NVARCHAR(200)` agrega la columna |
| Recarga de la UI | UI | ComboBox y DataGridView se recargan; la nueva columna aparece vacía |
| Carga de traducciones | UI | El administrador completa las celdas del DataGridView para el nuevo idioma |
| Guardado de traducciones | DAL | BTNguardar → IdiomaDAL.ActualizarTraduccion() ejecuta UPDATE por cada clave |

**ECU CU-05.2:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | El administrador está en FormIdioma |
| **Postcondición** | El nuevo idioma queda disponible como columna en la tabla Etiqueta |

1. El administrador ingresa el nombre del nuevo idioma en el campo de texto (ej: "Portugues").
2. Presiona "Agregar".
3. IdiomaDAL valida el nombre con Regex.
4. Si es válido, ejecuta `ALTER TABLE Etiqueta ADD [Portugues] NVARCHAR(200)`.
5. El ComboBox y el DataGridView se recargan; la columna "Portugues" aparece vacía.
6. El administrador completa las traducciones celda por celda en el DataGridView.
7. Presiona "Guardar cambios".
8. Por cada fila y columna del idioma nuevo, se ejecuta UPDATE en la tabla `Etiqueta`.
9. El nuevo idioma queda disponible en el selector para cualquier usuario.

**FA1 — El nombre contiene caracteres inválidos (números, símbolos, etc.):** La validación Regex rechaza el nombre y muestra un mensaje de error. No se ejecuta el ALTER TABLE.

---

## 11. T06b — Control de Cambios / Historial de Usuario ❌ SE AGREGA

### 11.1 Descripción

El sistema registra un historial detallado de cada modificación realizada sobre los datos de usuarios. Cada cambio se persiste a nivel de **campo individual**: se guarda qué campo cambió, el valor anterior, el valor nuevo, quién realizó el cambio y cuándo.

Esto permite:
- Consultar el historial completo de modificaciones de cualquier usuario.
- Revertir un cambio puntual: restaurar el valor anterior de un campo específico.

| Clase | Capa | Descripción |
|-------|------|-------------|
| `RegistroCambio` | BE | Entidad: EntidadNombre, EntidadId, NombreCampo, ValorAnterior, ValorNuevo, Operador, FechaHora |
| `GestorDeAuditoria` | BLL | Compara estado anterior vs posterior y genera la lista de RegistroCambio a persistir |
| `HistorialCambiosDAL` | DAL | GuardarCambios() INSERT lista; ObtenerHistorialDeUsuario() SELECT filtrado por usuarioId |
| `FormHistorialUsuario` | UI | Muestra el historial en DataGridView; permite revertir un cambio seleccionado |

**Integración con el ABM:** `GestorDeAuditoria` se invoca automáticamente desde `UsuarioBLL`:
- Alta → `RegistrarAlta()`: guarda el estado inicial de todos los campos.
- Modificación → `RegistrarCambios()`: compara campo por campo y guarda solo los que cambiaron.
- Baja → `RegistrarBaja()`: guarda el estado final de todos los campos con ValorNuevo = null.

### 11.2 Diagrama de Clases — Control de Cambios

`<ver gráfico T06b.1 del drawio_graficos.md>`

---

### 11.3 CU-06b.1 Consultar Historial de Usuario

**DF:**

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Selección del usuario | UI | El administrador selecciona un usuario en FormGestionUsuarios y presiona "Historial" |
| Consulta de historial | DAL | HistorialCambiosDAL.ObtenerHistorialDeUsuario() ejecuta SELECT filtrado por EntidadId |
| Visualización | UI | FormHistorialUsuario muestra los registros en DGVhistorial con todas las columnas del RegistroCambio |

**ECU CU-06b.1:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | El administrador está en FormGestionUsuarios con un usuario seleccionado |
| **Postcondición** | Se muestra el historial completo de cambios del usuario |

1. El administrador selecciona un usuario de la grilla.
2. Presiona "Historial".
3. Se abre FormHistorialUsuario con el nombre del usuario en el título.
4. GestorDeAuditoria.ObtenerHistorial() consulta la BD.
5. El historial se muestra en DGVhistorial con columnas: NombreCampo, ValorAnterior, ValorNuevo, Operador, FechaHora.

---

### 11.4 CU-06b.2 Revertir Cambio

**DF:**

| Subfunción | Capa | Descripción |
|------------|------|-------------|
| Selección del registro | UI | El administrador selecciona una fila del historial en DGVhistorial |
| Validación de reversión | UI | Se verifica que el registro tenga ValorAnterior (no es un alta) |
| Obtención del estado actual | DAL | UsuarioBLL.ObtenerPorId() trae el usuario actualizado desde la BD |
| Aplicación del valor anterior | BLL | Se sobreescribe el campo afectado con ValorAnterior según NombreCampo |
| Persistencia | BLL/DAL | UsuarioBLL.Guardar() actualiza el registro; recalcula DVH y DVV |
| Recarga del historial | UI | DGVhistorial se recarga para reflejar el nuevo estado |

**ECU CU-06b.2:**

| Campo | Detalle |
|-------|---------|
| **Actor** | Administrador |
| **Precondición** | El administrador está en FormHistorialUsuario con al menos un registro visible |
| **Postcondición** | El campo revertido queda con su valor anterior; las firmas se recalculan |

1. El administrador selecciona una fila del historial.
2. Presiona "Revertir".
3. El sistema verifica que el registro no sea un alta (ValorAnterior != null).
4. Se obtiene el usuario actual de la BD con ObtenerPorId().
5. Se identifica el campo a revertir según NombreCampo ("NombreUsuario", "Activo" o "NivelPermisos").
6. Se aplica ValorAnterior al campo correspondiente del objeto Usuario.
7. UsuarioBLL.Guardar() persiste el cambio y recalcula DVH y DVV.
8. El historial se recarga mostrando el nuevo estado.

**FA1 — Se intenta revertir un alta (ValorAnterior = null):** El sistema muestra un mensaje indicando que esa operación no se puede revertir.
**FA2 — Error al guardar el usuario:** Se muestra el error y el cambio no se aplica.
