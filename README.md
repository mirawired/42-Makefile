
# 42 School Makefile

Simple Makefile template for 42 school projects (C language)

## Features
- Libft and Minilibx ready
- Compiles *.o in a separate folder created at compilation time
- Check for *.h update when make command is called

## Folder
*.h must be in the inc/ directory, then specify path in *.c files
```c
#include "./../inc/main.h"
```
Your folder should be ordered this way
```bash
program_name/
├─ inc/
├─ src/
├─ libft/
├─ minilibx-linux/
├─ Makefile
```

## Tips
Makefile seems shady at first glance but reading (at least the first part) of the [official GNU make man](https://www.gnu.org/software/make/manual/make.html#Introduction)  should enlight its obscurantism

Then, don't hesitate to test and look at other coders Makefile's to grasp the subtleties

Good luck and don't panic (really !)
