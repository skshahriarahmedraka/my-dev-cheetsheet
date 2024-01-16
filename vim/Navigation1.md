### Navigation

`h`, `j`, `k`, `l`: Move the cursor left, down, up, and right, respectively.  
`w`: Move the cursor to the beginning of the next word.  
`b`: Move the cursor to the beginning of the previous word.  
`e`: Move the cursor to the end of the current word.  
`gg`: Move the cursor to the beginning of the file.  
`G`: Move the cursor to the end of the file.  
`{number}G`: Move the cursor to the specified line number.  
`:{line number}`: Move the cursor to the specified line number.

---

### Editing

`i`: Enter insert mode at the current cursor position.  
`I`: Enter insert mode at the beginning of the current line.  
`a`: Enter insert mode after the current cursor position.  
`A`: Enter insert mode at the end of the current line.  
`o`: Insert a new line below the current line and enter insert mode.  
`O`: Insert a new line above the current line and enter insert mode.  
`r`: Replace the character under the cursor.  
`R`: Enter replace mode.  
`x`: Delete the character under the cursor.  
`X`: Delete the character before the cursor.  
`d{motion}`: Delete the text that is moved over with the specified motion (e.g., dw will delete the current word).  
`dd`: Delete the current line.  
`{Visual mode}`: Select text to operate on it (e.g., d will delete the selected text).

---

### Insert mode

`Esc`: Exit insert mode.  
`Ctrl + [`: Exit insert mode.

---

### Visual mode

`v`: Enter visual mode.  
`V`: Enter visual line mode.  
`Ctrl + v`: Enter visual block mode.  
`Esc`: Exit visual mode.

---

### Undo and redo

`u`: Undo the last change.  
`Ctrl + r`: Redo the last undone change.  
Search  
`/{pattern}`: Search for the specified pattern.  
`n`: Jump to the next match of the current search pattern.  
`N`: Jump to the previous match of the current search pattern.  
Saving and quitting  
`:w`: Save the current file.  
`:w {file}`: Save the current file as the specified file.  
`:wq`: Save and quit.  
`:q`: Quit.  
`:q!`: Quit without saving.

---

### Search

`/{pattern}`: Search for the specified pattern.  
`n`: Jump to the next match of the current search pattern.  
`N`: Jump to the previous match of the current search pattern.

---

### Saving and quitting

`:w`: Save the current file.  
`:w {file}`: Save the current file as the specified file.  
`:wq`: Save and quit.  
`:q`: Quit.  
`:q!`: Quit without saving.

---

### Cut, copy, and paste

`yy`: Copy the current line.  
`{Visual mode} y`: Copy the selected text.  
`p`: Paste the text that was last yanked or deleted after the cursor.  
`P`: Paste the text that was last yanked or deleted before the cursor.

---

### Replace

`:%s/{old text}/{new text}/g`: Replace all occurrences of old text with new text in the current file.  
`:%s/{old text}/{new text}/gc`: Replace all occurrences of old text with new text in the current file, with a prompt to confirm each replacement.

---

### Splitting windows

`:split`: Split the window horizontally.  
`:vsplit`: Split the window vertically.  
`Ctrl + w h`, `Ctrl + w j`, `Ctrl + w k`, `Ctrl + w l`: Move to the window to the left, below, above, or right of the current window, respectively.  
`:q`: Close the current window.

---

### Tabs

`:tabnew`: Open a new tab.  
`gt`: Move to the next tab.  
`gT`: Move to the previous tab.  
`{tab number}gt`: Move to the specified tab number.  
`:tabclose`: Close the current tab.

---

### File management

`:e {file}`: Open the specified file.  
`:ls`: List all open buffers.  
`:b {buffer number}`: Switch to the specified buffer.  
`:bd`: Close the current buffer.

---

### Syntax highlighting

`:syntax on`: Enable syntax highlighting.  
`:syntax off`: Disable syntax highlighting.

---

### Indentation

`>`: Indent the current line.  
`<`: Unindent the current line.  
`==`: Auto-indent the current line.  
`=%`: Auto-indent the current block (e.g., a function).

---

### Help

`:help {topic}`: Display the help for the specified topic.  
`:help user-manual`: Open the Neovim user manual in a browser.

# 
