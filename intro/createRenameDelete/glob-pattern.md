


A glob pattern is a string that uses special wildcard characters to match file and directory names in Unix-like operating systems. Globbing is the process of expanding these wildcard patterns into a list of matching files and directories.

### Common Wildcard Characters in Glob Patterns

1. **`*` (Asterisk)**: Matches any number of characters (including zero characters).
   - Example: `*.txt` matches all files ending with `.txt` (`file.txt`, `document.txt`, etc.).

2. **`?` (Question Mark)**: Matches exactly one character.
   - Example: `file?.txt` matches `file1.txt`, `file2.txt`, but not `file10.txt`.

3. **`[]` (Square Brackets)**: Matches any one of the enclosed characters.
   - Example: `file[12].txt` matches `file1.txt` and `file2.txt`, but not `file3.txt`.

4. **`{}` (Curly Braces)**: Matches any of the patterns separated by commas within the braces.
   - Example: `{file1,file2}.txt` matches `file1.txt` and `file2.txt`.

5. **`[^]` (Caret inside Square Brackets)**: Matches any one character not enclosed in the brackets.
   - Example: `file[^12].txt` matches `file3.txt` but not `file1.txt` or `file2.txt`.

6. **`**` (Double Asterisk)**: Matches directories recursively (used in some shells like `bash` with `shopt -s globstar` enabled).
   - Example: `**/*.txt` matches all `.txt` files in the current directory and all subdirectories.

### Examples

#### List All `.txt` Files

```bash
ls *.txt
```

Matches `file.txt`, `document.txt`, etc., in the current directory.

#### List All Files Starting with `file` and Ending with Any Character Followed by `.txt`

```bash
ls file?.txt
```

Matches `file1.txt`, `fileA.txt`, but not `file10.txt`.

#### List All Files Named `file1.txt` or `file2.txt`

```bash
ls {file1,file2}.txt
```

Matches `file1.txt` and `file2.txt`.

#### List All `.txt` Files Except Those Containing `1` or `2` in the Name

```bash
ls file[^12].txt
```

Matches `file3.txt` but not `file1.txt` or `file2.txt`.

#### Recursively List All `.txt` Files in Current Directory and Subdirectories

```bash
shopt -s globstar  # Enable globstar option in bash
ls **/*.txt
```

Matches `file.txt` in any directory and subdirectory.

### Using Glob Patterns Safely

When using glob patterns, especially when filenames may start with a dash (`-`), we can ensure safe handling by using techniques like prefixing with `./` or using `--`:

#### Using `./*glob*`

```bash
ls ./*.txt
```

Ensures that filenames are not interpreted as options.

#### Using `-- *glob*`

```bash
ls -- *.txt
```

Indicates the end of options, so the filenames are not treated as options.




## Explain this statement: `Use ./*glob* or -- *glob* so names with dashes won't become options.`

When working with glob patterns, filenames that start with a dash (`-`) can be misinterpreted as options by commands like `ls`, `rm`, `mv`, etc. Using `./*glob*` or `-- *glob*` ensures that these filenames are treated correctly as arguments rather than options.

### Example with `./*glob*`

Let's assume we have a directory containing the following files:

```
-foo.txt
bar.txt
baz.txt
```

If we want to list all `.txt` files including those starting with a dash, we can use:

```bash
ls ./*.txt
```

This command ensures that filenames like `-foo.txt` are treated as filenames and not as options.

**Output:**
```
./-foo.txt
./bar.txt
./baz.txt
```

### Example with `-- *glob*`

Alternatively, we can use `--` to indicate the end of options:

```bash
ls -- *.txt
```

This command also ensures that filenames like `-foo.txt` are treated as filenames.

**Output:**
```
-foo.txt
bar.txt
baz.txt
```

### Applying the Concept in a Script

Suppose we have a script to rename `.txt` files by appending the current date to the filenames:

```bash
#!/bin/bash

DATE=$(date +%F)
for FILE in ./../assets/images/*.jpg; do
    # Extract the filename without the path
    BASENAME=$(basename "$FILE")
    echo "Renaming ${FILE} to ${DATE}-${BASENAME}"
    mv "$FILE" "../assets/images/${DATE}-${BASENAME}"
done
```

In this script:
- Using `./../assets/images/*.jpg` ensures that files with leading dashes are correctly processed.
- `basename` is used to extract the filename from the full path, so the new name does not include the directory path.

### Practical Examples

1. **Listing Files with Leading Dashes:**

```bash
ls -- *.txt
```

2. **Removing Files with Leading Dashes:**

```bash
rm -- *.txt
```

3. **Moving Files with Leading Dashes:**

```bash
mv -- -foo.txt newname.txt
```

4. **Copying Files with Leading Dashes:**

```bash
cp -- -foo.txt copyoffoo.txt
```

### Summary

Using `./*glob*` or `-- *glob*` ensures that filenames starting with dashes are treated correctly, preventing them from being interpreted as command options. This is particularly important for ensuring the safety and correctness of file operations in scripts and command-line usage.