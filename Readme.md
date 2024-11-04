# larvel-sail.el

This Emacs package provides a minor mode to wrap Laravel Sail commands, offering a menu for quick selection similar to Magit.

## Features

- Run common Laravel Sail commands (`up`, `down`, `build`, `artisan`, `composer`, `npm`, `yarn`, `test`) directly from Emacs.
- A customizable menu for quick command selection.
- Easily customizable keybindings.

## Installation

### Default
1. Clone the repository or download the `laravel-sail.el` file.

   ```sh
   git clone https://github.com/malbertzard/laravel-sail.el.git
   ```

2. Add the directory to your Emacs `load-path` and require the package in your Emacs configuration file (usually `~/.emacs` or `~/.emacs.d/init.el`).

   ```emacs-lisp
   (add-to-list 'load-path "/path/to/laravel-sail")
   (require 'laravel-sail)
   ```

3. Enable `laravel-sail-mode` in your Laravel project.

   ```emacs-lisp
   (add-hook 'php-mode-hook 'laravel-sail-mode)
   ```
   
### Straight
   ```emacs-lisp
   (laravel-sail.el :type git :host github :repo "malbertzard/laravel-sail.e")
   ```

## Usage

Once the package is installed and `laravel-sail-mode` is enabled, you can use the following default keybindings to run Laravel Sail commands:

- `C-l m`: Show the Sail command menu.
- `C-l u`: Run `sail up`.
- `C-l d`: Run `sail down`.

You can also customize the keybindings by setting `laravel-sail-mode-keymap` in your Emacs configuration:

```emacs-lisp
(setq laravel-sail-mode-keymap
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "C-c l m") 'laravel-sail-menu)
        (define-key map (kbd "C-c l u") 'laravel-sail-up)
        (define-key map (kbd "C-c l d") 'laravel-sail-down)
        map))
```

## Customization

### Custom Commands

By default, the package supports a set of commonly used Laravel Sail commands. If you need to add more commands, you can customize the `laravel-sail-commands` variable.

```emacs-lisp
(setq laravel-sail-commands
      '("up" "down" "build" "artisan" "composer" "npm" "yarn" "test" "new-command"))
```

### Sail Command

If the `sail` command is not in your PATH or you need to use a different command, you can customize the `laravel-sail-command` variable.

```emacs-lisp
(setq laravel-sail-command "/path/to/sail")
```
