# VS Code con GFortran en Windows

## Exemplo 3: entrada redirixida

### Fontes

O ficheiro [*hello_read.f90*](./hello_read.f90) solicita datos pola entrada estándar:

```fortran
program hello_read
  implicit none
  integer :: i, n

  print*, 'Enter an integer:'
  read*, n
  do i = 1, n
      print*, 'Hello', i
  end do
end program  
```

Observa que, como vamos a redixir a entrada, imprimimos o valor de `n` a efectos de comprobación.

### Compilación

En [*.vscode/tasks.json*](./.vscode/tasks.json) se define a regra _compile_ no grupo _build_, que compila con argumentos:

```json
"args": ["-Wall", "-g", "-o", "a.exe", "hello_read.f90"]
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
Indicamos que a entrada do executable se redirixe ao ficheiro *data.txt*:
```json
"args": ["<", "data.txt"]
```
Para saber como depurar ou executar con esta regra, consulta o [README](../README.md#Depuración-e-execución) da carpeta de exemplos.