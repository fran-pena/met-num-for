# Example with image output

Please, be aware that:

- File .f90 asks for an image filename via command line argument.
- A Matlab file _output_graph.m_ is created.
- Finalyy Matlab must be called to use _output_graph.m_ to create the image filename.
- To get all the proccess done, rule _run matlab_ in _tasks.json_ mest be executed:
  - Go to menu _Terminal - Run Task..._ (or press Ctrl + Shift + P, write _Tasks: Run Task_) and choose _run matlab_.

- Rule _run_ in _tasks.json_:
  - Redirects the standard input: `"args": ["graph.png"]`;
  - belongs to group _test_: `"group": "test"`.

- Rule _run matlab_ in _tasks.json_:
  - before anything else, calls the rule _run_: `"dependsOn": ["run"]`;
  - calls Matlab: `"command": "matlab"`; 
  - with arguments `"args": ["-batch", "output_graph"]`;
  - belongs to group _test_: `"kind": "test"`;
  - it is the default rule in that group: `"isDefault": true`.
