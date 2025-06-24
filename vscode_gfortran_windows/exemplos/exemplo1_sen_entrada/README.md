# Docencia de métodos numéricos con Fortran

## VS Code con GFortran en Windows

### Instalación

### Exemplos

#### Exemplo 1: sen entrada

##### Fontes

O ficheiro *hello_no_input.f90* non presenta entrada de datos:

```fortran
program hello_no_input
  implicit none
  integer :: i

  do i = 1, 2
      print*, 'Hello', i
  end do
end program  
```

##### Compilación

En *.vscode/tasks.json* se define a regra _compile_ no grupo _build_, que compila con argumentos:

```json
"args": ["-Wall", "-g", "-o", "a.exe", "hello_no_input.f90"]
```

Para saber como construir o executable con esta regra, consulta o [README](../README.md) da carpeta de exemplos.

##### Execución

En *.vscode/launch.json* se define a regra _debug_ para depuración e execución. Primeiro declara _compile_ como requisito:
```json
"preLaunchTask": "compile"
```
Logo chama ao executable:
```json
"program": "${workspaceFolder}/a.exe"
```

Para saber como depurar ou executar con esta regra, consulta o [README](../README.md) da carpeta de exemplos.