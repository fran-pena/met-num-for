# Example with redirected input

Please, be aware that:

- File .f90 asks for data in the standard input, but it will be redirected. Thus, it is  recommended to write the input for verification purposes:
  ```fortran
  print*, 'Enter an integer:'
  read*, n
  print*, n
  ```

- Rule _debug_ in _launch.json_:
  - Redirect the standard input: `"args": ["<", "data.txt"]`.