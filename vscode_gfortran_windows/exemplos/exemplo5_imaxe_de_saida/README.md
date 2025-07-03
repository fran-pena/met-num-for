# VS Code con GFortran en Windows

## Exemplo 5: imaxe de saída

### Fontes

O ficheiro [*hello_graph.f90*](./hello_graph.f90) solicita o nome da imaxe de saída como argumento de liña de comando. Ademais, crea o ficheiro auxiliar *output_graph.m*:

```fortran
program hello_graph
  implicit none
  integer :: iu
  character(255) :: file ! maximum path length in Windows API

  call get_command_argument(1, file)
  open(newunit=iu, file = 'output_graph.m', position='rewind')
  write(iu,*) 'h = figure(''visible'',''off'');'

  write(iu,*) 'x = [', [1, 4, 9, 16, 25], '];'
  write(iu,*) 'y = [', [1, 2, 3,  4,  5], '];'
  write(iu,*) 'plot(x,y)'
  write(iu,*) 'saveas(h,''', trim(file), ''')'
  close(iu)
end program  
```

### Compilación

En [*.vscode/tasks.json*](./.vscode/tasks.json) se define a regra _compile_ no grupo _build_, que compila con argumentos:

```json
"args":   ["-Wall", "-g", "-o", "a.exe", "hello_graph.f90"],
```

Para saber como construir o executable con esta regra, consulta o [README](../README.md#Compilación) da carpeta de exemplos.

### Execución

En [*.vscode/tasks.json*](./.vscode/tasks.json) se definen dúas regras no grupo _test_:

1. A regra _run_ lanza o executable compilado do Fortran con argumento o ficheiro de imaxe de saída:

```json
"command": "${workspaceFolder}/a.exe",
"args":   ["graph.png"],      
```

2. A regra _run graph_ lanza o Matlab para que, a partir de ficheiro auxiliar *output_graph.m*, xera a imaxe de saída:

```json
"command":    "matlab",
"args":      ["-batch", "output_graph"],
```

En caso de dispoñer dunha instalación de GNU Octave, as liñas anteriores poden cambiarse por:

```json
"command": "octave",
"args":   ["-q", "--eval", "output_graph"]
```

Esta segunda regra executará antes a primeira:

```json
"dependsOn": ["run"],
```

Declárase como a regra por defecto do grupo _test_:

```json
"group": {
    "kind": "test", 
    "isDefault": true
}
```

**Só é necesario executar a segunda regra _run graph_ para obter a imaxe de saída.**

Para saber como executar con estas regras, consulta o [README](../README.md#Depuración-e-execución) da carpeta de exemplos.

Para saber como instalar GNU Octave, consulta as [instruccións de instalación](../../instalacion.md#Instalación-de-GNU-Octave).

### Depuración

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
"args": ["graph.png"],     
```

__A depuración só se aplica ao código *hello_graph.f90*.__

Para saber como depurar ou executar con esta regra, consulta o [README](../README.md#Depuración-e-execución) da carpeta de exemplos.
