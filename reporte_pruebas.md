# Reporte de pruebas automatizadas - Lab 7

| Tipo | Comando | Resultado esperado | Resultado obtenido | Estado |
|---|---|---|---|---|
| Sintaxis | terraform validate | Configuration is valid | Configuration is valid | OK |
| Formato | terraform fmt -check | Sin salida, código 0 | Sin salida, código 0 | OK |
| Idempotencia | terraform plan (x2) | No changes en la 2.ª ejecución | No changes | OK |
| Funcional | ./pruebas.sh | 2 PASS | 2 PASS | OK |
| Funcional (negativa) | docker stop + ./pruebas.sh | FAIL al detener el contenedor | FAIL, código 1 | OK |

## Hallazgos y correcciones

- El archivo .terraform.lock.hcl quedó sin versionar y causó un conflicto en git pull; se eliminó, se regeneró con terraform init y se agregó al repositorio.
- El cambio de puerto (8082 a 8083) no se aplicó al inicio porque el pull request no estaba fusionado (Merged); se corrigió fusionándolo y actualizando main.
- La llave SSH no estaba registrada en GitHub; se agregó en Settings y se corrigió el acceso.
