# PPLAF-animation-generator
PPLAF-animation-generator is used to create animations, that consist of multiple files in the way, PPLAF `animation` lib can use them.

# Getting started
1. Download [archive](https://github.com/glebi574/PPLAF-animation-generator/releases) and unpack it.
2. Run executable file and insert path of animation folder or drag and drop it instead.
3. Enter the path where the animation folder in your level will be located.
4. If everything is correct, output folder will be created with:
 - `_.lua`, containing all parametres and main function
 - `_type.lua`, containing information, that PPLAF `animation` lib needs
 - frames, that will be generated by main function during game

# Animation template
PPLAF-animation-generator requires specific template - folder, containing:
 - `param.lua` - must have 3 parameters: `frame_amount`, `file_amount`, `frames_per_file`.
 - `origin.lia` - used to generate certain data, that can be used to generate frames(this is the only way to make meshes, that can be random at the beginning, work properly). You must return every generated table you need at the end of the file, or they won't be added in output file.
 - `main.lua` - contains function, used to generate frames. You must return function at the end of the file.
Files are loaded in order `param.lua` -> `origin.lua` -> `main.lua`. You can add variables in any file, but only `param.lua` and `main.lua` will be copied to output file.
