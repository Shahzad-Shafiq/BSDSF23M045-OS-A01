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
