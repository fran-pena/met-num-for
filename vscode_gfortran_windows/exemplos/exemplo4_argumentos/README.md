# VS Code con GFortran en Windows

## Exemplo 4: argumentos

### Fontes

O ficheiro [*hello_args.f90*](./hello_args.f90) solicita datos como argumentos de liña de comando:

```fortran
program hello_args
  implicit none
  integer :: i, n
  character(255) :: arg ! maximum path length in Windows API

  call get_command_argument(1, arg)
  read(arg, *) n
  do i = 1, n
      print*, 'Hello', i
  end do
end program  
```

### Compilación

En [*.vscode/tasks.json*](./.vscode/tasks.json) se define a regra _compile_ no grupo _build_, que compila con argumentos:

```json
"args": ["-Wall", "-g", "-o", "a.exe", "hello_args.f90"]
```

Para saber como construir o executable con esta regra, consulta o [README](../README.md#Compilación) da carpeta de exemplos.

### Depuración e execución

En [*.vscode/launch.json*](./.vscode/launch.json) se define a regra _debug_ para depuración e execución. Primeiro declara _compile_ como requisito:
```json
"preLaunchTask": "compile"
```
Logo chama ao executable:
```json
"program": "${workspaceFolder}/a.exe"
```
Indicamos que a entrada do executable ten un argumento:
```json
"args": ["4"]
```
Para saber como depurar ou executar con esta regra, consulta o [README](../README.md#Depuración-e-execución) da carpeta de exemplos.