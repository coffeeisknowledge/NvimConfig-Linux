**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# For nvim-jdlts

And after a bit of trial and error (handling the pom.xml file, clearing the cache in .cache/jdtls I managed to solve the problem by deleting, at the project root, the .classpath .project and .settings/ files

by doing so, reopening the project again, jdtls recreated the files and now everything works correctly

# For Json files

Select and format json objects

:%!jq .

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
