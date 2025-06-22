# NvChad Keymap Documentation

## Table of Contents
1. [Insert Mode Navigation](#insert-mode-navigation)
2. [Normal Mode Window Navigation](#normal-mode-window-navigation)
3. [General Operations](#general-operations)
4. [Buffer Management](#buffer-management)
5. [Code Formatting & LSP](#code-formatting--lsp)
6. [File Explorer (NvimTree)](#file-explorer-nvimtree)
7. [Fuzzy Finding (Telescope)](#fuzzy-finding-telescope)
8. [Terminal Operations](#terminal-operations)
9. [Commenting](#commenting)
10. [Utility Functions](#utility-functions)
11. [Essential Vim Motions](#essential-vim-motions)
12. [Advanced Vim Navigation](#advanced-vim-navigation)

---

## Insert Mode Navigation

| Keymap | Action | Description |
|--------|--------|-------------|
| `Ctrl + b` | Move to beginning of line | Jump to start of current line |
| `Ctrl + e` | Move to end of line | Jump to end of current line |
| `Ctrl + h` | Move left | Move cursor one character left |
| `Ctrl + l` | Move right | Move cursor one character right |
| `Ctrl + j` | Move down | Move cursor one line down |
| `Ctrl + k` | Move up | Move cursor one line up |

---

## Normal Mode Window Navigation

| Keymap | Action | Description |
|--------|--------|-------------|
| `Ctrl + h` | Switch window left | Focus window to the left |
| `Ctrl + l` | Switch window right | Focus window to the right |
| `Ctrl + j` | Switch window down | Focus window below |
| `Ctrl + k` | Switch window up | Focus window above |

---

## General Operations

| Keymap | Action | Description |
|--------|--------|-------------|
| `Esc` | Clear highlights | Remove search highlights |
| `Ctrl + s` | Save file | Write current buffer to file |
| `Ctrl + c` | Copy whole file | Copy entire file content to clipboard |
| `<leader>n` | Toggle line numbers | Show/hide line numbers |
| `<leader>rn` | Toggle relative numbers | Show/hide relative line numbers |
| `<leader>ch` | Toggle cheatsheet | Open/close NvChad cheatsheet |

---

## Buffer Management

| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>b` | New buffer | Create a new empty buffer |
| `Tab` | Next buffer | Switch to next buffer in tabline |
| `Shift + Tab` | Previous buffer | Switch to previous buffer in tabline |
| `<leader>x` | Close buffer | Close current buffer |

---

## Code Formatting & LSP

| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>fm` | Format file | Format current file using Conform |
| `<leader>ds` | LSP diagnostics | Open diagnostic location list |

---

## File Explorer (NvimTree)

| Keymap | Action | Description |
|--------|--------|-------------|
| `Ctrl + n` | Toggle NvimTree | Open/close file explorer |
| `<leader>e` | Focus NvimTree | Focus on file explorer window |

---

## Fuzzy Finding (Telescope)

### File Operations
| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>ff` | Find files | Search for files in project |
| `<leader>fa` | Find all files | Search including hidden/ignored files |
| `<leader>fo` | Find old files | Search recently opened files |
| `<leader>fb` | Find buffers | Search open buffers |

### Search Operations
| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>fw` | Live grep | Search text across project files |
| `<leader>fz` | Fuzzy find in buffer | Search within current buffer |

### Git Operations
| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>cm` | Git commits | Browse git commit history |
| `<leader>gt` | Git status | View git status |

### Utility Operations
| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>fh` | Help tags | Search help documentation |
| `<leader>ma` | Find marks | Search vim marks |
| `<leader>pt` | Pick terminal | Select from hidden terminals |
| `<leader>th` | NvChad themes | Open theme selector |

---

## Terminal Operations

### Terminal Mode
| Keymap | Action | Description |
|--------|--------|-------------|
| `Ctrl + x` | Exit terminal mode | Return to normal mode from terminal |

### New Terminals
| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>h` | Horizontal terminal | Open new horizontal split terminal |
| `<leader>v` | Vertical terminal | Open new vertical split terminal |

### Toggleable Terminals
| Keymap | Action | Description |
|--------|--------|-------------|
| `Alt + h` | Toggle horizontal terminal | Show/hide horizontal terminal |
| `Alt + v` | Toggle vertical terminal | Show/hide vertical terminal |
| `Alt + i` | Toggle floating terminal | Show/hide floating terminal |

---

## Commenting

| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>/` (Normal) | Toggle line comment | Comment/uncomment current line |
| `<leader>/` (Visual) | Toggle block comment | Comment/uncomment selected lines |

---

## Utility Functions

| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>wK` | Show all keymaps | Display all available keymaps |
| `<leader>wk` | Query keymaps | Search for specific keymap |

---

## Essential Vim Motions

### Basic Movement
| Keymap | Action | Description |
|--------|--------|-------------|
| `h` | Left | Move cursor left |
| `j` | Down | Move cursor down |
| `k` | Up | Move cursor up |
| `l` | Right | Move cursor right |
| `w` | Next word | Jump to beginning of next word |
| `b` | Previous word | Jump to beginning of previous word |
| `e` | End of word | Jump to end of current word |
| `0` | Line start | Jump to beginning of line |
| `^` | First non-blank | Jump to first non-whitespace character |
| `$` | Line end | Jump to end of line |

### Line Navigation
| Keymap | Action | Description |
|--------|--------|-------------|
| `gg` | File start | Jump to beginning of file |
| `G` | File end | Jump to end of file |
| `{line}G` | Go to line | Jump to specific line number |
| `H` | Screen top | Jump to top of screen |
| `M` | Screen middle | Jump to middle of screen |
| `L` | Screen bottom | Jump to bottom of screen |

### Text Objects
| Keymap | Action | Description |
|--------|--------|-------------|
| `iw` | Inner word | Select word under cursor |
| `aw` | A word | Select word including surrounding space |
| `is` | Inner sentence | Select current sentence |
| `as` | A sentence | Select sentence including surrounding space |
| `ip` | Inner paragraph | Select current paragraph |
| `ap` | A paragraph | Select paragraph including surrounding space |
| `i"` | Inner quotes | Select text inside double quotes |
| `a"` | A quotes | Select text including double quotes |
| `i(` | Inner parentheses | Select text inside parentheses |
| `a(` | A parentheses | Select text including parentheses |

---

## Advanced Vim Navigation

### Search and Replace
| Keymap | Action | Description |
|--------|--------|-------------|
| `/` | Search forward | Search for pattern forward |
| `?` | Search backward | Search for pattern backward |
| `n` | Next match | Jump to next search result |
| `N` | Previous match | Jump to previous search result |
| `*` | Search word forward | Search for word under cursor forward |
| `#` | Search word backward | Search for word under cursor backward |

### Marks and Jumps
| Keymap | Action | Description |
|--------|--------|-------------|
| `m{a-z}` | Set mark | Set local mark |
| `m{A-Z}` | Set global mark | Set global mark |
| `'{mark}` | Jump to mark line | Jump to line containing mark |
| `` `{mark}`` | Jump to mark position | Jump to exact mark position |
| `''` | Jump to previous line | Jump to line before last jump |
| ``` `` ``` | Jump to previous position | Jump to exact position before last jump |

### Folding
| Keymap | Action | Description |
|--------|--------|-------------|
| `za` | Toggle fold | Open/close fold under cursor |
| `zA` | Toggle all folds | Recursively open/close folds |
| `zo` | Open fold | Open fold under cursor |
| `zc` | Close fold | Close fold under cursor |
| `zR` | Open all folds | Open all folds in buffer |
| `zM` | Close all folds | Close all folds in buffer |

### Indentation
| Keymap | Action | Description |
|--------|--------|-------------|
| `>>` | Indent line | Indent current line |
| `<<` | Unindent line | Unindent current line |
| `>` | Indent selection | Indent selected lines |
| `<` | Unindent selection | Unindent selected lines |
| `=` | Auto-indent | Auto-indent selection |

### Registers
| Keymap | Action | Description |
|--------|--------|-------------|
| `"{register}` | Use register | Specify register for next command |
| `"*` | System clipboard | Use system clipboard register |
| `"+` | Selection clipboard | Use selection clipboard register |
| `":` | Command register | Last executed command |
| `"/` | Search register | Last search pattern |

---

## Notes

- **Leader Key**: In NvChad, the leader key is typically set to `<Space>` (spacebar)
- **Mode Indicators**: 
  - `(n)` = Normal mode
  - `(i)` = Insert mode
  - `(v)` = Visual mode
  - `(t)` = Terminal mode
- **Combo Keys**: Use `Ctrl`, `Alt`, and `Shift` modifiers as indicated
- **Text Objects**: Can be combined with operators like `d` (delete), `c` (change), `y` (yank)

This documentation covers the essential keymaps for efficient navigation and editing in NvChad. Practice these regularly to develop muscle memory and increase your productivity.