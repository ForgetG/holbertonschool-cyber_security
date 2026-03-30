# Hack the VM – Heap Memory Manipulation

## Objective

The goal of this task is to modify the memory of a running process by locating a specific string in its heap and replacing it with another string using Python.

## Approach

The solution relies on the Linux `/proc` filesystem to interact with the memory of a running process.

1. Identify the heap memory region  
   - Read `/proc/<pid>/maps`  
   - Extract the address range corresponding to `[heap]`

2. Access process memory  
   - Open `/proc/<pid>/mem` with read/write permissions

3. Read heap content  
   - Seek to the start of the heap  
   - Read the entire heap into memory

4. Search for the target string  
   - Convert the search string to bytes  
   - Locate it inside the heap buffer

5. Replace the string  
   - Ensure the replacement string is not longer  
   - Pad with null bytes (`\x00`) if needed  
   - Write directly at the correct memory address

## Key Constraints

- Only the heap segment must be scanned
- Strings must be ASCII
- Replacement string must be equal or shorter than the original
- Script must be executed with sufficient privileges (`sudo`)
