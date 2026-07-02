# Diagramas draw.io — Sistema de Gestión de Flotas

Cada sección contiene el XML listo para importar en draw.io.
**Cómo importar:** Abrir draw.io → Extras → Edit Diagram → pegar el XML → OK.

---

## T01.1 — Diagrama de Arquitectura (5 capas)

```xml
<mxGraphModel dx="1200" dy="800" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
  <root>
    <mxCell id="0"/>
    <mxCell id="1" parent="0"/>

    <mxCell id="2" value="UI — Ingenieria.De.Software&#xa;Form1, Form2, FormGestionUsuarios, FormBitacora, FormPermisosRoles, FormAsignacionPermisos, FormIdioma, FormHistorialUsuario"
      style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;fontStyle=1;fontSize=11;"
      vertex="1" parent="1">
      <mxGeometry x="80" y="40" width="560" height="60" as="geometry"/>
    </mxCell>

    <mxCell id="3" value="BLL — Capa_de_Aplicacion&#xa;UsuarioBLL, PermisoBLL, GestorDeIdioma, GestorDeAuditoria, DigitoVerificadorBLL, BitacoraBLL"
      style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontStyle=1;fontSize=11;"
      vertex="1" parent="1">
      <mxGeometry x="80" y="150" width="560" height="60" as="geometry"/>
    </mxCell>

    <mxCell id="4" value="DAL — Capa_de_Acceso_a_Datos&#xa;DAO, UsuarioDAL, IdiomaDAL, PermisoDAL, BitacoraDAL, HistorialCambiosDAL, DigitoVerificadorDAL"
      style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontStyle=1;fontSize=11;"
      vertex="1" parent="1">
      <mxGeometry x="80" y="260" width="260" height="60" as="geometry"/>
    </mxCell>

    <mxCell id="5" value="SL — Capa_de_Servicios&#xa;SessionManager (Singleton), CryptoManager, ValidadorDeIntegridad"
      style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontStyle=1;fontSize=11;"
      vertex="1" parent="1">
      <mxGeometry x="380" y="260" width="260" height="60" as="geometry"/>
    </mxCell>

    <mxCell id="6" value="BE — Capa_de_Dominio&#xa;Usuario, ComponentePermiso, PermisoSimple, Rol, RegistroBitacora, RegistroCambio, FiltrosBitacora"
      style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontStyle=1;fontSize=11;"
      vertex="1" parent="1">
      <mxGeometry x="80" y="370" width="560" height="60" as="geometry"/>
    </mxCell>

    <mxCell id="7" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="2" target="3" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="8" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="3" target="4" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="9" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="3" target="5" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="10" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="4" target="6" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="11" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="5" target="6" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>

    <mxCell id="12" value="depende de" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;"
      vertex="1" parent="1">
      <mxGeometry x="660" y="90" width="80" height="30" as="geometry"/>
    </mxCell>
  </root>
</mxGraphModel>
```

---

## T01.2 — Mapa de Navegación (flujo de formularios)

```xml
<mxGraphModel dx="1200" dy="800" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
  <root>
    <mxCell id="0"/>
    <mxCell id="1" parent="0"/>

    <mxCell id="2" value="Form1&#xa;Login" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="450" y="40" width="120" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="3" value="Form2&#xa;Menu Principal" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="450" y="160" width="120" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="4" value="FormGestionUsuarios&#xa;ABM Usuarios" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
      <mxGeometry x="100" y="300" width="140" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="5" value="FormBitacora&#xa;Bitacora" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
      <mxGeometry x="280" y="300" width="140" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="6" value="FormPermisosRoles&#xa;Roles y Permisos" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
      <mxGeometry x="460" y="300" width="140" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="7" value="FormIdioma&#xa;Gestion de Idiomas" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
      <mxGeometry x="640" y="300" width="140" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="8" value="FormUsuarioABM&#xa;Alta/Mod/Baja" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;" vertex="1" parent="1">
      <mxGeometry x="40" y="430" width="130" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="9" value="FormHistorialUsuario&#xa;Historial" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;" vertex="1" parent="1">
      <mxGeometry x="190" y="430" width="130" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="10" value="FormAsignacionPermisos&#xa;Asignar Roles" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;" vertex="1" parent="1">
      <mxGeometry x="440" y="430" width="160" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="11" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="2" target="3" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="12" value="Login exitoso" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="11">
      <mxGeometry x="-0.1" relative="1" as="geometry"/>
    </mxCell>

    <mxCell id="13" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="3" target="4" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="14" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="3" target="5" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="15" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="3" target="6" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="16" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="3" target="7" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="17" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="4" target="8" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="18" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="4" target="9" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="19" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="6" target="10" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
  </root>
</mxGraphModel>
```

---

## T02.1 — DCU Login / Logout

```xml
<mxGraphModel dx="1200" dy="800" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
  <root>
    <mxCell id="0"/>
    <mxCell id="1" parent="0"/>

    <mxCell id="2" value="Usuario" style="shape=mxgraph.uml.actor;html=1;whiteSpace=wrap;align=center;" vertex="1" parent="1">
      <mxGeometry x="60" y="200" width="50" height="80" as="geometry"/>
    </mxCell>

    <mxCell id="3" value="Sistema de Gestion de Flotas" style="points=[[0,0],[0.25,0],[0.5,0],[0.75,0],[1,0],[1,0.25],[1,0.5],[1,0.75],[1,1],[0.75,1],[0.5,1],[0.25,1],[0,1],[0,0.75],[0,0.5],[0,0.25]];shape=mxgraph.uml.systemBoundary;whiteSpace=wrap;html=1;" vertex="1" parent="1">
      <mxGeometry x="200" y="60" width="400" height="380" as="geometry"/>
    </mxCell>

    <mxCell id="4" value="Iniciar Sesion" style="ellipse;whiteSpace=wrap;html=1;" vertex="1" parent="1">
      <mxGeometry x="270" y="130" width="140" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="5" value="Cerrar Sesion" style="ellipse;whiteSpace=wrap;html=1;" vertex="1" parent="1">
      <mxGeometry x="270" y="230" width="140" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="6" value="Desbloquear Cuenta (Masivo)" style="ellipse;whiteSpace=wrap;html=1;" vertex="1" parent="1">
      <mxGeometry x="270" y="330" width="160" height="50" as="geometry"/>
    </mxCell>

    <mxCell id="7" value="Administrador" style="shape=mxgraph.uml.actor;html=1;whiteSpace=wrap;align=center;" vertex="1" parent="1">
      <mxGeometry x="640" y="310" width="50" height="80" as="geometry"/>
    </mxCell>

    <mxCell id="8" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="2" target="4" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="9" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="2" target="5" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="10" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="7" target="6" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="11" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="7" target="4" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="12" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="7" target="5" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
  </root>
</mxGraphModel>
```

---

## T02.2 — DS Login (Diagrama de Secuencia)

```xml
<mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1654" pageHeight="1169" math="0" shadow="0">
  <root>
    <mxCell id="0"/>
    <mxCell id="1" parent="0"/>

    <mxCell id="2" value="Usuario" style="shape=mxgraph.uml.actor2;html=1;" vertex="1" parent="1">
      <mxGeometry x="60" y="20" width="40" height="60" as="geometry"/>
    </mxCell>
    <mxCell id="3" value="" style="points=[[0.5,0]];perimeter=mxPerimeter.RectanglePerimeter;fillColor=none;strokeColor=#000000;dashed=1;" vertex="1" parent="1">
      <mxGeometry x="75" y="80" width="10" height="400" as="geometry"/>
    </mxCell>

    <mxCell id="4" value="Form1" style="text;html=1;align=center;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="210" y="30" width="80" height="30" as="geometry"/>
    </mxCell>
    <mxCell id="5" value="" style="points=[[0.5,0]];perimeter=mxPerimeter.RectanglePerimeter;fillColor=none;strokeColor=#000000;dashed=1;" vertex="1" parent="1">
      <mxGeometry x="245" y="60" width="10" height="420" as="geometry"/>
    </mxCell>

    <mxCell id="6" value="UsuarioBLL" style="text;html=1;align=center;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="370" y="30" width="100" height="30" as="geometry"/>
    </mxCell>
    <mxCell id="7" value="" style="points=[[0.5,0]];perimeter=mxPerimeter.RectanglePerimeter;fillColor=none;strokeColor=#000000;dashed=1;" vertex="1" parent="1">
      <mxGeometry x="415" y="60" width="10" height="420" as="geometry"/>
    </mxCell>

    <mxCell id="8" value="CryptoManager" style="text;html=1;align=center;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="540" y="30" width="120" height="30" as="geometry"/>
    </mxCell>
    <mxCell id="9" value="" style="points=[[0.5,0]];perimeter=mxPerimeter.RectanglePerimeter;fillColor=none;strokeColor=#000000;dashed=1;" vertex="1" parent="1">
      <mxGeometry x="597" y="60" width="10" height="420" as="geometry"/>
    </mxCell>

    <mxCell id="10" value="SessionManager" style="text;html=1;align=center;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="730" y="30" width="130" height="30" as="geometry"/>
    </mxCell>
    <mxCell id="11" value="" style="points=[[0.5,0]];perimeter=mxPerimeter.RectanglePerimeter;fillColor=none;strokeColor=#000000;dashed=1;" vertex="1" parent="1">
      <mxGeometry x="792" y="60" width="10" height="420" as="geometry"/>
    </mxCell>

    <mxCell id="20" value="ingresar usuario y password" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="3" target="5" parent="1">
      <mxGeometry y="100" relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="21" value="BTNingresar_Click()" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="5" target="7" parent="1">
      <mxGeometry y="160" relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="22" value="Login(usuario, pass)" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="7" target="7" parent="1">
      <mxGeometry y="200" relative="1" as="geometry"><Array as="points"><mxPoint x="450" y="210"/><mxPoint x="450" y="230"/></Array></mxGeometry>
    </mxCell>
    <mxCell id="23" value="Compare(pass, hashBD)" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="7" target="9" parent="1">
      <mxGeometry y="260" relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="24" value="true/false" style="edgeStyle=orthogonalEdgeStyle;dashed=1;" edge="1" source="9" target="7" parent="1">
      <mxGeometry y="300" relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="25" value="Login(usuario)" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="7" target="11" parent="1">
      <mxGeometry y="340" relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="26" value="OK" style="edgeStyle=orthogonalEdgeStyle;dashed=1;" edge="1" source="11" target="7" parent="1">
      <mxGeometry y="380" relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="27" value="abrir Form2" style="edgeStyle=orthogonalEdgeStyle;dashed=1;" edge="1" source="7" target="5" parent="1">
      <mxGeometry y="420" relative="1" as="geometry"/>
    </mxCell>
  </root>
</mxGraphModel>
```

---

## T02.4 — DS Alta de Usuario (Diagrama de Secuencia)

```xml
<mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1654" pageHeight="1169" math="0" shadow="0">
  <root>
    <mxCell id="0"/>
    <mxCell id="1" parent="0"/>

    <mxCell id="2" value="Administrador" style="shape=mxgraph.uml.actor2;html=1;" vertex="1" parent="1">
      <mxGeometry x="40" y="20" width="40" height="60" as="geometry"/>
    </mxCell>
    <mxCell id="3" value="" style="fillColor=none;strokeColor=#000000;dashed=1;" vertex="1" parent="1">
      <mxGeometry x="55" y="80" width="10" height="520" as="geometry"/>
    </mxCell>

    <mxCell id="4" value="FormGestionUsuarios" style="text;html=1;align=center;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="150" y="30" width="160" height="30" as="geometry"/>
    </mxCell>
    <mxCell id="5" value="" style="fillColor=none;strokeColor=#000000;dashed=1;" vertex="1" parent="1">
      <mxGeometry x="225" y="60" width="10" height="540" as="geometry"/>
    </mxCell>

    <mxCell id="6" value="FormUsuarioABM" style="text;html=1;align=center;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="390" y="30" width="140" height="30" as="geometry"/>
    </mxCell>
    <mxCell id="7" value="" style="fillColor=none;strokeColor=#000000;dashed=1;" vertex="1" parent="1">
      <mxGeometry x="457" y="60" width="10" height="540" as="geometry"/>
    </mxCell>

    <mxCell id="8" value="UsuarioBLL" style="text;html=1;align=center;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="580" y="30" width="100" height="30" as="geometry"/>
    </mxCell>
    <mxCell id="9" value="" style="fillColor=none;strokeColor=#000000;dashed=1;" vertex="1" parent="1">
      <mxGeometry x="625" y="60" width="10" height="540" as="geometry"/>
    </mxCell>

    <mxCell id="10" value="GestorDeAuditoria" style="text;html=1;align=center;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="730" y="30" width="140" height="30" as="geometry"/>
    </mxCell>
    <mxCell id="11" value="" style="fillColor=none;strokeColor=#000000;dashed=1;" vertex="1" parent="1">
      <mxGeometry x="797" y="60" width="10" height="540" as="geometry"/>
    </mxCell>

    <mxCell id="20" value="BTNcrearUsu_Click()" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="3" target="5" parent="1">
      <mxGeometry y="90" relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="21" value="llamarAMB(Alta)" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="5" target="7" parent="1">
      <mxGeometry y="130" relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="22" value="ingresar datos + BTNconfirmar" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="3" target="7" parent="1">
      <mxGeometry y="190" relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="23" value="Guardar(usuario Id=0)" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="7" target="9" parent="1">
      <mxGeometry y="240" relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="24" value="[paso 1] INSERT → Id asignado" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="9" target="9" parent="1">
      <mxGeometry y="280" relative="1" as="geometry"><Array as="points"><mxPoint x="660" y="290"/><mxPoint x="660" y="310"/></Array></mxGeometry>
    </mxCell>
    <mxCell id="25" value="CalcularDVH(usuario con Id real)" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="9" target="9" parent="1">
      <mxGeometry y="320" relative="1" as="geometry"><Array as="points"><mxPoint x="660" y="330"/><mxPoint x="660" y="350"/></Array></mxGeometry>
    </mxCell>
    <mxCell id="26" value="[paso 2] UPDATE con DVH correcto" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="9" target="9" parent="1">
      <mxGeometry y="360" relative="1" as="geometry"><Array as="points"><mxPoint x="660" y="370"/><mxPoint x="660" y="390"/></Array></mxGeometry>
    </mxCell>
    <mxCell id="27" value="RegistrarAlta(usuario)" style="edgeStyle=orthogonalEdgeStyle;" edge="1" source="9" target="11" parent="1">
      <mxGeometry y="410" relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="28" value="cerrar FormUsuarioABM + Actualizar()" style="edgeStyle=orthogonalEdgeStyle;dashed=1;" edge="1" source="9" target="5" parent="1">
      <mxGeometry y="460" relative="1" as="geometry"/>
    </mxCell>
  </root>
</mxGraphModel>
```

---

## T04.1 — DC Composite (Diagrama de Clases)

```xml
<mxGraphModel dx="1200" dy="800" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
  <root>
    <mxCell id="0"/>
    <mxCell id="1" parent="0"/>

    <!-- ComponentePermiso (abstract) -->
    <mxCell id="2" value="&lt;&lt;abstract&gt;&gt;&#xa;ComponentePermiso" style="swimlane;fontStyle=3;startSize=45;fillColor=#dae8fc;strokeColor=#6c8ebf;" vertex="1" parent="1">
      <mxGeometry x="280" y="40" width="240" height="120" as="geometry"/>
    </mxCell>
    <mxCell id="2b" value="+ Id: int&#xa;+ Nombre: string&#xa;+ NombreInterno: string&#xa;+ Hijos: List (abstract)&#xa;+ AgregarHijo() (abstract)&#xa;+ QuitarHijo() (abstract)" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="2">
      <mxGeometry y="45" width="240" height="75" as="geometry"/>
    </mxCell>

    <!-- PermisoSimple -->
    <mxCell id="3" value="PermisoSimple&#xa;&lt;&lt;Hoja / Leaf&gt;&gt;" style="swimlane;startSize=40;fillColor=#d5e8d4;strokeColor=#82b366;" vertex="1" parent="1">
      <mxGeometry x="60" y="270" width="200" height="90" as="geometry"/>
    </mxCell>
    <mxCell id="3b" value="+ Hijos: List (vacia)&#xa;+ AgregarHijo(): lanza excepcion&#xa;+ QuitarHijo(): lanza excepcion" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="3">
      <mxGeometry y="40" width="200" height="50" as="geometry"/>
    </mxCell>

    <!-- Rol -->
    <mxCell id="4" value="Rol&#xa;&lt;&lt;Contenedor / Composite&gt;&gt;" style="swimlane;startSize=40;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
      <mxGeometry x="540" y="270" width="220" height="90" as="geometry"/>
    </mxCell>
    <mxCell id="4b" value="- hijos: List&lt;ComponentePermiso&gt;&#xa;+ AgregarHijo(ComponentePermiso)&#xa;+ QuitarHijo(ComponentePermiso)" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="4">
      <mxGeometry y="40" width="220" height="50" as="geometry"/>
    </mxCell>

    <!-- Usuario -->
    <mxCell id="5" value="Usuario" style="swimlane;startSize=30;fillColor=#f8cecc;strokeColor=#b85450;" vertex="1" parent="1">
      <mxGeometry x="540" y="470" width="220" height="80" as="geometry"/>
    </mxCell>
    <mxCell id="5b" value="+ Permisos: List&lt;ComponentePermiso&gt;&#xa;+ TienePermiso(string): bool" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="5">
      <mxGeometry y="30" width="220" height="50" as="geometry"/>
    </mxCell>

    <!-- PermisoBLL -->
    <mxCell id="6" value="PermisoBLL" style="swimlane;startSize=30;" vertex="1" parent="1">
      <mxGeometry x="60" y="470" width="200" height="90" as="geometry"/>
    </mxCell>
    <mxCell id="6b" value="+ GuardarComponente()&#xa;+ AgregarComponenteARol()&#xa;+ QuitarComponenteDeRol()&#xa;+ ReferenciaCircular(): bool" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="6">
      <mxGeometry y="30" width="200" height="60" as="geometry"/>
    </mxCell>

    <!-- Herencia PermisoSimple -> ComponentePermiso -->
    <mxCell id="10" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;endFill=0;endSize=12;" edge="1" source="3" target="2" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>

    <!-- Herencia Rol -> ComponentePermiso -->
    <mxCell id="11" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;endFill=0;endSize=12;" edge="1" source="4" target="2" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>

    <!-- Agregacion Rol -> ComponentePermiso (contiene hijos) -->
    <mxCell id="12" value="0..*  hijos" style="edgeStyle=orthogonalEdgeStyle;startArrow=ERmany;startFill=0;endArrow=open;endFill=0;dashed=1;" edge="1" source="4" target="2" parent="1">
      <mxGeometry relative="1" as="geometry"><Array as="points"><mxPoint x="700" y="220"/><mxPoint x="400" y="220"/></Array></mxGeometry>
    </mxCell>

    <!-- Usuario usa ComponentePermiso -->
    <mxCell id="13" value="Permisos  0..*" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;dashed=1;" edge="1" source="5" target="2" parent="1">
      <mxGeometry relative="1" as="geometry"><Array as="points"><mxPoint x="400" y="510"/></Array></mxGeometry>
    </mxCell>

    <!-- PermisoBLL usa ComponentePermiso -->
    <mxCell id="14" value="usa" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;dashed=1;" edge="1" source="6" target="3" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
  </root>
</mxGraphModel>
```

---

## T05.1 — DC Observer (Diagrama de Clases)

```xml
<mxGraphModel dx="1200" dy="800" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
  <root>
    <mxCell id="0"/>
    <mxCell id="1" parent="0"/>

    <!-- IObservadorDeIdioma (interface) -->
    <mxCell id="2" value="&lt;&lt;interface&gt;&gt;&#xa;IObservadorDeIdioma" style="swimlane;fontStyle=3;startSize=40;fillColor=#dae8fc;strokeColor=#6c8ebf;" vertex="1" parent="1">
      <mxGeometry x="380" y="40" width="230" height="70" as="geometry"/>
    </mxCell>
    <mxCell id="2b" value="+ ActualizarIdioma(Dictionary): void" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="2">
      <mxGeometry y="40" width="230" height="30" as="geometry"/>
    </mxCell>

    <!-- GestorDeIdioma (Subject + Singleton) -->
    <mxCell id="3" value="GestorDeIdioma&#xa;&lt;&lt;Subject / Singleton&gt;&gt;" style="swimlane;startSize=45;fillColor=#d5e8d4;strokeColor=#82b366;" vertex="1" parent="1">
      <mxGeometry x="360" y="240" width="270" height="150" as="geometry"/>
    </mxCell>
    <mxCell id="3b" value="- instancia: GestorDeIdioma&#xa;- observadores: List&lt;IObservadorDeIdioma&gt;&#xa;- idiomaActual: string&#xa;- textosActuales: Dictionary&#xa;+ TraerInstancia(): GestorDeIdioma&#xa;+ Suscribir(IObservadorDeIdioma)&#xa;+ Desuscribir(IObservadorDeIdioma)&#xa;+ CambiarIdioma(string)&#xa;- Notificar()" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="3">
      <mxGeometry y="45" width="270" height="105" as="geometry"/>
    </mxCell>

    <!-- Form1 -->
    <mxCell id="4" value="Form1&#xa;&lt;&lt;Observer&gt;&gt;" style="swimlane;startSize=35;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
      <mxGeometry x="30" y="480" width="150" height="60" as="geometry"/>
    </mxCell>
    <mxCell id="4b" value="+ ActualizarIdioma()" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="4">
      <mxGeometry y="35" width="150" height="25" as="geometry"/>
    </mxCell>

    <!-- Form2 -->
    <mxCell id="5" value="Form2&#xa;&lt;&lt;Observer&gt;&gt;" style="swimlane;startSize=35;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
      <mxGeometry x="210" y="480" width="150" height="60" as="geometry"/>
    </mxCell>
    <mxCell id="5b" value="+ ActualizarIdioma()" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="5">
      <mxGeometry y="35" width="150" height="25" as="geometry"/>
    </mxCell>

    <!-- FormGestionUsuarios -->
    <mxCell id="6" value="FormGestionUsuarios&#xa;&lt;&lt;Observer&gt;&gt;" style="swimlane;startSize=35;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
      <mxGeometry x="390" y="480" width="170" height="60" as="geometry"/>
    </mxCell>
    <mxCell id="6b" value="+ ActualizarIdioma()" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="6">
      <mxGeometry y="35" width="170" height="25" as="geometry"/>
    </mxCell>

    <!-- FormIdioma -->
    <mxCell id="7" value="FormIdioma&#xa;&lt;&lt;Observer&gt;&gt;" style="swimlane;startSize=35;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
      <mxGeometry x="590" y="480" width="150" height="60" as="geometry"/>
    </mxCell>
    <mxCell id="7b" value="+ ActualizarIdioma()" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="7">
      <mxGeometry y="35" width="150" height="25" as="geometry"/>
    </mxCell>

    <!-- IdiomaDAL -->
    <mxCell id="8" value="IdiomaDAL" style="swimlane;startSize=30;" vertex="1" parent="1">
      <mxGeometry x="780" y="240" width="200" height="100" as="geometry"/>
    </mxCell>
    <mxCell id="8b" value="+ ObtenerIdiomas(): List&#xa;+ ObtenerDiccionario(string): Dict&#xa;+ ObtenerTodasLasEtiquetas()&#xa;+ AgregarIdioma(string)&#xa;+ ActualizarTraduccion()" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="8">
      <mxGeometry y="30" width="200" height="70" as="geometry"/>
    </mxCell>

    <!-- GestorDeIdioma implementa IObservadorDeIdioma (no, es subject) -->
    <!-- GestorDeIdioma notifica IObservadorDeIdioma -->
    <mxCell id="10" value="notifica  1..*" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="3" target="2" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>

    <!-- Forms implementan IObservadorDeIdioma -->
    <mxCell id="11" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;endFill=0;endSize=12;dashed=1;" edge="1" source="4" target="2" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="12" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;endFill=0;endSize=12;dashed=1;" edge="1" source="5" target="2" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="13" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;endFill=0;endSize=12;dashed=1;" edge="1" source="6" target="2" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="14" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;endFill=0;endSize=12;dashed=1;" edge="1" source="7" target="2" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>

    <!-- GestorDeIdioma usa IdiomaDAL -->
    <mxCell id="15" value="usa" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;dashed=1;" edge="1" source="3" target="8" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
  </root>
</mxGraphModel>
```

---

## T06b.1 — DC Control de Cambios (Diagrama de Clases)

```xml
<mxGraphModel dx="1200" dy="800" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
  <root>
    <mxCell id="0"/>
    <mxCell id="1" parent="0"/>

    <!-- RegistroCambio -->
    <mxCell id="2" value="RegistroCambio" style="swimlane;startSize=30;fillColor=#f8cecc;strokeColor=#b85450;" vertex="1" parent="1">
      <mxGeometry x="40" y="40" width="200" height="130" as="geometry"/>
    </mxCell>
    <mxCell id="2b" value="+ Id: int&#xa;+ EntidadNombre: string&#xa;+ EntidadId: int&#xa;+ NombreCampo: string&#xa;+ ValorAnterior: string&#xa;+ ValorNuevo: string&#xa;+ Operador: string&#xa;+ FechaHora: DateTime" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="2">
      <mxGeometry y="30" width="200" height="100" as="geometry"/>
    </mxCell>

    <!-- GestorDeAuditoria -->
    <mxCell id="3" value="GestorDeAuditoria" style="swimlane;startSize=30;fillColor=#d5e8d4;strokeColor=#82b366;" vertex="1" parent="1">
      <mxGeometry x="300" y="40" width="210" height="120" as="geometry"/>
    </mxCell>
    <mxCell id="3b" value="+ RegistrarAlta(Usuario)&#xa;+ RegistrarCambios(antes, despues)&#xa;+ RegistrarBaja(Usuario)&#xa;+ ObtenerHistorial(int): List" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="3">
      <mxGeometry y="30" width="210" height="90" as="geometry"/>
    </mxCell>

    <!-- HistorialCambiosDAL -->
    <mxCell id="4" value="HistorialCambiosDAL" style="swimlane;startSize=30;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
      <mxGeometry x="300" y="240" width="210" height="80" as="geometry"/>
    </mxCell>
    <mxCell id="4b" value="+ GuardarCambios(List&lt;RegistroCambio&gt;)&#xa;+ ObtenerHistorialDeUsuario(int)" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="4">
      <mxGeometry y="30" width="210" height="50" as="geometry"/>
    </mxCell>

    <!-- FormHistorialUsuario -->
    <mxCell id="5" value="FormHistorialUsuario" style="swimlane;startSize=30;fillColor=#dae8fc;strokeColor=#6c8ebf;" vertex="1" parent="1">
      <mxGeometry x="580" y="40" width="200" height="100" as="geometry"/>
    </mxCell>
    <mxCell id="5b" value="- usuarioId: int&#xa;- auditor: GestorDeAuditoria&#xa;+ CargarHistorial()&#xa;+ BTNrevertir_Click()" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="5">
      <mxGeometry y="30" width="200" height="70" as="geometry"/>
    </mxCell>

    <!-- Usuario (referencia) -->
    <mxCell id="6" value="Usuario" style="swimlane;startSize=30;" vertex="1" parent="1">
      <mxGeometry x="580" y="240" width="200" height="60" as="geometry"/>
    </mxCell>
    <mxCell id="6b" value="+ NombreUsuario, Activo, NivelPermisos" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="6">
      <mxGeometry y="30" width="200" height="30" as="geometry"/>
    </mxCell>

    <!-- GestorDeAuditoria genera RegistroCambio -->
    <mxCell id="10" value="genera  0..*" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="3" target="2" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>

    <!-- GestorDeAuditoria usa HistorialCambiosDAL -->
    <mxCell id="11" value="usa" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;dashed=1;" edge="1" source="3" target="4" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>

    <!-- HistorialCambiosDAL persiste RegistroCambio -->
    <mxCell id="12" value="persiste" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;dashed=1;" edge="1" source="4" target="2" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>

    <!-- FormHistorialUsuario usa GestorDeAuditoria -->
    <mxCell id="13" value="usa" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;dashed=1;" edge="1" source="5" target="3" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>

    <!-- FormHistorialUsuario revierte en Usuario -->
    <mxCell id="14" value="revierte campo" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;dashed=1;" edge="1" source="5" target="6" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
  </root>
</mxGraphModel>
```

---

## T02.3 — DC Login / Sesion (Diagrama de Clases)

```xml
<mxGraphModel dx="1200" dy="800" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
  <root>
    <mxCell id="0"/>
    <mxCell id="1" parent="0"/>

    <!-- Form1 -->
    <mxCell id="2" value="Form1" style="swimlane;startSize=30;fillColor=#dae8fc;strokeColor=#6c8ebf;" vertex="1" parent="1">
      <mxGeometry x="40" y="40" width="160" height="80" as="geometry"/>
    </mxCell>
    <mxCell id="2b" value="- intentosFallidos: int&#xa;+ BTNingresar_Click()&#xa;+ CHKcontra_CheckedChanged()" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="2">
      <mxGeometry y="30" width="160" height="50" as="geometry"/>
    </mxCell>

    <!-- UsuarioBLL -->
    <mxCell id="3" value="UsuarioBLL" style="swimlane;startSize=30;fillColor=#d5e8d4;strokeColor=#82b366;" vertex="1" parent="1">
      <mxGeometry x="260" y="40" width="180" height="80" as="geometry"/>
    </mxCell>
    <mxCell id="3b" value="+ Login(usuario, pass): bool&#xa;+ Guardar(usuario)&#xa;+ ObtenerPorId(int)&#xa;+ Listar(): List" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="3">
      <mxGeometry y="30" width="180" height="50" as="geometry"/>
    </mxCell>

    <!-- CryptoManager -->
    <mxCell id="4" value="CryptoManager" style="swimlane;startSize=30;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
      <mxGeometry x="500" y="40" width="170" height="70" as="geometry"/>
    </mxCell>
    <mxCell id="4b" value="+ Hash(string): string&#xa;+ Compare(string, string): bool" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="4">
      <mxGeometry y="30" width="170" height="40" as="geometry"/>
    </mxCell>

    <!-- SessionManager (Singleton) -->
    <mxCell id="5" value="SessionManager  &lt;&lt;Singleton&gt;&gt;" style="swimlane;startSize=30;fillColor=#f8cecc;strokeColor=#b85450;" vertex="1" parent="1">
      <mxGeometry x="260" y="220" width="200" height="90" as="geometry"/>
    </mxCell>
    <mxCell id="5b" value="- instancia: SessionManager&#xa;+ usuarioINS: Usuario&#xa;+ TraerInstancia(): SessionManager&#xa;+ Login(Usuario)&#xa;+ Logout()" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="5">
      <mxGeometry y="30" width="200" height="60" as="geometry"/>
    </mxCell>

    <!-- Usuario -->
    <mxCell id="6" value="Usuario" style="swimlane;startSize=30;" vertex="1" parent="1">
      <mxGeometry x="500" y="220" width="180" height="70" as="geometry"/>
    </mxCell>
    <mxCell id="6b" value="+ Id, NombreUsuario&#xa;+ Contraseña (hash)&#xa;+ Activo, BloqueoDV, DVH" style="text;align=left;verticalAlign=top;spacingLeft=4;" vertex="1" parent="6">
      <mxGeometry y="30" width="180" height="40" as="geometry"/>
    </mxCell>

    <mxCell id="10" value="usa" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;dashed=1;" edge="1" source="2" target="3" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="11" value="usa" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;dashed=1;" edge="1" source="3" target="4" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="12" value="usa" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;dashed=1;" edge="1" source="3" target="5" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
    <mxCell id="13" value="contiene" style="edgeStyle=orthogonalEdgeStyle;endArrow=open;endFill=0;" edge="1" source="5" target="6" parent="1">
      <mxGeometry relative="1" as="geometry"/>
    </mxCell>
  </root>
</mxGraphModel>
```
