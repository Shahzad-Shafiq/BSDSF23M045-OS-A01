### Feature 2 
### Q1. Linking rule in Makefile  
`$(TARGET): $(OBJECTS)` means the executable is built from the object files. It links `.o` files directly.  
When linking against a library, we don’t list all `.o` files — instead we use `-L` and `-l` flags to link a pre-built library.  

---

### Q2. Git tag  
A git tag marks a specific commit, usually for versions.  
- **Simple tag**: just a pointer to a commit.  
- **Annotated tag**: has message, author, and date.  
Annotated tags are better for versioning.  

---

### Q3. GitHub Release  
A release is a version of the project tied to a tag. It makes sharing stable versions easy.  
Adding binaries (like the client program) lets others use the software without compiling.  

### Feature 3

**Q1. Compare the Makefile from Part 2 and Part 3**  
In Part 2, the Makefile linked all the `.o` files directly into the executable.  
In Part 3, I added rules and variables to first build a static library (`libmyutils.a`) and then link only `main.o` against it.  
The key difference is the extra step of creating and using the library.

---

**Q2. Purpose of `ar` and `ranlib`**  
`ar` is used to bundle multiple object files into one static library (`.a`).  
`ranlib` creates an index inside that library so the linker can quickly find the functions.  
On Linux, `ar rcs` usually handles both steps in one go.

---

**Q3. Using `nm` on client_static**  
When I run `nm` on `client_static`, functions like `mystrlen` do not show as external symbols, because their code is already copied inside the executable.  
This shows that static linking makes the program self-contained — all needed code is included at compile time.

###– Feature 4

**Q1. What is -fPIC and why is it required?**  
`-fPIC` makes position-independent code, which means the code can run from any memory address.  
This is required for shared libraries because the operating system may load them at different places in memory for different programs.

---

**Q2. Why is there a file size difference between static and dynamic clients?**  
The static client is larger because the library code is copied inside the executable.  
The dynamic client is smaller because it only stores references, and the code is loaded from the `.so` at runtime.

---

**Q3. What is LD_LIBRARY_PATH and why did we set it?**  
`LD_LIBRARY_PATH` tells the system where to look for shared libraries at runtime.  
We had to set it so the loader could find our custom `libmyutils.so` in the `lib/` folder.  
This shows the dynamic loader’s job is to locate and load shared libraries when a program starts.
