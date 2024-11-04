;;; laravel-sail.el --- A simple package for using Laravel Sail              -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Mathis Albertzard

;; Author: Mathis Albertzard <malbertzard@gmail.com>
;; Keywords: lisp
;; Version: 0.0.1
;; URL: https://github.com/malbertzard/laravel-sail.el
;; Package-Requires: ((emacs "24.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Put a description of the package here
;; This package provides a minor mode to wrap Laravel Sail commands,
;; offering a menu for quick selection, similar to Magit.

;;; Code:

;; laravel-sail.el
(defgroup laravel-sail nil
  "Wrap Laravel Sail commands."
  :group 'tools)

(defcustom laravel-sail-command "./vendor/bin/sail"
  "The Laravel Sail binary."
  :type 'string
  :group 'laravel-sail)

(defvar laravel-sail-commands
  '("up" "down" "build" "artisan" "composer" "npm" "yarn" "test")
  "List of Laravel Sail commands.")

(defun laravel-sail-run-command (command)
  "Run a Laravel Sail COMMAND."
  (interactive
   (list (completing-read "Sail command: " laravel-sail-commands)))
  (let ((default-directory (locate-dominating-file default-directory "docker-compose.yml")))
    (compile (concat laravel-sail-command " " command))))

(defun laravel-sail-up ()
  "Run `sail up`."
  (interactive)
  (laravel-sail-run-command "up"))

(defun laravel-sail-down ()
  "Run `sail down`."
  (interactive)
  (laravel-sail-run-command "down"))

;; Add more functions for other commands as needed

(defun laravel-sail-menu ()
  "Show a menu for Laravel Sail commands."
  (interactive)
  (let ((command (completing-read "Sail command: " laravel-sail-commands)))
    (laravel-sail-run-command command)))

(define-minor-mode laravel-sail-mode
  "Minor mode for Laravel Sail."
  :lighter " Sail"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-l m") 'laravel-sail-menu)
            (define-key map (kbd "C-l u") 'laravel-sail-up)
            (define-key map (kbd "C-l d") 'laravel-sail-down)
            map))

(provide 'laravel-sail)
;;; laravel-sail.el ends here
