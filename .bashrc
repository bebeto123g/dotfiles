#!/usr/bin/env bash
#######################################################
# ┏━╸╻ ╻╺┳╸┏━┓┏━╸┏┳┓┏━╸   ╻ ╻╻  ╺┳╸╻┏┳┓┏━┓╺┳╸┏━╸    ┏┓ ┏━┓┏━┓╻ ╻┏━┓┏━╸
# ┣╸ ┏╋┛ ┃ ┣┳┛┣╸ ┃┃┃┣╸    ┃ ┃┃   ┃ ┃┃┃┃┣━┫ ┃ ┣╸     ┣┻┓┣━┫┗━┓┣━┫┣┳┛┃
# ┗━╸╹ ╹ ╹ ╹┗╸┗━╸╹ ╹┗━╸   ┗━┛┗━╸ ╹ ╹╹ ╹╹ ╹ ╹ ┗━╸   ╹┗━┛╹ ╹┗━┛╹ ╹╹┗╸┗━╸
# https://sourceforge.net/projects/ultimate-bashrc/files/
# Extreme Ultimate .bashrc File sources are free and
# open software released under the Zero-Clause BSD License (0BSD)
# https://opensource.org/license/0BSD
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#######################################################
# To Install or Update:
# wget -O ~/.bashrc https://sourceforge.net/projects/ultimate-bashrc/files/_bashrc/download
# wget -O ~/.bashrc_help https://sourceforge.net/projects/ultimate-bashrc/files/_bashrc_help/download
# -or-
# curl -L --output ~/.bashrc https://sourceforge.net/projects/ultimate-bashrc/files/_bashrc/download
# curl -L --output ~/.bashrc_help https://sourceforge.net/projects/ultimate-bashrc/files/_bashrc_help/download
#######################################################
# Supported Optional Applications/Dependencies:
# 7z apg aria2 atuin aureport baca base64 bash-completion bashmarks bashtop bat
# batcat bc blesh bottom bpytop broot btm btop btrfs bzip2 ccat cmatrix cod
# colordiff commacd cracklib curl delta diff-so-fancy difftastic dircolors
# distrobox doas doasedit dua dust dym elinks enhancd exa exiftool eza fasd fd
# ffmpeg figlet fresh frogmouth fx fzf fzf-tab-completion fzy gawk gcal gdu gio
# git git-commander git-completion git-delta gitalias gitui glances glow gpg grc
# grv gtop gunzip gzip hBlock helix hstr htop hyfetch icdiff ifconfig iftop
# imagemagick iotop jless jnv jp2a jq kdiff3 keepass keepassxc keeweb lazygit
# links links2 lnav lolcat lscolors lsd lsof lsx lynx mc mcfly mdcat mdless meld
# micro mlocate moar most multitail mysql-colorize nano ncdu neovim nethogs nmon
# nnn nvtop oh-my-posh openssl ov paru pkill pwgen qfc ranger rar rem resh
# restore-trash rhvoice ripgrep rsync run0 shellcheck shred silver_searcher
# skim source-highlight sshpass tar termdown terminology thefuck tig tmux toilet
# trash-cli tree tuifi ugit vivid vizex vlock w3m wget wl-copy wl-paste xclip
# xdg-open xdotool xhost xprop xrdb xsel youtube-dl yt-dlp ytfzf yazi ytop
# zellij zf zip zoxide
#
# Supported Optional Huds:
# fastfetch, hyfetch, neofetch, screenFetch, linux_logo, archey, pfetch
#
# Supported Optional Prompts:
# Trueline, Powerline, Powerline-Go, Powerline-Shell,
# Pureline, Starship, Oh My Posh, Bash Git Prompt, Liquid Prompt
#
# To Install Packages:
# pkginstall [package names separated by spaces]
#######################################################
# set -o errexit  # Exit when a command fails
# set -o pipefail # Catch mysqldump fails
# set -o nounset  # Exit when using undeclared variables
# set -o xtrace   # Trace what gets executed (useful for debugging)

### ERROR TRAPPING
# alias debug="set -o nounset; set -o xtrace"
# error() { echo 'Error in ${1} on line ${2}: ${3}' }
# trap 'error "${BASH_SOURCE}" "${LINENO}"' ERR

### TEST FOR AN INTERACTIVE SHELL
# This file is sourced by all "interactive" bash shells on startup
# including shells such as scp and rcp that can't tolerate any output.
# There is no need to set anything past this point for scp and rcp,
# and it's important to refrain from outputting anything in those cases.
[[ $- != *i* ]] && return
[[ -z "$PS1" ]] && return

# Bash version check
if [ -n "$BASH_VERSION" ] && ((BASH_VERSINFO[0] < 4)); then
	echo "This .bashrc file requires at least Bash 4.0"
	return 1
fi

# Source global definitions from the available bashrc files
if [[ -f /etc/bashrc ]]; then
	builtin source /etc/bashrc
elif [[ -f /etc/bash.bashrc ]]; then
	builtin source /etc/bash.bashrc
fi

# Grant permission to the local root user to access the X server
# This is NOT recommended for regular use due to the security implications:
# https://stackoverflow.com/questions/63884968/why-is-xhost-considered-dangerous
#if [[ -x "$(command -v xhost)" ]]; then
#	# 'xhost +local:root' allows the root user to connect to the X server
#	# This might be needed for some X applications to work
#	xhost +local:root > /dev/null 2>&1
#fi

#######################################################
# Default Bash Escape ANSI Color Codes
#######################################################

# Foreground Colors
BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"

# Bright Foreground Colors
BRIGHT_BLACK="\033[1;30m"
BRIGHT_RED="\033[1;31m"
BRIGHT_GREEN="\033[1;32m"
BRIGHT_YELLOW="\033[1;33m"
BRIGHT_BLUE="\033[1;34m"
BRIGHT_MAGENTA="\033[1;35m"
BRIGHT_CYAN="\033[1;36m"
BRIGHT_WHITE="\033[1;37m"

# Background Colors
BG_BLACK="\033[0;40m"
BG_RED="\033[0;41m"
BG_GREEN="\033[0;42m"
BG_YELLOW="\033[0;43m"
BG_BLUE="\033[0;44m"
BG_MAGENTA="\033[0;45m"
BG_CYAN="\033[0;46m"
BG_WHITE="\033[0;47m"

# Bright Background Colors
BG_BRIGHT_BLACK="\033[1;40m"
BG_BRIGHT_RED="\033[1;41m"
BG_BRIGHT_GREEN="\033[1;42m"
BG_BRIGHT_YELLOW="\033[1;43m"
BG_BRIGHT_BLUE="\033[1;44m"
BG_BRIGHT_MAGENTA="\033[1;45m"
BG_BRIGHT_CYAN="\033[1;46m"
BG_BRIGHT_WHITE="\033[1;47m"

# Reset Color
RESET="\033[0m"

#######################################################
# Find a temp directory where local is preferred
#######################################################

# Loop through potential temporary directories in order of preference
for _TEMP_DIR_PATH in \
	"${XDG_CACHE_HOME:-${HOME}/.cache}/tmp" \
	"${HOME}/.tmp" \
	"${HOME}/.temp" \
	"${XDG_CACHE_HOME:-${HOME}/.cache}" \
	"${TMPDIR}" \
	"${TMP}" \
	"/tmp" \
	"/temp"; do

	# Check if directory exists
	if [[ -d "${_TEMP_DIR_PATH}" ]]; then
		TEMPDIR_LOCAL="${_TEMP_DIR_PATH}"
		break # Exit loop after finding first valid directory
	fi
done

# Clean up
unset _TEMP_DIR_PATH

#######################################################
# Set the default editor
# Examples: vim, nvim, emacs, nano, micro, fresh, helix, pico,
# or gui apps like kate, gedit, notepadqq, or vscodium
# NOTE: In Git Bash, you can use something like "/c/Program\ Files/Notepad++/notepad++.exe"
# To change these without modifying this file, simply
# add these with your changes to one of these files:
# ~/.env
# ~/.envrc
# ~/.config/bashrc/config
# See section "Configuration and Extras" in the README:
# Link: https://sourceforge.net/projects/ultimate-bashrc/files/
#######################################################

# Declare associative array for caching command checks
declare -A _HASCOMMAND_CACHE

# Check if a command or alias exists (with caching for performance)
function hascommand() {
	# If no arguments, just '--strict', or help requested, show help message
	if [[ -z "${1}" || "${1}" == "--help" || "${1}" == "-h" || (${#} -eq 1 && "${1}" == "--strict") ]]; then
		echo -e "${BRIGHT_CYAN}hascommand${RESET}: Check if a command or alias exists"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}hascommand${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}options${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}command${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Options:${RESET}"
		echo -e "  ${BRIGHT_GREEN}--strict${RESET}, ${BRIGHT_GREEN}-s${RESET}   Check executables only (exclude aliases)"
		echo -e "  ${BRIGHT_GREEN}--no-cache${RESET}    Skip cache (useful after installing new software)"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}hascommand${RESET} ${BRIGHT_YELLOW}ls${RESET}                          ${BRIGHT_BLUE}# Check any command or alias${RESET}"
		echo -e "  ${BRIGHT_CYAN}hascommand${RESET} ${BRIGHT_GREEN}--strict${RESET} ${BRIGHT_YELLOW}grep${RESET}               ${BRIGHT_BLUE}# Check executable only${RESET}"
		echo -e "  ${BRIGHT_CYAN}hascommand${RESET} ${BRIGHT_GREEN}--no-cache --strict${RESET} ${BRIGHT_YELLOW}newcmd${RESET}  ${BRIGHT_BLUE}# Force fresh check${RESET}"
		return 2  # Return code 2 to indicate incorrect usage
	fi

	# Check for --no-cache flag
	local USE_CACHE=true
	if [[ "${1}" == "--no-cache" ]]; then
		USE_CACHE=false
		shift
	fi

	# Check for the '--strict' option
	local STRICT=false
	local COMMAND
	if [[ "${1}" == "--strict" ]] || [[ "${1}" == "-s" ]]; then
		STRICT=true
		COMMAND="${2}"
	else
		COMMAND="${1}"
	fi

	# Create cache key
	local CACHE_KEY="${STRICT}:${COMMAND}"

	# Check cache first
	if [[ "${USE_CACHE}" == true ]] && [[ -n "${_HASCOMMAND_CACHE[${CACHE_KEY}]}" ]]; then
		[[ "${_HASCOMMAND_CACHE[${CACHE_KEY}]}" == "1" ]]
		return $?
	fi

	# Perform the actual check
	local RESULT
	if [[ "${STRICT}" == true ]]; then
		# Look for executable command using type -P
		if type -P "${COMMAND}" &>/dev/null; then
			RESULT=1
		else
			RESULT=0
		fi
	else
		# Look for command or alias
		if type "${COMMAND}" &>/dev/null; then
			RESULT=1
		else
			RESULT=0
		fi
	fi

	# Cache the result
	_HASCOMMAND_CACHE[${CACHE_KEY}]="${RESULT}"

	[[ "${RESULT}" == "1" ]]
	return $?
}

# Helper to clear the cache if you install something mid-session
function hascommandclear() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}hascommandclear${RESET}: Clear the hascommand lookup cache"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}hascommandclear${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Run after installing new software to refresh command detection${RESET}"
		return 0
	fi

	unset _HASCOMMAND_CACHE
	declare -gA _HASCOMMAND_CACHE
	echo "hascommand cache cleared"
}

# BEGIN_EDITOR_CONFIG
# Loop a list of common editors to check
for _EDITOR_NAME in \
	fresh micro ne helix tilde jed vile zile joe nano nvim vim emacs vi jove mg ed
do
	# Order matters: plain name first, then Flatpak and Snap host paths
	for EDITOR in \
		"${_EDITOR_NAME}" \
		"/usr/local/bin/${_EDITOR_NAME}" \
		"${HOME}/.local/bin/${_EDITOR_NAME}" \
		"/run/host/usr/bin/${_EDITOR_NAME}" \
		"/var/run/host/usr/bin/${_EDITOR_NAME}" \
		"/snap/bin/${_EDITOR_NAME}"
	do
		# Accept commands, aliases, or executable absolute paths
		if command -v "${EDITOR}" >/dev/null 2>&1 || [ -x "${EDITOR}" ]; then

			# Default text editor for various command-line utilities
			# (fallback if VISUAL is not set)
			export EDITOR

			# Default text editor for visual (full-screen) utilities
			# (takes precedence over EDITOR)
			export VISUAL="${EDITOR}"

			# Specifies the editor to use with 'sudo -e' or 'sudoedit'
			# (overrides VISUAL and EDITOR)
			export SUDO_EDITOR="${EDITOR}"

			# Specifies the editor for 'fc' command to edit and re-run
			# commands from history (falls back to EDITOR)
			export FCEDIT="${EDITOR}"

			# Specifies a fallback editor for Emacs and its derivatives
			# (Used when Emacs cannot start the primary editor defined by EDITOR)
			export ALTERNATE_EDITOR="${EDITOR}"

			# nnn default action for opening a file
			# https://github.com/jarun/nnn
			export NNN_OPENER="${EDITOR}"

			break 2 # Found so exit both loops
		fi
	done
done

# Clean up
unset _EDITOR_NAME
# END_EDITOR_CONFIG

# We will default to use either Neovim https://neovim.io or vim instead of vi
# NOTE: vi is POSIX compliant but vim has more features and Neovim is more extensible
# http://www.viemu.com/a-why-vi-vim.html
# https://www.linuxfordevices.com/tutorials/linux/vim-vs-neovim
if hascommand --strict nvim; then
	alias {v,vi,vim}='nvim'
	alias svi='sudo nvim'
	alias vis='nvim "+set si"'
elif hascommand --strict vim; then
	alias {v,vi}='vim'
	alias svi='sudo vim'
	alias vis='vim "+set si"'
elif hascommand --strict vi; then
	alias v='vi'
	alias svi='sudo vi'
fi

# Set some defaults for nano
# NOTE: Depending on the version of nano you have, --linenumbers and --suspend is helpful
if hascommand --strict nano; then
	alias {n,nano}='nano --smarthome --multibuffer --const --autoindent'
fi

# Set Micro editor true color support
# Link: https://micro-editor.github.io/
# Install: curl https://getmic.ro | bash
export MICRO_TRUECOLOR=1

# Create an alias for the Helix editor
# See hx --tutor or :tutor for a vimtutor-like introduction
# Link: https://github.com/helix-editor/helix
# Link: https://docs.helix-editor.com/title-page.html
if hascommand --strict helix; then
	alias hx='helix'
fi

# Smart File Editor with Auto Privilege Management
# Uses the default editor or sudoedit for security based on file permissions
# It also provides visual feedback in color and even integrates with Tmux
# Syntax: edit [optional_filename]
alias e="edit"
function edit() {

	# Local variable to track if the immutable attribute was modified
	local IMMUTABLE_SET=""
	# Track the current tmux tab name so restore_tab can reset it
	local _CURRENT_TAB_NAME=""

	# NOTE: The helper functions are defined inside this edit function to avoid
	#  cluttering the global namespace and tab completion. They are specific to
	#  the edit functionality and not intended to be used independently.

	### Post-edit action function to handle specific file edits
	# and reapply the immutable attribute if it was removed
	function post_edit_action() {
		# Convert the provided path to an absolute path
		local ABSOLUTE_PATH=$(realpath "${1}" 2>/dev/null)

		# Exit the function if the file does not exist
		[[ -z "${ABSOLUTE_PATH}" ]] && return

		# Use a case statement to match the filename with specific actions
		case "${ABSOLUTE_PATH}" in

			/etc/default/grub)
				# Check if grub-mkconfig exists before updating grub configuration
				if hascommand grub-mkconfig; then
					if ask "${BRIGHT_YELLOW}Update grub configuration?${RESET}" Y; then
						sudo grub-mkconfig -o /boot/grub/grub.cfg
						echo -e "${BRIGHT_GREEN}Grub configuration updated${RESET}"
					fi
				fi
			;;

			# Apache Configuration
			/etc/httpd/conf/httpd.conf|/etc/apache2/apache2.conf)
				# Validate Apache Configuration
				if hascommand apachectl; then
					if apachectl configtest; then
						if ask "${BRIGHT_YELLOW}Restart Apache to apply changes?${RESET}" Y; then
							apacherestart
						fi
					else
						echo -e "${BRIGHT_RED}Apache configuration test failed${RESET}"
					fi
				fi
			;;

			# Nginx Configuration
			/etc/nginx/nginx.conf)
				# Validate Nginx Configuration
				if hascommand --strict nginx; then
					if sudo nginx -t; then
						if ask "${BRIGHT_YELLOW}Restart Nginx to apply changes?${RESET}" Y; then
							ngrestart
						fi
					else
						echo -e "${BRIGHT_RED}Nginx configuration test failed${RESET}"
					fi
				fi
			;;

			*php.ini|*/php/*/php.ini)
				if hascommand --strict php; then
					if ask "${BRIGHT_YELLOW}Restart web servers to apply PHP changes?${RESET}" Y; then
						# Try to restart Apache and suppress errors
						if hascommand --strict apachectl || hascommand --strict httpd || hascommand --strict apache2; then
							apacherestart
						fi

						# Try to restart Nginx and suppress errors
						if hascommand --strict nginx; then
							ngrestart
						fi

						echo -e "${BRIGHT_GREEN}Attempted to restart web servers for PHP.ini changes${RESET}"
					fi
				fi
			;;

			/etc/ssh/sshd_config)
				# Check if systemd is installed and systemctl is available
				if hascommand --strict systemctl; then
					if ask "${BRIGHT_YELLOW}Restart SSH service to apply changes?${RESET}" Y; then
						# Directly execute the commands to restart and enable the SSH service
						sudo systemctl restart sshd.service && sudo systemctl enable sshd.service
						echo -e "${BRIGHT_GREEN}SSH service restarted${RESET}"
					fi
				fi
			;;

			/etc/vconsole.conf)
				# Check if mkinitcpio exists before rebuilding the initial ramdisk environment
				if hascommand --strict mkinitcpio; then
					if ask "${BRIGHT_YELLOW}Rebuild initial ramdisk environment for vconsole?${RESET}" Y; then
						sudo mkinitcpio -P
						echo -e "${BRIGHT_GREEN}Initial ramdisk environment rebuilt${RESET}"
					fi
				fi
			;;

			"${HOME}/.bash_profile")
				# If editing the .bash_profile file, reload it
				if ask "${BRIGHT_YELLOW}Reload the new .bash_profile file?${RESET}" N; then
					command clear
					builtin source ~/.bash_profile
				fi
			;;

			"${HOME}/.bashrc")
				# If editing the .bashrc file, reload it
				if ask "${BRIGHT_YELLOW}Reload the new .bashrc file?${RESET}" N; then
					command clear
					builtin source ~/.bashrc
				fi
			;;

			"${HOME}/.tmux.conf"|"${XDG_CONFIG_HOME:-${HOME}/.config}/tmux/tmux.conf"|/etc/tmux.conf)
				# If editing .tmux.conf, refresh tmux configuration
				# Check if tmux is installed and running
				if hascommand --strict tmux && tmux info &> /dev/null; then
					tmux source-file "${1}"
					echo -e "${BRIGHT_GREEN}Reloaded Tmux configuration from ${BRIGHT_MAGENTA}${1}${RESET}"
				fi
			;;

			"${HOME}/.Xresources"|/etc/X11/Xresources)
				# Check if xrdb exists and we are in X11 before merging .Xresources
				if [[ $DISPLAY ]] && [[ $XDG_SESSION_TYPE == "x11" ]] && hascommand --strict xrdb; then
					if ask "${BRIGHT_YELLOW}Merge X resources from ${ABSOLUTE_PATH}?${RESET}" Y; then
						xrdb -merge "${1}"
						echo -e "${BRIGHT_GREEN}Merged X resources from ${BRIGHT_MAGENTA}${1}${RESET}"
					fi
				fi
			;;

			# -- Post-edit file format validators (read-only, no restart needed) --

			*.desktop)
				# Validate .desktop file after editing
				if hascommand desktop-file-validate; then
					if desktop-file-validate "${1}"; then
						echo -e "${BRIGHT_GREEN}Desktop file validation passed${RESET}"
					else
						echo -e "${BRIGHT_RED}Desktop file validation failed${RESET}"
					fi
				fi
			;;

			*.json)
				# Validate JSON syntax after editing
				if hascommand jq; then
					if jq 'empty' "${1}" 2>/dev/null; then
						echo -e "${BRIGHT_GREEN}JSON validation passed${RESET}"
					else
						echo -e "${BRIGHT_RED}JSON validation failed${RESET}"
						# Show the actual error for context
						jq 'empty' "${1}" 2>&1
					fi
				fi
			;;

			*.xml)
				# Validate XML syntax after editing
				if hascommand xmllint; then
					if xmllint --noout "${1}" 2>/dev/null; then
						echo -e "${BRIGHT_GREEN}XML validation passed${RESET}"
					else
						echo -e "${BRIGHT_RED}XML validation failed${RESET}"
						# Show the actual error for context
						xmllint --noout "${1}" 2>&1
					fi
				fi
			;;

			*.yaml|*.yml)
				# Validate YAML syntax after editing
				if hascommand yamllint; then
					if yamllint -s "${1}" 2>/dev/null; then
						echo -e "${BRIGHT_GREEN}YAML validation passed${RESET}"
					else
						echo -e "${BRIGHT_RED}YAML validation failed${RESET}"
						# Show the actual errors for context
						yamllint -s "${1}" 2>&1
					fi
				fi
			;;

			*.service|*.timer|*.socket|*.mount|*.path|*.target|*.slice)
				# Validate systemd unit file after editing
				if hascommand systemd-analyze; then
					if systemd-analyze verify "${1}" 2>/dev/null; then
						echo -e "${BRIGHT_GREEN}Systemd unit validation passed${RESET}"
					else
						echo -e "${BRIGHT_RED}Systemd unit validation failed${RESET}"
						# Show the actual errors for context
						systemd-analyze verify "${1}" 2>&1
					fi
				fi
			;;
		esac
	}

	### Helper function to use the more secure sudoedit only if it's possible
	# since sudoedit cannot edit a file in a directory with write permissions
	function sudo_edit() {

		# Determine the directory containing the file (SC2155: split declaration)
		local DIRNAME
		DIRNAME=$(dirname "${1}")
		[[ "${DIRNAME}" == "." ]] && DIRNAME="${PWD}"

		# If inside a Tmux session, rename the tab temporarily
		rename_tab "${1}"

		# Pre-authenticate so the status message appears after any password prompt
		if ! sudo -v; then
			restore_tab
			return 1
		fi

		# Show what we're about to edit or create
		if [[ -f "${1}" ]]; then
			echo -e "${BRIGHT_GREEN}Editing ${BRIGHT_CYAN}$(tilde_path "${1}")${RESET}"
		else
			echo -e "${BRIGHT_GREEN}Creating ${BRIGHT_CYAN}$(tilde_path "${1}")${RESET}"
		fi

		# Check if the directory is writable...
		if [[ -w "${DIRNAME}" ]] || ! hascommand sudoedit; then
			# Edit as root keeping environment variables (like default editor)
			sudo --preserve-env "${EDITOR}" "${1}" && post_edit_action "${1}"
		else
			# Securely edit as root via temporary copy minimizing editor risks
			sudoedit "${1}" && post_edit_action "${1}"
		fi

		# Restore the Tmux tab name
		restore_tab
	}

	### Check and modify the immutable attribute of a file
	# Parameters:
	#   $1 - The filename to check and potentially modify the immutable attribute
	function immutable_remove() {
		# Check if required commands exist
		if ! hascommand chattr || ! hascommand lsattr; then
			return
		fi

		# Check if the file and commands exists
		if [[ -f "${1}" ]] && hascommand chattr && hascommand lsattr; then

			# Extract file attributes using lsattr
			local ATTRIBUTES=$(lsattr "${1}" 2>/dev/null | cut -d' ' -f1)

			# Check if the immutable attribute is set (indicated by 'i')
			if [[ "${ATTRIBUTES}" =~ i ]]; then

				# Ask user if they want to temporarily remove the immutable attribute to allow editing
				if ask "${BRIGHT_YELLOW}This file is immutable. Temporarily remove immutable attribute to edit?${RESET}" Y; then

					# Try to remove the immutable attribute without using sudo first
					if ! chattr -i "${1}" > /dev/null 2>&1; then
						# If the command fails, inform the user and retry with sudo
						sudo chattr -i "${1}" > /dev/null 2>&1
					fi

					# Set a flag to indicate the attribute was modified
					IMMUTABLE_SET="true"
				else

					# If the user chooses not to edit the file, exit and show a message
					echo -e "${BRIGHT_RED}Cannot edit the file without removing the immutable attribute.${RESET}"

					# Exit the function with status 1 indicating an error
					return 1
				fi
			fi
		fi
	}

	### Reapply the immutable attribute if it was previously removed
	function immutable_restore() {
		# Check if the file and commands exists
		if [[ -f "${1}" ]] && hascommand chattr; then

			# If we changed the immutable attribute
			if [[ "${IMMUTABLE_SET}" == "true" ]]; then

					# Try to restore the immutable attribute without using sudo first
					if ! chattr +i "${1}" > /dev/null 2>&1; then
						# If the command fails, inform the user and retry with sudo
						sudo chattr +i "${1}" > /dev/null 2>&1
					fi

				echo -e "${BRIGHT_GREEN}Immutable attribute reapplied to ${BRIGHT_MAGENTA}${1}${RESET}"
			fi
		fi
	}

	### Helper function to rename the current Tmux or console tab if supported
	function rename_tab() {
		# Get the simple editor name
		local _EDITOR_SHORT_NAME=$(basename "${EDITOR%% *}")

		# Get the filename (drop the path) for the new tab name
		local _EDITING_FILENAME=$(basename "${1}")

		# If in a Tmux session...
		if [[ -n "${TMUX}" ]] && hascommand tmux; then
			# Save the current tab text
			_CURRENT_TAB_NAME=$(tmux display-message -p '#W')

			# Rename the current tab
			#tmux rename-window "✒️${_EDITING_FILENAME}"
			tmux rename-window "${_EDITOR_SHORT_NAME}→${_EDITING_FILENAME}"

		# Check if we are in WezTerm
		elif [[ "${TERM_PROGRAM}" == "WezTerm" ]]; then
			# Rename the WezTerm tab
			wezterm cli set-tab-title "${_EDITOR_SHORT_NAME} → ${_EDITING_FILENAME}"

		# We are not in Tmux...
		else
			# Change the tab title if the terminal supports it
			echo -ne "\033]2;${_EDITOR_SHORT_NAME}→${_EDITING_FILENAME}\007"
			echo -ne "\033]30;${_EDITOR_SHORT_NAME}→${_EDITING_FILENAME}\007"
		fi
	}

	### Helper function to restore the Tmux or Konsole tab name
	function restore_tab() {
		# If we are inside a Tmux session...
		if [[ -n "${TMUX}" ]] && [[ -n "${_CURRENT_TAB_NAME}" ]] && hascommand tmux; then
			# Restore Tmux tab name
			tmux rename-window "${_CURRENT_TAB_NAME}"
			unset _CURRENT_TAB_NAME

		elif [[ "${TERM_PROGRAM}" == "WezTerm" ]]; then
			# Restore WezTerm tab name
			wezterm cli set-tab-title ""

		# If we are in Konsole...
		elif [[ -n "$KONSOLE_DBUS_SERVICE" ]]; then
			# Reset the tab title to the default
			echo -ne "\033]30;%d : %n\007"

		# We are not in Tmux...
		else
			# This will reset the tab
			echo -ne "\033]0;\007"
		fi
	}

	### Replace home directory with ~ in displayed paths for privacy
	function tilde_path() {
		if [[ "${1}" == "${HOME}"* ]]; then
			echo "~${1#"${HOME}"}"
		else
			echo "${1}"
		fi
	}

	### Track whether the file path was already announced (e.g. by "Found")
	local PATH_ANNOUNCED=""

	### Check if the file is a symlink
	local ACTUAL_FILE
	if [[ -L "${1}" ]]; then
		# Resolve the symlink to the actual file (SC2155: split declaration)
		ACTUAL_FILE=$(resolvesymlink "${1}")

		# Inform the user about the switch
		echo -e "${BRIGHT_YELLOW}Editing actual file instead of symlink:${RESET} ${BRIGHT_CYAN}$(tilde_path "${ACTUAL_FILE}")${RESET}"
	else
		# If not a symlink, proceed with the original file
		ACTUAL_FILE="${1}"
	fi

	### If it does not contain a path and is not a file
	if [[ "$ACTUAL_FILE" != */* && ! -f "$ACTUAL_FILE" ]]; then
		# Try to locate the full path using `which`
		local FOUND_PATH=$(command which "$ACTUAL_FILE" 2>/dev/null)

		# Update ACTUAL_FILE if a path was found
		if [[ -n "$FOUND_PATH" ]]; then
			ACTUAL_FILE="$FOUND_PATH"
			echo -e "${BRIGHT_GREEN}Found ${BRIGHT_CYAN}$(tilde_path "${ACTUAL_FILE}")${RESET}"
			PATH_ANNOUNCED="true"
		fi
	fi

	### Check for special case of editing /etc/sudoers...
	if [[ "${ACTUAL_FILE}" == "/etc/sudoers" ]] && hascommand visudo; then
		echo -ne "${BRIGHT_RED}Security alert:"
		echo -e "${BRIGHT_YELLOW} Using visudo to edit ${BRIGHT_CYAN}${ACTUAL_FILE}${RESET}"
		if ! immutable_remove "${1}"; then
			# For some reason, we are unable to remove the immutable attribute
			return 1
		fi
		rename_tab "${ACTUAL_FILE}"
		sudo visudo
		restore_tab
		immutable_restore "${1}"
		return

	### Check if EDITOR is set...
	elif [ -z "${EDITOR}" ]; then
		echo -ne "${BRIGHT_RED}Error: ${BRIGHT_CYAN}EDITOR environment variable is not set.${RESET}"
		return 1

	### No parameters passed, load the default editor...
	elif [[ $# -eq 0 ]]; then
		rename_tab 'New File'
		"${EDITOR}"
		restore_tab
		return

	### Check if file exists and has read/write permissions...
	elif [[ -r "${ACTUAL_FILE}" ]] && [[ -w "${ACTUAL_FILE}" ]]; then
		immutable_remove "${1}"
		rename_tab "${ACTUAL_FILE}"

		# Get the initial modification time of the file
		# Use platform-appropriate stat flag (GNU vs BSD/macOS)
		local _STAT_FMT='-c %Y'
		[[ "$(uname)" == "Darwin" ]] && _STAT_FMT='-f %m'
		local INITIAL_MTIME=""
		if [[ -f "${ACTUAL_FILE}" ]]; then
			INITIAL_MTIME=$(stat ${_STAT_FMT} "${ACTUAL_FILE}")
		fi

		# Show the file being edited (skip if already announced by "Found")
		if [[ -z "${PATH_ANNOUNCED}" ]]; then
			echo -e "${BRIGHT_GREEN}Editing ${BRIGHT_CYAN}$(tilde_path "${ACTUAL_FILE}")${RESET}"
		fi

		# Capture the exit status of the editor
		"${EDITOR}" "${ACTUAL_FILE}"
		local EDIT_STATUS=$?

		# Check if the file was modified based on the modification time
		if [[ -f "${ACTUAL_FILE}" ]]; then
			if [[ "$(stat ${_STAT_FMT} "${ACTUAL_FILE}")" != "${INITIAL_MTIME}" ]]; then
				post_edit_action "${ACTUAL_FILE}"
			fi
		else
			post_edit_action "${ACTUAL_FILE}"
		fi

		restore_tab
		immutable_restore "${1}"
		return $EDIT_STATUS

	### Check if the file exists but doesn't have write permission...
	elif [[ -f "${ACTUAL_FILE}" ]]; then
		echo -ne "${BRIGHT_RED}Insufficient permissions:"
		echo -e "${BRIGHT_YELLOW} Using super user to edit ${BRIGHT_CYAN}${ACTUAL_FILE}${RESET}"
		immutable_remove "${1}"
		sudo_edit "${ACTUAL_FILE}"
		immutable_restore "${1}"
		return

	### File doesn't exist, check if we can create it...
	elif [[ -w "$(dirname "${ACTUAL_FILE}")" ]]; then
		echo -e "${BRIGHT_GREEN}Creating ${BRIGHT_CYAN}$(tilde_path "${ACTUAL_FILE}")${RESET}"
		# Attempt to edit the file
		rename_tab "${ACTUAL_FILE}"
		if "${EDITOR}" "${ACTUAL_FILE}"; then
			return
		else # There was an error...
			# Retry with sudo_edit
			restore_tab
			echo -ne "${BRIGHT_RED}Insufficient permissions:"
			echo -e "${BRIGHT_YELLOW} Retrying with super user to edit ${BRIGHT_CYAN}${ACTUAL_FILE}${RESET}"
			immutable_remove "${1}"
			sudo_edit "${ACTUAL_FILE}"
			immutable_restore "${1}"
			return
		fi

	### We need super user access to create the new file
	else
		echo -ne "${BRIGHT_RED}Insufficient permissions:"
		echo -e "${BRIGHT_YELLOW} Using super user to create ${BRIGHT_CYAN}${ACTUAL_FILE}${RESET}"
		sudo_edit "${ACTUAL_FILE}"
		return
	fi
}

# Command-line completion for the edit command
_edit_completion() {
	local cur prev words cword
	_init_completion -n = || return

	case $prev in
		edit|e)
			_filedir
			return
			;;
	esac
}
complete -F _edit_completion edit e

# Shortcut for edit using root permissions
alias se="sudoedit"

#######################################################
# Set default variable values
# These variables can be overridden in one of these environment variable files:
# ~/.env
# ~/.envrc
# ~/.config/bashrc/config
#######################################################

# BEGIN_BASHRC_CONFIG
# Determines if CTRL-h will show help
# Ctrl+h (for help) and Ctrl+Backspace share the same key binding
# in some terminal emulators so we default to skip this keybind
_SKIP_HELP_KEYBIND=true

# Show an installed information HUD on initial Bash load (if not skipped)
# Link: https://github.com/LinusDierheimer/fastfetch
# Link: https://github.com/hykilpikonna/hyfetch
# Link: https://ostechnix.com/neofetch-display-linux-systems-information/
# Link: https://github.com/KittyKatt/screenFetch
# Link: https://github.com/deater/linux_logo
# Link: https://github.com/dylanaraps/pfetch
_SKIP_SYSTEM_INFO=false

# If not skipped, shows pending updates (only in Arch, Manjaro, and Ubuntu)
# WARNING: This check for updates takes several seconds so the default is true
_SKIP_UPGRADE_NOTIFY=true

# Automatically launch TMUX terminal multiplexer in local, TTY, or SSH sessions
# https://github.com/tmux/tmux/wiki
# Since TMUX is pre-installed on most systems, the default is to skip TMUX
_TMUX_LOAD_TTY=false
_TMUX_LOAD_SSH=false
_TMUX_LOAD_LOCAL=false

# OPTIONAL: Set and force the default TMUX session name for this script and tm
# If not specified, an active TMUX session is used and attached to
# If no active TMUX session exists, the current logged in user name is used
#export _TMUX_LOAD_SESSION_NAME='☁Cloud☁'
#export _TMUX_LOAD_SESSION_NAME='☕ON☕'
#export _TMUX_LOAD_SESSION_NAME='♥♥♥ x3 LIVES'
#export _TMUX_LOAD_SESSION_NAME='📡 SIGNAL FOUND'
#export _TMUX_LOAD_SESSION_NAME='🕹 👾 👾 👾'
#export _TMUX_LOAD_SESSION_NAME='I❤Linux'
#export _TMUX_LOAD_SESSION_NAME='Look!🐿'
#export _TMUX_LOAD_SESSION_NAME='Quantum Super Computer'
#export _TMUX_LOAD_SESSION_NAME='ᗧ·●··ᗣ'
#export _TMUX_LOAD_SESSION_NAME=''

# Terminology is a graphical EFL terminal emulator that can run in TTY sessions
# If installed, it can automatically be launched when starting a TTY session
# To split the window horizontally press Ctrl+Shift+PgUp
# To split the window vertically press Ctrl+Shift+PgDn
# To create Tabs press Ctrl+Shift+T and cycle through using Ctrl+1-9
# Link: https://github.com/borisfaure/terminology
# Link: https://linoxide.com/terminology-terminal/
_SKIP_TERMINOLOGY_TTY=false

# Blesh: Bash Line Editor replaces default GNU Readline
# Link: https://github.com/akinomyoga/ble.sh
# Link for configuration: https://github.com/akinomyoga/ble.sh/blob/master/blerc
# WARNING: Can be buggy with certain prompts (like Trueline)
_SKIP_BLESH=false

# Make sure the default file and directory permissions for newly created files
# in the home directory is umask 026 to improve security.
# (user=read/write/execute, group=read/execute, others=execute for directories)
# The default is to skip this security setting and not modify home permissions
_SKIP_UMASK_HOME=true

# Replaces Sudo with one of the three alternatives (if installed):
# run0 (systemd 256+) - Delegates to PID 1 via polkit, no SUID binary
# - OR -
# RootDO (rdo) - A very slim alternative to both sudo and doas
# Link: https://codeberg.org/sw1tchbl4d3/rdo
# - OR -
# A port of OpenBSD's doas offers two benefits over sudo:
# 1) Its configuration file has a simple syntax and
# 2) It is smaller, requiring less effort to audit the code
# Link: https://github.com/Duncaen/OpenDoas or https://github.com/slicer69/doas
# Default value is skip and must be set to false manually for security reasons
_SKIP_SUDO_ALTERNATIVE=true

# If set to true, cd will not output the current absolute path under certain
# circumstances like when using the command cd - or using cdable_vars bookmarks
# Link: https://www.gnu.org/software/bash/manual/bash.html#index-cd
_SILENCE_CD_OUTPUT=false

# If set to true, will not load anything that modifies the ls command or colors
_SKIP_LS_COLORIZED=false

# LSD (LSDeluxe) is a rewrite of GNU ls with lots of added features like
# colors, icons, tree-view, more formatting options, git support, etc.
# Fonts: Install the patched fonts of powerline, nerd-font, and/or font-awesome
# Link: https://github.com/Peltoche/lsd
_SKIP_LSD=false

# eza/exa is a modern color replacement for ls that also has some Git support
# Link: https://github.com/eza-community/eza
# Link: https://github.com/ogham/exa
_SKIP_EXA=false

# grc Generic Colouriser
# Link: https://github.com/garabik/grc
_SKIP_GRC=false

# Use built-in aliases for grc Generic Colouriser instead of it's own includes
_GRC_USE_BASHRC_BUILTIN=false

# Choose your preferred picker to use with menus
# You can choose any picker like fzy, sk, fzf, peco, percol, pick, icepick,
# selecta, sentaku, zf, or even dmenu, rofi, or wofi UI pickers
_PREFERRED_PICKER=

# If set to true, will not source bash completion scripts
_SKIP_BASH_COMPLETION=false

# If set to true, will show a calendar when Bash is started
_SHOW_BASH_CALENDAR=false

# If GNU gcal is installed, use this local for holidays
# To show the possible options type: gcal -hh | grep 'Holidays in'
# Link: https://www.gnu.org/software/gcal/manual/gcal.html
# Link: https://unix.stackexchange.com/questions/164555/how-to-emphasize-holidays-by-color-in-cal-command
_GCAL_COUNTRY_CODE=US_AK

# Skip the birthday/anniversary reminder that shows a message in your teminal?
# Reads the birthday CSV file: ~/.config/birthdays.csv
# The first line is ignored (header) and the format is (year is optional):
# Month,Day,Year,"Message"
# Jan,1,1985,"This is a message!"
#
# Figlet and/or Toilet application is an optional dependency
# Install Arch/Manjaro:  sudo pacman -S toilet
# Install Ubuntu/Debian: sudo apt-get install toilet
_SKIP_BDAY_REMINDER=false

# Set the location for the birthday/anniversary reminder CSV file
# The default location is "~/.config/birthdays.csv"
_BDAY_FILE="${XDG_CONFIG_HOME:-${HOME}/.config}/birthdays.csv"

# Set the preferred birthday reminder font here (default is "future"):
_BDAY_FONT=future

# Set to have the built in prompt use a faster but less precise Git method
# This might be necessary on slow connections or networked directories
# Also if set to true, will remove eza/exa's --git flag (use lsg for Git info)
_GIT_IS_SLOW=false

# Optional original prompt from 2014 version now with newly added Git support
# download the optional .bashrc_prompt script file and place it in either your
# home directory or as the file ~/.config/bashrc/prompt
# You will also need to make sure this setting is set to false
_SKIP_PROMPT_ORIGINAL=false

# If false, the built-in prompt will be one single line with an abbreviated path
# If true, the built-in prompt will split into two lines with a full path
_PROMPT_BUILTIN_FULL_PATH=false

# Trueline Bash (true 24-bit color and glyph support)
# This is the prefered prompt since it looks amazing,
# has so many features, is easily extended using functions,
# and is a single Bash script file that is easy to install.
# Link: https://github.com/petobens/trueline
# Install: wget https://raw.githubusercontent.com/petobens/trueline/master/trueline.sh -P ~/
# Fonts: https://github.com/powerline/fonts
_SKIP_PROMPT_TRUELINE=false

# Powerline-Go (this prompt uses no special glyphs)
# Link: https://github.com/justjanne/powerline-go
_SKIP_PROMPT_POWERLINE_GO=false

# Powerline-Shell (details about git/svn/hg/fossil branch and Python virtualenv environment)
# Link: https://github.com/b-ryan/powerline-shell
_SKIP_PROMPT_POWERLINE_SHELL=false

# Pureline (256 color written in bash script)
# Link: https://github.com/chris-marsh/pureline
# Install:
# git clone https://github.com/chris-marsh/pureline.git
# cp pureline/configs/powerline_full_256col.conf ~/.pureline.conf
_SKIP_PROMPT_PURELINE=false

# Starship Cross Shell Prompt (focus on compatibility and written in Rust)
# Link: https://starship.rs
# Install: sh -c "$(curl -fsSL https://starship.rs/install.sh)"
_SKIP_PROMPT_STARSHIP=false

# Oh My Posh Cross Shell Prompt (highly themeable, supports bash)
# Link: https://ohmyposh.dev
# Install: curl -s https://ohmyposh.dev/install.sh | bash -s
_SKIP_PROMPT_OH_MY_POSH=false

# Oh-My-Git (only used for Git but has huge support for it, requires font)
# Link: https://github.com/arialdomartini/oh-my-git
# Install: git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git
_SKIP_PROMPT_OH_MY_GIT=false

# Bash Git Prompt (shows git repository, branch name, difference with remote branch, number of files staged, changed, etc)
# Link: https://github.com/magicmonty/bash-git-prompt
# Install: git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
_SKIP_PROMPT_BASH_GIT_PROMPT=false

# Bash Powerline (no need for patched fonts, supports git, previous command execution status, platform-dependent prompt symbols)
# Link: https://github.com/riobard/bash-powerline
# Install: curl https://raw.githubusercontent.com/riobard/bash-powerline/master/bash-powerline.sh > ~/.bash-powerline.sh
_SKIP_PROMPT_BASH_POWERLINE=false

# Sexy Bash Prompt (supports git, 256 color)
# Link: https://github.com/twolfson/sexy-bash-prompt
# Install: (cd /tmp && ([[ -d sexy-bash-prompt ]] || git clone --depth 1 --config core.autocrlf=false https://github.com/twolfson/sexy-bash-prompt) && cd sexy-bash-prompt && make install)
_SKIP_PROMPT_SEXY_BASH_PROMPT=false

# Liquid Prompt (adaptive prompt with low color and no glyphs)
# Link: https://github.com/nojhan/liquidprompt
# Install: git clone --branch stable https://github.com/nojhan/liquidprompt.git ~/liquidprompt
_SKIP_PROMPT_LIQUIDPROMPT=false

# Original Powerline Status Line for Vim Bash Zsh fish tmux IPython Awesome i3 Qtile
# Link: https://github.com/powerline/powerline
# Install: https://medium.com/earlybyte/powerline-for-bash-6d3dd004f6fc
# NOTE: Requires Python and can be used with Trueline in Bash
# WARNING: This path may change or break in the future with new Python versions
_SKIP_PROMPT_POWERLINE=false

# Recognize the depreciated _PROMPT_BUILTIN_FASTER_GIT option
if [[ ${_PROMPT_BUILTIN_FASTER_GIT} = true ]]; then
	_GIT_IS_SLOW=true
fi
# END_BASHRC_CONFIG

# Determine our kernel name
_KERNEL_NAME=$(printf '%.5s' "$(command uname -s)")

#######################################################
# Add Common Binary Directories to Path
#######################################################

# Add directories to the end of the path if they exist and are not already in the path
# Link: https://superuser.com/questions/39751/add-directory-to-path-if-its-not-already-there
function pathappend() {
	for ARG in "$@"; do
		if [[ -d "${ARG}" ]] && [[ ":${PATH}:" != *":${ARG}:"* ]]; then
			PATH="${PATH:+"${PATH}:"}${ARG}"
		fi
	done
}

# Add directories to the beginning of the path if they exist and are not already in the path
function pathprepend() {
	for ((i = $#; i > 0; i--)); do
		ARG="${!i}"
		if [[ -d "${ARG}" ]] && [[ ":${PATH}:" != *":${ARG}:"* ]]; then
			PATH="${ARG}${PATH:+":${PATH}"}"
		fi
	done
}

# Append to an existing alias or otherwise create the new alias
aliasappend() {
	# Display help if less than two arguments are provided
	if [[ "$#" -lt 2 ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}aliasappend${RESET}: Append an argument to an existing alias or create a new one"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}aliasappend${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}alias_name${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}argument${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}aliasappend${RESET} ${BRIGHT_YELLOW}grep '--color=auto'${RESET}"
		return 2
	fi

	if alias "${1}" &>/dev/null; then
		# Extract the alias value, ensuring it is correctly handled
		local ALIAS_VALUE=$(alias "${1}" | sed -E "s/^alias ${1}='(.*)'$/\1/")

		# Check if the alias already contains the argument we want to append
		if [[ "${ALIAS_VALUE}" != *"${2}"* ]]; then
			# Correctly append the argument and redefine the alias with proper quoting
			alias "${1}"="${ALIAS_VALUE} ${2}"
		fi
	else
		# If the command is not an alias, create a new one with the provided argument
		alias "${1}"="${1} ${2}"
	fi
}

# Add the most common personal binary paths located inside the home folder
# (these directories are only added if they exist)
pathprepend "${HOME}/bin" "${HOME}/sbin" "${HOME}/.local/bin" "${HOME}/local/bin" "${HOME}/.bin"

# Check for the Rust package manager binary install location
# Link: https://doc.rust-lang.org/cargo/index.html
pathappend "${HOME}/.cargo/bin" "/root/.cargo/bin" "${HOME}/go/bin"

# If the GOPATH environment variable is not set and the go command exists...
if hascommand --strict go && [[ -z ${GOPATH+x} ]] && [[ -d "${HOME}/go" ]]; then
	# Set GOPATH to the default directory
	export GOPATH="${HOME}/go"
fi

#######################################################
# User Specific Environment Variables
#######################################################

if [[ -f "${HOME}/.envrc" ]]; then
	builtin source "${HOME}/.envrc"
fi

if [[ -f "${HOME}/.env" ]]; then
	builtin source "${HOME}/.env"
fi

# Where the framework files are installed
# AUR/opt installs set this externally; standalone installs use the XDG default
BASHRC_INSTALL_DIR="${BASHRC_INSTALL_DIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/bashrc}"

# If installed via package manager but not yet configured, nudge the user
if [[ "${BASHRC_INSTALL_DIR}" == "/opt/"* ]] && [[ ! -f "${HOME}/.config/bashrc/.installed" ]]; then
	echo ""
	echo "Extreme Ultimate .bashrc is installed but not yet configured."
	echo "Run: setup-bashrc"
	echo ""
	echo "To restore your original .bashrc instead:"
	echo "  mv ~/.bashrc.backup.* ~/.bashrc"
	echo ""
fi

if [[ -f "${BASHRC_INSTALL_DIR}/config" ]]; then
	builtin source "${BASHRC_INSTALL_DIR}/config"
fi

#######################################################
# Bashrc Support
#######################################################

# Searches for text inside within the ~/.bashrc file
function findbashrc() {
	# Display help if no arguments are provided
	if [[ "$#" -eq 0 ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}findbashrc${RESET}: Search for text inside ~/.bashrc"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}findbashrc${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}pattern${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}pattern2${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}...${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findbashrc${RESET} ${BRIGHT_YELLOW}'alias'${RESET}            ${BRIGHT_BLUE}# Find all alias lines${RESET}"
		echo -e "  ${BRIGHT_CYAN}findbashrc${RESET} ${BRIGHT_YELLOW}'function' 'edit'${RESET}  ${BRIGHT_BLUE}# Filter by multiple patterns${RESET}"
		return 2
	fi

	# Start with the initial grep with a case-insensitive search
	local RESULT="$(grep --color=always -n -i -e "$1" "${HOME}/.bashrc")"

	# Loop through all additional arguments to further filter the results
	local ARGUMENT
	for ARGUMENT in "${@:2}"; do
		RESULT="$(echo "${RESULT}" | grep --color=always -i -e "${ARGUMENT}")"
	done

	# Output the results
	if [ -z "${RESULT}" ]; then
		echo -e "${BRIGHT_RED}Error:${BRIGHT_CYAN} No matches found for specified patterns${RESET}"
		return 1
	else
		echo "${RESULT}"
	fi
}

# Opens ~/.bashrc in the default editor or searches it for provided patterns
alias ebrc='editbashrc'
function editbashrc() {
	if [ $# -eq 0 ]; then
		# If no arguments, open ~/.bashrc with the default editor
		edit "${HOME}/.bashrc"
	else
		# Call findbashrc with all arguments passed to editbashrc
		findbashrc "$@"
	fi
}

# Change into the bashrc directory
function bashrc() {
	if [[ $# -eq 0 ]]; then
		# Set the target directory
		local TARGET_DIR="${BASHRC_INSTALL_DIR}"

		# Check if target directory exists
		if [[ -d "${TARGET_DIR}" ]]; then
			# Check for the presence of specific files or a non-empty subdirectory
			if [[ -f "${TARGET_DIR}/aliases" ]] || \
			[[ -f "${TARGET_DIR}/bashhelp" ]] || \
			[[ -f "${TARGET_DIR}/config" ]] || \
			[[ -f "${TARGET_DIR}/help" ]] || \
			[[ -f "${TARGET_DIR}/README.md" ]] || \
			[[ -f "${TARGET_DIR}/README.html" ]] || \
			( [[ -d "${TARGET_DIR}/bashrc.d" ]] && \
			[[ "$(ls -A "${TARGET_DIR}/bashrc.d")" ]] ); then
				cd "${TARGET_DIR}"
			else
				cd "${HOME}"
			fi
		else
			cd "${HOME}"
		fi
	else
		# Call findbashrc with all passed parameters
		findbashrc "$@"
	fi
}

# Create an alias to reload this .bashrc file
alias {rbrc,reloadbashrc,bashrcreload}='command clear; builtin source ~/.bashrc'

# Find the help file for this .bashrc file (type hlp or press CONTROL-H)
if [[ -f "${BASHRC_INSTALL_DIR}/help" ]]; then
	_BASHRC_HELP="${BASHRC_INSTALL_DIR}/help"
	if [[ ${_SKIP_HELP_KEYBIND} == false ]]; then
		bind -x '"\C-h":"less -f -r -n -S \"${_BASHRC_HELP}\""'
	fi
elif [[ -f "${HOME}/.bashrc_help" ]]; then
	_BASHRC_HELP="${HOME}/.bashrc_help"
	if [[ ${_SKIP_HELP_KEYBIND} == false ]]; then
		bind -x '"\C-h":"less -f -r -n -S \"${_BASHRC_HELP}\""'
	fi
fi

# Alias to edit the global bashrc if it exists using the same aliases upper case
if [[ -f "/etc/bash.bashrc" ]]; then
	alias {EBRC,EDITBASHRC}='sudoedit /etc/bash.bashrc'
fi

# Alias to show the help file
alias hlp='command less -f -r -n -S "${_BASHRC_HELP}"'

# Exports a new config file for bashrc with environment variable settings
function bashrcnewconfig() {
	# Help message remains the same
	if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}bashrcnewconfig${RESET}: Export a new config file with environment variable settings"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}bashrcnewconfig${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}--test${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Options:${RESET}"
		echo -e "  ${BRIGHT_GREEN}--test${RESET}, ${BRIGHT_GREEN}-t${RESET}  Output config to stdout instead of file"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}bashrcnewconfig${RESET}         ${BRIGHT_BLUE}# Write to config file${RESET}"
		echo -e "  ${BRIGHT_CYAN}bashrcnewconfig${RESET} ${BRIGHT_GREEN}--test${RESET}  ${BRIGHT_BLUE}# Preview in terminal${RESET}"
		return 0
	fi

	# Determine if we're testing (outputting to stdout) or writing to file
	local OUTPUT_TO_FILE=true
	if [[ "$1" == "--test" ]] || [[ "$1" == "-t" ]] || [[ "$1" == "--testing" ]]; then
		OUTPUT_TO_FILE=false
	fi

	# Determine config path (only needed if writing to file)
	local CONFIG_PATH
	if ${OUTPUT_TO_FILE}; then
		if [[ -f "${HOME}/.envrc" ]]; then
			CONFIG_PATH="${HOME}/.envrc"
		elif [[ -f "${HOME}/.env" ]]; then
			CONFIG_PATH="${HOME}/.env"
		else
			mkdir -p "${BASHRC_INSTALL_DIR}"
			CONFIG_PATH="${BASHRC_INSTALL_DIR}/config"
		fi

		# Check if file exists and prompt for overwrite
		if [[ -f "${CONFIG_PATH}" ]]; then
			if ! ask "File ${CONFIG_PATH} already exists. Overwrite?" "N"; then
				echo "Operation cancelled."
				return 1
			fi
		fi
	fi

	# Function to write content (either to file or stdout)
	write_content() {
		if ${OUTPUT_TO_FILE}; then
			cat > "${CONFIG_PATH}"
		else
			cat
		fi
	}

	# Generate the content
	{
		cat << 'EOL'
#!/usr/bin/env bash
#######################################################
# Extreme Ultimate .bashrc Environment Variables
# ~/.env
# ~/.envrc
# ~/.config/bashrc/config
# NOTE: Type env to see a list of set variables
#######################################################

# Alias to edit this file
alias ebe="edit ${BASH_SOURCE}"

#######################################################
# Set/override the default editor
# Examples: vim, nvim, emacs, nano, micro, helix, pico
# or gui apps like kate, geany, gedit, notepadqq, or vscodium
# NOTE: In Git Bash, you can use something like "/c/Program\ Files/Notepad++/notepad++.exe"
#######################################################
EOL

		# Extract and modify editor config section (between sentinel markers)
		sed -n '/^# BEGIN_EDITOR_CONFIG$/,/^# END_EDITOR_CONFIG$/{//d;p;}' "${BASH_SOURCE}" | sed 's/^[[:space:]]*//' | while IFS= read -r LINE; do
			if [[ "${LINE}" == *"export EDITOR"* ]] && [[ "${LINE}" != *"="* ]]; then
				echo '# export EDITOR="nano"'
			elif [[ "${LINE}" == *"export"* ]]; then
				echo "# ${LINE}"
			else
				echo "${LINE}"
			fi
		done

		# Add separator
		echo "#######################################################"
		echo "# Extreme Ultimate .bashrc Configuration"
		echo "#######################################################"

		# Extract and modify the config section (between sentinel markers)
		sed -n '/^# BEGIN_BASHRC_CONFIG$/,/^# END_BASHRC_CONFIG$/{//d;p;}' "${BASH_SOURCE}" | while IFS= read -r LINE; do
			if [[ "${LINE}" == "_BDAY_FILE="* ]]; then
				echo "# _BDAY_FILE="
			else
				echo "${LINE}"
			fi
		done
	} | write_content

	if ${OUTPUT_TO_FILE}; then
		echo "Configuration exported successfully to: ${CONFIG_PATH}"
	fi
}

#######################################################
# Use these commands to keep the .bashrc immutable and write protected
# even from root so that other scripts and applications can't change it
#######################################################

alias bashrcprotect="sudo chattr +i ${HOME}/.bashrc"
alias bashrcunprotect="sudo chattr -i ${HOME}/.bashrc"
alias bashrccheckprotect='if [[ $(lsattr -R -l ~/.bashrc | grep " Immutable") ]]; then echo "Protected"; else echo "Not Protected"; fi;'

#######################################################
# Bashrc Updates
#######################################################

# Update the main .bashrc file and supporting files
alias bashrcupdateforce="download 'https://sourceforge.net/projects/ultimate-bashrc/files/_bashrc/download' '${HOME}' && command mv --interactive '${HOME}/_bashrc' '${HOME}/.bashrc'"
function bashrcupdate() {

	# If installed via package manager, redirect to the package manager
	if [[ "${BASHRC_INSTALL_DIR}" == "/opt/"* ]]; then
		echo -e "${BRIGHT_YELLOW}This installation is managed by your package manager.${RESET}"
		if hascommand yay; then
			echo -e "${BRIGHT_YELLOW}Run: ${BRIGHT_CYAN}yay -Syu extreme-ultimate-bashrc${RESET}"
		elif hascommand paru; then
			echo -e "${BRIGHT_YELLOW}Run: ${BRIGHT_CYAN}paru -Syu extreme-ultimate-bashrc${RESET}"
		else
			echo -e "${BRIGHT_YELLOW}Run: ${BRIGHT_CYAN}pacman -Syu extreme-ultimate-bashrc${RESET}"
		fi
		return 0
	fi

	# Files to update
	declare -A FILES_TO_UPDATE=(
		["${HOME}/.bashrc"]="https://sourceforge.net/projects/ultimate-bashrc/files/_bashrc/download"
		["${HOME}/.bashrc_help"]="https://sourceforge.net/projects/ultimate-bashrc/files/_bashrc_help/download"
		["${BASHRC_INSTALL_DIR}/help"]="https://sourceforge.net/projects/ultimate-bashrc/files/_bashrc_help/download"
		["${HOME}/README.md"]="https://sourceforge.net/projects/ultimate-bashrc/files/README.md/download"
		["${BASHRC_INSTALL_DIR}/README.md"]="https://sourceforge.net/projects/ultimate-bashrc/files/README.md/download"
		["${HOME}/README.html"]="https://sourceforge.net/projects/ultimate-bashrc/files/README.html/download"
		["${BASHRC_INSTALL_DIR}/README.html"]="https://sourceforge.net/projects/ultimate-bashrc/files/README.html/download"
	)

	if ! hascommand axel && ! hascommand aria2c && ! hascommand curl && ! hascommand wget; then
		if hascommand --strict xdg-open; then
			xdg-open "https://sourceforge.net/projects/ultimate-bashrc/files/" > /dev/null 2>&1 & disown
		elif hascommand --strict open; then  # For macOS
			open "https://sourceforge.net/projects/ultimate-bashrc/files/" > /dev/null 2>&1 & disown
		elif hascommand --strict start; then  # For Windows
			start "" "https://sourceforge.net/projects/ultimate-bashrc/files/"
		else
			echo -e "${BRIGHT_YELLOW}Please install either wget, curl, aria2, or visit ${BRIGHT_CYAN}https://sourceforge.net/projects/ultimate-bashrc/${BRIGHT_YELLOW} to update.${RESET}"
		fi
		return
	fi

	# Backup the existing ~/.bashrc with a time date stamp
	local BASHRC_BACKUP_FILE="${HOME}/.bashrc.$(date +"%Y-%m-%d_%H-%M-%S").backup"
	echo -e "${BRIGHT_YELLOW}Backing up your .bashrc file to ${BRIGHT_CYAN}${BASHRC_BACKUP_FILE}${RESET}"
	command cp "${HOME}/.bashrc" "${BASHRC_BACKUP_FILE}" || {
		echo -e "${BRIGHT_RED}Backup of .bashrc failed. Please check your permissions and disk space.${RESET}"
		return 1
	}

	# Create a temporary directory for downloads
	# NOTE: Using _UPDATE_TMPDIR to avoid shadowing the global $TMPDIR env var
	local _UPDATE_TMPDIR=$(mktemp -d)
	if [[ ! -d "${_UPDATE_TMPDIR}" ]] || [[ -z "${_UPDATE_TMPDIR}" ]]; then
		echo -e "${BRIGHT_RED}Failed to create a temporary directory. Check your system's temporary storage settings.${RESET}"
		return 1
	fi
	# Use RETURN trap (not EXIT) so cleanup happens when the function returns,
	# not when the entire shell exits (when local vars are out of scope)
	trap 'rm -rf "${_UPDATE_TMPDIR}"' RETURN

	# Loop through each file
	for FILE in "${!FILES_TO_UPDATE[@]}"; do

		# Get the download URL
		local URL="${FILES_TO_UPDATE[${FILE}]}"

		# If the file exists or it's the .bashrc which we will always update...
		if [[ -f "${FILE}" ]] || [[ "$(command basename "${FILE}")" == ".bashrc" ]]; then

			# Remove immutable attribute if set
			local IS_IMMUTABLE=false
			if hascommand lsattr && hascommand chattr && command lsattr -R -l "${FILE}" 2>/dev/null | command  grep -q "Immutable"; then
				echo -e "${BRIGHT_YELLOW}Removing immutable attribute from ${FILE}${RESET}"
				sudo chattr -i "${FILE}"
				IS_IMMUTABLE=true
			fi

			# Ensure temporary directory is empty
			command rm -f "${_UPDATE_TMPDIR}"/*

			# Download to temporary directory
			echo "Updating ${FILE}"
			download "${URL}" "${_UPDATE_TMPDIR}" || {
				echo -e "${BRIGHT_RED}Failed to download ${FILE}${RESET}"
				continue
			}

			# Now find the file that was just downloaded
			local DOWNLOADED_FILE=$(command find "${_UPDATE_TMPDIR}" -type f -exec ls -1t {} + | command head -n1)

			# Move downloaded file to the desired location
			if [[ -f "${DOWNLOADED_FILE}" ]]; then
				command mv "${DOWNLOADED_FILE}" "${FILE}"
				echo -e "${BRIGHT_GREEN}Updated ${FILE} successfully${RESET}"
			else
				echo -e "${BRIGHT_RED}Download failed or file not found for ${FILE}${RESET}"
			fi

			# If this is the .bashrc file, make sure it does not contain errors!
			if [[ "$(command basename "${FILE}")" == ".bashrc" ]]; then
				bash -n "${HOME}/.bashrc"
				if [ $? -ne 0 ]; then
					echo -e "${BRIGHT_RED}New .bashrc contains errors, reverting backup.${RESET}"
					command mv "${BASHRC_BACKUP_FILE}" "${HOME}/.bashrc"
					return 1
				fi
			fi

			# Restore the immutable flag if it was removed
			if [[ "${IS_IMMUTABLE}" == true ]]; then
				echo -e "${BRIGHT_YELLOW}Restoring immutable attribute to ${FILE}${RESET}"
				sudo chattr +i "${FILE}"
			fi
		fi
	done

	echo -e "${BRIGHT_GREEN}Done!${RESET} ${BRIGHT_MAGENTA}Restart your terminal to see the changes.${RESET}"
}

#######################################################
# Change the default file and directory permissions for newly created files
# in the home directory for security (also see fixuserhome function)
#######################################################

# Only if we are not the root user...
if [[ ${_SKIP_UMASK_HOME} == false ]] && [[ ${EUID} -ne 0 ]]; then
	# Set to umask 027 while leaving execute for directories
	# - Grant full permissions to the user (owner)
	# - Grant read and execute permissions to the group
	# - Remove all permissions for others
	umask u=rwx,g=rx,o=
fi

#######################################################
# General Aliases
# NOTE: To temporarily bypass an alias, we proceed the command with a \
# EG: if the ls command is aliased, to use the normal command you would type \ls
#######################################################

# Find text in man pages
alias findman='apropos'

# Find environment variables
alias findenv='printenv | grep -i'

# List available aliases with optional filter parameter
function findalias() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}findalias${RESET}: Search through defined aliases"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}findalias${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}pattern${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findalias${RESET}          ${BRIGHT_BLUE}# List all aliases${RESET}"
		echo -e "  ${BRIGHT_CYAN}findalias${RESET} ${BRIGHT_GREEN}git${RESET}      ${BRIGHT_BLUE}# Find git-related aliases${RESET}"
		echo -e "  ${BRIGHT_CYAN}findalias${RESET} ${BRIGHT_GREEN}'ls|ll'${RESET}  ${BRIGHT_BLUE}# Regex pattern${RESET}"
		return 0
	fi

	# Assign the first argument to FILTER for filtering the output
	local FILTER="${1}"

	# Print the section heading for aliases
	echo -e "${BRIGHT_RED}Aliases:${RESET}"

	# List all aliases, format and color their output, then apply the filter
	alias | awk -F'[ =]' '{print "\033[33m"$2"\033[0m\t\033[34m"$0"\033[0m";}' | grep -E "${FILTER}"
}

# List available functions with optional filter parameter
function findfunction() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}findfunction${RESET}: Search through defined functions"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}findfunction${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}pattern${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findfunction${RESET}       ${BRIGHT_BLUE}# List all functions${RESET}"
		echo -e "  ${BRIGHT_CYAN}findfunction${RESET} ${BRIGHT_GREEN}git${RESET}   ${BRIGHT_BLUE}# Find git-related functions${RESET}"
		echo -e "  ${BRIGHT_CYAN}findfunction${RESET} ${BRIGHT_GREEN}find${RESET}  ${BRIGHT_BLUE}# Find search functions${RESET}"
		return 0
	fi

	# Assign the first argument to FILTER for filtering the output
	local FILTER="${1}"

	# Print the section heading for functions
	echo -e "${BRIGHT_RED}Functions:${RESET}"

	# List all user-defined functions, filter out private ones starting with
	# an underscore, and apply the filter
	compgen -A function | grep -v '^_.*' | grep -E "${FILTER}"
}

# Show a list of available aliases and functions with optional filtering
function a() {
	# Store the first argument to FILTER
	local FILTER="${1}"

	# Combine the output of aliases and functions with optional filtering
	{ findalias "${FILTER}"; echo; findfunction "${FILTER}"; } | command less --line-numbers --no-init
}

#######################################################
### DIRECTORY ALIASES
#######################################################

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it
# regardless of the directory you're in like this:
# export desktop="${HOME}/Desktop"
# cd desktop
shopt -s cdable_vars

# Declare an associative array for directory locations (with alternatives)
# NOTE: These aliases are case sensitive where lower case is the local user
#       directory and upper case is the global system directory
declare -A ALIASES=(
	["autostart"]="${XDG_CONFIG_HOME:-${HOME}/.config}/autostart"
	["bin"]="${HOME}/.local/bin"
	["BIN"]="/usr/bin"
	["cache"]="${XDG_CACHE_HOME:-${HOME}/.cache}"
	["config"]="${XDG_CONFIG_HOME:-${HOME}/.config}"
	["CONFIG"]="/etc"
	["desktop"]="$(command -v xdg-user-dir > /dev/null && xdg-user-dir DESKTOP || echo "${HOME}/Desktop")"
	["docs"]="$(command -v xdg-user-dir > /dev/null && xdg-user-dir DOCUMENTS || echo "${HOME}/Documents")"
	["documents"]="$(command -v xdg-user-dir > /dev/null && xdg-user-dir DOCUMENTS || echo "${HOME}/Documents")"
	["DOCS"]="/usr/local/man /usr/local/share/man /usr/share/man"
	["downloads"]="$(command -v xdg-user-dir > /dev/null && xdg-user-dir DOWNLOAD || echo "${HOME}/Downloads")"
	["fonts"]="${XDG_DATA_HOME:-${HOME}/.local/share}/fonts ${HOME}/.fonts"
	["FONTS"]="/usr/share/fonts"
	["icons"]="${XDG_DATA_HOME:-${HOME}/.local/share}/icons ${HOME}/.icons"
	["ICONS"]="/usr/share/icons"
	["music"]="$(command -v xdg-user-dir > /dev/null && xdg-user-dir MUSIC || echo "${HOME}/Music")"
	["pics"]="$(command -v xdg-user-dir > /dev/null && xdg-user-dir PICTURES || echo "${HOME}/Pictures")"
	["pictures"]="$(command -v xdg-user-dir > /dev/null && xdg-user-dir PICTURES || echo "${HOME}/Pictures")"
	["share"]="${XDG_DATA_HOME:-${HOME}/.local/share}"
	["SHARE"]="/usr/share"
	["shortcuts"]="${XDG_DATA_HOME:-${HOME}/.local/share}/applications ${HOME}/.gnome/apps"
	["SHORTCUTS"]="/usr/share/applications /usr/local/share/applications"
	["themes"]="${HOME}/.themes ${XDG_DATA_HOME:-${HOME}/.local/share}/themes"
	["THEMES"]="/usr/share/themes"
	["tmp"]="${HOME}/tmp ${XDG_CACHE_HOME:-${HOME}/.cache}/tmp ${XDG_CACHE_HOME:-${HOME}/.cache}"
	["TMP"]="${TMPDIR:-/tmp}"
	["videos"]="$(command -v xdg-user-dir > /dev/null && xdg-user-dir VIDEOS || echo "${HOME}/Videos")"
	["wallpaper"]="${XDG_DATA_HOME:-${HOME}/.local/share}/wallpapers"
	["WALLPAPER"]="/usr/share/backgrounds /usr/share/wallpapers"
	["web"]="/srv/http /var/www/html /usr/share/nginx/html /opt/lampp/htdocs /usr/local/apache2/htdocs /usr/local/www/apache24/data"
)

# Save original IFS and set it to space for parsing directories
OLD_IFS="${IFS}"
IFS=' '

# Loop through the associative array and create aliases and exports for existing directories
for ALIAS in "${!ALIASES[@]}"; do
	DIRECTORIES=(${ALIASES[${ALIAS}]})
	for DIRECTORY in "${DIRECTORIES[@]}"; do
		if [[ -d "${DIRECTORY}" ]]; then
			alias "${ALIAS}"="cd \"${DIRECTORY}\""
			export "${ALIAS}"="${DIRECTORY}"
			break # Only set the first found directory
		fi
	done
done

# Restore original IFS
IFS="${OLD_IFS}"

# Clean up
unset OLD_IFS DIRECTORY DIRECTORIES ALIAS ALIASES

#######################################################
### GIT ALIASES
#######################################################

# If git is installed...
if hascommand --strict git; then

	# Git Alias: Provides many useful Git alias commands
	# This alias will install/update the Git alias commands file
	# Link: https://github.com/GitAlias/gitalias
	# Edit ~/.gitconfig and then include the path to this file like this:
	# [include]
	# path = gitalias.txt
	alias gitalias='curl -L --output "${HOME}/gitalias.txt" https://raw.githubusercontent.com/GitAlias/gitalias/main/gitalias.txt && git config --global include.path "gitalias.txt"'

	# When invoked without arguments gg will do a short Git status,
	# otherwise it will just pass on the given arguments to the Git command.
	# Status is likely to be the Git command one will execute the most,
	# hence this simple enhancement does prove very useful in practice.
	# - `??`: Untracked file (not in the repository)
	# - `A`: Added to the index (staged for commit)
	# - `M`: Modified (changes not staged for commit)
	# - `D`: Deleted (deleted but not staged for commit)
	# - `R`: Renamed (file has been renamed, not staged for commit)
	# - `C`: Copied (file has been copied, not staged for commit)
	# - `U`: Unmerged (conflict in merging changes)
	# - `!!`: Ignored (file is ignored by Git)
	# - `1`: Index and working tree match (status for submodules)
	# - `2`: Working tree changed but index not updated (status for submodules)
	# - `?`: Unknown (an error occurred while trying to obtain the status)
	# git status --short --branch
	function gg() {
		# Check if the number of arguments is zero
		if [[ $# -eq 0 ]]; then
			# Call gitls when no arguments are provided
			gitls
		else
			# Pass all arguments to the 'git' command
			git "$@"
		fi
	}

	# All Git aliases start with gg for speed
	alias ggg='git status'                    # Standard git status
	alias ggs='git status --short --branch'   # Compact status with branch info
	alias ggf='git fetch'                     # Fetch changes from remote
	alias ggprune='git fetch --prune'         # Remove references to deleted remote branches
	alias ggp='git pull'                      # Fetch and merge changes
	alias ggpu='git push'                     # Push changes to remote
	alias ggm='git merge'                     # Merge branches
	alias ggri='git rebase --interactive'     # Start interactive rebase
	alias ggsquash='git reset $(git merge-base $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@") $(git branch --show-current)) && \
		git add --all && \
		git commit --message "Squashed commits"' # Reset to default branch base and squash all commits

	# Branch operations
	alias ggb='gitbranch'                     # Change branch (custom function)
	alias gg-='git checkout -'                # Switch to previous branch
	alias ggback='git checkout HEAD~'         # Go back one commit
	alias ggcb='git checkout -b'              # Create new branch
	alias ggcbforce='git checkout -B'         # Create/reset branch
	alias ggbdelete='ask "Are you sure you want to delete this branch? This cannot be undone." N || { echo "Canceled"; false; } && git branch -D' # Safe branch deletion
	alias {gglb,ggbl}='git for-each-ref --sort=-committerdate refs/heads/ \
		--format="%(committerdate:short) %(refname:short)" | head -n 25' # List branches sorted by last commit date
	alias ggsb='git for-each-ref --format="%(refname:short)" refs/heads refs/remotes | sed "s/origin\///" | sort -u | grep -i' # Search branch names

	# Staging and committing
	alias gga='git add'                       # Stage files
	alias ggaa='git add --patch'              # Interactive staging
	alias ggac='git add --all && git commit --verbose --message' # Stage all and commit
	alias ggua='git reset'                    # Unstage files
	alias ggundo='git reset --soft HEAD~1'    # Undo last commit, keep changes staged
	alias ggr='git restore'                   # Restore files to HEAD
	alias ggrm='git rm'                       # Remove and stage deletion
	alias ggc='git commit --verbose -m'       # Commit with message
	alias ggca='git commit --amend --verbose' # Modify last commit

	# Searching and diffing
	alias ggfind='git log --pretty=format:"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]" --grep' # Search commit messages
	alias ggd='git diff'                      # Show unstaged changes
	alias ggdc='git diff --cached'            # Show staged changes
	alias ggdd='git remote update > /dev/null 2>&1 && \
		git status -uno | grep -q "Your branch is behind" && \
		git fetch origin; \
		git diff origin/$(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")..HEAD' # Compare with default branch

	alias ggds='git diff --stat'              # Show changed files stats

	# Stash operations
	alias ggst='git stash'                    # Stash changes
	alias ggsta='git stash --patch'           # Interactive stash
	alias ggpop='git stash pop'               # Apply stashed changes
	alias ggstlist='git stash list'           # List stashes

	# Repository information
	alias ggls='git ls-files'                 # List all tracked files
	alias ggrv='git remote --verbose'         # List remote repositories
	alias gglast='git show --stat'            # Show last commit changes

	# Git alias for log tailored for local projects or office use
	# Reference for Git Pretty Formats:
	# - %h:  Abbreviated commit hash
	# - %ad: Author date (format can be customized)
	# - %s:  Commit summary
	# - %b:  Body of the commit message.
	# - %an: Author name
	# - %ae: Author email
	# - %cn: Committer's name (the person who applied the commit)
	# - %ce: Committer's email
	# - %d:  Ref names (branches or tags associated with the commit)
	# - %H:  Commit hash
	# - %h:  Abbreviated commit hash
	# - %p:  Parent hashes of a commit (useful for merge commits)
	# - %G?: GPG signature status code
	# - %GS: GPG signature’s signer
	alias ggl='git log --oneline --date=short --decorate --pretty=format:"%C(magenta)%h%C(reset) - %C(green)(%cr)%C(reset) %s%C(auto)%d%C(reset) %C(bold brightblue)<%an>%C(reset)"'

	# Git alias for more detailed list log that is better for online collaberation
	# The last 1 character field is the GPG signature for the commit
	# - G: Good signature
	# - B: Bad signature
	# - U: Good signature with unknown validity
	# - X: Good signature that has expired
	# - Y: Good signature made by an expired key
	# - R: Good signature made by a revoked key
	# - E: Signature cannot be checked (e.g., missing key)
	# - N: No signature
	alias ggll='git log --graph --topo-order --date=iso8601-strict --no-abbrev-commit --decorate --all --boundary --pretty=format:"%C(green)%ad %C(magenta)%h%Creset -%C(auto)%d%Creset %s %C(brightblue)[%aN <%aE>]%C(cyan)(%cN)%C(reset) %C(brightyellow)%G?%C(reset)"'

	# Vacuum the local Git repository database, reduce it's size, and clean out logs
	# Link: https://stackoverflow.com/questions/2116778/reduce-git-repository-size
	alias ggclean='git reflog expire --all --expire=now && git gc --prune=now --aggressive'

	# Check PHP syntax on all modified and untracked PHP files in the current branch
	# Useful for catching syntax errors before committing
	function phpcheckbranch() {
		# Get all modified PHP files (staged + unstaged changes)
		local PHP_FILES=$(git diff --name-only HEAD 2>/dev/null | grep '\.php$')

		# Get all untracked PHP files (new files not yet added to git)
		local UNTRACKED=$(git ls-files --others --exclude-standard 2>/dev/null | grep '\.php$')

		# Combine modified and untracked files into one list
		if [[ -n "${UNTRACKED}" ]]; then
			if [[ -n "${PHP_FILES}" ]]; then
				PHP_FILES=$(printf "%s\n%s" "${PHP_FILES}" "${UNTRACKED}")
			else
				PHP_FILES="${UNTRACKED}"
			fi
		fi

		# Exit early if no PHP files found
		if [[ -z "${PHP_FILES}" ]]; then
			echo -e "${BRIGHT_YELLOW}No modified PHP files found${RESET}"
			return 0
		fi

		# Track results
		local FAILED=0
		local TOTAL=0

		# Check each PHP file using the phpcheck function
		while IFS= read -r FILE; do
			if [[ -f "${FILE}" ]]; then
				((TOTAL++))
				phpcheck "${FILE}"
				if [[ $? -ne 0 ]]; then
					((FAILED++))
				fi
				echo ""  # Add spacing between file checks
			fi
		done <<< "${PHP_FILES}"

		# Print summary
		echo -e "${BRIGHT_CYAN}════════════════════════════════${RESET}"
		if [[ ${FAILED} -gt 0 ]]; then
			echo -e "${BRIGHT_RED}✗ Failed: ${FAILED}/${TOTAL} file(s)${RESET}"
			return 1
		else
			echo -e "${BRIGHT_GREEN}✓ All ${TOTAL} PHP file(s) passed!${RESET}"
			return 0
		fi
	}

	# Find all Git repos in the current directory recursively
	# Note: Excludes hidden and temp directories
	# You can find all git repos on the entire system using: locate .git | grep "/.git$"
	alias gitrepos="find . -type d -not -path '*/.git/*' -not -path '*/tmp/*' -not -path '*/temp/*' -not -path '*/.*' -exec test -e '{}/.git' ';' -print -prune"

	# Git Auto-Completion
	# Link: https://github.com/git/git/tree/master/contrib/completion
	# Install: wget -O ~/git-completion.bash https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
	if [[ -f "${HOME}/git-completion.bash" ]]; then
		builtin source "${HOME}/git-completion.bash"
	fi

	# If eza with Git support is installed...
	# Link: https://eza.rocks
	if hascommand --strict eza; then

		# If Git is not slow, always use the eza Git repo flag globally
		if [[ ${_GIT_IS_SLOW} == false ]]; then
			alias {eza,exa}='command eza --git'
		else
			alias {eza,exa}='command eza --git --git-repos-no-status'
		fi

		if [[ ${_SKIP_EXA} == false ]]; then
			alias lsg='eza --long --all --links --group --modified --classify --group-directories-first --color=auto --color-scale'
		fi

	# If exa with Git support is installed...
	# Link: https://github.com/ogham/exa
	elif hascommand --strict exa; then

		# Add Git support to Exa only if Git is not slow
		if [[ ${_GIT_IS_SLOW} == false ]]; then
			alias exa='command exa --git'
		fi

		if [[ ${_SKIP_EXA} == false ]]; then
			alias lsg='exa --long --all --links --group --modified --classify --group-directories-first --color=auto --color-scale'
		fi
	fi

	# If lsd with Git support is installed...
	# Link: https://github.com/Peltoche/lsd
	if hascommand --strict lsd; then
		# Add icons if unicode and the icon paramter is supported
		if [[ -n $(command lsd --help | grep -e '--git\s' 2> /dev/null) ]]; then
			alias lsd='command lsd --git'
		fi
	fi

	# Nearly everything you can do in Git but in a terminal UI
	# Link: https://github.com/Extrawurst/gitui
	if hascommand gitui; then
		alias ggu='gitui'
	fi

	# Tig ncurses-based text-mode interface for git
	# Link: https://jonas.github.io/tig/
	if hascommand tig; then
		alias gitt='tig'
	fi

	# Git Commander
	# Link: https://github.com/golbin/git-commander
	# Install: npm install -g git-commander
	if hascommand git-commander; then
		alias gitc='git-commander'
	fi

	# GRV - Git Repository Viewer
	# Link: https://github.com/rgburke/grv
	if hascommand grv; then
		alias gitrv='grv'
	fi

	# LazyGit - Terminal UI for git commands
	# Link: https://github.com/jesseduffield/lazygit
	if hascommand lazygit; then
		alias lg='lazygit'
	fi

	# Ugit - Git Undo
	# Link: https://github.com/Bhupesh-V/ugit
	# Install: sh -c "$(curl -fsSL https://raw.githubusercontent.com/Bhupesh-V/ugit/master/install)"
	if hascommand ugit; then
		alias {gitundo,ggundo}='ugit'
	fi

	# List Git files by last modified date
	# Link: https://stackoverflow.com/questions/14141344/git-status-list-last-modified-date
	alias gitmodifieddate='IFS=""; git status -s | while read -n2 mode; read -n1; read file; do echo "$mode" "$(stat -c %y "$file")" "$file"; done | sort -k1,4'

	# Returns you to the Git project's top level
	alias cg='cd "$(git rev-parse --show-toplevel)"'

	# Displays git status with human-readable descriptions aligned in columns
	function gitls() {
		local COUNT=0  # Will keep the file count
		local TOGGLE=0 # Toggle variable for alternating row colors

		# Getting the current branch name
		local CURRENT_BRANCH
		CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
		if [[ $? -ne 0 ]]; then
			echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Not a git repository ${BRIGHT_MAGENTA}(or any parent up to mount point /)${RESET}"
			return 1  # Return with an error status code
		fi
		echo -e "${BRIGHT_RED}Current branch: ${BRIGHT_WHITE}${CURRENT_BRANCH}${RESET}"

		# Storing the output of git status --porcelain in a variable
		local GIT_STATUS=$(git status --porcelain | sort -k1,1 -k2)
		if [[ -z "${GIT_STATUS}" ]]; then
			echo -e "${BRIGHT_CYAN}No changes found in the repository${RESET}"
			return 0  # Return with a success status code
		fi

		# Find the maximum length of the filenames
		local MAX_FILENAME_LENGTH=0
		local FILENAME FILENAME_LENGTH
		while IFS= read -r LINE; do
			FILENAME="${LINE:2}"
			FILENAME_LENGTH=${#FILENAME}
			# Compare the current filename length with the current max
			MAX_FILENAME_LENGTH=$((MAX_FILENAME_LENGTH < FILENAME_LENGTH ? FILENAME_LENGTH : MAX_FILENAME_LENGTH))
		done <<< "${GIT_STATUS}"

		# Cap the MAX_FILENAME_LENGTH at 80 if it exceeds it
		if [[ ${MAX_FILENAME_LENGTH} -gt 80 ]]; then
			MAX_FILENAME_LENGTH=80
		fi

		# Running git status with the porcelain flag
		local CODE DESCRIPTION COLOR BACKGROUND
		while IFS= read -r LINE; do
			# Count the files
			((COUNT++))

			# Extracting the status code and the file name
			CODE="${LINE:0:2}"
			FILENAME="${LINE:2}"; FILENAME="${FILENAME# }"

			# Matching the status code with the corresponding description
			DESCRIPTION=""
			case "${CODE}" in
				"??") DESCRIPTION="Untracked file (not in the repository)";;
				"A ") DESCRIPTION="Added (staged for commit)";;
				"AM") DESCRIPTION="Added (staged) with unstaged modifications";;
				"AD") DESCRIPTION="Added (staged) then deleted in working tree";;
				"M ") DESCRIPTION="Modified (staged for commit)";;
				"MM") DESCRIPTION="Modified (staged) with additional unstaged modifications";;
				" M") DESCRIPTION="Modified (changes not staged for commit)";;
				"D ") DESCRIPTION="Deleted (staged for commit)";;
				" D") DESCRIPTION="Deleted (not staged for commit)";;
				"R ") DESCRIPTION="Renamed (staged for commit)";;
				"C ") DESCRIPTION="Copied (staged for commit)";;
				"T ") DESCRIPTION="Type changed (staged for commit)";;
				"U ") DESCRIPTION="Unmerged (conflict in merging changes)";;
				"UU") DESCRIPTION="Unmerged (both modified -- merge conflict)";;
				"AA") DESCRIPTION="Unmerged (both added -- merge conflict)";;
				"DD") DESCRIPTION="Unmerged (both deleted -- merge conflict)";;
				"!!") DESCRIPTION="Ignored (file is ignored by Git)";;
				*)    DESCRIPTION="Status: ${CODE}";;
			esac

			# Determine if the file is a directory
			if [[ -d "${FILENAME}" ]]; then
				COLOR="${BRIGHT_BLUE}"
			else
				COLOR="${BRIGHT_YELLOW}"
			fi

			# Applying alternating background colors
			if [[ ${TOGGLE} -eq 0 ]]; then
				BACKGROUND="\033[100m" # Dark grey background
				TOGGLE=1
			else
				BACKGROUND="\033[49m"  # Default background
				TOGGLE=0
			fi

			# Printing the filename and description with the chosen colors
			printf "${BACKGROUND}${COLOR}%-*s${BRIGHT_CYAN}%s${RESET}\n" "${MAX_FILENAME_LENGTH}" "${FILENAME}" " ${DESCRIPTION}"

		# Loop through the next git status line
		done <<< "${GIT_STATUS}"

		# Printing the total count in purple and green
		echo -e "${MAGENTA}Total files:${RESET} ${COUNT}"
	}

	# Update all Git repositories in the specified directory with depth as a parameter
	function gitupdaterepos() {
		# Set the depth level for the search with 1 as default if not specified
		local DEPTH_LEVEL=${1:-1}

		# Check if the necessary commands (git, sed, sort) are available in the environment
		if hascommand git && hascommand sed && hascommand sort; then
			# Save the current directory to a variable
			local CURRENT_DIR=$(command pwd)

			# Alert the user to the current directory and the action to be taken
			echo -e "${BRIGHT_YELLOW}=>${RESET} You are about to update Git repositories in: ${CURRENT_DIR}"
			echo -e "${BRIGHT_BLUE}=>${RESET} Listed repositories:"

			# Use IFS and readarray to handle spaces in file paths properly
			local IFS=$'\n'
			local REPOS=()
			readarray -t REPOS < <(command find "${CURRENT_DIR}" -mindepth 1 -maxdepth $((DEPTH_LEVEL + 1)) -type d -name '.git' | command sed 's|/.git$||' | command sort -u)

			# Display the directories to be updated
			local REPO
			for REPO in "${REPOS[@]}"; do
				echo "${REPO}"
			done

			# Prompt the user for confirmation to proceed with updating
			local RESPONSE
			read -r -p "Are you sure you want to proceed? (y/N): " RESPONSE
			if [[ "${RESPONSE,,}" != "y" ]]; then
				echo -e "${BRIGHT_RED}=>${RESET} Update canceled"
				return
			fi

			# Iterate over each repository directory and attempt a 'git pull' operation
			local REPO_DIR
			for REPO_DIR in "${REPOS[@]}"; do
				builtin cd "${REPO_DIR}" || { echo -e "${BRIGHT_RED}=>${RESET} Error entering ${REPO_DIR}"; continue; }
				echo -e "${BRIGHT_YELLOW}=>${RESET} Updating Git repo in ${REPO_DIR}..."

				# Execute a git pull and display success or failure messages
				git pull && echo -e "${BRIGHT_GREEN}=>${RESET} Successfully updated ${REPO_DIR}" || echo -e "${BRIGHT_RED}=>${RESET} Failed to update ${REPO_DIR}"

				# Return to the original directory after each update
				builtin cd - > /dev/null
			done
		else
			# If required commands are not available, alert the user
			echo -e "${BRIGHT_RED}=>${RESET} Required commands Git, sed, and/or sort are not installed"
		fi
	}

	# Change the Git branch - If no branch is specified as an argument, then
	# the user is prompted to select from a list the available branches
	# Syntax: gitbranch [optional_branch_name]
	function gitbranch() {
		# Check if the current directory is a Git repository
		if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
			# No arguments passed
			if [[ $# -eq 0 ]]; then
				# Check if there is a remote server
				if git remote -v | grep -q 'origin'; then
					# Prompt the user for action
					if ask "${BRIGHT_WHITE}Download ${BRIGHT_YELLOW}remote${BRIGHT_WHITE} branch names?${BRIGHT_RED} Could be slow for large repos.${RESET}" N; then
						# Fetch latest remote branches; handle errors
						git fetch origin 2>&1
						local RAW_REMOTE_OUTPUT REMOTE_BRANCHES
						RAW_REMOTE_OUTPUT=$(git ls-remote --refs --sort=-committerdate origin 2>&1)
						if [[ $? -ne 0 ]]; then
							echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}${RAW_REMOTE_OUTPUT}${RESET}"
							return 1
						fi
						REMOTE_BRANCHES=$(echo "${RAW_REMOTE_OUTPUT}" | awk '{sub("refs/heads/", ""); print $2}')
						# Use createmenu for selection
						git checkout "$(echo "${REMOTE_BRANCHES}" | createmenu)"
					else
						# Use local branches for selection via createmenu
						git checkout "$(git branch --sort=-committerdate | cut -c 3- | createmenu)"
					fi
				else
					# No remote server, use local branches only
					git checkout "$(git branch --sort=-committerdate | cut -c 3- | createmenu)"
				fi
			else
				# Argument passed, just switch to that branch
				git checkout "${@}"
			fi
		else
			# Not a Git repo
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}Current directory is not a Git repository${RESET}"
		fi
	}

	# Forces Git to overwrite local files and resets the branch (or master)
	# Important: If you have any local changes, they will be lost (if they're tracked)!
	function gitresetbranch() {
		# Make sure we are in a Git repo
		if ! git rev-parse --git-dir > /dev/null 2>&1; then
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}Current directory is not a Git repository${RESET}"
			return 1
		fi

		# Default to current branch if not specified
		local BRANCH="${1:-$(git rev-parse --abbrev-ref HEAD)}"

		# Check if a branch name was provided, and confirm if using the current branch
		if [ -z "${BRANCH}" ]; then
			echo -e "${BRIGHT_RED}Operation cancelled.${RESET} ${BRIGHT_CYAN}Please specify a branch.${RESET}"
			return 1
		fi

		# Confirm action, as local changes will be lost
		echo -e "${BRIGHT_BLUE}Selected branch to reset is: ${BRIGHT_YELLOW}${BRANCH}${RESET}"
		if ask "${BRIGHT_RED}WARNING: ${BRIGHT_CYAN}If you have any local changes, they will be lost! ${BRIGHT_MAGENTA}Are you sure?${RESET}" 'N'; then
			git checkout "${BRANCH}" && git fetch --all && git reset --hard "origin/${BRANCH}"
		else
			echo -e "${BRIGHT_RED}Operation cancelled${RESET}"
			return 0
		fi
	}

	# Retrieve a specific version of a file from Git history
	function gitfileversion() {
		# Constants
		local NO_ARGS=0
		local NO_GIT_REPO_ERROR=1
		local NO_FILE_PATH_ERROR=2
		local FILE_NOT_IN_GIT_ERROR=3
		local NO_SELECTION_MADE=4

		# Display help
		function display_help() {
			echo -e "${BRIGHT_BLUE}Usage:${RESET} git_file_version ${BRIGHT_GREEN}<file path>${RESET} [${BRIGHT_YELLOW}output file${RESET}]"
			echo -e "${BRIGHT_BLUE}Description:${RESET} Retrieves a specific version of a file from Git history"
			echo -e "   ${BRIGHT_GREEN}<file path>${RESET}   - Path of the file in the Git repository"
			echo -e "   ${BRIGHT_YELLOW}<output file>${RESET} - Optional. Path to save the older version of the file. If not provided, copies to clipboard"
		}

		# Check for no arguments
		if [[ $# -eq ${NO_ARGS} ]]; then
			display_help
			return ${NO_ARGS}
		fi

		# Check if inside a Git repository
		if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}Not inside a Git repository${RESET}"
			return ${NO_GIT_REPO_ERROR}
		fi

		# Check for missing file path
		if [[ -z "$1" ]]; then
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}File path not provided${RESET}"
			display_help
			return ${NO_FILE_PATH_ERROR}
		fi

		# Check if the file exists in the Git repo
		if ! git ls-files --error-unmatch "$1" > /dev/null 2>&1; then
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}File '${BRIGHT_YELLOW}$1${BRIGHT_CYAN}' not found in Git repository${RESET}"
			return ${FILE_NOT_IN_GIT_ERROR}
		fi

		# Display the commit menu and get selection
		local COMMIT_HASH
		COMMIT_HASH=$(git log --pretty=format:"%h - %s (%cr)" -- "$1" | createmenu)
		if [[ -z "${COMMIT_HASH}" ]]; then
			echo -e "${BRIGHT_RED}No selection made. Exiting.${RESET}"
			return ${NO_SELECTION_MADE}
		fi

		# Extract the hash from the selection
		COMMIT_HASH=${COMMIT_HASH%% *}

		# Retrieve the file for the selected commit
		if [[ -n "$2" ]]; then
			# Save to file if second parameter is provided
			git show "${COMMIT_HASH}:$1" > "$2"
		else
			git show "${COMMIT_HASH}:$1" | clipboard
		fi
	}

	# Helper to create git branch names
	gitbranchhelp() {
		local BRANCH_PREFIXES=(
			"bugfix/"
			"develop/"
			"feature/"
			"hotfix/"
			"master/"
			"main/"
			"release/"
			"support/"
			"wip/"
		)

		local BRANCH_DESCRIPTIONS=(
			"Non-critical bug fixes."
			"Ongoing development work."
			"New features or enhancements."
			"Critical production bug fixes."
			"Stable, production-ready code."
			"Stable, production-ready code."
			"Pre-release preparations."
			"Support for older releases."
			"Work in progress."
		)

		# Prompt the user to select the type of branch from the list
		echo -e "${BRIGHT_YELLOW}Select the type of branch:${RESET}"
		for i in "${!BRANCH_PREFIXES[@]}"; do
			echo -e "$((i+1)). ${BRIGHT_CYAN}${BRANCH_PREFIXES[${i}]}${RESET} - ${BRANCH_DESCRIPTIONS[${i}]}"
		done

		# Read the user's selection for the branch type
		local BRANCH_TYPE_NUMBER
		echo -ne "${BRIGHT_YELLOW}Enter the number corresponding to the branch type:${RESET} "
		read -r BRANCH_TYPE_NUMBER

		# Validate the selection
		if ! [[ "${BRANCH_TYPE_NUMBER}" =~ ^[1-9]$ ]]; then
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}Invalid selection${RESET}"
			return 1
		fi

		local BRANCH_PREFIX="${BRANCH_PREFIXES[$((BRANCH_TYPE_NUMBER-1))]}"

		# Get the project code
		local PROJECT_CODE
		echo -ne "${BRIGHT_YELLOW}Enter the project code ${BRIGHT_CYAN}(e.g., PROJ)${BRIGHT_YELLOW} or press return to skip${RESET}: "
		read -r PROJECT_CODE

		# Get the ticket number
		local TICKET_NUMBER
		echo -ne "${BRIGHT_YELLOW}Enter the ticket number ${BRIGHT_CYAN}(e.g., 12345)${BRIGHT_YELLOW} or press return to skip${RESET}: "
		read -r TICKET_NUMBER

		# Get the description
		local DESCRIPTION
		echo -ne "${BRIGHT_YELLOW}Enter the description ${BRIGHT_CYAN}(use spaces or dashes, will be formatted automatically)${RESET}: "
		read -r DESCRIPTION

		# Format the description: replace spaces with dashes, remove duplicate dashes
		DESCRIPTION=$(echo "${DESCRIPTION}" | tr '[:space:]' '-' | tr -s '-')

		# Construct the branch name parts
		local BRANCH_NAME="${BRANCH_PREFIX}"

		# Append project code if provided
		if [[ -n "${PROJECT_CODE}" ]]; then
			BRANCH_NAME+="${PROJECT_CODE}"
		fi

		# Append ticket number with a dash if project code is present or ticket number is provided
		if [[ -n "${TICKET_NUMBER}" ]]; then
			if [[ -n "${PROJECT_CODE}" ]]; then
				BRANCH_NAME+="-${TICKET_NUMBER}"
			else
				BRANCH_NAME+="${TICKET_NUMBER}"
			fi
		fi

		# Append description with a dash if previous parts are present
		if [[ -n "${DESCRIPTION}" ]]; then
			if [[ -n "${PROJECT_CODE}" || -n "${TICKET_NUMBER}" ]]; then
				BRANCH_NAME+="-${DESCRIPTION,,}"
			else
				BRANCH_NAME+="${DESCRIPTION,,}"
			fi
		fi

		# Remove any trailing dashes
		BRANCH_NAME=$(echo "${BRANCH_NAME}" | sed 's/-$//')

		# Copy the commit message to the clipboard
		echo "${BRANCH_NAME}" | clipboard

		# Display the final branch name
		echo -e "${BRIGHT_GREEN}Your branch name is:${RESET}\n${BRANCH_NAME}"
	}

	# Helper to create git commit messages
	gitcommithelp() {
		local FULL_COMMIT_MESSAGE

		# Define commit types with colored labels
		local COMMIT_TYPES=(
			"🔧 ${BRIGHT_CYAN}chore${RESET}: updating grunt tasks etc; no production code change"
			"📝 ${BRIGHT_CYAN}docs${RESET}: changes to the documentation"
			"✨ ${BRIGHT_CYAN}feat${RESET}: new feature for the user, not a new feature for build script"
			"🐛 ${BRIGHT_CYAN}fix${RESET}: bug fix for the user, not a fix to a build script"
			"♻️ ${BRIGHT_CYAN}refactor${RESET}: refactoring production code, eg. renaming a variable"
			"💅 ${BRIGHT_CYAN}style${RESET}: formatting, missing semi colons, etc; no production code change"
			"🧪 ${BRIGHT_CYAN}test${RESET}: adding missing tests, refactoring tests; no production code change"
			"🚧 ${BRIGHT_CYAN}wip${RESET}: work in progress"
			"🔀 ${BRIGHT_CYAN}merge${RESET}: choose this if this is a merge"
		)

		# Corresponding commit prefixes
		local COMMIT_PREFIXES=(
			"🔧 chore: "
			"📝 docs: "
			"✨ feat: "
			"🐛 fix: "
			"♻️ refactor: "
			"💅 style: "
			"🧪 test: "
			"🚧 wip: "
		)

		# Prompt the user to select the type of commit from the list
		echo -e "${BRIGHT_YELLOW}What type of commit is this?${RESET}"
		for i in "${!COMMIT_TYPES[@]}"; do
			echo -e "$((i+1)). ${COMMIT_TYPES[${i}]}"
		done

		# Read the user's selection
		local COMMIT_TYPE_NUMBER
		echo -ne "${BRIGHT_YELLOW}Enter the number corresponding to the commit type${RESET}: "
		read -r COMMIT_TYPE_NUMBER

		# Validate the selection
		if ! [[ "${COMMIT_TYPE_NUMBER}" =~ ^[1-9]$ ]]; then
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}Invalid selection${RESET}"
			return 1
		fi

		# Handle special cases (merge and wip)
		if [[ "${COMMIT_TYPE_NUMBER}" -eq 9 ]]; then
			# Merge commit
			local SOURCE_BRANCH
			echo -ne "${BRIGHT_YELLOW}Enter the ${BRIGHT_CYAN}source branch${BRIGHT_YELLOW} you are merging ${BRIGHT_CYAN}from${BRIGHT_YELLOW}${RESET}: "
			read -r SOURCE_BRANCH

			# Ensure the branch was provided
			if [[ -z "${SOURCE_BRANCH}" ]]; then
				echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No source branch specified${RESET}"
				return 1
			fi

			local DESTINATION_BRANCH
			echo -ne "${BRIGHT_YELLOW}Enter the ${BRIGHT_CYAN}destination branch${BRIGHT_YELLOW} you are merging ${BRIGHT_CYAN}into${BRIGHT_YELLOW}${RESET}: "
			read -r DESTINATION_BRANCH

			# Ensure the branch was provided
			if [[ -z "${DESTINATION_BRANCH}" ]]; then
				echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No destination branch specified${RESET}"
				return 1
			fi

			# Construct the merge commit message
			FULL_COMMIT_MESSAGE="🔀 Merged branch ${SOURCE_BRANCH} into ${DESTINATION_BRANCH}"

		elif [[ "${COMMIT_TYPE_NUMBER}" -eq 8 ]]; then
			# WIP commit
			FULL_COMMIT_MESSAGE="🚧 work in progress [$(date +%H:%M)]"

		else
			# Regular commit
			# Get the corresponding commit prefix
			local COMMIT_PREFIX="${COMMIT_PREFIXES[$((COMMIT_TYPE_NUMBER-1))]}"

			# Prompt the user for a commit message
			local COMMIT_MESSAGE
			echo -e "${BRIGHT_YELLOW}Enter a commit message ${BRIGHT_MAGENTA}(use present tense and do not capitalize the first letter)${RESET}:"
			echo -ne "${BRIGHT_GREEN}>${RESET} "
			read -r COMMIT_MESSAGE

			# Ensure a commit message was provided
			if [[ -z "${COMMIT_MESSAGE}" ]]; then
				echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No commit message was specified${RESET}"
				return 1
			fi

			# Combine the prefix and message
			FULL_COMMIT_MESSAGE="${COMMIT_PREFIX}${COMMIT_MESSAGE}"
		fi

		# Copy the commit message to the clipboard
		echo "${FULL_COMMIT_MESSAGE}" | clipboard

		# Display the final commit message
		echo -e "${BRIGHT_GREEN}Your commit message is:${RESET}\n${FULL_COMMIT_MESSAGE}"
	}

	# Set defaults for Git (~/.gitconfig)
	function gitfixsettings() {
		local CHECKMARK="\r${BRIGHT_GREEN}✓${RESET}"

		# If GitAlias (see gitalias alias) is installed...
		if [[ -f "${HOME}/gitalias.txt" ]]; then
			# Tell Git to include this file
			git config --global include.path "gitalias.txt"
			echo -e "${CHECKMARK} Found gitalias.txt"
		fi

		# If a global ignore file exists...
		if [[ -f "${HOME}/.gitignore_global" ]]; then
			# Globally exclude common files that you don’t want to track
			git config --global core.excludesfile ~/.gitignore_global
			echo -e "${CHECKMARK} Found .gitignore_global"
		fi

		# Set the user name
		local GIT_USER_NAME
		read -r -e -i "$(git config --get user.name)" -p "Enter your user name (ENTER to skip): " GIT_USER_NAME
		if [ -z "${GIT_USER_NAME}" ]; then
			GIT_USER_NAME="User"
		fi
		git config --global user.name "${GIT_USER_NAME}"

		# Set the email address
		local GIT_USER_EMAIL
		read -r -e -i "$(git config --get user.email)" -p "Enter your email (ENTER to skip): " GIT_USER_EMAIL
		if [ -z "${GIT_USER_EMAIL}" ]; then
			GIT_USER_EMAIL="user@example.com"
		fi
		git config --global user.email "${GIT_USER_EMAIL}"

		# You should add this manually with your own information
		# git config --global user.signingkey <gpg-key-id>

		# Set the default branch name to be main (instead of master) in new repos
		# git config --global init.defaultBranch main

		# Enable colorful output for better readability
		git config --global color.ui auto

		# Check integrity of objects during operations like fetching or receiving
		git config --global transfer.fsckobjects true
		git config --global fetch.fsckobjects true
		git config --global receive.fsckobjects true

		# Automatically fix minor mistakes when you mistype a command
		# 0         - No autocorrection; only provides suggestions
		# 30        - Executes after 3 seconds
		# immediate - Executes immediately without confirmation
		# prompt    - Asks for confirmation before executing the suggestion
		git config --global help.autocorrect prompt

		# Automatically set up a tracking branch (upstream branch) when you push
		# a local branch to a remote for the first time, so you will not have
		# to manually run "git push --set-upstream origin <branch>" each time
		git config --global push.autoSetupRemote true

		# Speed up git status in large repositories by using Git fsmonitor
		# Note: This can cause issues on much older out of date Git versions
		git config --global core.fsmonitor true

		# Set the default Git editor to your default Bash editor
		git config --global core.editor "${EDITOR}"
		echo -e "${CHECKMARK} Default editor set to ${EDITOR}"

		# Set the default diff algorithm
		# The patience diff algorithm handles reordering changes better,
		# it can be slower for larger diffs compared to Myers
		# The Histogram algorithm performs better with large codebases
		# but may produce slightly less intuitive results
		git config --global diff.algorithm patience
		# git config --global diff.algorithm histogram

		# Set the dafault pager
		git config --global core.pager "less --ignore-case --LONG-PROMPT --LINE-NUMBERS"

		# Set defaults for diff and merge
		git config --global merge.conflictstyle "diff3"
		git config --global diff.colorMoved "default"

		# Set this if icdiff is installed
		if hascommand --strict icdiff; then
			git config --global icdiff.options '--highlight --line-numbers --strip-trailing-cr'
			echo -e "${CHECKMARK} Found icdiff"
		fi

		# If delta is installed...
		if hascommand delta; then

			# delta - Beautiful side by side colored diff with Git support and syntax highlighting
			# This diff tool also uses more advanced diff algorithms with more features
			# Link: https://github.com/dandavison/delta
			# Info: Add listed settings to your ~/.gitconfig
			# NOTE: use n and N to move between diff sections
			git config --global core.pager "delta"

			# Enable delta for interactive diffs
			git config --global interactive.diffFilter "delta --color-only --features=interactive"

			# Enable navigation using 'n' and 'N' for diff sections
			git config --global delta.navigate true

			# Enable delta features: side-by-side diff view, line numbers, decorations, and word-diff
			git config --global delta.features "side-by-side line-numbers decorations word-diff"

			# Side-by-side diff format
			git config --global delta.side-by-side "true"

			# Display line numbers in diffs
			git config --global delta.line-numbers "true"

			# Use word-diff and define word boundaries with regex
			git config --global delta.word-diff-regex '\w+'

			# Set how delta handles whitespace errors (underline them in bold red)
			git config --global delta.whitespace-error-style "underline bold red"

			# Limit the length of lines to highlight whitespace issues
			git config --global delta.whitespace-line-length-limit 120

			# Customize commit decoration (blue outline, raw commit message style)
			git config --global delta.decorations.commit-decoration-style "blue ol"
			git config --global delta.decorations.commit-style "raw"

			# Customize hunk header (blue box for decoration, red file name, green line numbers)
			git config --global delta.decorations.hunk-header-decoration-style "blue box"
			git config --global delta.decorations.hunk-header-file-style "red"
			git config --global delta.decorations.hunk-header-line-number-style "#067a00"
			git config --global delta.decorations.hunk-header-style "file line-number syntax"

			# Disable plus/minus markers in interactive mode
			git config --global delta.interactive.keep-plus-minus-markers "false"

			# Omit file names in the delta output
			git config --global delta.decorations.file-style "omit"

			# (Optional) Disable showing GPG signature in `git log` (commented out)
			# git config --global log.showSignature false

			echo -e "${CHECKMARK} Found delta"

		# Check for Difftastic
		elif hascommand difft; then

			# Difftastic supports over 30 languages and compares based on syntax
			# git -c diff.external=difft diff # View uncommitted changes
			# git -c diff.external=difft show --ext-diff # Most recent commit
			# git -c diff.external=difft log -p --ext-diff # Recent commits current branch
			# Link: https://github.com/Wilfred/difftastic
			# Link: https://difftastic.wilfred.me.uk/git.html?highlight=page#difftool
			git config --global diff.external difft

			# Define difftastic as a custom difftool with the necessary command
			git config --global difftool.difftastic.cmd 'difft "$MERGED" "$LOCAL" "abcdef1" "100644" "$REMOTE" "abcdef2" "100644"'

			# Additional configurations for difftastic
			git config --global difftool.prompt false
			git config --global pager.difftool true
			git config --global diff.tool difftastic

			# Set up aliases "git dlog", "git dshow", and "git ddiff"
			git config --global alias.dlog '-c diff.external=difft log -p --ext-diff'
			git config --global alias.dshow '-c diff.external=difft show --ext-diff'
			git config --global alias.ddiff '-c diff.external=difft diff'

			echo -e "${CHECKMARK} Found Difftastic"

		# Check for diff-so-fancy
		elif hascommand diff-so-fancy; then

			# Configure diff-so-fancy for Git diff outputs
			# diff-so-fancy simplifies Git diff outputs, making them easier to read
			git config --global core.pager "diff-so-fancy | $(command which less) --tabs=4 -RFX"

			# Interactive diff filter setting for diff-so-fancy
			git config --global interactive.diffFilter "diff-so-fancy --patch"

			# Setting color enhancements for better visual differentiation in diffs
			git config --global color.ui true
			git config --global color.diff-highlight.oldNormal "red bold"
			git config --global color.diff-highlight.oldHighlight "red bold 52"
			git config --global color.diff-highlight.newNormal "green bold"
			git config --global color.diff-highlight.newHighlight "green bold 22"
			git config --global color.diff.meta "11"
			git config --global color.diff.frag "magenta bold"
			git config --global color.diff.commit "yellow bold"
			git config --global color.diff.old "red bold"
			git config --global color.diff.new "green bold"
			git config --global color.diff.whitespace "red reverse"

			# Confirm diff-so-fancy is configured for output
			echo -e "${CHECKMARK} Configured diff-so-fancy for Git diffs"
		fi

		# If we are in a desktop environment and Ultracompare is not installed...
		# You will be prompted when you launch Ultracompare to automatically set up
		# Git, so just skip the other diff configurations since this app is paid
		# Link: https://www.ultraedit.com/products/ultracompare-linux/
		if ([[ -n "$DISPLAY" ]] || [[ -n "$WAYLAND_DISPLAY" ]]) && [[ -n "$XDG_CURRENT_DESKTOP" ]]; then
			echo -e "${CHECKMARK} User is in desktop environment ${XDG_CURRENT_DESKTOP}"

			# If UltraCompare is installed...
			# You will be prompted when you launch UltraCompare to automatically set up
			# Git, so just skip the other diff configurations since this app is paid
			# Link: https://www.ultraedit.com/products/ultracompare-linux/
			if hascommand --strict ucx; then
				echo -e "${CHECKMARK} Found UltraCompare"

			# If Meld is installed...
			# Link: https://meldmerge.org/
			elif hascommand --strict meld; then
				# These settings will not alter the behaviour of "git diff"
				# Link: https://stackoverflow.com/questions/34119866/setting-up-and-using-meld-as-your-git-difftool-and-mergetool
				# You use "git difftool" in exactly the same way as you use git diff
				# Example: git difftool <COMMIT_HASH> file_name
				# Example: git difftool <BRANCH_NAME> file_name
				# Example: git difftool <COMMIT_HASH_1> <COMMIT_HASH_2> file_name
				git config --global diff.tool meld
				git config --global difftool.meld.path "$(command which meld)"
				git config --global difftool.meld.cmd 'meld "$LOCAL" "$REMOTE"'
				git config --global difftool.prompt false

				# "git mergetool" allows you to use a GUI merge program to resolve merge conflicts
				# Before using git mergetool you perform a merge in the usual way with git
				# then Mergetool can now be used to resolve the merge conflicts
				git config --global merge.tool meld
				git config --global mergetool.meld.path "$(command which meld)"
				git config --global mergetool.prompt false

				# Choose which starting edit position you'd prefer; $MERGED for the file
				# which contains the partially merged file with the merge conflict info
				# or $BASE for the shared commit ancestor of $LOCAL and $REMOTE
				git config --global mergetool.meld.cmd 'meld "$LOCAL" "$MERGED" "$REMOTE" --output "$MERGED"'
				#git config --global mergetool.meld.cmd 'meld "$LOCAL" "$BASE" "$REMOTE" --output "$MERGED"'

				# Also set up the alias "git meld" which works on Cygwin
				git config --global alias.meld '!git difftool -t meld --dir-diff'
				echo -e "${CHECKMARK} Found meld"

			# If KDiff3 is installed...
			# Link: https://kdiff3.sourceforge.net/
			elif hascommand --strict kdiff3; then
				git config --global diff.guitool kdiff3
				git config --global difftool.kdiff3.path "$(command which kdiff3)"
				git config --global difftool.kdiff3.trustExitCode false
				git config --global merge.tool kdiff3
				git config --global mergetool.kdiff3.path "$(command which kdiff3)"
				git config --global mergetool.kdiff3.trustExitCode false
				echo -e "${CHECKMARK} Found KDiff3"
			fi
		fi

		# Create an alias s for the git status command
		git config --global alias.s "status"

		# Create an alias l for a compact log format:
		# --oneline  : shows each commit as a single line
		# --graph    : adds an ASCII graph of branch and merge history
		# --decorate : adds extra information such as branch names, tags, etc.
		git config --global alias.l "log --oneline --date=short --graph --decorate --pretty=format:'%C(red)%h%C(reset) - %C(green)(%cr)%C(reset) %s%C(yellow)%d%C(reset) %C(bold blue)<%an>%C(reset)'"

		# Stage git commits with an interactive prompt
		git config --global alias.aa "add -p"

		# Make an empty commit with no content
		# (to trigger kick off a CI build or some other integration)
		git config --global alias.empty "commit --allow-empty -m"
	}
fi

#######################################################
### SYSTEMD ALIASES
#######################################################

# Check if systemd is installed
if hascommand --strict systemctl; then
	# Get a list of all services
	alias services='systemctl list-units --type=service --state=running,failed'
	alias servicesall='systemctl list-units --type=service'

	# Find what systemd services have failed
	alias {failed,servicefailed}='systemctl --failed'

	# Get the status of a services
	alias servicestatus='sudo systemctl status'

	# Start a service and enable automatic startup at boot
	alias serviceenable='sudo systemctl enable --now'

	# Disable a service
	alias servicedisable='sudo systemctl disable'

	# Start a service
	alias servicestart='sudo systemctl start'

	# Stop a service
	alias servicestop='sudo systemctl stop'

	# Forcefully terminate a service
	alias servicekill='sudo systemctl kill'

	# Stop and restart a service
	alias servicerestart='sudo systemctl restart'

	# Reload a service's configuration (soft restart)
	alias servicereload='sudo systemctl reload'

	# Tell how long it took to boot the system
	alias boottime='systemd-analyze'

	# Tell how long it took to boot the system
	alias boottimelist='systemd-analyze blame'

	# Generate a visual boot time analysis chart as a graphic SVG image
	alias bootchart='systemd-analyze plot > ./boot.svg && echo "Boot chart saved to ${PWD/#$HOME/~}/boot.svg"'

	# View kernel messages from current boot
	alias bootmessages='journalctl -b -k'

	# View kernel messages from previous boot
	alias bootprevious='journalctl -b -1 -k'

	# Filter for warning and errors
	alias booterrors='journalctl -b -k -p warning..emerg'

	# List boots
	alias bootlist='journalctl --list-boots'

	# Clear system log entries from the systemd journal
	alias {clearsystemlogs,cleansystemlogs}='echo -ne "${BRIGHT_BLUE}Before${RESET}: "; journalctl --disk-usage; sudo journalctl --rotate; sudo journalctl --vacuum-time=1s; echo -ne "${BRIGHT_BLUE}After${RESET}: "; journalctl --disk-usage'

	# Fast reboot user space and not the kernel
	alias rebootfast='systemctl soft-reboot'

	# If SSH is installed...
	if hascommand --strict ssh; then
		# Create aliases to start/enable and stop/disable the SSH server
		alias sshstatus='systemctl status sshd.service'
		alias sshstart='sudo systemctl start sshd.service && sudo systemctl enable sshd.service'
		alias sshstop='sudo systemctl stop sshd.service && sudo systemctl disable sshd.service'
		alias sshrestart='sudo systemctl restart sshd.service && sudo systemctl enable sshd.service'
	fi

	# If gpm is installed...
	# Link: https://github.com/telmich/gpm
	if hascommand --strict gpm; then
		alias ttymouseon='sudo systemctl enable --now gpm'
		alias ttymouseoff='sudo systemctl stop gpm && sudo systemctl disable gpm'
		alias ttymousestatus='sudo systemctl status gpm'
	fi

	# Flushing and restart the DNS cache if installed and running
	function flushdns() {
		# Check if systemd-resolved is available
		if hascommand --strict systemd-resolve; then
			# Check if systemd-resolved service is active
			if systemctl is-active systemd-resolved >/dev/null; then
				# Flush DNS cache and restart systemd-resolved
				sudo systemd-resolve --flush-caches
				sudo systemctl restart systemd-resolved
				echo "DNS cache flushed and systemd-resolved restarted"
			else
				echo "systemd-resolved is not active, unable to flush DNS cache"
			fi
		# Check if dnsmasq is available
		elif hascommand --strict dnsmasq; then
			# Check if dnsmasq process is running
			if pgrep -x "dnsmasq" >/dev/null; then
				# Restart dnsmasq to flush DNS cache
				sudo systemctl restart dnsmasq
				echo "DNS cache flushed and dnsmasq restarted"
			else
				echo "dnsmasq is not running, unable to flush DNS cache"
			fi
		else
			echo "No supported DNS caching service found"
		fi
	}

	# Browse and manage systemd services
	findservice() {
		local service
		local services_list

		# Get only the service names (first column, stripping status symbols)
		services_list=$(systemctl list-units --type=service --all --no-legend --plain | awk '{print $1}' | sed 's/^●//')

		# Pickers with preview support
		local PICKER_FOUND=false
		for picker in sk fzf; do
			if hascommand "$picker"; then
				PICKER_FOUND=true
				service=$(echo "$services_list" | "$picker" --header="Select service" \
						--preview 'systemctl status {}' | xargs)
				break
			fi
		done

		# Fallback to pickers without preview
		if ! ${PICKER_FOUND}; then
			for picker in fzy peco percol pick icepick selecta sentaku zf; do
				if hascommand "$picker"; then
					PICKER_FOUND=true
					service=$(echo "$services_list" | "$picker" | xargs)
					break
				fi
			done
		fi

		# No picker found
		if ! ${PICKER_FOUND}; then
			echo "Error: No fuzzy finder installed (fzf, sk, fzy, peco, etc.)"
			return 1
		fi

		# User cancelled the picker
		if [ -z "$service" ]; then
			return 0
		fi

		echo "Service: $service"
		echo "1) Status  2) Start  3) Stop  4) Restart  5) Enable  6) Disable"
		read -p "Action: " -n 1 action
		echo
		case $action in
			1) systemctl status "$service" ;;
			2) sudo systemctl start "$service" ;;
			3) sudo systemctl stop "$service" ;;
			4) sudo systemctl restart "$service" ;;
			5) sudo systemctl enable "$service" ;;
			6) sudo systemctl disable "$service" ;;
		esac
	}
fi

#######################################################
### CHANGING AND LISTING DIRECTORIES
#######################################################

# Aliases for faster pushd and popd: type "p" for pushd and "p-" for popd
# Link: https://opensource.com/article/19/8/navigating-bash-shell-pushd-popd
alias p='pushd'
alias p-='popd'
# Allow us to clear the directory stack
alias dirsclear='dirs -c'
# If you want to see the numeric position of each directory in the stack,
# you can use the -v (vertical) option - as DT suggests, use this by default
alias dirs='dirs -v'

# If Yazi is installed, use it as the terminal file manager; otherwise fall back to Ranger.
# Both maintain the last selected directory on exit so `r` always drops you where you left off.

# Yazi - modern terminal file manager written in Rust
# Link: https://github.com/sxyazi/yazi
# Navigation uses arrow keys (configured in ~/.config/yazi/keymap.toml).
#  Arrow keys - navigate (left=parent, right=enter)
#  F1-F8      - Midnight Commander style file operations
#  g + key    - jump to directories (gh=home, gc=.config, gl=local bin, etc.)
#  o + key    - sort (on=natural, os=size, om=modified, oe=extension)
#  zh         - toggle hidden files
#  /          - search, Space - select, S - shell, q - quit
if hascommand --strict yazi; then
	# Override yazi to change to the most recently selected directory on exit
	function yazi() {
		local YAZI_CWD_FILE
		YAZI_CWD_FILE="$(mktemp -t "yazi-cwd.XXXXXX")"
		command yazi --cwd-file="${YAZI_CWD_FILE}" "$@"
		if [[ -f "${YAZI_CWD_FILE}" ]]; then
			local YAZI_CWD="$(< "${YAZI_CWD_FILE}")"
			if [[ -n "${YAZI_CWD}" ]] && [[ "${YAZI_CWD}" != "${PWD}" ]]; then
				command cd "${YAZI_CWD}" || {
					echo -e "${BRIGHT_RED}Error:${BRIGHT_CYAN} Unable to change directory to '${YAZI_CWD}'${RESET}"
					return 1
				}
			fi
		fi
		command rm -f "${YAZI_CWD_FILE}" > /dev/null 2>&1
	}

	alias r='yazi'

# Ranger - classic terminal file manager (fallback when yazi is not installed)
# Link: https://github.com/ranger/ranger
#  g - navigation and tabs
#  r - :open_with command
#  y - copy (yank)
#  d - cut (delete)
#  p - paste
#  o - sort
#  . - filter_stack
#  z - settings / zz - filter
#  u - undo
#  M - linemode
#  +, -, = for setting access rights to files
elif hascommand --strict ranger; then
	# Override ranger to change to the most recently selected directory
	function ranger() {
		# If the temporary directory location is set...
		if [[ -n "${TEMPDIR_LOCAL}" ]] && [[ -d "${TEMPDIR_LOCAL}" ]]; then
			# Use system ranger and save last directory on exit
			command ranger --choosedir="${TEMPDIR_LOCAL}/.rangerdir" "$@"

			# If last directory file exists, change to it
			if [[ -f "${TEMPDIR_LOCAL}/.rangerdir" ]]; then
				local LAST_DIR_LOCATION="$(< "${TEMPDIR_LOCAL}/.rangerdir")"
				if [[ -d "${LAST_DIR_LOCATION}" ]]; then
					command cd "${LAST_DIR_LOCATION}" || {
						echo -e "${BRIGHT_RED}Error:${BRIGHT_CYAN} Unable to change directory to '${LAST_DIR_LOCATION}'${RESET}"
						return 1
					}
					command rm -f "${TEMPDIR_LOCAL}/.rangerdir" > /dev/null 2>&1
				fi
			fi
		else
			# Launch without directory persistence if TEMPDIR_LOCAL is not set
			command ranger "$@"
		fi
	}

	alias r='ranger'
fi

# If nnn is installed, add an alias for a directory listing
# Link: https://github.com/jarun/nnn/
# The following command installs or updates all plugins:
# Install: curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
# Plugins are installed to ${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins
if hascommand --strict nnn; then
	if [[ -f "${XDG_CONFIG_HOME:-${HOME}/.config}/nnn/plugins/finder" ]]; then
		export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
		alias nnnplugins='curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh'
	fi
	#alias nnn='nnn -e'
	alias nnn='nnn -Headr'
fi

# TUIFI Manager
# Link: https://github.com/GiorgosXou/TUIFIManager
# Install: pip3 install tuifimanager --upgrade
if hascommand tuifi; then
	alias ff="tuifi"
fi

# If lsx enhanced directory navigation is found, source it
# Link: https://github.com/souvikinator/lsx
if [[ -f "${XDG_CONFIG_HOME:-${HOME}/.config}/lsx/lsx.sh" ]]; then
	builtin source "${XDG_CONFIG_HOME:-${HOME}/.config}/lsx/lsx.sh"

	# If lsx is installed, alias it to see hidden directories
	if hascommand lsx; then
		alias l='lsx -a'
	elif hascommand ls-x; then
		alias l="ls-x -a"
		alias lsx="${GOPATH}/bin/ls-x"
	elif [[ -x "${GOPATH}/bin/ls-x" ]]; then
		alias l="${GOPATH}/bin/ls-x -a"
		alias lsx="${GOPATH}/bin/ls-x"
	fi
fi

# List folders recursively in a tree
if hascommand --strict tree; then
	alias treed='command tree -CAFd'
fi

# List files recursively in a tree
if hascommand broot; then
	# If broot is installed...
	# Link: https://github.com/Canop/broot
	# Link: https://computingforgeeks.com/broot-easy-directory-trees-navigation-in-linux/

	# To generate this source file, type: broot --install
	if [[ -f "${XDG_CONFIG_HOME:-${HOME}/.config}/broot/launcher/bash/br" ]]; then
		# Source the br function
		builtin source "${XDG_CONFIG_HOME:-${HOME}/.config}/broot/launcher/bash/br"

		# If Git is installed, enable the Git functionality
		if hascommand --strict git; then
			alias {lb,tree}='br --sizes --dates --show-root-fs --hidden --show-git-info'
		else
			alias {lb,tree}='br --sizes --dates --show-root-fs --hidden'
		fi
	else
		# If Git is installed, enable the Git functionality
		if hascommand --strict git; then
			alias {lb,tree}='broot --sizes --dates --show-root-fs --hidden --show-git-info'
		else
			alias {lb,tree}='broot --sizes --dates --show-root-fs --hidden'
		fi
	fi

elif [[ $_SKIP_EXA = false ]] && hascommand eza; then
	# If eza is installed (actively maintained fork of exa)
	# Link: https://eza.rocks
	if hascommand --strict git; then
		alias tree='eza --all --git --group-directories-first --header --long --tree --icons=auto'
	else
		alias tree='eza --all --group-directories-first --header --long --tree --icons=auto'
	fi
elif [[ $_SKIP_LSD = false ]] && hascommand lsd; then
	# If lsd is installed...
	# Link: https://github.com/Peltoche/lsd
	alias tree='command lsd --all --blocks permission,user,size,date,name --group-dirs first --header --long --tree'
elif [[ $_SKIP_EXA = false ]] && hascommand exa; then
	# If exa is installed (deprecated, use eza instead)
	# Link: https://github.com/ogham/exa
	if hascommand --strict git; then
		alias tree='exa --all --git --group-directories-first --header --long --tree'
	else
		alias tree='exa --all --group-directories-first --header --long --tree'
	fi
elif hascommand tree; then
	# If tree is installed...
	# Link: https://www.tecmint.com/linux-tree-command-examples/
	alias tree='command tree -CAhF --dirsfirst'
fi

# Common aliases for directory listing commands
alias lw='ls -xAh'                   # wide listing format
alias lm='ll -alh | command less -S' # pipe through less
alias lr='ls -lRh'                   # recursive ls
alias l.='ll -d .*'                  # show hidden files
alias lfile="ls -l | grep -v '^d'"   # files only
alias ldir="ls -la | grep '^d'"      # directories only

# Conditional aliases based on the availability of specific directory tools
if [[ $_SKIP_LS_COLORIZED = false ]]; then

	# If eza (with Git support) is installed...
	# Eza is the fastest ls replacements with so many features
	# Link: https://eza.rocks
	if [[ $_SKIP_EXA = false ]] && hascommand eza; then

		# Flags for nearly all directory listings
		_EZA_COMMON_FLAGS="--all --classify --color=auto --color-scale=all --icons=auto"

		# Flags for all long listings (which include common and Git flags)
		#_EZA_LONG_FLAGS="${_EZA_COMMON_FLAGS} --group-directories-first --long --links --group --modified"
		_EZA_LONG_FLAGS="${_EZA_COMMON_FLAGS} --group-directories-first --long --links --group --modified"

		alias ls="eza ${_EZA_COMMON_FLAGS} --group-directories-first"
		alias labc="eza ${_EZA_COMMON_FLAGS} --grid --sort name"
		alias ll="eza ${_EZA_LONG_FLAGS}"
		alias lx="eza ${_EZA_LONG_FLAGS} --sort extension"
		alias lk="eza ${_EZA_LONG_FLAGS} --sort size"
		alias lt="eza ${_EZA_LONG_FLAGS} --sort modified"
		alias lc="eza ${_EZA_LONG_FLAGS} --changed --sort changed"
		alias lu="eza ${_EZA_LONG_FLAGS} --accessed --sort accessed"
		alias new="eza ${_EZA_LONG_FLAGS} --sort modified | tail -10 | tac"
		alias lr="eza ${_EZA_COMMON_FLAGS} --grid --group-directories-first --recurse"
		alias ltree="command eza --icons=auto --all --group-directories-first --header --long --tree"

		# Cleanup variables to avoid leaking them into the environment
		unset _EZA_COMMON_FLAGS _EZA_LONG_FLAGS

	# If lsd is installed, use it instead
	# Link: https://github.com/Peltoche/lsd
	elif [[ $_SKIP_LSD = false ]] && hascommand lsd; then
		alias ls='lsd -AF --group-dirs first'
		alias ll='lsd --almost-all --header --long --group-dirs first'
		alias labc='lsd -lAv --header'
		alias lx='lsd -lAXh --header'
		alias lk='lsd -lASrh --header'
		alias lt='lsd -lAtrh --header'
		alias lc='command ls -lAcrh --color=always'
		alias lu='command ls -lAurh --color=always'
		alias new='lsd -lAtr --almost-all | tail -10 | tac'
		alias ltree='command lsd --almost-all --blocks permission,user,size,date,name --group-dirs first --header --long --tree'

	# If exa (depreciated but still on some older distros) is installed...
	# Link: https://github.com/ogham/exa
	elif [[ $_SKIP_EXA = false ]] && hascommand exa; then

		# Add icons to exa if unicode and the icon paramter is supported
		if [[ $(locale charmap) == 'UTF-8' ]]; then
			if command exa --help | grep -q -- "--icons" &> /dev/null; then
				aliasappend 'exa' '--icons'
			fi
		fi

		# Flags for nearly all directory listings
		_EXA_COMMON_FLAGS="--all --classify --color=auto --color-scale"

		# Flags for all long listings (which include common and Git flags)
		_EXA_LONG_FLAGS="${_EXA_COMMON_FLAGS} --group-directories-first --long --links --group --modified"

		alias ls="exa ${_EXA_COMMON_FLAGS} --group-directories-first"
		alias labc="exa ${_EXA_COMMON_FLAGS} --grid --sort name"
		alias ll="exa ${_EXA_LONG_FLAGS}"
		alias lx="exa ${_EXA_LONG_FLAGS} --sort extension"
		alias lk="exa ${_EXA_LONG_FLAGS} --sort size"
		alias lt="exa ${_EXA_LONG_FLAGS} --sort modified"
		alias lc="exa ${_EXA_LONG_FLAGS} --changed --sort changed"
		alias lu="exa ${_EXA_LONG_FLAGS} --accessed --sort accessed"
		alias new="exa ${_EXA_LONG_FLAGS} --sort modified | tail -10 | tac"
		alias lr="exa ${_EXA_COMMON_FLAGS} --grid --group-directories-first --recurse"
		alias ltree="command exa --all --group-directories-first --header --long --tree"

		# Clean up variables to avoid leaking them into the environment
		unset _EXA_COMMON_FLAGS _EXA_LONG_FLAGS

	# If Natls is installed, use it instead
	# Link: https://github.com/willdoescode/nat
	# Install: cargo install natls
	elif hascommand natls; then
		alias ls='natls --gdf --name'
		alias ll='natls --gdf --name --long'
		alias labc='natls --name'
		alias lx='command ls -FlsaXBh --color=auto'
		alias lk='natls --gdf --long --size'
		alias lt='natls --gdf --long --modified'
		alias lc='command ls -Flsacrh --color=auto'
		alias lu='command ls -Flsaurh --color=auto'
		alias new='command ls -latr | tail -10 | tac'
		alias l.='command ls -Flsd .* --color=auto'
		alias lr='command ls -lRh --color=auto'
	else
		# Use ls with command line options
		alias ls='ls -aFh --color=always --group-directories-first'
		alias labc='ls -lap'                  # sort alphabetically
		alias lx='ll -laXBh'                  # sort by extension
		alias lk='ll -laSrh'                  # sort by size
		alias lt='ll -latrh'                  # sort by date
		alias lc='ll -lacrh'                  # sort by change time
		alias lu='ll -laurh'                  # sort by access time
		alias new='ls -latr | tail -10 | tac' # list recently created/updated files
		alias ltree='command tree -CAhF --dirsfirst' # tree view

		if [[ $_SKIP_GRC = false ]] && hascommand grc; then
			# If grc Generic Colouriser is installed
			# Link: https://github.com/garabik/grc
			alias ll='grc ls -l --all --classify --group-directories-first --human-readable --color=always'
		else
			# Use standard long listing format
			alias ll='llcolor'
		fi
	fi
else
	alias ls='ls -aFh --color=always'     # do add built-in colors to file types
	alias ll='ls -Fals'                   # long listing
	alias labc='ls -lap'                  # sort alphabetically
	alias lx='ll -laXBh'                  # sort by extension
	alias lk='ll -laSrh'                  # sort by size
	alias lt='ll -latrh'                  # sort by date
	alias lc='ll -lacrh'                  # sort by change time
	alias lu='ll -laurh'                  # sort by access time
	alias new='ls -latr | tail -10 | tac' # list recently created/updated files
fi

# List all files larger than a given size
# llfs +10k will find and display all files larger than 10 kilobytes in the currect directory
alias llfs='_llfs(){ find . -type f -size "$1" -exec ls --color --classify --human-readable -l {} \; ; }; _llfs'

# Show colors with the dir command
if hascommand --strict dir; then
	alias dir='dir --color=auto  --almost-all --human-readable --group-directories-first -F'
	alias vdir='vdir --color=auto'
fi

# Show the previous path
alias pwd-='echo ${OLDPWD}'

# Show full path of file or wildcard
alias fullpath='find "`pwd`" -name'

# List the PATH environment variable directories
alias path='echo -e ${PATH//:/\\n}'

# When changing a directory, don't show an extra line with the directory
# Link: https://askubuntu.com/questions/1316485/how-do-i-stop-cd-command-from-printing-absolute-path-everytime
if [[ $_SILENCE_CD_OUTPUT = true ]]; then
	alias cd='>/dev/null cd'
fi

# Change to the home directory
alias home='cd ~'

# Allow changing directory when missing a space
alias cd..='cd ..'

# Allow changing directory back when missing a space
alias cd-='cd -'

# Go back directories using dot style
alias ..='up 1'
alias ...='up 2'
alias ....='up 3'
alias .....='up 4'
alias ......='up 5'

# Go back directories using dot dot number style
alias ..1='up 1'
alias ..2='up 2'
alias ..3='up 3'
alias ..4='up 4'
alias ..5='up 5'

# Changes directories and immediately lists the contents with information
cdd() {
	# Use enhancd if available, otherwise fallback to builtin cd
	if type __enhancd::cd &>/dev/null; then
		__enhancd::cd "$@" || return
	else
		builtin cd "$@" || return
	fi

	# Directory contents - using user's aliases
	local COUNT=$(builtin command ls -A | wc -l)
	if [[ ${COUNT} -gt 20 ]]; then
		ls  # User's ls alias
	else
		ll  # User's ll alias (likely ls -al)
	fi

	# Directory stats (fast using find with maxdepth)
	local DIRS=$(builtin command find . -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l)
	local FILES=$((COUNT - DIRS))
	local LARGE=$(builtin command find . -maxdepth 1 -type f -size +100M 2>/dev/null | wc -l)

	# Get total size if not too many files (performance)
	local SIZE_INFO=""
	[[ ${COUNT} -le 100 ]] && SIZE_INFO=", total size $(builtin command du -sh . 2>/dev/null | builtin command cut -f1)"

	# Show stats and size on same line
	builtin echo -e "📊 ${DIRS} dirs, ${FILES} files${SIZE_INFO}"
	[[ ${LARGE} -gt 0 ]] && builtin echo "   ⚠️  ${LARGE} files over 100MB"

	# Project detection - check for various project markers
	local PROJECT_TYPE=""
	[[ -f package.json ]] && PROJECT_TYPE="${PROJECT_TYPE}📦 Node"
	[[ -f Cargo.toml ]] && PROJECT_TYPE="${PROJECT_TYPE}🦀 Rust"
	[[ -f go.mod ]] && PROJECT_TYPE="${PROJECT_TYPE}🐹 Go"
	[[ -f requirements.txt ]] || [[ -f setup.py ]] || [[ -f pyproject.toml ]] && PROJECT_TYPE="${PROJECT_TYPE}🐍 Python"
	[[ -f pom.xml ]] || [[ -f build.gradle ]] && PROJECT_TYPE="${PROJECT_TYPE}☕ Java"
	[[ -f Makefile ]] && PROJECT_TYPE="${PROJECT_TYPE}🔨 Make"
	[[ -f docker-compose.yml ]] || [[ -f Dockerfile ]] && PROJECT_TYPE="${PROJECT_TYPE}🐳 Docker"
	[[ -f .env ]] && PROJECT_TYPE="${PROJECT_TYPE}🔐 Env"

	# Only show project line if we detected something
	[[ -n "${PROJECT_TYPE}" ]] && builtin echo "🏗️ Project: ${PROJECT_TYPE}"

	# Git status (only if git repo exists)
	if [[ -d .git ]] || builtin command git rev-parse --git-dir > /dev/null 2>&1; then
		# Get branch and change counts
		local BRANCH=$(builtin command git branch --show-current 2>/dev/null || echo "detached")
		local CHANGES=$(builtin command git status -s | wc -l)
		local STAGED=$(builtin command git diff --cached --numstat | wc -l)
		local UNSTAGED=$(builtin command git diff --numstat | wc -l)
		local UNTRACKED=$(builtin command git ls-files --others --exclude-standard | wc -l)

		# Build compact status line
		local GIT_INFO="🌿 Git: ⎇ ${BRANCH}"
		[[ ${CHANGES} -gt 0 ]] && GIT_INFO="${GIT_INFO} | ${CHANGES} changes"
		[[ ${STAGED} -gt 0 ]] && GIT_INFO="${GIT_INFO} (↑${STAGED} staged)"
		[[ ${UNTRACKED} -gt 0 ]] && GIT_INFO="${GIT_INFO} (◆${UNTRACKED} untracked)"

		builtin echo "${GIT_INFO}"
	fi
}

#######################################################
### FIND FILES OR FILE INFORMATION
#######################################################

# Searches for directories (can use wildcards)
# Example: finddir config
# Example: finddir "This has spaces"
alias finddir='find . -type d -iname'

# Recursively find all files modified in the last 24 hours (current directory)
alias find24='find . -mtime -1 -ls'

# Find all the symlinks containing search text (i.e. "/backup")
alias findlinks="find . -type l -printf '%p -> ' -exec readlink -f {} ';' | grep -E"

# To count how many files are in your current file system location:
alias countfiles='find . -type f | wc -l'

# To see if a command is aliased, a file, or a built-in command
alias check="type -t"

# If the mlocate package is installed
if hascommand locate; then
	# Case insensitive search and display only files present in your system
	alias locate='sudo \locate -i -e'

	# Update the locate database before locating a file
	# --require-visibility 0 ensures only accessible files are indexed
	alias ulocate='sudo updatedb --require-visibility 0 && locate'

	# Always update the locate (mlocate) database as root
	alias updatedb='sudo updatedb --require-visibility 0'

	# Display the number of matching entries
	alias locount='sudo \locate -c'
fi

#######################################################
### FILE MANAGEMENT
#######################################################

# Safety net for changing permisions on /
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Alias to make a file executable
# A combination of the letters ugoa controls which users' access to the
# file will be changed: the user who owns it (u), other users in the
# file's group (g), other users not in the file's group (o), or all users
# (a). If none of these are given, the effect is as if (a) were given,
# but bits that are set in the umask are not affected.
alias mx='chmod a+x'

# Make parent directories as needed
alias mkdir='mkdir -p'

# When copying files, prompt before overwriting a file
alias cp='cp -i'

# Copy file(s) recursively with permissions, ownership, timestamps, symbolic
# links, devices, special files, security context, and extended attributes
if hascommand --strict rsync; then
	alias clone='rsync --archive --human-readable --progress'

	# Clone and synchronize directories deleting files not present at source
	alias clonesync='rsync --archive --delete --human-readable --progress'
else
	alias clone='cp --recursive --preserve=all --verbose'
fi

# When moving files, prompt for confirmation if the destination path exists
# Use -f if you want to skip all prompts (-i option is ignored)
alias mv='mv -i'

# Prompt whether to remove destinations
alias ln='ln -i'

# Prompt before every removal
alias rm='rm -I --preserve-root'

# Remove a directory and all files
alias rmd='command rm --recursive --force --verbose'

# When shredding files, shred no matter permissions and remove the file(s)
alias shred='shred --force --remove --verbose'

# Type any text into a file
alias typefile='echo "Press CTRL+d when done:" && echo "$(</dev/stdin)" >'

# ExifTool removes embedded Exif data (like location) from images, videos, and docs
# https://exiftool.org/
# https://linuxhandbook.com/remove-exif-data/
if hascommand --strict exiftool; then
	alias cleanmeta='exiftool -overwrite_original -all='
fi

# Create a timestamped backup of a file or directory
# Usage: bak [file_or_directory]
function bak() {
	# Display help if no parameter provided
	if [[ -z "${1}" ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}bak${RESET}: Create a timestamped backup of a file or directory"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}bak${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}file_or_directory${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}bak${RESET} ${BRIGHT_YELLOW}config.yml${RESET}  ${BRIGHT_BLUE}# Creates config.yml.2024-03-15.bak${RESET}"
		echo -e "  ${BRIGHT_CYAN}bak${RESET} ${BRIGHT_YELLOW}myproject/${RESET}  ${BRIGHT_BLUE}# Creates myproject.2024-03-15.bak/${RESET}"
		return 1
	fi

	# Check if source exists
	if [[ ! -e "$1" ]]; then
		echo -e "${BRIGHT_RED}ERROR:${RESET} ${BRIGHT_CYAN}$1${RESET} does not exist"
		return 1
	fi

	# Remove trailing slash for directories
	local SOURCE="${1%/}"
	local DATE_STAMP=$(date +"%Y-%m-%d")
	local BACKUP_BASE="${SOURCE}.${DATE_STAMP}"
	local BACKUP_PATH="${BACKUP_BASE}.bak"

	# If backup already exists, add incrementing number
	if [[ -e "${BACKUP_PATH}" ]]; then
		local COUNTER=1
		while [[ -e "${BACKUP_BASE}.${COUNTER}.bak" ]]; do
			((COUNTER++))
		done
		BACKUP_PATH="${BACKUP_BASE}.${COUNTER}.bak"
	fi

	# Perform the backup
	local CP_STATUS
	if [[ -d "${SOURCE}" ]]; then
		cp -r "${SOURCE}" "${BACKUP_PATH}"
		CP_STATUS=$?
	else
		cp "${SOURCE}" "${BACKUP_PATH}"
		CP_STATUS=$?
	fi

	if [[ ${CP_STATUS} -eq 0 ]]; then
		echo -e "${BRIGHT_GREEN}Created backup:${RESET} ${BRIGHT_CYAN}${BACKUP_PATH}${RESET}"
	else
		echo -e "${BRIGHT_RED}Failed to create backup${RESET}"
		return 1
	fi
}

# Restore a backup of a file or directory
# Usage: unbak [file_or_directory]
function unbak() {
	# Display help if no parameter provided
	if [[ -z "${1}" ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}unbak${RESET}: Restore a backup of a file or directory"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}unbak${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}original_name${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}unbak${RESET} ${BRIGHT_YELLOW}config.yml${RESET}  ${BRIGHT_BLUE}# Select from config.yml.*.bak${RESET}"
		echo -e "  ${BRIGHT_CYAN}unbak${RESET} ${BRIGHT_YELLOW}myproject${RESET}   ${BRIGHT_BLUE}# Select from myproject.*.bak/${RESET}"
		return 1
	fi

	# Remove trailing slash for directories
	local TARGET="${1%/}"

	# Find all backup files sorted by modification time (most recent first)
	local BACKUPS=""
	if [[ "$(uname)" == "Darwin" ]]; then
		# macOS: use stat with -f for format
		BACKUPS=$(find . -maxdepth 1 -name "${TARGET}.*.bak" -print0 2>/dev/null | xargs -0 stat -f "%m %N" 2>/dev/null | sort -rn | cut -d' ' -f2-)
	else
		# Linux/GNU: use stat with --format
		BACKUPS=$(find . -maxdepth 1 -name "${TARGET}.*.bak" -print0 2>/dev/null | xargs -0 stat --format="%Y %n" 2>/dev/null | sort -rn | cut -d' ' -f2-)
	fi

	# Fallback: use ls if stat method failed or returned empty
	if [[ -z "${BACKUPS}" ]]; then
		BACKUPS=$(ls -t "${TARGET}".*.bak 2>/dev/null)
	fi

	# Check if any backups were found
	if [[ -z "${BACKUPS}" ]]; then
		echo -e "${BRIGHT_RED}ERROR:${RESET} No backups found for ${BRIGHT_CYAN}${TARGET}${RESET}"
		return 1
	fi

	# Count the number of backups
	local BACKUP_COUNT=$(echo "${BACKUPS}" | wc -l)

	# Select backup to restore
	local SELECTED_BACKUP
	if [[ ${BACKUP_COUNT} -eq 1 ]]; then
		# Only one backup exists, use it directly
		SELECTED_BACKUP="${BACKUPS}"
		echo -e "Found backup: ${BRIGHT_CYAN}${SELECTED_BACKUP}${RESET}"
	else
		# Multiple backups exist, let user choose
		echo -e "Found ${BRIGHT_YELLOW}${BACKUP_COUNT}${RESET} backups for ${BRIGHT_CYAN}${TARGET}${RESET}:"
		SELECTED_BACKUP=$(echo "${BACKUPS}" | createmenu)

		# Check if user canceled the selection
		if [[ -z "${SELECTED_BACKUP}" ]]; then
			echo "Operation canceled."
			return 1
		fi
	fi

	# Show what we're about to do and confirm
	if [[ -e "${TARGET}" ]]; then
		echo -e "${BRIGHT_YELLOW}WARNING:${RESET} ${BRIGHT_CYAN}${TARGET}${RESET} will be overwritten"
	fi

	if ask "Restore from ${SELECTED_BACKUP}?" Y; then
		# Remove existing target if it exists
		if [[ -e "${TARGET}" ]]; then
			rm -rf "${TARGET}"
		fi

		# Restore the backup
		local CP_STATUS
		if [[ -d "${SELECTED_BACKUP}" ]]; then
			cp -r "${SELECTED_BACKUP}" "${TARGET}"
			CP_STATUS=$?
		else
			cp "${SELECTED_BACKUP}" "${TARGET}"
			CP_STATUS=$?
		fi

		if [[ ${CP_STATUS} -eq 0 ]]; then
			echo -e "${BRIGHT_GREEN}Restored${RESET} ${BRIGHT_CYAN}${TARGET}${RESET} from ${BRIGHT_CYAN}${SELECTED_BACKUP}${RESET}"
		else
			echo -e "${BRIGHT_RED}Failed to restore backup${RESET}"
			return 1
		fi
	else
		echo "Operation canceled."
	fi
}

# Show mount points in a pretty, human readable format
# NOTE: Not aliased to 'mount' because that breaks actual mount operations
alias mounts='command mount | column -t'
alias m='mounts'
alias um='umount'

# Your Linux system's filesystem table (or fstab) is a configuration table
# designed to automate mounting and unmounting file systems to a machine
# WARNING: Modifications to this file can make your system unbootable!
alias fstab='sudo cp /etc/fstab /etc/fstab.backup; edit /etc/fstab'

# Display disk space available and show file system type
if hascommand --strict duf; then
	# duf Disk Usage/Free Utility
	# Link: https://github.com/muesli/duf
	# Link: https://linuxhint.com/use-duf-command-in-linux/
	#alias df='duf -hide-fs squashfs'
	alias lll='duf -only local'

elif hascommand --strict vizex; then
	# Visualize disk space usage for every partition and media on the user's machine
	# Link: https://github.com/bexxmodd/vizex
	alias lll='vizex'

else
	# df provides valuable information on disk space utilization
	# Link: https://www.geeksforgeeks.org/df-command-linux-examples/
	if hascommand --strict grc; then
		alias lll='colourify \df --human-readable --print-type --exclude-type=squashfs --exclude-type=tmpfs --exclude-type=devtmpfs --exclude-type=efivarfs'
	else
		alias lll='command df --human-readable --print-type --exclude-type=squashfs --exclude-type=tmpfs --exclude-type=devtmpfs --exclude-type=efivarfs'
	fi
fi

# Get the block size for a partition
# Example: blocksize /dev/sda
alias blocksize='sudo blockdev --getbsz'

# dua parallel disk space analyzer in interactive mode TUI/GUI (in color)
# Link: https://github.com/Byron/dua-cli
# Install: curl -LSfs https://raw.githubusercontent.com/byron/dua-cli/master/ci/install.sh | \sh -s -- --git byron/dua-cli --target x86_64-unknown-linux-musl --crate dua
if [[ -f "${HOME}/.cargo/bin/dua" ]]; then
	alias diskspace="${HOME}/.cargo/bin/dua i"
elif hascommand dua; then
	alias diskspace='dua i'
# gdu fast parallel disk usage analyzer written in Go
# Link: https://github.com/dundee/gdu
# Install: go install github.com/dundee/gdu/v5/cmd/gdu@latest
elif hascommand gdu; then
	alias diskspace='gdu'
# Ncdu is a disk usage analyzer with an ncurses interface
# Link: https://dev.yorhel.nl/ncdu
elif hascommand ncdu; then
	alias diskspace='ncdu'
# diskonaut gives a visual treemap of what is taking up your disk space
# Link: https://github.com/imsnif/diskonaut
elif hascommand diskonaut; then
	alias diskspace='diskonaut'
# Dust is like du written in Rust and more intuitive
# Link: https://github.com/bootandy/dust
elif hascommand dust; then
	alias diskspace='dust -xd1'
# List all folders disk space sorted by largest space
else
	alias diskspace='du -S | sort -n -r | more'
fi

# Just show the size of the current folder or a specified folder
alias totalsize='du -sh'

# List disk space of immediate folders one level deep
alias folders='du -kh --max-depth=1'

# f3 - test and check real capacity for USB devices (backup your drive first)
# Link: https://github.com/AltraMayor/f3
# Link: https://www.linuxbabe.com/command-line/f3-usb-capacity-fake-usb-test-linux
if hascommand --strict f3probe; then
	alias usbtest='sudo f3probe --destructive --time-ops'
fi

# Alias to show MySQL's data directory location
if hascommand --strict mysqld; then
	alias mysqldatadir='mysqld --verbose --help 2>/dev/null | grep ^datadir | column --table'
fi

# Alias to launch a document, file, or URL in it's default X application
if hascommand --strict xdg-open; then
	alias open='runfree xdg-open'
fi

# Source fzf if installed via Git
[ -f ~/.fzf.bash ] && builtin source ~/.fzf.bash # Source if installed via Git

# Alias to fuzzy find files in the current folder(s), preview them, and launch in an editor
if hascommand --strict fzf; then
	# Preview text files in a directory
	if hascommand --strict xdg-open; then
		preview() {
			open $(fzf --info=inline --query="${1}" --preview="$PAGER {}")
		}
	else
		preview() {
			edit $(fzf --info=inline --query="${1}" --preview="$PAGER {}")
		}
	fi

	# Find log files using file previews
	if [[ -d /var/log ]]; then
		# Alias to find and view log files
		if hascommand bat; then
			# Use bat for preview if available for better syntax highlighting
			alias findlog='(cd /var/log && _LOG_SELECTED=$(sudo \find . -maxdepth 10 -iname "*.log" | \sort -f | sudo fzf --layout=reverse-list --info=inline --preview="sudo bat --color=always {}"); if [ -n "${_LOG_SELECTED}" ]; then echo -e "${BRIGHT_CYAN}Log file: ${BRIGHT_YELLOW}$(sudo \realpath "${_LOG_SELECTED}")${RESET}"; logview "$(sudo \realpath "${_LOG_SELECTED}")"; fi)'
		else
			# Fall back to the default PAGER
			alias findlog='(cd /var/log && _LOG_SELECTED=$(sudo \find . -maxdepth 10 -iname "*.log" | \sort -f | sudo -E fzf --layout=reverse-list --info=inline --preview="sudo ${PAGER} {}"); if [ -n "${_LOG_SELECTED}" ]; then echo -e "${BRIGHT_CYAN}Log file: ${BRIGHT_YELLOW}$(sudo \realpath "${_LOG_SELECTED}")${RESET}"; logview "$(sudo \realpath "${_LOG_SELECTED}")"; fi)'
		fi
	fi
fi

# Alias for Midnight Commander (mc) to exit into current directory
# NOTE: Use mcc for the shell command line features as the subshell is very slow
# https://stackoverflow.com/questions/39017391/how-to-make-midnight-commander-exit-to-its-current-directory
# https://unix.stackexchange.com/questions/57439/slow-start-of-midnight-commander
# https://midnight-commander.org/ticket/3580
if [[ -f "/usr/lib/mc/mc-wrapper.sh" ]]; then
	alias mcc='builtin source /usr/lib/mc/mc-wrapper.sh'
	alias mc='builtin source /usr/lib/mc/mc-wrapper.sh --nosubshell'
elif hascommand --strict mc; then
	alias mcc='command mc'
	alias mc='command mc --nosubshell'
fi

# Check shell script syntax
if hascommand --strict shellcheck; then
	alias schk='shellcheck'
fi

# Alias to view log files in real time (usually in /var/log)
# Check for lnav (The Log File Navigator)
# Link: https://lnav.org
if hascommand --strict lnav; then
	alias logview='sudo \lnav -r -t'
	alias logs='sudo \lnav -r -t /var/log/*.log' # All logs in /var/log

# Check for multitail (Multiple Tail)
# Link: https://www.vanheusden.com/multitail/
elif hascommand --strict multitail; then
	alias logview='sudo \multitail -c -s 2'
	alias logs='sudo \multitail -c -s 2 /var/log/*.log'

# Check for tail
elif hascommand --strict tail; then
	alias logview='sudo tail -f'
	alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# If no log viewer is installed, use less as a fallback
else
	alias logview='sudo \less +F'
fi

# Show logs in color
if hascommand --strict multitail; then
	alias multitail='command multitail -c'
fi

#######################################################
### DATE AND TIME
#######################################################

# Show the time
alias now='date +"%T"'

# Show the short date
alias today='date +"%Y-%m-%d"'

# Stop watch
alias stopwatch='date && echo "Press CTRL+D to stop" && time read'

# Countdown timer and stop watch
# Link: https://github.com/trehn/termdown
# Fonts: banner3, big, computer, doh, letters, roman, small, standard, univers
# Link: http://www.figlet.org/examples.html
if hascommand --strict termdown; then
	alias termdown='termdown --blink --end --critical 10 --font doh'
	alias countdown="termdown --help | sed -n '/Options\:/q;p'"
	alias timer='termdown'
	alias clock='termdown --time'
fi

# Change a file's (or files using a wildcard) accessed and modified time to now
# NOTE: There is no file creation date in Unix, only access, modify, and change
alias filetimenow='touch -a -m'

# Compare local clock against multiple NTP time sources
# Requires: ntpdate (from the ntp or ntpdate package)
# NOTE: Uses GNU date extensions (%N, -d @epoch) so Linux/WSL only
function timecheck() {
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}timecheck${RESET}: Compare local clock against multiple NTP time sources"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}timecheck${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}server1 server2 ...${BRIGHT_MAGENTA}]${RESET}"
		echo
		echo -e "${BRIGHT_WHITE}Options:${RESET}"
		echo -e "  ${BRIGHT_GREEN}-h, --help${RESET}     ${BRIGHT_BLUE}Show this help message${RESET}"
		echo
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}timecheck${RESET}                              ${BRIGHT_BLUE}# Query default NTP servers${RESET}"
		echo -e "  ${BRIGHT_CYAN}timecheck${RESET} ${BRIGHT_YELLOW}time.google.com pool.ntp.org${RESET}  ${BRIGHT_BLUE}# Query specific servers${RESET}"
		return 0
	fi

	# Dependency check
	if ! hascommand --strict ntpdate; then
		echo -e "${BRIGHT_RED}timecheck:${RESET} ntpdate not found. Install the ${BRIGHT_CYAN}ntp${RESET} or ${BRIGHT_CYAN}ntpdate${RESET} package for your distro."
		return 1
	fi

	# Allow override or use well-known public NTP servers as defaults
	local SERVERS=("${@}")
	if [[ ${#SERVERS[@]} -eq 0 ]]; then
		SERVERS=(
			pool.ntp.org
			time.apple.com
			time.cloudflare.com
			time.facebook.com
			time.google.com
			time.nist.gov
		)
	fi

	# Show local clock first
	local LOCAL_NOW
	LOCAL_NOW=$(date -u '+%Y-%m-%d %H:%M:%S.%3N UTC')
	echo -e "  ${BRIGHT_WHITE}Local clock${RESET}             ${LOCAL_NOW}"
	echo -e "  ${BRIGHT_BLACK}──────────────────────  ─────────────────────────────${RESET}"

	# Query each server with a 4-second timeout per server
	local SERVER OFFSET SERVER_EPOCH SERVER_TIME TIMEOUT_CMD=""
	if hascommand --strict timeout; then
		TIMEOUT_CMD="timeout 4"
	fi

	for SERVER in "${SERVERS[@]}"; do
		# ntpdate -q queries without setting the clock (no root needed)
		# Output: "server X.X.X.X, stratum N, offset +0.000123, delay 0.02345"
		OFFSET=$(${TIMEOUT_CMD} ntpdate -q "${SERVER}" 2>/dev/null \
			| awk '/^server/ { for (i = 1; i <= NF; i++) if ($i == "offset") { gsub(/,/, "", $(i+1)); print $(i+1) } }' \
			| head -1)

		if [[ -n "${OFFSET}" ]]; then
			# Reconstruct server time: local epoch + measured offset
			SERVER_EPOCH=$(awk -v BASE="$(date +%s.%N)" -v OFF="${OFFSET}" 'BEGIN { printf "%.3f", BASE + OFF }')
			SERVER_TIME=$(date -u -d "@${SERVER_EPOCH}" '+%Y-%m-%d %H:%M:%S.%3N UTC')
			printf "  ${BRIGHT_CYAN}%-22s${RESET}  %s  ${BRIGHT_YELLOW}(offset %+.3f s)${RESET}\n" "${SERVER}" "${SERVER_TIME}" "${OFFSET}"
		else
			printf "  ${BRIGHT_CYAN}%-22s${RESET}  ${BRIGHT_RED}%-30s${RESET}\n" "${SERVER}" "unreachable"
		fi
	done
}

#######################################################
### CPU, MEMORY, AND PROCESSES
#######################################################

# Display amount of free and used memory
alias free='free -h'

# When reporting a snapshot of the current processes:
# a = all users
# u = user-oriented format providing detailed information
# x = list the processes without a controlling terminal
# f = display a tree view of parent to child processes
#alias ps='ps auxf'

# Show top ten processes
alias cpu='ps aux | sort -r -nk +4 | head | $PAGER'

# Show CPU information
alias cpuinfo='lscpu | $PAGER'

# Show the USB device tree
if hascommand --strict lsusb; then
	alias usb='lsusb -t'
fi

# Show the PCI device tree
if hascommand --strict lspci; then
	alias pci='lspci -tv'
fi

# Alias top
# Link: https://ostechnix.com/some-alternatives-to-top-command-line-utility-you-might-want-to-know/
# Link: https://www.linuxlinks.com/alternativestotop/
# List of preferred top commands in order of preference

# Iterate over a list of preferred top commands in order of preference/features
_TOP_COMMANDS=("btop" "bpytop" "bashtop" "nmon" "glances" "btm" "ytop" "gtop" "htop")
for _TOP_COMMAND in "${_TOP_COMMANDS[@]}"; do
	# Check if the command exists and is executable
	if hascommand --strict "${_TOP_COMMAND}"; then
		# Create an alias for the 'top' command using the found command
		alias top="${_TOP_COMMAND}"
		# Exit the loop once the first matching command is found
		break
	fi
done
# Clean up and don't leave the extra variables in the environment
unset _TOP_COMMANDS
unset _TOP_COMMAND

# Alias bottom
# Link: https://github.com/ClementTsang/bottom
if hascommand --strict btm; then
	alias bottom='btm'
fi

# nvtop is a task monitor for NVIDIA, AMD and Intel GPUs
# Link: https://github.com/Syllo/nvtop
if hascommand --strict nvtop; then
	alias gpu='nvtop'
fi

# Show jobs
alias j='jobs -l'

# Change the cursor to a crosshair to select a window (requires xprop)
if hascommand --strict xprop; then
	alias windowinfo='xprop'
fi

# Get active X-window process ID after a 3 second delay (requires xdotool)
if hascommand --strict xdotool; then
	alias activewinpid='sleep 3 && xdotool getactivewindow getwindowpid'
fi

# Alias to clear RAM memory cache, buffer and swap space
# Link: https://www.tecmint.com/clear-ram-memory-cache-buffer-and-swap-space-on-linux/
alias flushcache="sudo free -h && \\
	sudo su -c \"echo 3 >'/proc/sys/vm/drop_caches' && \\
	swapoff -a && \\
	swapon -a && \\
	printf '\n${BRIGHT_YELLOW}%s${RESET}\n\n' 'Ram-cache and Swap Cleared'\" root && \\
	free -h"

#######################################################
### NETWORKING
#######################################################

# yt-dlp fork of youtube-dl - Set the default download folder
# Link: https://github.com/yt-dlp/yt-dlp
if hascommand --strict yt-dlp; then
	alias yt-dlp='yt-dlp'
	alias ytd='yt-dlp'
# Youtube-dl - Use best settings
# Link: https://github.com/ytdl-org/youtube-dl
elif hascommand --strict youtube-dl; then
	alias youtube-dl="youtube-dl --format 'best[vcodec*=avc]'"
	alias ytd='youtube-dl'
fi

# Checking for the presence of download utilities to create a download alias
# and an optional alias for downloading the LS_COLORS file to ~/.dircolors
# that requires the dircolors command used by ls to set color directory output
if hascommand aria2c; then
	# aria2c is a lightweight multi-protocol & multi-source command-line
	# download utility that supports HTTP/HTTPS, FTP, SFTP, BitTorrent, and
	# Metalink with multiple connections and enhanced control over connections
	# Link: https://aria2.github.io/
	alias aria2c='aria2c --max-connection-per-server=5 --continue=true --async-dns=false'

	if hascommand --strict dircolors; then
		alias download-dircolors='aria2c --max-connection-per-server=5 --continue=true --async-dns=false -d "${HOME}" -o .dircolors https://raw.githubusercontent.com/ahmadassaf/dircolors/master/LS_COLORS'
	fi
elif hascommand --strict wget; then
	# wget is a non-interactive command-line file downloader for HTTP, HTTPS,
	# and FTP that supports resuming downloads on more unstable connections
	# Link: https://www.gnu.org/software/wget/
	if hascommand --strict dircolors; then
		alias download-dircolors='wget --continue -O "${HOME}/.dircolors" https://raw.githubusercontent.com/ahmadassaf/dircolors/master/LS_COLORS'
	fi
elif hascommand --strict curl; then
	# curl supports data transfer from or to a server using multiple protocols
	# like HTTP, HTTPS, and FTP, and features resuming and redirect following
	# Link: https://curl.se/
	if hascommand --strict dircolors; then
		alias download-dircolors='curl -C - -L -o "${HOME}/.dircolors" https://raw.githubusercontent.com/ahmadassaf/dircolors/master/LS_COLORS'
	fi
fi

# Resume wget by default
if hascommand --strict wget; then
	alias wget='wget -c'
fi

# Stop pinging after sending 5 ECHO_REQUEST packets
alias ping='ping -c 5'

# Do not wait for ping interval 1 second, go fast
alias fastping='ping -c 100 -i.2'

# Show open ports
alias ports='netstat -tulanp'

# Display and monitor the disk IO usage
# Link: https://www.geeksforgeeks.org/iotop-command-in-linux-with-examples/
if hascommand iotop; then
	alias iotop='sudo iotop -o -a'
fi

# If nmap is installed, set an alias for a network scan of a host (takes a while)
# Scan delay slows things down but reduces throttling, anti-ddos, auto-block
# Link: https://nmap.org/
# Example: netscan localhost
if hascommand nmap; then
	alias netscan='sudo nmap --scan-delay 1.1s -v --resolve-all -A -sTUV'
fi

# Get local IP addresses
if hascommand --strict ip; then
	alias iplocal="ip -br -c a"
else
	alias iplocal="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
fi

# Get public IP address (several options below)
alias ipexternal='wget -O - -q icanhazip.com && echo'
# alias ipexternal='wget -qO- ifconfig.me/ip && echo'
# alias ipexternal='curl ipinfo.io/ip && echo'

# Make it easy to disable and reenable the Teamviewer service
# so that it's not constantly running and only when you need it
if hascommand --strict teamviewer; then
	alias teamviewerstart='sudo teamviewer --daemon start'
	alias teamviewerstop='sudo teamviewer --daemon stop'
fi

# Check SSL certificate expiration for a domain
# Usage: sslcheck [domain] [port]
function sslcheck() {
	# Display help if no parameter provided
	if [[ -z "${1}" ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}sslcheck${RESET}: Check SSL certificate expiration for a domain"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}sslcheck${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}domain${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}port${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}sslcheck${RESET} ${BRIGHT_YELLOW}google.com${RESET}        ${BRIGHT_BLUE}# Uses default port 443${RESET}"
		echo -e "  ${BRIGHT_CYAN}sslcheck${RESET} ${BRIGHT_YELLOW}example.com 8443${RESET}  ${BRIGHT_BLUE}# Custom port${RESET}"
		return 1
	fi

	# Check if openssl is available
	if ! hascommand --strict openssl; then
		echo -e "${BRIGHT_RED}ERROR:${RESET} openssl is required but not installed"
		return 1
	fi

	local DOMAIN="$1"
	local PORT="${2:-443}"

	# Remove protocol prefix if provided
	DOMAIN="${DOMAIN#https://}"
	DOMAIN="${DOMAIN#http://}"
	# Remove trailing slash and path
	DOMAIN="${DOMAIN%%/*}"

	echo -e "Checking SSL certificate for ${BRIGHT_CYAN}${DOMAIN}:${PORT}${RESET}..."

	# Get certificate expiry date
	local CERT_INFO
	CERT_INFO=$(echo | openssl s_client -servername "${DOMAIN}" -connect "${DOMAIN}:${PORT}" 2>/dev/null | openssl x509 -noout -dates 2>/dev/null)

	if [[ -z "${CERT_INFO}" ]]; then
		echo -e "${BRIGHT_RED}ERROR:${RESET} Could not retrieve certificate from ${BRIGHT_CYAN}${DOMAIN}:${PORT}${RESET}"
		echo -e "Possible causes: domain doesn't exist, no SSL, connection refused, or timeout"
		return 1
	fi

	# Extract the expiry date
	local EXPIRY_DATE
	EXPIRY_DATE=$(echo "${CERT_INFO}" | grep 'notAfter=' | cut -d= -f2)

	if [[ -z "${EXPIRY_DATE}" ]]; then
		echo -e "${BRIGHT_RED}ERROR:${RESET} Could not parse certificate expiry date"
		return 1
	fi

	# Calculate days until expiry (cross-platform)
	local EXPIRY_EPOCH
	local NOW_EPOCH
	local DAYS_LEFT

	# Normalize date string (handle double spaces in day)
	EXPIRY_DATE=$(echo "${EXPIRY_DATE}" | sed 's/  */ /g')

	if [[ "$(uname)" == "Darwin" ]]; then
		# macOS date syntax
		EXPIRY_EPOCH=$(date -j -f "%b %d %T %Y %Z" "${EXPIRY_DATE}" "+%s" 2>/dev/null)
	else
		# Linux/GNU date syntax
		EXPIRY_EPOCH=$(date -d "${EXPIRY_DATE}" "+%s" 2>/dev/null)
	fi

	NOW_EPOCH=$(date "+%s")

	if [[ -n "${EXPIRY_EPOCH}" ]]; then
		DAYS_LEFT=$(( (EXPIRY_EPOCH - NOW_EPOCH) / 86400 ))
	else
		# Fallback: just show the date without days calculation
		echo -e "Certificate expires: ${BRIGHT_YELLOW}${EXPIRY_DATE}${RESET}"
		echo -e "${BRIGHT_YELLOW}(Could not calculate days remaining)${RESET}"
		return 0
	fi

	# Display result with color based on urgency
	local COLOR
	local STATUS
	if [[ ${DAYS_LEFT} -lt 0 ]]; then
		COLOR="${BRIGHT_RED}"
		STATUS="EXPIRED"
		echo -e "${COLOR}Certificate ${STATUS}${RESET} $((-DAYS_LEFT)) days ago"
	elif [[ ${DAYS_LEFT} -lt 7 ]]; then
		COLOR="${BRIGHT_RED}"
		STATUS="CRITICAL"
		echo -e "${COLOR}${STATUS}:${RESET} Certificate expires in ${COLOR}${DAYS_LEFT}${RESET} days"
	elif [[ ${DAYS_LEFT} -lt 30 ]]; then
		COLOR="${BRIGHT_YELLOW}"
		STATUS="WARNING"
		echo -e "${COLOR}${STATUS}:${RESET} Certificate expires in ${COLOR}${DAYS_LEFT}${RESET} days"
	else
		COLOR="${BRIGHT_GREEN}"
		echo -e "${COLOR}OK:${RESET} Certificate expires in ${COLOR}${DAYS_LEFT}${RESET} days"
	fi

	echo -e "Expiry date: ${BRIGHT_CYAN}${EXPIRY_DATE}${RESET}"
}

#######################################################
### VISUAL
#######################################################

# Colorize the grep command output for ease of use (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Show the currectdisplay server
alias whichdisplay='echo -e "\033[1;33m${XDG_SESSION_TYPE^}\033[0m"'

# Colorize messages for the kernel ring buffer
alias dmesg='dmesg --color'

# Clear the screen with both clear and cls shorthand
alias cls='clear'

# Search and play YouTube videos in the terminal
if hascommand --strict ytfzf; then
	alias yt='ytfzf -l -t'
fi

# Convert images to ASCII in color
if hascommand --strict jp2a; then
	alias jp2a='jp2a --color'
fi

# List fonts for toilet
if hascommand --strict toilet; then
	alias toiletfont='ls /usr/share/figlet'
	alias toiletfontlist='for file in /usr/share/figlet/*.?lf; do toilet -f $(basename "$file") $(basename "$file"); done'
fi

# Launch the cmatrix screen saver (if installed)
if hascommand --strict cmatrix; then
	alias matrix='cmatrix -b'
fi

# Wrap text breaking at whitespace only
# use -w or --width=WIDTH to set line width (default 80)
if hascommand --strict fold; then
	alias wrap='fold --spaces'
fi

# Fix spacing and reformat text while preserving paragraphs
if hascommand --strict fmt; then
	alias unwrap='fmt'
fi

#######################################################
### FILE SYSTEMS
#######################################################

# Aliases for BtrFS file systems
if hascommand --strict btrfs; then
	alias btrcheck='sudo btrfs fi show'                        # Check status of raid drives
	alias btrstats='sudo btrfs device stats'                   # Show device statistics
	alias btrscrub='sudo btrfs scrub start'                    # Start a scrub
	alias btrpause='sudo btrfs scrub cancel'                   # Cancel or pause a scrub
	alias btrresume='sudo btrfs scrub resume'                  # Resume a paused scrub
	alias btrstatus='sudo btrfs scrub status'                  # Show status of a scrub
	alias btrdefragfile='sudo btrfs filesystem defragment -vf' # Defrag a file
	alias btrdefragdir='sudo btrfs filesystem defragment -rvf' # Defrag a directory
fi

# Aliases for Ext3 file systems
if hascommand --strict mkfs.ext3; then
	alias ext3check='sudo fsck.ext3'   # Check and repair Ext3 filesystem
	alias ext3stats='sudo dumpe2fs -h' # Show statistics for Ext3 filesystem
	alias ext3trim='sudo fstrim -v'    # Trim unused blocks on Ext3 filesystem
fi

# Aliases for EXT4 file systems
if hascommand --strict mkfs.ext4; then
	alias ext4check='sudo fsck.ext4'   # Check and repair EXT4 filesystem
	alias ext4stats='sudo dumpe2fs -h' # Show statistics for EXT4 filesystem
	alias ext4trim='sudo fstrim -v'    # Trim unused blocks on EXT4 filesystem
fi

# Aliases for F2FS file systems
if hascommand --strict mkfs.f2fs; then
	alias f2fscheck='sudo fsck.f2fs'   # Check and repair F2FS filesystem
	alias f2fsstats='sudo dump.f2fs'   # Show statistics for F2FS filesystem
	alias f2fstrim='sudo fstrim -v'    # Trim unused blocks on F2FS filesystem
fi

# Aliases for XFS file systems
if hascommand --strict mkfs.xfs; then
	alias xfscheck='sudo xfs_repair'   # Check and repair XFS filesystem
	alias xfsstats='sudo xfs_info'     # Show information about XFS filesystem
	alias xfstrim='sudo fstrim -v'     # Trim unused blocks on XFS filesystem
fi

# Aliases for ZFS file systems
if hascommand --strict zpool; then
	alias zfscheck='sudo zpool scrub'           # Check and repair ZFS pool
	alias zfsstats='sudo zpool iostat'          # Show ZFS pool statistics
	alias zfstrim='sudo zpool trim'             # Trim unused blocks on ZFS pool
	alias zfsstatus='sudo zpool status'         # Check status of ZFS pool
	alias zfsscrub='sudo zpool scrub'           # Start a scrub on ZFS pool
	alias zfspause='sudo zpool scrub -s'        # Pause a scrub on ZFS pool
	alias zfsresume='sudo zpool scrub'            # Resume a paused scrub (just re-run scrub)
	alias zfsscrubstatus='sudo zpool status -v' # Show status of ZFS pool scrub
	# NOTE: ZFS does not support traditional defragmentation.
	# 'zfs send -R' sends a replication stream (raw binary) to stdout -- not defrag.
fi

# Aliases for NTFS filesystems
if hascommand --strict ntfsfix; then
	alias ntfscheck='sudo ntfsfix'  # Check and repair NTFS filesystem
	alias ntfsstats='sudo ntfsinfo' # Show information about NTFS filesystem
fi

# Aliases for exFAT, FAT12, FAT16, and FAT32 filesystems
# I'm on a diet, so no jokes please. This whole section. lol
if hascommand --strict dosfsck; then
	alias fatcheck='sudo dosfsck'     # Check and repair FAT filesystem
	alias fatstats='sudo fsck.fat -i' # Show information about FAT filesystem
fi

#######################################################
### DISTROBOX
#######################################################

# If Distrobox is installed...
# Link: https://github.com/89luca89/distrobox
# Link: https://github.com/89luca89/distrobox/blob/main/docs/usage/usage.md
if hascommand --strict distrobox; then
	# Create aliases for the most common commands
	alias db='distrobox'
	alias {dbe,distrobox-enter}='_distrobox-enter'
	alias dbl='distrobox list'
	alias dbls='distrobox-list-simple'
	alias dbs='distrobox stop'
	alias dbsa='distrobox-stop-all'
	alias dbhe='distrobox-host-exec'
	alias {dbup,distrobox-upgrade}='_distrobox-upgrade'
	alias {dbc,distrobox-check}='docker system df -v'

	# List only the names of each container
	# This takes no arguments and will mostly be used in scripts
	function distrobox-list-simple() {
		distrobox-list | awk -F '|' '{print $2}' | tail -n +2 | sed 's/^[ \t]*//;s/[ \t]*$//'
	}

	# Choose an installed container
	# This takes no arguments and will mostly be used in scripts
	function distrobox-pick() {
		distrobox-list-simple | createmenu
	}

	# Loop through and stop all containers
	function distrobox-stop-all() {
		local _BOX
		while IFS= read -r _BOX; do
			[[ -n "${_BOX}" ]] && \distrobox stop --yes "${_BOX}"
		done <<< "$(distrobox-list-simple)"
	}

	function _distrobox-enter() {
		if [ $# -eq 0 ]; then
			command distrobox enter "$(distrobox-pick)"
		else
			command distrobox enter "$@"
		fi
	}

	function _distrobox-upgrade() {
		if [ $# -eq 0 ]; then
			command distrobox upgrade --all
		else
			command distrobox upgrade "$@"
		fi
	}
fi

#######################################################
### MISCELLANEOUS
#######################################################

# Raw kernel ring buffer messages
alias kernelmessages='sudo dmesg'

# Filter kernel messages for problems
alias kernelerrors='sudo dmesg | grep -iE "error|fail|warn|critical|panic|oops|segfault|timeout|refused|denied|unable|cannot|invalid|corrupt|bad|broken|missing|not found|no such|permission denied"'

# Alias to show the current TTY (CTRL+ALT+1 through 7)
alias whichtty='tty | sed -e "s:/dev/::"'

# Conditionally set alias for checking failed login attempts
if hascommand aureport; then
	# Use aureport to generate a report of failed authentication attempts
	alias checkloginfailures='sudo \aureport -au --failed | command less'
elif hascommand lastb; then
	# If aureport is not available, check for the lastb command
	alias checkloginfailures='sudo \lastb | command less'
else
	# If neither executable command is available, check for system log files
	if [[ -f /var/log/auth.log ]]; then
		# Use grep to search for 'FAILED LOGIN' entries in auth.log
		alias checkloginfailures="sudo \grep 'FAILED LOGIN' /var/log/auth.log | command less"
	elif [[ -f /var/log/secure ]]; then
		# Use grep to search for 'FAILED LOGIN' entries in secure
		alias checkloginfailures="sudo \grep 'FAILED LOGIN' /var/log/secure | command less"
	#else
	#	# Provide feedback if no methods are available for checking login failures
	#	echo "Error: No common methods or logs found for checking login failures"
	fi
fi

# Spell check a word with DidYouMean
# Link: https://github.com/hisbaan/didyoumean
if hascommand --strict dym; then
	alias spell='dym -n 10 -y'
fi

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# If OpenSSL is installed...
if hascommand --strict openssl; then
	# If base64 isn't available, use openssl's version to do the same thing
	if ! hascommand --strict base64; then
		alias base64='openssl base64'
	fi

	# If base64 isn't available, use openssl's version to do the same thing
	if ! hascommand --strict md5sum; then
		alias md5sum='openssl md5'
	fi

	# SHA1
	alias sha1='openssl sha1'
fi

# Update the fireware on Linux automatically and safely using fwupdmgr
# (used by companies like Corsair, Dell, HP, Intel, Logitech, etc.)
# Install: pkginstall fwupdmgr
# Link: https://fwupd.org
if hascommand --strict fwupdmgr; then
	alias firmwareupdate='fwupdmgr get-devices && fwupdmgr refresh && fwupdmgr get-updates && fwupdmgr update'
fi

# When updating virus definitions, do it as root
if hascommand --strict freshclam; then
	alias freshclam='sudo freshclam'
fi

# Check passwords with cracklib
# Link: https://www.cyberciti.biz/security/linux-password-strength-checker/
if hascommand --strict cracklib-check; then
	alias pwcheck='cracklib-check<<<'
fi

# Check for the availability of web browsers
# Link: https://www.geeksforgeeks.org/using-lynx-to-browse-the-web-from-the-linux-terminal/
# Link: https://wiki.archlinux.org/title/ELinks
# Link: https://w3m.sourceforge.net/
# Link: http://www.aboutlinux.info/2007/02/links2-cross-platform-console-based-web.html
# Link: https://www.tecmint.com/command-line-web-browsers/
for TERMINAL_BROWSER in "w3m" "lynx" "elinks" "links2" "links"; do
	if hascommand "${TERMINAL_BROWSER}"; then
		# Show the Extreme Ultimate .bashrc README file in the available browser
		if [[ -f "${BASHRC_INSTALL_DIR}/README.html" ]]; then
			alias readme="${TERMINAL_BROWSER} ${BASHRC_INSTALL_DIR}/README.html"
			break  # Exit the loop once the first available browser is found
		elif [[ -f "${HOME}/README.html" ]]; then
			alias readme="${TERMINAL_BROWSER} ~/README.html"
			break  # Exit the loop once the first available browser is found
		fi
	fi
done

# If the readme alias is still not set, try markdown readers
if [[ $(type -t readme) != 'alias' ]]; then
	# Check for the availability of markdown viewers
	# Link: https://github.com/Textualize/frogmouth
	# Link: https://github.com/charmbracelet/glow
	# Link: https://github.com/swsnr/mdcat
	# Link: https://github.com/ttscoff/mdless
	for TERMINAL_MARKDOWN_VIEWER in "frogmouth" "glow" "mdcat" "mdless"; do
		if hascommand "${TERMINAL_MARKDOWN_VIEWER}"; then
			# If README.md exists in .config/bashrc, set 'readme' alias
			if [[ -f "${BASHRC_INSTALL_DIR}/README.md" ]]; then
				alias readme="${TERMINAL_MARKDOWN_VIEWER} ${BASHRC_INSTALL_DIR}/README.md"
				break  # Exit the loop once the first available browser is found
			# If README.md exists in home, set 'readme' alias
			elif [[ -f "${HOME}/README.md" ]]; then
				alias readme="${TERMINAL_MARKDOWN_VIEWER} ~/README.md"
				break  # Exit the loop once the first available browser is found
			fi
		fi
	done
fi

# If glow is installed, set up some aliases for it
# Link: https://github.com/charmbracelet/glow
if hascommand glow; then
	# Use glow's pager option
	alias glow='glow --all --pager'

	# Local only version for security
	alias glowsafe='glow --all --pager --local'
fi

# If mdcat is installed, use pagination
# Link: https://github.com/swsnr/mdcat
if hascommand mdcat; then
	alias mdcat='mdcat --paginate'
fi

# jless is a command-line JSON viewer
# Link: https://jless.io/
if hascommand --strict jless; then
	alias json='jless'

# jnv - Interactive JSON viewer and jq filter editor
# Link: https://github.com/ynqa/jnv
elif hascommand --strict jnv && hascommand --strict jq; then
	alias json='jnv'

# fx is a JavaScript Object Notation (JSON) viewer
# Link: https://github.com/antonmedv/fx
elif hascommand --strict fx; then
	alias json='fx'

# jq - Pretty Print JSON Files in the terminal
# Link: https://itsfoss.com/pretty-print-json-linux/
elif hascommand --strict jq; then
	alias json='jq'
fi

# Pretty print JSON
if hascommand --strict jq; then
	alias jsonformat='jq'
fi

# baca TUI ebook reader
# Link: https://github.com/wustho/baca
# Install: pip install baca
if hascommand --strict baca; then
	alias ebook=baca
fi

if hascommand piper-tts; then
	# Piper TTS - fast local neural text-to-speech (VITS model)
	# Link: https://github.com/rhasspy/piper
	# Voices stored in ~/.local/share/piper/, prefers john (LibriVox narrator)
	# All en_US voices use 22050 Hz sample rate
	PIPER_VOICE=""
	for _VOICE in en_US-john-medium en_US-lessac-high en_US-ryan-high en_US-norman-medium en_US-arctic-medium; do
		if [[ -f "${HOME}/.local/share/piper/${_VOICE}.onnx" ]]; then
			PIPER_VOICE="${HOME}/.local/share/piper/${_VOICE}.onnx"
			break
		fi
	done
	unset _VOICE
	if [[ -n "${PIPER_VOICE}" ]]; then
		# Usage: say "text" or say -f output.wav "text" or say --file output.wav "text"
		say() {
			local OUTPUT_FILE=""
			if [[ "${1:-}" == "-f" || "${1:-}" == "--file" || "${1:-}" == "--filename" ]]; then
				OUTPUT_FILE="${2}"
				shift 2
			fi
			if [[ -n "${OUTPUT_FILE}" ]]; then
				echo "$*" | piper-tts -m "${PIPER_VOICE}" -f "${OUTPUT_FILE}" 2>/dev/null
			else
				echo "$*" | piper-tts -m "${PIPER_VOICE}" --output-raw 2>/dev/null | aplay -r 22050 -f S16_LE -q 2>/dev/null
			fi
		}
		# Usage: saycb or saycb -f output.wav or saycb --file output.wav
		saycb() {
			local OUTPUT_FILE=""
			if [[ "${1:-}" == "-f" || "${1:-}" == "--file" || "${1:-}" == "--filename" ]]; then
				OUTPUT_FILE="${2}"
			fi
			if [[ -n "${OUTPUT_FILE}" ]]; then
				clipboard | piper-tts -m "${PIPER_VOICE}" -f "${OUTPUT_FILE}" 2>/dev/null
			else
				clipboard | piper-tts -m "${PIPER_VOICE}" --output-raw 2>/dev/null | aplay -r 22050 -f S16_LE -q 2>/dev/null
			fi
		}
		alias sayclipboard='saycb'
		saygreet() { echo "$(HOUR=$(date +%H); echo "$( [ "$HOUR" -lt 12 ] && echo "Good morning" || { [ "$HOUR" -lt 17 ] && echo "Good afternoon" || { [ "$HOUR" -lt 21 ] && echo "Good evening" || echo "Good night"; }; }) $(getent passwd "${USER}" | cut -d ":" -f 5 | cut -d "," -f 1 || echo "${USER}")! It is $(date +"%-I. %M. %p" | sed "s/AM/A. M./; s/PM/P. M./"). $(grep -q "^To " /var/mail/${USER} 2>/dev/null && echo "You have new messages." || echo "")")" | piper-tts -m "${PIPER_VOICE}" --output-raw 2>/dev/null | aplay -r 22050 -f S16_LE -q 2>/dev/null; }
	fi
elif hascommand RHVoice-test; then
	# RHVoice is a free and open-source multilingual speech synthesizer
	# Link: https://rhvoice.org
	alias say='RHVoice-test --rate 130 --volume 100 --profile lyubov <<<'
	alias {saycb,sayclipboard}='clipboard | RHVoice-test --rate 130 --volume 100 --profile lyubov'
	alias saygreet='echo "$(HOUR=$(date +%H); echo "$( [ "$HOUR" -lt 12 ] && echo "Good morning" || { [ "$HOUR" -lt 17 ] && echo "Good afternoon" || { [ "$HOUR" -lt 21 ] && echo "Good evening" || echo "Good night"; }; }) $(getent passwd "${USER}" | cut -d ":" -f 5 | cut -d "," -f 1 || echo "${USER}")! It is $(date +"%-I. %M. %p" | sed "s/AM/A. M./; s/PM/P. M./"). $(grep -q "^To " /var/mail/${USER} 2>/dev/null && echo "You have new messages." || echo "")")" | RHVoice-test --rate 130 --volume 100 --profile lyubov'
elif hascommand espeak; then
	# Speak with female voice
	# Link: https://thomashunter.name/posts/2012-05-21-female-voice-using-espeak
	alias say='espeak -ven-us+f4 -s170'
	alias {saycb,sayclipboard}='clipboard | espeak -ven-us+f4 -s170'
	alias saygreet='echo "$(HOUR=$(date +%H); echo "$( [ "$HOUR" -lt 12 ] && echo "Good morning" || { [ "$HOUR" -lt 17 ] && echo "Good afternoon" || { [ "$HOUR" -lt 21 ] && echo "Good evening" || echo "Good night"; }; }) $(getent passwd "${USER}" | cut -d ":" -f 5 | cut -d "," -f 1 || echo "${USER}")! It is $(date +"%-I. %M. %p" | sed "s/AM/A. M./; s/PM/P. M./"). $(grep -q "^To " /var/mail/${USER} 2>/dev/null && echo "You have new messages." || echo "")")" | espeak -ven-us+f4 -s170'
fi

# Aliases to modify GRUB
# https://www.howtogeek.com/196655/how-to-configure-the-grub2-boot-loaders-settings/
alias grubedit='edit /etc/default/grub'
alias grubsave='sudo update-grub'

# Shows all the script files in a directory and which shell they require
alias scanscripts='grep -E -r "^#!/" ./* 2> /dev/null'

# Vlock - lock all terminals
# Install: sudo apt install vlock
# Install: sudo pacman -S kbd
# https://odysee.com/@DistroTube:2/lock-your-terminal-sessions-with-vlock:0
if hascommand --strict vlock; then
	# Alias Vlock to lock all terminals and can be typed with one hand
	alias lok='vlock --all'
fi

# Alias thefuck that corrects errors in previous console commands
# Link: https://github.com/nvbn/thefuck
if hascommand --strict thefuck; then
	eval "$(thefuck --alias fix)"
fi

# Alias to restart KDE Plasma desktop without rebooting or logging out
if hascommand --strict kstart5 && hascommand --strict kquitapp5; then
	alias {plasmarestart,kderestart}='kquitapp5 plasmashell && runfree kstart5 plasmashell'
fi

#######################################################
# Set compression aliases with automatic parallel processing if installed
# Note: Use [-P] to preserve full paths
# To encrypt the output, pipe it to the built-in encrypt function:
#   mk... - [files_or_directories_to_compress] | encrypt [encrypted_file.ext.gpg]
#   Example: mkgz - file1 file2 dir1 | encrypt archive.tar.gz.gpg
# Usage:
#   mkbz2 [-P] [archive.tar.bz2] [files_or_directories_to_compress]
#     Create a bz2 compressed tar archive (using pbzip2 if available)
#   unbz2 [-P] [archive.tar.bz2]
#     Extract a bz2 compressed tar archive (using pbzip2 if available)
#   mkgz [-P] [archive.tar.gz] [files_or_directories_to_compress]
#     Create a gz compressed tar archive (using pigz if available)
#   ungz [-P] [archive.tar.gz]
#     Extract a gz compressed tar archive (using pigz if available)
#   mkxz [-P] [archive.tar.xz] [files_or_directories_to_compress]
#     Create an xz compressed tar archive (using pixz if available)
#   unxz [-P] [archive.tar.xz]
#     Extract an xz compressed tar archive (using pixz if available)
#   mkzst [-P] [archive.tar.zst] [files_or_directories_to_compress]
#     Create a zstd compressed tar archive (using all CPU cores)
#   unzst [-P] [archive.tar.zst]
#     Extract a zstd compressed tar archive (using all CPU cores)
#   mkzip [archive.zip] [files_or_directories_to_compress]
#     Create a zip archive with maximum compression
#   unzip [archive.zip]
#     Extract a zip archive
#   mk7z [archive.7z] [files_or_directories_to_compress]
#     Create a 7z archive with ultra compression and multi-threading
#   un7z [archive.7z]
#     Extract a 7z archive (supports many formats)
#   mktar [-P] [archive.tar] [files_or_directories_to_compress]
#     Create an uncompressed tar archive
#   untar [-P] [archive.tar]
#     Extract an uncompressed tar archive
#   mkiso [archive.iso] [files_or_directories_to_compress]
#     Create an ISO image
#   uniso [archive.iso]
#     Extract an ISO image
#######################################################

# Check for pbzip2 parallel block-sorting file compressor
# Link: https://github.com/ruanhuabin/pbzip2
# Note: bzip2 can reduce files by 10-15% more than gzip on average but is slower
#       and has better integrity checking even if slightly less common
if hascommand --strict pbzip2; then
	alias mkbz2='tar --use-compress-program="pbzip2 -9" -cvf'
	alias unbz2='tar --use-compress-program=pbzip2 -xvf'
else
	alias mkbz2='tar --use-compress-program="bzip2 -9" -cvf'
	alias unbz2='tar -xvjf'
fi

# Check for pigz parallel implementation of the gzip file compressor
# Link: https://zlib.net/pigz/
# Note: gzip is significantly faster for both compression and decompression
#       and is more widely supported (virtually universal)
if hascommand --strict pigz; then
	alias mkgz='tar --use-compress-program="pigz -9" -cvf'
	alias ungz='tar --use-compress-program=pigz -xvf'
else
	alias mkgz='tar -cvzf'
	alias ungz='tar -xvzf'
fi

# Check for pixz (parallel xz) which automatically indexes during compression
# Link: https://github.com/vasi/pixz
if hascommand --strict pixz; then
	alias mkxz='tar --use-compress-program="pixz -9" -cvf'
	alias unxz='tar --use-compress-program=pixz -xvf'
elif hascommand --strict xz; then
	alias mkxz='tar --use-compress-program="xz -T0 -9" -cvf'
	alias unxz='tar -xvJf'
fi

# Check for zstd with better compression ratios and built-in multi-threading
# Link: https://github.com/facebook/zstd
# Note: Generally considered one of the best modern compression tools
if hascommand --strict zstd; then
	alias mkzst='tar --use-compress-program="zstd -T0 -19" -cvf'
	alias unzst='tar --use-compress-program="zstd -T0" -xvf'
fi

# Check for zip compression utility (unzip is included and not needed to alias)
# Link: http://infozip.sourceforge.net/Zip.html
# Note: Best for greatest multi-platform compatibility
if hascommand --strict zip; then
	alias mkzip='zip -9r'
fi

# Check for 7-zip (p7zip) compression utility
# Link: https://sourceforge.net/projects/p7zip/
# Note: Excellent compression ratio and supports many formats
if hascommand --strict 7z; then
	alias mk7z='7z a -mx=9 -mmt=on'
	alias un7z='7z x'
	alias uniso='7z x'
fi

# ISO image creation and extraction
if hascommand --strict mkisofs; then
	alias mkiso='mkisofs -o'
elif hascommand --strict genisoimage; then
	alias mkiso='genisoimage -o'
fi

# Standard tar without compression
alias mktar='tar -cvf'  # Create tar file
alias untar='tar -xvf'  # Extract tar file

#######################################################
# Tmux Terminal Multiplexor Support
# Link: https://github.com/tmux/tmux/wiki
#######################################################

# Aliases for tmux terminal multiplexer if installed
if hascommand tmux; then

	# Enhance clear to also clear the TMUX scrollback buffer
	if  [[ -n "${TMUX}" ]]; then
		alias clear='\clear && tmux clear-history'
	else
		alias clear='printf "\033[3J"; \clear'
	fi

	# If you connect to a session with a different resolution terminal
	# this will freeze the size of the Tmux session window and not auto-resize
	#tmux resize-window -A &> /dev/null

	# Load TMUX with default session defined by _TMUX_LOAD_SESSION_NAME
	# If TMUX is already running, switch to a session name passed in as a parameter
	# TIP: Use CTRL+d to detach your session which closes but leaves the session
	# running. CTRL+d will also exit bash once outside of TMUX.
	# alias tm='tmux a -t main || tmux new -s main'
	function tm() {

		# Get the passed in or default session name
		if [[ -n "${@}" ]]; then
			local SESSION_NAME="${@}"
		elif [[ -n "${_TMUX_LOAD_SESSION_NAME}" ]]; then
			local SESSION_NAME="${_TMUX_LOAD_SESSION_NAME}"
		elif [[ "$(tmux list-sessions 2> /dev/null | wc -l)" -gt 0 ]]; then
			local SESSION_NAME="$(tmux ls -F "#{session_name}" | createmenu)"
		else
			local SESSION_NAME="$(whoami)"
		fi

		# Create the session if it doesn't exist
		TMUX='' tmux -u new-session -d -s "${SESSION_NAME}" 2> /dev/null

		# Attach if outside of TMUX
		if [[ -z "$TMUX" ]]; then
			tmux -u attach -t "${SESSION_NAME}" 2> /dev/null && exit

		# Switch if we are already inside of TMUX
		else
			tmux -u switch-client -t "${SESSION_NAME}" 2> /dev/null
		fi
	}

	function tmsessiongroup() {
		# Tmux allows you to create "session groups" - multiple sessions that can all attach to the same set of windows
		# (Allow multiple monitors to attach to the same session but independently view separate panes)
		# Link: https://unix.stackexchange.com/questions/282365/using-multiple-terminal-x-windows-with-one-tmux-session
		# To switch from one to the other using xdotool:
		# xdotool search --name 'session1:0:' windowactivate
		# xdotool search --name 'session2:1:' windowactivate

		# Get a list of sessions
		local _TMUX_OPEN_SESSIONS="$(tmux ls -F "#{session_name}" 2> /dev/null)"

		# If the chosen session is blank
		if [ -z "${_TMUX_OPEN_SESSIONS}" ]; then
			# Show an error and exit
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No session found${RESET}"
			return 1
		fi

		# If a new session name was not passed in...
		if [ $# -eq 0 ]; then
			# Get the name of the last session
			local _TMUX_LAST_SESSION=$(echo "${_TMUX_OPEN_SESSIONS}" | head -n 1)

			# Generate a new session name based on the last session
			local _COUNTER=2
			local _TMUX_RANDOM_NAME
			while [ -z "${_TMUX_RANDOM_NAME}" ]; do
				if echo "${_TMUX_OPEN_SESSIONS}" | grep -qxF "${_TMUX_LAST_SESSION}${_COUNTER}"; then
					let _COUNTER=_COUNTER+1
				else
					_TMUX_RANDOM_NAME="${_TMUX_LAST_SESSION}${_COUNTER}"
				fi
			done

			# Ask for the new session name from a menu
			read -e -i "${_TMUX_RANDOM_NAME}" -p "New Session Name: " _TMUX_NEW_SESSION
		else
			# Use the passed in session name
			local _TMUX_NEW_SESSION="${@}"
		fi

		# Make sure the new session name doesn't already exist
		if echo "${_TMUX_OPEN_SESSIONS}" | grep -qxF "${_TMUX_NEW_SESSION}"; then
			# Show an error and exit
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}Session ${BRIGHT_YELLOW}${_TMUX_NEW_SESSION}${BRIGHT_CYAN} already exists${RESET}"
			return 1
		fi

		# If the chosen session is blank
		if [[ -z "${_TMUX_NEW_SESSION}" ]]; then
			# Show an error and exit
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}You must specify a new session name${RESET}"
			return 1
		fi

		# Change the prompt
		local _PS3_OLD="${PS3}"
		PS3="Choose an existing session to connect to: "

		# Ask for the session to connect to
		local _TMUX_EXISTING_SESSION=$(echo "${_TMUX_OPEN_SESSIONS}" | sort | createmenu)

		# Put the prompt back to its original value
		PS3="${_PS3_OLD}"

		# If the chosen session is blank
		if [ -z "${_TMUX_EXISTING_SESSION}" ]; then
			# Show an error and exit
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}You must specify an existing session${RESET}"
			return 1
		fi

		# Create a session group
		if tmux -u new-session -t "${_TMUX_EXISTING_SESSION}" -s "${_TMUX_NEW_SESSION}"; then
			return 0
		else
			# Show an error and exit
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}Could not connect to session ${BRIGHT_YELLOW}${_TMUX_EXISTING_SESSION}${RESET}"
			return 1
		fi
	}

	# Detach from Tmux - and optionally run a command if specified
	# For example, detach and log into an SSH server already running Tmux
	# so you don't run a Tmux session inside of your local Tmux session
	# Example: tmd ssh username@server.net
	function tmd() {
		# If Tmux is running...
		if [[ -n "$TMUX" ]]; then
			# If no parameters were pass in...
			if [ $# -eq 0 ]; then
				# Detach from the session
				tmux detach
			else
				# Detach and then execute the parameters
				tmux detach -E "$*"
			fi

		# Tmux is NOT running so no need to detach...
		else
			# Only do something if a command is passed in...
			if [ $# -gt 0 ]; then
				# Run the command
				eval "${@}"
			fi
		fi
	}

	# List and choose a buffer (clipboard history)
	alias {tmb,tmc}='tmux choose-buffer'

	# List all the sessions
	alias tmlist='tmux ls'

	# List all the connected clients
	alias tmclients='tmux lsc'

	# Create a new session
	alias {tmnew,tmjoin}='tm'

	# Attach to an existing session
	#alias tmattach='tmux -u new-session -A -s'
	alias tmattach='tmux -u attach-session -t "$(tmux ls -F "#{session_name}" | createmenu)"'

	# Rename a session: tmrename [session] [new_name]
	alias tmrename='tmux rename -t'

	# Kill a session
	alias tmkill='tmux kill-session -t'

	# Kill all sessions
	alias tmreset='tmux kill-server'

	# List all the bound keys
	alias tmlistkeys='grep -E "^(bind-key|bind)\s+" ~/.tmux.conf | sort'

# Tmux is not installed, but Zellij is and is very user friendly
elif hascommand zellij; then
	# Redirect these Tmux aliases to Zellij instead
	alias {tm,tmnew,tmjoin}='znew'
	alias tmlist='zlist'
	alias tmattach='zattach'
	alias tmkill='zkill'
	alias tmreset='zreset'

# Tmux is not installed, but Screen is
# Link: https://linuxize.com/post/how-to-use-linux-screen/
elif hascommand screen; then
	alias tm="echo 'Tmux is not installed, but screen is installed on this system.'"

fi

#######################################################
# Zellij Terminal Multiplexor Support
# Link: https://zellij.dev/documentation/introduction.html
#######################################################

# Aliases for Zellij terminal multiplexer if installed
if hascommand zellij; then

	# Load Zellij with a default session named the logged in user
	# You can also pass in a specific session name as a parameter
	function znew() {
		# Get the passed in or default session name
		if [[ -n "${@}" ]]; then
			local SESSION_NAME="${@}"
		elif [[ "$(zellij list-sessions 2> /dev/null | wc -l)" -gt 0 ]]; then
			local SESSION_NAME=""
		else
			local SESSION_NAME="$(whoami)"
		fi

		# Create the session if it doesn't exist
		zellij --session "${SESSION_NAME}" 2> /dev/null || zellij attach "${SESSION_NAME}"
	}

	# Aliases for Zellij
	alias {zj,zjoin}='znew'
	alias zlist='zellij list-sessions'
	alias zattach='zellij attach "$(zellij list-sessions | createmenu)"'
	alias zkill='zellij kill-session'
	alias zreset='zellij kill-all-sessions'

	# Include the bash completion and aliases from Zellij (i.e. zr, zrf, ze, zef)
	builtin source <(zellij setup --generate-completion bash) >/dev/null 2>&1
fi

#######################################################
# Abduco lets programs run independently of the controlling terminal
# Note: CTRL+\ will detach the session
# Link: https://www.brain-dump.org/projects/abduco/
#######################################################

if hascommand abduco; then

	# Start or connect to an abduco session
	function aa() {
		if [[ ${#} -eq 0 ]]; then
			if [[ $(abduco | wc -l) -gt 1 ]]; then
				abduco -a "$(abduco | tail -n +2 | sed 's:\s\+:\t:g' | cut -f 5 | createmenu)" bash
			else
				abduco -c "${USER}" bash
			fi
		else
			abduco -A "${@}" bash
		fi
	}

	# Connect to an abduco session read-only
	function aaro() {
		abduco -Ar "${@}" bash
	}

	# List any abduco sessions
	alias aals='abduco'

	# Kill all abduco sessions
	alias aareset='pkill abduco'
fi

#######################################################
# Easy Cross-Platform Package Management Aliases
#######################################################

# Depending on the installed package managers, set up some package aliases
if hascommand --strict paru; then # Arch
	# Link: https://github.com/Morganamilo/paru
	# Link: https://itsfoss.com/paru-aur-helper/
	# NOTE: To get search results to start at the bottom and go upwards, enable BottomUp in paru.conf
	alias has='paru -Si'
	alias pkgupdateall='paru -Syyu --sudoloop --noconfirm --newsonupgrade && if type flatpak >/dev/null 2>&1; then flatpak update --appstream && flatpak update --assumeyes --noninteractive; fi && if type snap >/dev/null 2>&1; then sudo snap refresh; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='paru --sync --sudoloop --noconfirm'
	alias pkginstall='paru --sync --sudoloop --noconfirm'
	alias pkgremove='paru --remove'
	alias pkgclean='paru --clean'
	alias pkgsearch='paru --bottomup'
	alias pkglist='paru -Qe'
	alias pkglistmore='paru -Q' # Also includes dependencies
	alias aurcheck='paru -Qua' # | sort | command less --no-init --ignore-case --LONG-PROMPT --LINE-NUMBERS'
elif hascommand --strict yay; then # Arch
	# Link: https://github.com/Jguer/yay
	alias has='yay -Si'
	alias pkgupdateall='yay -Syyu --sudoloop && if type flatpak >/dev/null 2>&1; then flatpak update --appstream && flatpak update; fi && if type snap >/dev/null 2>&1; then sudo snap refresh; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='yay -S'
	alias pkginstall='yay -S'
	alias pkgremove='yay -Rns'
	alias pkgclean='yay -Yc'
	alias pkgsearch='yay'
	alias pkglist='yay -Qe'
	alias pkglistmore='yay -Q' # Also includes dependencies
	alias aurcheck='yay -Qua' # | sort | command less --no-init --ignore-case --LONG-PROMPT --LINE-NUMBERS'
elif hascommand --strict pamac; then    # Manjaro
	# Link: https://wiki.manjaro.org/index.php/Pamac
	alias has='sudo pamac info'
	alias pkgupdateall='sudo pamac upgrade -a && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='sudo pamac update'
	alias pkginstall='sudo pamac install'
	alias pkgremove='sudo pamac remove'
	alias pkgclean='sudo pamac remove --orphans'
	alias pkgsearch='sudo pamac search -a'
	alias pkglist='pacman -Qe'
	alias pkglistmore='pacman -Q' # Also includes dependencies
elif hascommand --strict pacman && [[ -f /etc/arch-release ]]; then # Arch (No AUR)
	# Link: https://archlinux.org/pacman/
	alias has='pacman -Q --info'
	alias pkgupdateall='sudo pacman -Syyu && if type flatpak >/dev/null 2>&1; then flatpak update --appstream && flatpak update; fi && if type snap >/dev/null 2>&1; then sudo snap refresh; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='sudo pacman -S'
	alias pkginstall='sudo pacman -S'
	alias pkgremove='sudo pacman -Rns'
	alias pkgclean='pacman -Qtdq | sudo pacman -Rns -'
	alias pkgsearch='pacman -Ss'
	alias pkglist='pacman -Qe'
	alias pkglistmore='pacman -Q' # Also includes dependencies
elif hascommand --strict dnf; then # RedHat/Fedora
	# Link: https://fedoraproject.org/wiki/DNF
	alias has='dnf info'
	alias pkgupdateall='sudo dnf upgrade --refresh'
	alias pkgupdate='sudo dnf upgrade'
	alias pkginstall='sudo dnf install'
	alias pkgremove='sudo dnf remove'
	alias pkgclean='sudo dnf autoremove'
	alias pkgsearch='sudo dnf search'
	alias pkglist='dnf list installed'
	alias pkgdependencies='yum whatprovides'
elif hascommand --strict yum; then # RedHat/Fedora
	# Link: https://access.redhat.com/articles/yum-cheat-sheet
	alias has='yum info'
	alias pkgupdateall='sudo yum clean all && yum -y update'
	alias pkgupdate='sudo yum update'
	alias pkginstall='sudo yum install'
	alias pkgremove='sudo yum remove'
	alias pkgclean='sudo yum autoremove'
	alias pkgsearch='sudo yum search'
	alias pkglist='yum list installed'
	alias pkgdependencies='yum whatprovides'
elif hascommand --strict nala; then # Debian/Ubuntu/Raspbian
	# Link: https://gitlab.com/volian/nala
	# Link: https://itsfoss.com/nala/
	alias has='nala show'
	alias pkgupdateall='sudo nala update && sudo nala upgrade && if type pacstall >/dev/null 2>&1; then pacstall --upgrade; fi'
	alias pkgupdate='sudo nala update'
	alias pkginstall='sudo nala install --install-suggests'
	alias pkgremove='sudo nala remove'
	alias pkgclean='sudo nala clean --fix-broken'
	alias pkgsearch='sudo nala search'
	alias pkglist='sudo nala list --installed'
	alias pkgmirrors='sudo nala fetch'
elif hascommand --strict apt; then # Debian/Ubuntu/Raspbian
	# Link: https://itsfoss.com/apt-command-guide/
	alias has='apt show'
	alias pkgupdateall='sudo apt update --assume-yes && sudo apt upgrade --assume-yes && if type pacstall >/dev/null 2>&1; then pacstall --upgrade; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='sudo apt-get install --only-upgrade'
	alias pkginstall='sudo apt install'
	alias pkgremove='sudo apt remove'
	alias pkgclean='sudo apt autoremove'
	alias pkgsearch='sudo apt search'
	alias pkglist='sudo apt list --installed'
	alias pkgcheck='sudo apt update --assume-yes && apt list --upgradable'
elif hascommand --strict apt-get; then # Debian/Ubuntu
	# Link: https://help.ubuntu.com/community/AptGet/Howto
	alias has='apt-cache show'
	alias pkgupdateall='sudo apt-get update && sudo apt-get upgrade && if type pacstall >/dev/null 2>&1; then pacstall --upgrade; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='sudo apt-get install --only-upgrade'
	alias pkginstall='sudo apt-get install'
	alias pkgremove='sudo apt-get remove'
	alias pkgclean='sudo apt-get autoremove'
	alias pkgsearch='sudo apt-cache search'
	alias pkglist='sudo dpkg -l'
elif hascommand --strict zypper; then # SUSE
	# Link: https://en.opensuse.org/SDB:Zypper_usage
	alias has='zypper info'
	alias pkgupdateall='sudo zypper patch'
	alias pkgupdate='sudo zypper up'
	alias pkginstall='sudo zypper in'
	alias pkgremove='sudo zypper rm'
	alias pkgclean='sudo zypper packages --orphaned'
	alias pkgsearch='sudo zypper se'
	alias pkglist='zypper se --installed-only'
elif hascommand --strict eopkg; then # Solus
	# Link: https://getsol.us/articles/package-management/basics/en/
	alias has='sudo eopkg info'
	alias pkgupdateall='sudo eopkg upgrade'
	alias pkgupdate='sudo eopkg upgrade'
	alias pkginstall='sudo eopkg install'
	alias pkgremove='sudo eopkg remove'
	alias pkgsearch='sudo eopkg search'
	alias pkglist='eopkg li -l'
elif hascommand --strict emerge; then # Gentoo (Portage)
	# Link: https://www.linode.com/docs/guides/portage-package-manager/
	alias has='equery files'
	alias pkgupdateall='sudo emerge --sync && sudo emerge --update --deep --with-bdeps=y --newuse @world && sudo emerge --depclean && sudo revdep-rebuild'
	alias pkgupdate='sudo emerge -u'
	alias pkginstall='sudo emerge'
	alias pkgremove='sudo emerge --depclean'
	alias pkgsearch='sudo emerge --search'
	alias pkglist='equery list "*"'
elif hascommand --strict slackpkg; then # Slackware
	# Link: https://www.linux.com/training-tutorials/intro-slackware-package-management/
	alias has='slackpkg info'
	alias pkgupdateall='slackpkg update && slackpkg install-new && slackpkg upgrade-all'
	alias pkgupdate='upgradepkg'
	alias pkginstall='installpkg'
	alias pkgremove='removepkg'
	alias pkglist='pkgtool'
elif hascommand --strict urpmi; then # Mandrake
	# Link: https://wiki.mageia.org/en/URPMI
	alias has='urpmq --summary -Y'
	alias pkgupdateall='urpmi --auto-update'
	alias pkgupdate='urpmi'
	alias pkginstall='urpmi'
	alias pkgremove='urpme'
	alias pkgsearch='urpmq --summary -Y'
	alias pkglist='rpm -qa'
elif hascommand --strict apt-cyg; then # Cygwin
	# Link: http://stephenjungels.com/jungels.net/projects/apt-cyg/
	alias has='apt-cyg show'
	alias pkgupdateall='apt-cyg update'
	alias pkgupdate='apt-cyg update'
	alias pkginstall='apt-cyg install'
	alias pkgremove='apt-cyg remove'
	alias pkgsearch='apt-cyg find'
	alias pkglist='cygcheck --check-setup'
elif hascommand --strict brew; then # macOS
	# Link: https://brew.sh/
	alias has='brew info'
	alias pkgupdateall='brew update'
	alias pkgupdate='brew update'
	alias pkginstall='brew install'
	alias pkgremove='brew uninstall'
	alias pkgclean='brew cleanup'
	alias pkgsearch='brew search'
	alias pkglist='brew list'
fi

# If this is an Arch based distrobution with pacman...
if hascommand --strict pacman && [[ -d /etc/pacman.d/ ]]; then

	# Install a list of packages with regex
	# https://wiki.archlinux.org/title/pacman#Installing_specific_packages
	function pkginstallregex() {
		if [ $# -eq 0 ]; then
			echo "No regex provided"
			return 1
		else
			sudo pacman -S $(pacman -Ssq "${@}")
		fi
	}

	# Clean the pacman and helper package caches
	alias pacman-clean-cache='sudo echo -ne "${BRIGHT_YELLOW}Before:${RESET} "; sudo du -sh /var/cache/pacman/pkg/ 2>/dev/null; yes | sudo pacman -Scc && command -v yay &> /dev/null && yes | yay -Sc || true && command -v paru &> /dev/null && yes | paru -Sc || true; echo -ne "\n${BRIGHT_GREEN}After:${RESET} "; sudo du -sh /var/cache/pacman/pkg/ 2>/dev/null'

	# To mark a package as explicitly installed or only a dependency
	alias pkgmarkasexplicit='sudo pacman -D --asexplicit'
	alias pkgmarkasdependency='sudo pacman -D --asdeps'

	# Show all packages and their install reason
	alias pkgreasons="pacman -Qi | awk -F': ' '/^Name/ { name = \$2; } /^Install Reason/ { reason = \$2; } /^$/ { printf \"%s: %s\\n\", name, reason; }'"

	# Check for default configuration file default backups
	alias pacnew='sudo true && echo "Pacman backup configuration files found:"; sudo find /etc -type f \( -iname \*.pacnew -o -iname \*.pacsave \) | sort -t"/" -k2.2r -k2.1'

	# Force remove a package ignoring required dependencies
	# NOTE: Also can be typed as sudo pacman -Rdd for short
	alias pkgforceremove='sudo pacman -Rd --nodeps'

	# Force remove a package ignoring required dependencies and then reinstall
	function pkgforcereinstall() {
		if [[ -z "${1}" ]]; then
			echo -e "${BRIGHT_RED}Error:${RESET} Package name required"
			return 1
		fi
		sudo pacman -Rd --nodeps "${1}" && sudo pacman -S "${1}"
	}

	# Search for a package containing a file
	alias pkgsearchcontainingfile='sudo pacman -Fy'

	# List all the local files in an installed package
	alias pkglocalpackagefiles='pacman -Ql'

	# Verify the presence of the files installed by a package
	alias pkgverifylocalpackage='sudo pacman -Qkk'

	# Verify all packages
	# Link: https://unix.stackexchange.com/questions/659756/arch-linux-reinstall-all-broken-packages-after-poweroff-during-system-upgrade
	alias pkgverifyall="pacman -Qk 2>/dev/null | grep -v ' 0 missing files'"

	# Show the latest Arch linux update news
	alias archnews='w3m https://www.archlinux.org/ | sed -n "/Latest News/,/Older News/p" | "${PAGER}"'

	# Pacseek - browse and search through the Arch Linux package databases and AUR
	# Link: https://github.com/moson-mo/pacseek
	if hascommand --strict pacseek; then
		alias pkg='pacseek'
	fi

	# If perl is installed (preset on most systems)...
	# Link: https://wiki.archlinux.org/title/Perl
	# Install: sudo pacman -S perl
	if hascommand --strict perl; then

		# Use a much more detailed package listing with descriptions (AUR separated)
		# pkglist [search] will search for all installed packages instead
		# Perl pipeline: collapse padding, wrap groups in parens, then slurp-mode
		# regex reduces each package block to: Name (Group) - Description
		alias pkglist &>/dev/null && unalias pkglist
		function pkglist() {
			if [ $# -eq 0 ]; then
				# Native Arch packages (from official repos)
				# -Q = query local, -e = explicit, -n = native (repo), -i = info
				echo -e "${BRIGHT_BLUE}=============== ${BRIGHT_YELLOW}Native Arch Packages${BRIGHT_BLUE} ===============${RESET}"
				pacman -Qeni \
					| perl -pe 's/ +/ /gm' \
					| perl -pe 's/^(Groups +: )(.*)/\1(\2)/gm' \
					| perl -0777 -pe 's/^Name : (.*)\nVersion :(.*)\nDescription : ((?!None).*)?(?:.|\n)*?Groups :((?! \(None\)$)( )?.*)?(?:.|\n(?!Name))+/$1$4 - $3/gm' \
					| grep -A1 --color -P '^[^\s]+'

				# AUR / Chaotic-AUR / custom repository packages (not in official repos)
				# -m = foreign (not found in any configured repo)
				echo -e "\n${BRIGHT_BLUE}=============== ${BRIGHT_YELLOW}Arch User Repository (AUR)${BRIGHT_BLUE} ===============${RESET}"
				pacman -Qemi \
					| perl -pe 's/ +/ /gm' \
					| perl -pe 's/^(Groups +: )(.*)/\1(\2)/gm' \
					| perl -0777 -pe 's/^Name : (.*)\nVersion :(.*)\nDescription : ((?!None).*)?(?:.|\n)*?Groups :((?! \(None\)$)( )?.*)?(?:.|\n(?!Name))+/$1$4 - $3/gm' \
					| grep -A1 --color -P '^[^\s]+'
			else
				# If a search parameter was specified, grep all explicit packages
				pacman -Qei \
					| perl -pe 's/ +/ /gm' \
					| perl -pe 's/^(Groups +: )(.*)/\1(\2)/gm' \
					| perl -0777 -pe 's/^Name : (.*)\nVersion :(.*)\nDescription : ((?!None).*)?(?:.|\n)*?Groups :((?! \(None\)$)( )?.*)?(?:.|\n(?!Name))+/$1$4 - $3/gm' \
					| grep -A1 --color -P '^[^\s]+' \
					| grep -i "${@}"
			fi
		}
	fi

	# If pacman-contrib (contributed scripts and tools for pacman) is installed...
	# Install: sudo pacman -S pacman-contrib
	if hascommand --strict paccache; then

		# Add aliases to find dependencies
		alias pkgdependencies='pactree --color' # --unique --depth 1
		alias pkgwhatuses='pactree --reverse --color'

		# The checkupdates script (also from Arch pacman-contrib)
		# NOTE: The benefit to this is it does NOT need SUDO/ROOT access
		alias pkgcheck='checkupdates | sort | command less --no-init --ignore-case --LONG-PROMPT --LINE-NUMBERS'

		# Alias to fix Arch Pacman install error "invalid or corrupted package" with a
		# new PGP key, clear anything older than the last 3 installs, and remove locks
		# Link: https://odysee.com/@DistroTube:2/solved-pacman-wouldn't-let-me-run-an:0
		alias pacmanfix='sudo rm -f /var/lib/pacman/db.lck && sudo paccache -r && sudo pacman -Sy archlinux-keyring'
		alias pacmanfixkeys='sudo rm -f /var/lib/pacman/db.lck; sudo rm -R /etc/pacman.d/gnupg/; sudo rm -R /root/.gnupg/; sudo gpg --refresh-keys && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy archlinux-keyring'
	fi
fi

# If apt package manager is installed, add aliases to find dependencies in Ubuntu/Debian
if hascommand --strict apt-cache; then
	alias pkgdependencies='apt-cache depends'
	# If apt-rdepends is installed (sudo apt install apt-rdepends)
	if hascommand --strict apt-rdepends; then
		alias pkgwhatuses='apt-rdepends'
	fi
fi

# Aliases for flatpak packages if installed
if hascommand --strict flatpak; then
	alias flatpakhas='flatpak info'
	alias flatpakcheck='flatpak update --appstream && flatpak remote-ls --updates'
	alias flatpakupdate='flatpak update --appstream && flatpak update'
	alias flatpakinstall='flatpak install'
	alias flatpakremove='flatpak uninstall'
	alias flatpakwipe='flatpak uninstall --delete-data'
	alias flatpakclean='flatpak repair && flatpak uninstall --unused'
	alias flatpaksearch='flatpak search'
	alias flatpaklist='flatpak list --columns=name,app:f,version:e,description:e --app'
	alias flatpaksize='flatpak list --columns=app:f,name,size:f,installation:e'
	alias flatpakremotes='flatpak remotes --show-details'

	# Create missing or recreate broken Flatpak icons (might require restart)
	if [ -d "/var/lib/flatpak/exports/share/applications/" ]; then
		alias flatpakmakeicons='command cp /var/lib/flatpak/exports/share/applications/*.desktop ~/.local/share/applications/'
	else
		alias flatpakmakeicons='find /var/lib/flatpak/app/ -type f -iname "*.desktop" -exec cp {} ~/.local/share/applications \;'
	fi

	# Create an executable backup script for Flatpak apps and custom permissions
	flatpakbackup() {
		# Require sudo rights unless we're only showing help
		if [[ ! "${1}" =~ ^(-h|--help)$ ]] && (( EUID != 0 )); then
			if ! sudo -v 2>/dev/null; then
				echo -e "${BRIGHT_RED}Error:${RESET} root (sudo) privileges are needed to read system-level Flatpak overrides"
				return 1
			fi
		fi

		# Handle command line arguments
		case "${1}" in
			-h|--help)
				echo -e "${BRIGHT_CYAN}flatpakbackup${RESET}: Generate bash commands to backup and restore Flatpak permissions"
				echo -e "${BRIGHT_WHITE}Description:${RESET} Captures system/user global overrides and app-specific overrides"
				echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}flatpakbackup${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}output_file${BRIGHT_MAGENTA}]${RESET}"
				echo -e "${BRIGHT_WHITE}Examples:${RESET}"
				echo -e "  ${BRIGHT_CYAN}flatpakbackup${RESET}             ${BRIGHT_BLUE}# Output to terminal${RESET}"
				echo -e "  ${BRIGHT_CYAN}flatpakbackup${RESET} ${BRIGHT_YELLOW}restore.sh${RESET}  ${BRIGHT_BLUE}# Save to executable file${RESET}"
				return 0
				;;
			"")
				# Output to terminal
				;;
			*)
				# Cleanup orphaned app data
				echo -e "${BRIGHT_CYAN}Clean up data from orphaned Flatpak apps? (${BRIGHT_GREEN}y${BRIGHT_CYAN}/${BRIGHT_RED}N${BRIGHT_CYAN}):${RESET} \c"
				read -r cleanup_confirm
				if [[ ${cleanup_confirm} =~ ^[yY]$ ]]; then
					installed="$(flatpak list --app --columns=application 2>/dev/null | LC_ALL=C sort -fu)"
					for dir in "${HOME}/.var/app"/*/; do
						[[ -d "${dir}" ]] || continue
						app_id="$(basename "${dir}")"
						if ! grep -qxF "${app_id}" <<< "${installed}"; then
							echo -e "\n${BRIGHT_MAGENTA}Orphaned:${RESET} ${BRIGHT_WHITE}${app_id}${RESET}"
							echo -e "${BRIGHT_CYAN}Remove ${BRIGHT_YELLOW}${dir}${BRIGHT_CYAN}? (${BRIGHT_GREEN}y${BRIGHT_CYAN}/${BRIGHT_RED}N${BRIGHT_CYAN}):${RESET} \c"
							read -r confirm
							if [[ ${confirm} =~ ^[yY]$ ]]; then
								rm -rf -- "${dir}"
								echo -e "${BRIGHT_GREEN}✓ Removed${RESET}"
							else
								echo -e "${BRIGHT_RED}X Skipped${RESET}"
							fi
						fi
					done
				fi

				# Backup app data (use strongest widely-available compressor)
				echo -e "\n${BRIGHT_CYAN}Create compressed backup of ${BRIGHT_YELLOW}~/.var/app/${BRIGHT_CYAN} (all Flatpak app data)? (${BRIGHT_GREEN}y${BRIGHT_CYAN}/${BRIGHT_RED}N${BRIGHT_CYAN}):${RESET} \c"
				read -r backup_confirm
				if [[ ${backup_confirm} =~ ^[yY]$ ]]; then
					# Build a relative tar (no absolute paths) and choose best available compression.
					if command -v xz >/dev/null 2>&1; then
						outfile="flatpak-app-data-$(date +%Y%m%d-%H%M%S).tar.xz"
						tar -C "${HOME}/.var" -I "xz -T0 -9e" -cf "${outfile}" app
					elif command -v zstd >/dev/null 2>&1; then
						outfile="flatpak-app-data-$(date +%Y%m%d-%H%M%S).tar.zst"
						tar -C "${HOME}/.var" -I "zstd -T0 -19" -cf "${outfile}" app
					else
						outfile="flatpak-app-data-$(date +%Y%m%d-%H%M%S).tar.gz"
						tar -C "${HOME}/.var" -I "gzip -9" -cf "${outfile}" app
					fi
					echo -e "${BRIGHT_GREEN}✓ Backup created:${RESET} ${BRIGHT_YELLOW}${outfile}${RESET}"
				fi

				# Save to file - redirect output and make executable
				flatpakbackup "" > "${1}"
				chmod ug+x "${1}"
				echo -e "${BRIGHT_GREEN}✓ Flatpak backup saved to:${RESET} ${BRIGHT_YELLOW}${1}${RESET}"
				return 0
				;;
		esac

		# Helper function to parse individual override lines into flatpak commands
		_parse_override_line() {
			local LINE="$1"
			local COMMAND_PREFIX="$2"  # e.g., "sudo flatpak override --system"
			local COMMAND_SUFFIX="$3"  # e.g., ' "com.example.App"' or ""

			# Skip section headers like [Context], [Environment], etc.
			if [[ "${LINE}" =~ ^\[.*\]$ ]]; then
				return 0
			fi

			case "${LINE}" in
				# Explicit env unsets as reported by --show
				"unset-env="*)
					local VALUES="${LINE#*=}"
					IFS=';' read -ra ITEMS <<< "${VALUES}"
					for ITEM in "${ITEMS[@]}"; do
						[[ -n "${ITEM}" ]] && echo "${COMMAND_PREFIX} --unset-env=${ITEM}${COMMAND_SUFFIX}"
					done
					;;

				# Regular permissions (positive/negative items separated by ;)
				"filesystems="*|"sockets="*|"devices="*|"shared="*|"own-name="*|"talk-name="*|"persist="*|"features="*)
					local KEY="${LINE%%=*}"
					local VALUES="${LINE#*=}"
					local OPTION_MAP=""
					case "${KEY}" in
						"filesystems") OPTION_MAP="--filesystem"  ;;
						"sockets")     OPTION_MAP="--socket"      ;;
						"devices")     OPTION_MAP="--device"      ;;
						"shared")      OPTION_MAP="--share"       ;;
						"own-name")    OPTION_MAP="--own-name"    ;;
						"talk-name")   OPTION_MAP="--talk-name"   ;;
						"persist")     OPTION_MAP="--persist"     ;;
						"features")    OPTION_MAP="--feature"     ;;
					esac

					IFS=';' read -ra ITEMS <<< "${VALUES}"
					for ITEM in "${ITEMS[@]}"; do
						[[ -z "${ITEM}" ]] && continue
						if [[ "${ITEM}" == "!"* ]]; then
							# Negations map to specific --no*/--unshare flags
							local VALUE="${ITEM#!}"
							case "${KEY}" in
								"sockets")     echo "${COMMAND_PREFIX} --nosocket=${VALUE}${COMMAND_SUFFIX}"      ;;
								"filesystems") echo "${COMMAND_PREFIX} --nofilesystem=${VALUE}${COMMAND_SUFFIX}"  ;;
								"devices")     echo "${COMMAND_PREFIX} --nodevice=${VALUE}${COMMAND_SUFFIX}"      ;;
								"shared")      echo "${COMMAND_PREFIX} --unshare=${VALUE}${COMMAND_SUFFIX}"       ;;
								"own-name")    echo "${COMMAND_PREFIX} --no-own-name=${VALUE}${COMMAND_SUFFIX}"   ;;
								"talk-name")   echo "${COMMAND_PREFIX} --no-talk-name=${VALUE}${COMMAND_SUFFIX}"  ;;
								"persist")     echo "${COMMAND_PREFIX} --no-persist=${VALUE}${COMMAND_SUFFIX}"    ;;
								"features")    echo "${COMMAND_PREFIX} --no-feature=${VALUE}${COMMAND_SUFFIX}"    ;;
								*)             echo "# TODO: unknown negation for key=${KEY} item=${VALUE}" ;;
							esac
						else
							echo "${COMMAND_PREFIX} ${OPTION_MAP}=${ITEM}${COMMAND_SUFFIX}"
						fi
					done
					;;

				# Fallback: treat bare KEY=VALUE from [Environment] as --env
				*"="*)
					# Avoid re-catching known keys above
					if [[ "${LINE}" != filesystems=* && "${LINE}" != sockets=*  && "${LINE}" != devices=*   && \
						"${LINE}" != shared=*        && "${LINE}" != own-name=* && "${LINE}" != talk-name=* && \
						"${LINE}" != persist=*       && "${LINE}" != features=* && "${LINE}" != unset-env=* ]]
					then
						echo "${COMMAND_PREFIX} --env=${LINE}${COMMAND_SUFFIX}"
					fi
					;;
			esac
		}

		# Generate the restore script header
		echo "#!/usr/bin/env bash"
		echo "set -euo pipefail # fail fast on errors / unset vars / pipeline failures"
		echo "# Flatpak permissions restore script generated on $(date '+%B %d, %Y at %I:%M %p')"
		echo "# This script will recreate all your Flatpak app installations and permission overrides"
		echo ""

		# === SYSTEM GLOBAL OVERRIDES ===
		echo "# System global overrides (applies to all apps for all users)"
		echo "# Uncomment the reset line below to clear existing overrides first:"
		echo "# sudo flatpak override --system --reset"

		local system_output
		system_output="$(flatpak override --system --show 2>/dev/null)"
		if [[ -n "${system_output}" ]]; then
			echo "${system_output}" | while IFS= read -r line; do
				_parse_override_line "${line}" "sudo flatpak override --system" ""
			done | LC_ALL=C sort -fu
		else
			echo "# No system global overrides found"
		fi
		echo ""

		# === USER GLOBAL OVERRIDES ===
		echo "# User global overrides (applies to all apps for current user)"
		echo "# Uncomment the reset line below to clear existing overrides first:"
		echo "# flatpak override --user --reset"

		local user_output
		user_output="$(flatpak override --user --show 2>/dev/null)"
		if [[ -n "${user_output}" ]]; then
			echo "${user_output}" | while IFS= read -r line; do
				_parse_override_line "${line}" "flatpak override --user" ""
			done | LC_ALL=C sort -fu
		else
			echo "# No user global overrides found"
		fi
		echo ""

		# === APP-SPECIFIC OVERRIDES ===
		echo "# App-specific overrides (sorted by app name for easy reference)"
		echo "# Each app section includes installation command and custom permissions"
		echo

		# Get all apps sorted by display name, then extract app IDs
		# Use process substitution (< <(...)) so the while-loop runs in the
		# current shell — this makes `local` work correctly inside the loop
		while read -r app_id; do
				# Skip header line and empty lines
				if [[ -n "${app_id}" && "${app_id}" != "Application" ]]; then
					# Get override settings for this app (both system and user)
					local system_app_output user_app_output
					system_app_output="$(flatpak override --system --show "${app_id}" 2>/dev/null)"
					user_app_output="$(flatpak override --user --show "${app_id}" 2>/dev/null)"

					# Process all apps (even those without custom overrides)
					# Get app description for the header comment
					local app_description
					app_description="$(printf '%s\n' "$(flatpak info "${app_id}" 2>/dev/null)" | awk 'NF { print; exit }')"

					# Create app section header
					if [[ -n "${app_description}" ]]; then
						echo "# $(printf '%.0s=' {1..76})"
						echo "# ${app_description}"
						echo "# $(printf '%.0s=' {1..76})"
					fi

					# App installation and reset commands
					# Detect current installation scope so restores match original location
					local install_scope
					install_scope="$(flatpak list --app --columns=installation,application 2>/dev/null \
						| awk -v id="${app_id}" 'BEGIN{FS="\t"} $2==id{print $1; exit}')"

					if [[ "${install_scope}" == "user" ]]; then
						echo "flatpak install -y --or-update --noninteractive --user \"${app_id}\""
					else
						echo "flatpak install -y --or-update --noninteractive --system \"${app_id}\""
					fi

					# Only add override sections if there are actual overrides
					if [[ -n "${system_app_output}" || -n "${user_app_output}" ]]; then
						echo "# Uncomment the reset lines below to clear existing app overrides first:"
						echo "# sudo flatpak override --system --reset \"${app_id}\""
						echo "# flatpak override --user --reset \"${app_id}\""

						# System-level app overrides
						if [[ -n "${system_app_output}" ]]; then
							echo "${system_app_output}" | while IFS= read -r line; do
								_parse_override_line "${line}" "sudo flatpak override --system" " \"${app_id}\""
							done | LC_ALL=C sort -fu
						fi

						# User-level app overrides
						if [[ -n "${user_app_output}" ]]; then
							echo "${user_app_output}" | while IFS= read -r line; do
								_parse_override_line "${line}" "flatpak override --user" " \"${app_id}\""
							done | LC_ALL=C sort -fu
						fi
					fi
					echo ""
				fi
		done < <(flatpak list --app --columns=name,application 2>/dev/null \
			| LC_ALL=C sort -fu \
			| cut -f2)
	}

	# Make sure the Flatpak paths are present once (for icons/desktop files)
	# Only append Flatpak paths if not already present (prevents duplicates on re-source)
	if [[ ":${XDG_DATA_DIRS}:" != *":/var/lib/flatpak/exports/share:"* ]]; then
		export XDG_DATA_DIRS="${XDG_DATA_DIRS:+${XDG_DATA_DIRS}:}/var/lib/flatpak/exports/share:${HOME}/.local/share/flatpak/exports/share"
	fi
fi

# Aliases for snap packages if installed
if hascommand --strict snap; then
	alias snaphas='snap info'
	alias snapcheck='snap refresh --list'
	alias snapupdate='sudo snap refresh'
	alias snapinstall='sudo snap install'
	alias snapremove='sudo snap remove'
	alias snapclean='LANG=C snap list --all | while read snapname ver rev trk pub notes; do if [[ $notes = *disabled* ]]; then sudo snap remove "$snapname" --revision="$rev"; fi; done'
	alias snapsearch='snap find'
	alias snaplist='snap list'
	alias snapsize='echo "Snap package sizes:" && du -hcs /var/lib/snapd/snaps/* 2>/dev/null || echo "No snap packages found"'
fi

#######################################################
# Alias for sudo replacements on machines with one user
#######################################################

if [[ $_SKIP_SUDO_ALTERNATIVE = false ]]; then

	# run0 from systemd 256+ uses no SUID binary, delegating privilege
	# escalation to PID 1 via polkit instead of a setuid executable
	# Link: https://www.freedesktop.org/software/systemd/man/latest/run0.html
	if hascommand --strict run0; then
		alias sudo='run0'

	# A very slim alternative to both sudo and doas
	# Link: https://codeberg.org/sw1tchbl4d3/rdo
	# Config: sudoedit /etc/rdo.conf
	# username=yourusername
	# wrong_pw_sleep=1000
	# session_ttl=5
	elif hascommand --strict rdo; then
		alias sudo='rdo'

		# If sudoedit is not avaliable, alias it
		if ! hascommand --strict sudoedit; then
			# The edit alias might not exist in root but the
			# edit function handles sudo editing when needed
			alias sudoedit='edit'
		fi

	# A port of OpenBSD's doas offers two benefits over sudo:
	# 1) Its configuration file has a simple syntax and
	# 2) It is smaller, requiring less effort to audit the code
	# This makes it harder for both admins and coders to make mistakes that potentially open security holes in the system
	# Link: https://github.com/Duncaen/OpenDoas or https://github.com/slicer69/doas
	# Link: https://youtu.be/eamEZCj-CuQ
	# Config: Add "permit <user> as root" in /etc/doas.conf or /usr/local/etc/doas.conf
	elif hascommand --strict doas; then
		alias sudo='doas'

		# Replace sudoedit only if doasedit exists
		# Link: https://github.com/AN3223/scripts/blob/master/doasedit
		if hascommand --strict doasedit; then
			alias sudoedit='doasedit'
		fi
	fi
fi

#######################################################
# General Function "Aliases"
#######################################################

# Run this function upon exit of the shell
function _exit() {
	# Show who logged out
	local COLOR="${BRIGHT_RED}"     # Light Red
	local HIGHLIGHT="${BRIGHT_BLUE}" # Light Blue
	local NOCOLOR="${RESET}"
	echo -e "${COLOR}User ${HIGHLIGHT}$(echo $USER)${COLOR} has logged out of ${HIGHLIGHT}$(echo $HOSTNAME)${COLOR}.${NOCOLOR}"
}
trap _exit EXIT

# Calculator that uses bc or Bash's built-in arithmetic
# Example: = 5*5+2
if hascommand bc; then
	# Start calculator with math support
	# echo 'if (scale == 0) scale=4' > ~/.config/bcrc
	# Link: https://www.gnu.org/software/bc/manual/html_mono/bc.html
	alias bc='bc --mathlib'
	if [[ -f ~/.bcrc ]]; then
		export BC_ENV_ARGS=~/.bcrc
	elif [[ -f ~/.config/bcrc ]]; then
		export BC_ENV_ARGS=~/.config/bcrc
	fi
	export BC_LINE_LENGTH=0

	function =() {
		bc <<< "${@}"
	}
else
	function =() {
		local IFS=' '
		local _CALC="${*//p/+}"
		_CALC="${_CALC//x/*}"
		echo "$(($_CALC))"
	}
fi

# Cross-platform realpath equivalent for resolving symlinks to an absolute path
# Uses readlink -f on Linux and an alternative approach on macOS which lacks -f
function resolvesymlink() {
	# Show help if no argument provided or help requested
	if [[ -z "${1}" ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}resolvesymlink${RESET}: Resolve a symlink to its absolute target path"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}resolvesymlink${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}symlink_path${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}resolvesymlink${RESET} ${BRIGHT_YELLOW}/usr/bin/python${RESET}"
		return 2
	fi

	# Check if the system is running macOS (Darwin)
	if [[ "$(uname)" == "Darwin" ]]; then

		# Initialize the TARGET_FILE variable to the input file path
		local TARGET_FILE="$1"
		local FULL_PATH

		# Use a subshell to prevent changing the current working directory
		(
			# Change to the directory containing the target file
			cd "$(dirname "${TARGET_FILE}")" || return 1

			# Get the base name of the target file (strip directory path)
			TARGET_FILE=$(basename "${TARGET_FILE}")

			# Resolve any symlinks by following them iteratively
			while [[ -L "${TARGET_FILE}" ]]; do
				# Update TARGET_FILE with the link's actual destination
				TARGET_FILE=$(readlink "${TARGET_FILE}")
				# Change directory to where the symlink points
				cd "$(dirname "${TARGET_FILE}")" || return 1
				# Update TARGET_FILE to just the file name again
				TARGET_FILE=$(basename "${TARGET_FILE}")
			done

			# Get the absolute path of the final resolved file
			FULL_PATH="$(pwd -P)/${TARGET_FILE}"

			# Output the resolved absolute path
			echo "${FULL_PATH}"
		)
	else
		# Use readlink -f for Linux systems
		readlink -f "$1"
	fi
}

# Confirm/Ask a question - See 'killps' for example of use
# General-purpose function to ask Yes/No questions in Bash,
# either with or without a default answer.
# It keeps repeating the question until it gets a valid answer.
# Link: https://gist.github.com/davejamesmiller/1965569
# Example Usage:
#   if ask "Do you want to do such-and-such?"; then
# Default to Yes if the user presses enter without giving an answer:
#   if ask "Do you want to do such-and-such?" Y; then
# Default to No if the user presses enter without giving an answer:
#   if ask "Do you want to do such-and-such?" N; then
# Or if you prefer the shorter version:
#   ask "Do you want to do such-and-such?" && said_yes
#   ask "Do you want to do such-and-such?" || said_no
function ask() {
	# Initialize local variables
	local prompt default reply

	# Determine the prompt and default based on the second parameter
	if [[ "${2:-}" = "Y" ]]; then
		prompt='Y/n'
		default='Y'
	elif [[ "${2:-}" = "N" ]]; then
		prompt='y/N'
		default='N'
	else
		prompt='y/n'
		default=''
	fi

	# Loop until a valid answer is given
	while true; do
		# Ask the question (not using "read -p" as it uses stderr not stdout)
		echo -ne "${1} [$prompt] "

		# Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
		read -r reply </dev/tty

		# Set reply to default if it is empty
		[[ -z "${reply}" ]] && reply="${default}"

		# Check if the reply is valid
		case "${reply}" in
			Y*|y*) return 0 ;;
			N*|n*) return 1 ;;
		esac
	done
}

# Creates a menu for selecting an item from a list from either piped in
# multi-line text or command line arguments. Use --picker=app to force a picker
# Example: ls -1 ~ | createmenu
# Example: echo -e "Jen\nTom\nJoe Bob\nAmy\nPat" | sort | createmenu
# Example: cat "menuitems.txt" | createmenu
# Example: _TMUX_SESSION="$(tmux ls -F "#{session_name}" 2> /dev/null | createmenu)"
# Example: createmenu 'Option 1' 'Option 2' 'Option 3'
function createmenu() {
	# Valid pickers to detect and automatically used in order
	local _VALID_PICKERS="${_PREFERRED_PICKER} fzy sk fzf peco percol pick icepick selecta sentaku zf dmenu rofi wofi"

	# Check if command line arguments are provided and if input is piped in
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]] || { [[ "$#" -eq 0 ]] && [[ -t 0 ]]; }; then
		echo -e "${BRIGHT_CYAN}createmenu${RESET}: Create a menu for selecting an item from a list"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}createmenu${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}--picker=name${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}items...${BRIGHT_MAGENTA}]${RESET}"
		echo -e "       command | ${BRIGHT_CYAN}createmenu${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}--picker=name${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Pickers:${RESET} fzy, sk, fzf, peco, percol, pick, icepick, selecta, sentaku, zf, dmenu, rofi, wofi"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}createmenu${RESET} ${BRIGHT_YELLOW}'Option 1' 'Option 2' 'Option 3'${RESET}"
		echo -e "  ${BRIGHT_YELLOW}ls -1 ~${RESET} | ${BRIGHT_CYAN}createmenu${RESET}"
		echo -e "  ${BRIGHT_YELLOW}cat 'items.txt'${RESET} | ${BRIGHT_CYAN}createmenu${RESET}"
		echo -e "  ${BRIGHT_CYAN}createmenu${RESET} ${BRIGHT_GREEN}--picker=rofi${RESET} ${BRIGHT_YELLOW}'A' 'B' 'C'${RESET}"
		return 1
	fi

	# Check for --picker parameter and remove it from arguments
	local _PICKER
	local _FOUND_PICKER=false
	local NEW_ARGS=()
	for ARG in "$@"; do
		if [[ "$ARG" == --picker=* ]]; then
			_PICKER="${ARG#*=}"
			if type "${_PICKER}" &>/dev/null; then
				_FOUND_PICKER=true
			else
				echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}The picker ${BRIGHT_YELLOW}${_PICKER}${BRIGHT_CYAN} is not available or installed${RESET}"
				return 1
			fi
		else
			NEW_ARGS+=("$ARG")
		fi
	done
	set -- "${NEW_ARGS[@]}"

	# If no specific picker is provided or the picker is not valid...
	if [ "$_FOUND_PICKER" == false ]; then
		# Loop through the list and see if one of them is installed
		for _PICKER in $_VALID_PICKERS; do
			if type $_PICKER &>/dev/null; then
				_FOUND_PICKER=true
				break
			fi
		done
	fi

	# Check if command line arguments are provided
	if [ "$#" -gt 0 ]; then
		local _INPUT=""
		local _COUNT=0
		for arg in "$@"; do
			# Increase count for each argument
			((_COUNT++))

			# Add newline after each argument except the last
			if [ $_COUNT -lt $# ]; then
				_INPUT+="${arg}"$'\n'
			else
				_INPUT+="${arg}"
			fi
		done
	else
		# Get the piped in multiple lines of text
		local _INPUT="$(</dev/stdin)"
		# Count the lines of text
		local _COUNT=$(echo "${_INPUT}" | wc -l)
	fi

	# If there is no input, just exit with an error
	if [ -z "${_INPUT}" ]; then
		return 1

	# If there is only one line (or one argument), no choice is needed
	elif [ ${_COUNT} -eq 1 ]; then
		echo "${_INPUT}"
		return 0
	fi

	# If we found a picker, use it
	if [ "$_FOUND_PICKER" == true ]; then
		# echo -e "${BRIGHT_MAGENTA}The picker is: ${BRIGHT_GREEN}$_PICKER${RESET}"
		case $_PICKER in
			dmenu)
				echo "${_INPUT}" | dmenu -l 10
				;;
			rofi)
				echo "${_INPUT}" | rofi -dmenu -i -no-custom -no-fixed-num-lines -p "Choose:"
				;;
			wofi)
				echo "${_INPUT}" | wofi --show dmenu --insensitive --prompt "Choose:"
				;;
			*)
				echo "${_INPUT}" | $_PICKER
				;;
		esac

	# Use Bash's built in select option
	else
		# Parse only on new lines
		local _IFS_OLD="${IFS}"
		IFS=$'\n'

		# Turn off globbing filename generation
		set -f

		# Show a list to pick an item from
		select RESULT in ${_INPUT}; do
			if [ -n "${RESULT}" ]; then
				echo "${RESULT}"
				break
			fi
		done < /dev/tty

		# Restore settings
		IFS="${_IFS_OLD}"
		set +f
	fi
}

# This function automates the process of executing a command and providing visual feedback
# It displays an hourglass symbol next to the provided description while the command is running
# Upon successful execution, the hourglass is replaced with a green checkmark
# If the command fails, a red cross symbol is displayed instead
# Parameters:
# 	$1: Text description to display while the command is running
# 	$2: The command to execute
function runwithfeedback() {
	# Check if both parameters are provided
	if [[ -z "${1}" ]] || [[ -z "${2}" ]]; then
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}runwithfeedback${RESET} ${BRIGHT_GREEN}[description] [command]${RESET}"
		return 1
	fi

	# Local variables for special characters with color codes
	local HOURGLASS="${BRIGHT_YELLOW}⌛${RESET}"   # Yellow Hourglass
	local CHECKMARK="\r${BRIGHT_GREEN}✓${RESET}"  # Green Checkmark
	local CROSS="\r${BRIGHT_RED}X${RESET}"        # Red Error Cross

	# Display the hourglass and message
	echo -ne "${HOURGLASS} ${1}"

	# Execute the command
	if eval "${2}"; then
		# If successful, display a green checkmark
		echo -e "${CHECKMARK} ${1} "
	else
		# If failed, display a red cross
		echo -e "${CROSS} ${1} "
	fi
}

# Finds the current Linux distribution, name, version, and kernel version
function ver() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}ver${RESET}: Display system and kernel version information"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}ver${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Shows uname, /proc/version, lsb_release, and hostnamectl info${RESET}"
		return 0
	fi

	if hascommand --strict uname; then
		# Get information about the system kernel, release, and machine hardware
		uname --kernel-name --kernel-release --machine
		echo
	fi
	if [[ -e /proc/version ]]; then
		# File that contains version information about the operating kernel
		cat /proc/version
		echo
	fi
	if hascommand --strict lsb_release; then
		# Provides LSB (Linux Standard Base) and distribution-specific information
		lsb_release -a
		echo
	fi
	if hascommand --strict hostnamectl; then
		# Control the Linux system hostname, also shows various system details
		hostnamectl
		echo
	else
		# Various files that contain text relating to the system identification
		cat /etc/*-release 2> /dev/null
	fi
}

# Aliases crontab with safety warning for -r option, confirming removal
alias crontab='_crontab_safe'
function _crontab_safe() {
	# Check if the parameters contain the "-r" option
	if [[ "$*" == *"-r"* ]]; then
		# Display a warning message in bright red with a warning icon
		echo -e "${BRIGHT_RED}WARNING: ${RESET}${BRIGHT_CYAN}You are attempting to remove your crontab. This action cannot be undone! ${BRIGHT_YELLOW}⚠️${RESET}"

		# Ask for user confirmation before proceeding
		read -p "Are you sure you want to continue? (y/N) " confirm

		# Check if the user confirmed the operation
		if [[ "$confirm" == [yY] || "$confirm" == [yY][eE][sS] ]]; then
			# If confirmed, execute the actual crontab command with the provided parameters
			command crontab "$@"
		else
			# If not confirmed, display a cancellation message
			echo "Operation canceled."
		fi
	else
		# If the "-r" option is not present, execute the regular crontab command with the provided parameters
		command crontab "$@"
	fi
}

# Search process names to kill
# https://unix.stackexchange.com/questions/443472/alias-for-killing-all-processes-of-a-grep-hit
function smash() {
	# Check if a process name is specified; if not, show help text
	if [[ -z "${1}" ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}smash${RESET}: Find and optionally kill processes by name"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}smash${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}process_name${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}smash${RESET} ${BRIGHT_YELLOW}vim${RESET}"
		return 1
	fi

	local T_PROC=$1
	local T_PIDS=($(pgrep -i "$T_PROC"))
	if [[ "${#T_PIDS[@]}" -ge 1 ]]; then
		echo "Found the following processes:"
		for pid in "${T_PIDS[@]}"; do
			echo "$pid" "$(command ps -p "$pid" -o comm= | awk -F'/' '{print $NF}')" | column -t
		done
		if ask "Kill them?" N; then
			for pid in "${T_PIDS[@]}"; do
				echo "Killing ${pid}..."
				# Try SIGTERM first, then escalate if process survives
				builtin kill -15 "$pid" 2>/dev/null
				sleep 2
				if builtin kill -0 "$pid" 2>/dev/null; then
					builtin kill -2 "$pid" 2>/dev/null
					sleep 2
					if builtin kill -0 "$pid" 2>/dev/null; then
						builtin kill -1 "$pid" 2>/dev/null
						sleep 2
						if builtin kill -0 "$pid" 2>/dev/null; then
							echo "Cannot terminate ${pid}" >&2
							continue
						fi
					fi
				fi
			done
		else
			echo "Exiting..."
			return 0
		fi
	else
		echo "No processes found for: $1" >&2 && return 1
	fi
}

# Automatically downloads based on URL by dynamically choosing the appropriate command
# Detects the domain from the URL and chooses the appropriate download command
# ---
# IMPORTANT: Always ensure that you have the legal right and ethical justification
# to download media from various services. Respect copyright laws and terms of service
# agreements. Use of this script should comply with all applicable regulations.
alias d='download'
function download() {
	local URL="${1}"
	local DOWNLOAD_PATH="${2:-.}"

	# Check if we are in a graphical environment and Desktop exists
	if [[ "${DOWNLOAD_PATH}" == "." ]] && ([[ -n "$DISPLAY" ]] || [[ -n "$WAYLAND_DISPLAY" ]]) && [[ -n "$XDG_CURRENT_DESKTOP" ]] && hascommand xdg-user-dir; then
		DOWNLOAD_PATH="$(xdg-user-dir DOWNLOAD)"
	fi

	# Display help if no URL provided or help requested
	if [[ -z "${URL}" ]] || [[ "${URL}" == "--help" ]] || [[ "${URL}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}d${RESET}: Download from URL using the best available tool"
		echo -en "${BRIGHT_WHITE}Tools:${RESET} ${BRIGHT_CYAN}axel${RESET}, ${BRIGHT_CYAN}aria2c${RESET}, ${BRIGHT_CYAN}wget${RESET}, ${BRIGHT_CYAN}curl${RESET},"
		echo -e " ${BRIGHT_MAGENTA}ytmdl${RESET}, ${BRIGHT_MAGENTA}yt-dlp${RESET}, ${BRIGHT_MAGENTA}spotdl${RESET}, ${BRIGHT_MAGENTA}tidal-dl${RESET}, ${BRIGHT_MAGENTA}qobuz-dl${RESET}, ${BRIGHT_MAGENTA}scdl${RESET}"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}d${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}URL or song name${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}download_path${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}d${RESET} ${BRIGHT_YELLOW}\"Love is Blue\"${RESET}                             ${BRIGHT_BLUE}# Search and download song${RESET}"
		echo -e "  ${BRIGHT_CYAN}d${RESET} ${BRIGHT_YELLOW}https://example.com/file.zip${RESET}              ${BRIGHT_BLUE}# Direct download${RESET}"
		echo -e "  ${BRIGHT_CYAN}d${RESET} ${BRIGHT_YELLOW}https://youtube.com/watch?v=...${RESET}           ${BRIGHT_BLUE}# YouTube video${RESET}"
		echo -e "  ${BRIGHT_CYAN}d${RESET} ${BRIGHT_YELLOW}https://open.spotify.com/track/...${RESET}        ${BRIGHT_BLUE}# Spotify track${RESET}"
		echo -e "  ${BRIGHT_CYAN}d${RESET} ${BRIGHT_YELLOW}https://open.qobuz.com/track/...${RESET}          ${BRIGHT_BLUE}# Qobuz track${RESET}"
		echo -e "  ${BRIGHT_CYAN}d${RESET} ${BRIGHT_YELLOW}https://soundcloud.com/...${RESET}                ${BRIGHT_BLUE}# SoundCloud${RESET}"
		echo -e "  ${BRIGHT_CYAN}d${RESET} ${BRIGHT_YELLOW}https://example.com/file.zip${RESET} ${BRIGHT_GREEN}~/Downloads${RESET}  ${BRIGHT_BLUE}# Custom path${RESET}"
		return 1

	# Song name search (not a URL)
	# ytmdl searches YouTube, downloads audio, and tags with metadata
	# from iTunes, Spotify, LastFM, Deezer, and MusicBrainz
	elif [[ ! "${URL}" =~ ^https?:// ]] && hascommand ytmdl; then
		echo -e "${BRIGHT_YELLOW}Using ytmdl to search for \"${URL}\"...${RESET}"
		ytmdl --format opus --dont-transcode "${URL}" || echo -e "${BRIGHT_RED}Download failed.${RESET}"

	# Spotify URLs
	elif [[ "${URL}" =~ ^https://open.spotify.com/ ]]; then

		# spotDL finds songs from Spotify playlists on YouTube and downloads
		# them along with album art, lyrics, and metadata
		# Link: https://github.com/spotDL/spotify-downloader
		if hascommand spotdl; then
			echo -e "${BRIGHT_YELLOW}Using spotdl for Spotify URL...${RESET}"
			(cd "${DOWNLOAD_PATH}" && spotdl --bitrate 320k "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"

		else
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No suitable Spotify download tool found${RESET}"
			return 1
		fi

	# Tidal URLs
	elif [[ "${URL}" =~ ^https://tidal.com/ ]]; then

		# TIDAL Downloader Next Generation downloads songs and videos from TIDAL
		# https://github.com/exislow/tidal-dl-ng
		if hascommand tidal-dl-ng; then
			echo -e "${BRIGHT_YELLOW}Using tidal-dl-ng for Tidal URL...${RESET}"
			(cd "${DOWNLOAD_PATH}" && tidal-dl-ng dl "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"

		# Tidal-Media-Downloader» lets you download videos and tracks from Tidal
		# https://github.com/yaronzz/Tidal-Media-Downloader
		elif hascommand tidal-dl; then
			echo -e "${BRIGHT_YELLOW}Using tidal-dl for Tidal URL (ensure logged in)...${RESET}"
			(cd "${DOWNLOAD_PATH}" && tidal-dl "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"

		else
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No suitable Tidal download tool found${RESET}"
			return 1
		fi

	# Qobuz URLs
	elif [[ "${URL}" =~ ^https://(open\.)?qobuz\.com/ ]]; then

		# qobuz-dl is a complete Qobuz music downloader with FLAC support
		# Link: https://github.com/vitiko98/qobuz-dl
		if hascommand qobuz-dl; then
			echo -e "${BRIGHT_YELLOW}Using qobuz-dl for Qobuz URL...${RESET}"
			(cd "${DOWNLOAD_PATH}" && qobuz-dl dl "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"

		else
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No suitable Qobuz download tool found${RESET}"
			return 1
		fi

	# Soundcloud + scdl is a script is able to download music from SoundCloud
	# and can also set the id3tag to the downloaded music file
	# Link: https://github.com/scdl-org/scdl
	elif [[ "${URL}" =~ ^https?://(www\.)?soundcloud.com/ ]] && hascommand scdl; then
			# Download using the scdl script
			echo -e "${BRIGHT_YELLOW}Using scdl for SoundCloud URL...${RESET}"
			(scdl -l "${URL}" --path "${DOWNLOAD_PATH}" --onlymp3) || echo -e "${BRIGHT_RED}Download failed.${RESET}"

	# YouTube URLs (including YouTube Music)
	# ytmdl downloads songs from YouTube with metadata from iTunes, Spotify,
	# LastFM, Deezer, and MusicBrainz
	# Link: https://github.com/deepjyoti30/ytmdl
	elif [[ "${URL}" =~ ^https?://(www\.|music\.)?(youtube\.com|youtu\.be)/ ]]; then

		# YouTube Music URLs are always audio
		local AUDIO_DOWNLOAD=false
		if [[ "${URL}" =~ music\.youtube\.com ]]; then
			AUDIO_DOWNLOAD=true
		elif ask "Download as audio only? (No = download video)" N; then
			AUDIO_DOWNLOAD=true
		fi

		if [[ "${AUDIO_DOWNLOAD}" == true ]]; then
			# yt-dlp is the most reliable YouTube downloader (actively maintained)
			if hascommand yt-dlp; then
				echo -e "${BRIGHT_YELLOW}Using yt-dlp for YouTube audio...${RESET}"
				(cd "${DOWNLOAD_PATH}" && yt-dlp -f 'bestaudio/best' --extract-audio --audio-format mp3 --audio-quality 0 "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"

			# ytmdl downloads audio and automatically tags with metadata
			elif hascommand ytmdl; then
				echo -e "${BRIGHT_YELLOW}Using ytmdl for YouTube audio (with metadata)...${RESET}"
				ytmdl --format opus --dont-transcode --url "${URL}" || echo -e "${BRIGHT_RED}Download failed.${RESET}"

			elif hascommand youtube-dl; then
				echo -e "${BRIGHT_YELLOW}Using youtube-dl for YouTube audio...${RESET}"
				(cd "${DOWNLOAD_PATH}" && youtube-dl -f 'bestaudio' --extract-audio --audio-format mp3 --audio-quality 0 "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"

			else
				echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No suitable YouTube audio download tool found${RESET}"
				return 1
			fi
		else
			# Video download with quality selection
			if hascommand yt-dlp; then
				echo -e "${BRIGHT_YELLOW}Using yt-dlp for YouTube video...${RESET}"

				if ask "Limit video size to 1080p? (No = max size)" Y; then
					(cd "${DOWNLOAD_PATH}" && yt-dlp -o "%(title)s.%(ext)s" -f 'bestvideo[ext=mp4][height<=1080]+bestaudio' --merge-output-format mp4 "${URL}" || yt-dlp -o "video.%(ext)s" -f 'bestvideo[ext=mp4][height<=1080]+bestaudio' --merge-output-format mp4 "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
				else
					(cd "${DOWNLOAD_PATH}" && yt-dlp -o "%(title)s.%(ext)s" -f 'bestvideo[ext=mp4]+bestaudio' --merge-output-format mp4 "${URL}" || yt-dlp -o "video.%(ext)s" -f 'bestvideo[ext=mp4]+bestaudio' --merge-output-format mp4 "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
				fi

			elif hascommand youtube-dl; then
				echo -e "${BRIGHT_YELLOW}Using youtube-dl for YouTube video...${RESET}"

				if ask "Download highest available quality? (No = limit to 1080p)" N; then
					(cd "${DOWNLOAD_PATH}" && youtube-dl --format 'best[vcodec*=avc]+bestaudio' "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
				else
					(cd "${DOWNLOAD_PATH}" && youtube-dl --format 'best[vcodec*=avc][height<=1080]+bestaudio' "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
				fi

			else
				echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No suitable YouTube video download tool found${RESET}"
				return 1
			fi
		fi

	# SoundCloud, Bandcamp and other audio-focused platforms
	elif [[ "${URL}" =~ ^https?://(www\.)?(soundcloud\.com|bandcamp\.com|mixcloud\.com|audiomack\.com|audius\.co|hearthis\.at|play\.fm|clyp\.it|indieshuffle\.com)/ ]]; then
		# yt-dlp is a feature-rich command-line audio/video downloader
		# with support for thousands of sites
		# Link: https://github.com/yt-dlp/yt-dlp
		if hascommand yt-dlp; then
			echo -e "${BRIGHT_YELLOW}Using yt-dlp for the audio URL...${RESET}"

			if ask "Do you want to download the audio in MP3 format (choosing No will download the highest quality original format)?" Y; then
				(cd "${DOWNLOAD_PATH}" && yt-dlp -f 'bestaudio/best' --extract-audio --audio-format mp3 --audio-quality 0 "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
			else
				(cd "${DOWNLOAD_PATH}" && yt-dlp -f 'bestaudio/best' --extract-audio --audio-quality 0 "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
			fi

		# youtube-dl downloads videos from youtube.com or other video platforms
		# Link: https://github.com/ytdl-org/youtube-dl
		elif hascommand youtube-dl; then
			echo -e "${BRIGHT_YELLOW}Using youtube-dl for the audio URL...${RESET}"

			if ask "Do you want to download the audio in MP3 format (choosing No will download the highest quality original format)?" Y; then
				(cd "${DOWNLOAD_PATH}" && youtube-dl -f 'bestaudio' --extract-audio --audio-format mp3 --audio-quality 0 "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
			else
				(cd "${DOWNLOAD_PATH}" && youtube-dl -f 'bestaudio' --extract-audio --audio-format best --audio-quality 0 "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
			fi

		else
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No suitable audio download tool found${RESET}"
			return 1
		fi

	# Simple video platforms (Odysee, Rumble, Bitchute, etc) - basic format selection
	elif [[ "${URL}" =~ ^https?://(www\.)?(bitchute\.com|lbry\.tv|metacafe\.com|odysee\.com|peertube\.[a-zA-Z]+|rumble\.com|streamable\.com|ted\.com|viddler\.com|wistia\.com)/ ]]; then

		# Found yt-dlp command-line audio/video downloader
		if hascommand yt-dlp; then
			echo -e "${BRIGHT_YELLOW}Using yt-dlp for the video URL...${RESET}"
			(cd "${DOWNLOAD_PATH}" && yt-dlp --format "best" --progress --no-warnings --geo-bypass "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"

		# Found youtube-dl command-line audio/video downloader
		elif hascommand youtube-dl; then
			echo -e "${BRIGHT_YELLOW}Using youtube-dl for the video URL...${RESET}"
			(cd "${DOWNLOAD_PATH}" && youtube-dl --format "best" --progress --no-warnings --geo-bypass "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"

		else
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No suitable video download tool found${RESET}"
			return 1
		fi

	# Major streaming platforms (Twitch, Dailymotion, etc) - advanced format handling
	elif [[ "${URL}" =~ ^https?://(www\.)?(dailymotion\.com|facebook\.com|instagram\.com|linkedin\.com|ok\.ru|reddit\.com|tiktok\.com|tumblr\.com|twitch\.tv|twitter\.com|vevo\.com|vimeo\.com|vk\.com)/ ]]; then

		# Found yt-dlp command-line audio/video downloader
		if hascommand yt-dlp; then
			echo -e "${BRIGHT_YELLOW}Using yt-dlp for the video URL...${RESET}"

			if ask "Do you want to download the highest available video quality (choosing No will limit to 1080p)?" N; then
				(cd "${DOWNLOAD_PATH}" && yt-dlp -o "%(title)s.%(ext)s" -f 'bestvideo[ext=mp4]+bestaudio' --merge-output-format mp4 "${URL}" || yt-dlp -o "video.%(ext)s" -f 'bestvideo[ext=mp4]+bestaudio' --merge-output-format mp4 "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
			else
				(cd "${DOWNLOAD_PATH}" && yt-dlp -o "%(title)s.%(ext)s" -f 'bestvideo[ext=mp4][height<=1080]+bestaudio' --merge-output-format mp4 "${URL}" || yt-dlp -o "video.%(ext)s" -f 'bestvideo[ext=mp4][height<=1080]+bestaudio' --merge-output-format mp4 "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
			fi

		# Found youtube-dl command-line audio/video downloader
		elif hascommand youtube-dl; then
			echo -e "${BRIGHT_YELLOW}Using youtube-dl for the video URL...${RESET}"

			if ask "Do you want to download the highest available video quality (choosing No will limit to 1080p)?" N; then
				(cd "${DOWNLOAD_PATH}" && youtube-dl --format 'best[vcodec*=avc]+bestaudio' "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
			else
				(cd "${DOWNLOAD_PATH}" && youtube-dl --format 'best[vcodec*=avc][height<=1080]+bestaudio' "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"
			fi

		else
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}No suitable video download tool found${RESET}"
			return 1
		fi

	# Download using the detected tool
	else
		if hascommand axel; then
			# Axel accelerates the download process by using multiple connections
			# per file, and can also balance the load between different servers
			# Link: https://github.com/axel-download-accelerator/axel
			echo -e "${BRIGHT_YELLOW}Downloading using axel...${RESET}"
			(cd "${DOWNLOAD_PATH}" && command axel -a -n 10 "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"

		elif hascommand aria2c; then
			# aria2c is a lightweight multi-protocol & multi-source command-line
			# download utility that supports HTTP/HTTPS, FTP, SFTP, BitTorrent, and
			# Metalink with multiple connections and enhanced control over connections
			# Link: https://aria2.github.io/
			echo -e "${BRIGHT_YELLOW}Downloading using aria2c...${RESET}"
			command aria2c --max-connection-per-server=5 --continue=true --async-dns=false --dir="${DOWNLOAD_PATH}" "${URL}" || echo -e "${BRIGHT_RED}Download failed.${RESET}"

		elif hascommand curl; then
			# curl supports data transfer from or to a server using multiple protocols
			# like HTTP, HTTPS, and FTP, and features resuming and redirect following
			# Link: https://curl.se/
			echo -e "${BRIGHT_YELLOW}Downloading using curl...${RESET}"
			(cd "${DOWNLOAD_PATH}" && command curl -C - -L -O "${URL}") || echo -e "${BRIGHT_RED}Download failed.${RESET}"

		elif hascommand wget; then
			# wget is a non-interactive command-line file downloader for HTTP, HTTPS,
			# and FTP that supports resuming downloads on more unstable connections
			# Link: https://www.gnu.org/software/wget/
			echo -e "${BRIGHT_YELLOW}Downloading using wget...${RESET}"
			command wget --continue -P "${DOWNLOAD_PATH}" "${URL}" || echo -e "${BRIGHT_RED}Download failed.${RESET}"

		else
			echo -e "${BRIGHT_RED}ERROR: No suitable download tool found${RESET}"
			return 1
		fi
	fi
}

# Extracts any archive(s)
function extract() {
	# If no archive is specified or --help or -h is passed, show help text
	if [[ -z "${1}" ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}extract${RESET}: Extract one or multiple archive files"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}extract${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}archive${BRIGHT_MAGENTA}>${RESET}..."
		echo -e "${BRIGHT_WHITE}Supports:${RESET} .tar.gz .tar.bz2 .tar .tgz .tbz2 .gz .bz2 .zip .rar .7z .Z"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}extract${RESET} ${BRIGHT_YELLOW}backup.tar.gz${RESET}           ${BRIGHT_BLUE}# Extract tarball${RESET}"
		echo -e "  ${BRIGHT_CYAN}extract${RESET} ${BRIGHT_YELLOW}archive.zip${RESET}             ${BRIGHT_BLUE}# Extract zip${RESET}"
		echo -e "  ${BRIGHT_CYAN}extract${RESET} ${BRIGHT_YELLOW}data.7z${RESET}                 ${BRIGHT_BLUE}# Extract 7-zip${RESET}"
		echo -e "  ${BRIGHT_CYAN}extract${RESET} ${BRIGHT_YELLOW}file1.tar.gz file2.zip${RESET}  ${BRIGHT_BLUE}# Multiple archives${RESET}"
		return 1
	fi

	# Loop through each archive provided as an argument
	for archive in "$@"; do
		# Check if the file exists
		if [ -f "${archive}" ] ; then
			# Switch case to handle various archive types
			case "${archive}" in
				*.tar.bz2)  tar xvjf "${archive}"    ;;
				*.tar.gz)   tar xvzf "${archive}"    ;;
				*.bz2)      bunzip2 "${archive}"     ;;
				*.rar)      rar x "${archive}"       ;;
				*.gz)       gunzip "${archive}"      ;;
				*.tar)      tar xvf "${archive}"     ;;
				*.tbz2)     tar xvjf "${archive}"    ;;
				*.tgz)      tar xvzf "${archive}"    ;;
				*.zip)      unzip "${archive}"       ;;
				*.Z)        uncompress "${archive}"  ;;
				*.7z)       7z x "${archive}"        ;;
				*)          echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Unknown archive type ${BRIGHT_YELLOW}${archive##*.}${RESET}" ;;
			esac
		else
			echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}The file ${BRIGHT_YELLOW}${archive}${BRIGHT_CYAN} is not valid or does not exist${RESET}"
		fi
	done
}

# Generate a random password
# Pass the number of characters for the password on the command line
# Add the parameter +s to include symbols and -s to exclude them
# Example: genpw
# Example: genpw +s 24
# Example: genpw 8
# Example: genpw 12 -s
# HINT: Check passwords with cracklib: echo "1234abc" | cracklib-check
# Link: https://www.cyberciti.biz/security/linux-password-strength-checker/
function genpw() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}genpw${RESET}: Generate secure random passwords"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}genpw${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}length${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}-s|+s${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Options:${RESET}"
		echo -e "  ${BRIGHT_GREEN}+s${RESET}  Include symbols"
		echo -e "  ${BRIGHT_GREEN}-s${RESET}  Exclude symbols"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}genpw${RESET}        ${BRIGHT_BLUE}# Interactive (default 16 chars)${RESET}"
		echo -e "  ${BRIGHT_CYAN}genpw${RESET} ${BRIGHT_GREEN}24${RESET}     ${BRIGHT_BLUE}# 24 character passwords${RESET}"
		echo -e "  ${BRIGHT_CYAN}genpw${RESET} ${BRIGHT_GREEN}32 +s${RESET}  ${BRIGHT_BLUE}# 32 chars with symbols${RESET}"
		echo -e "  ${BRIGHT_CYAN}genpw${RESET} ${BRIGHT_GREEN}16 -s${RESET}  ${BRIGHT_BLUE}# 16 chars without symbols${RESET}"
		return 0
	fi

	local _PASSWORD_LENGTH
	local _PASSWORD_SYMBOLS

	if [[ ${1} -gt 0 ]]; then
		_PASSWORD_LENGTH=${1}
	elif [[ ${2} -gt 0 ]]; then
		_PASSWORD_LENGTH=${2}
	else
		read -e -i "16" -p "How many characters? " _PASSWORD_LENGTH
		if [[ ! ${_PASSWORD_LENGTH} -gt 0 ]]; then
			_PASSWORD_LENGTH=16
		fi
	fi

	if [[ ${1} == '-s' ]] || [[ ${2} == '-s' ]]; then
		_PASSWORD_SYMBOLS=false
	elif [[ ${1} == '+s' ]] || [[ ${2} == '+s' ]]; then
		_PASSWORD_SYMBOLS=true
	else
		if ask "Do you want to include symbols?" Y; then
			_PASSWORD_SYMBOLS=true
		fi
	fi

	if hascommand --strict apg; then
		if [[ ${_PASSWORD_SYMBOLS} == true ]]; then
			apg -a 1 -n 10 -m ${_PASSWORD_LENGTH} -l
		else
			apg -a 0 -n 10 -m ${_PASSWORD_LENGTH} -l
		fi
	elif hascommand --strict pwgen; then
		if [[ ${_PASSWORD_SYMBOLS} == true ]]; then
			pwgen --capitalize --numerals --symbols --secure -C ${_PASSWORD_LENGTH} 40
		else
			pwgen --capitalize --numerals --secure -C ${_PASSWORD_LENGTH} 40
		fi
	elif hascommand --strict gpg; then
		for ((n=0;n<10;n++)); do
			if [[ ${_PASSWORD_SYMBOLS} == true ]]; then
				gpg --gen-random 1 1024 | tr -dc a-zA-Z0-9'`~!@#$%^&*-_=+()[]{}|;:",.?<>/\\'"'" | head -c${_PASSWORD_LENGTH}; echo
			else
				gpg --gen-random 1 1024 | tr -dc a-zA-Z0-9 | head -c${_PASSWORD_LENGTH}; echo
			fi
		done
	elif hascommand --strict openssl; then
		for ((n=0;n<10;n++)); do
			if [[ ${_PASSWORD_SYMBOLS} == true ]]; then
				openssl rand 1024 | tr -dc a-zA-Z0-9'`~!@#$%^&*-_=+()[]{}|;:",.?<>/\\'"'" | head -c${_PASSWORD_LENGTH}; echo
			else
				openssl rand 1024 | tr -dc a-zA-Z0-9 | head -c${_PASSWORD_LENGTH}; echo
			fi
		done
	else
		for ((n=0;n<10;n++)); do
			if [[ ${_PASSWORD_SYMBOLS} == true ]]; then
				cat /dev/urandom | tr -dc a-zA-Z0-9'`~!@#$%^&*-_=+()[]{}|;:",.?<>/\\'"'" | head -c${_PASSWORD_LENGTH}; echo
			else
				cat /dev/urandom | tr -dc a-zA-Z0-9 | head -c${_PASSWORD_LENGTH}; echo
			fi
		done
	fi
}

# Schedule the computer to auto reboot (defaults to 4:00 AM)
function rebootlater() {
	# Show help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}rebootlater${RESET}: Schedule the computer to auto reboot at a specified time"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}rebootlater${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}time${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}rebootlater${RESET}        ${BRIGHT_BLUE}# Defaults to 4:00 AM${RESET}"
		echo -e "  ${BRIGHT_CYAN}rebootlater${RESET} ${BRIGHT_YELLOW}23:30${RESET}  ${BRIGHT_BLUE}# Reboot at 11:30 PM${RESET}"
		echo -e "  ${BRIGHT_CYAN}sudo shutdown -c${RESET}   ${BRIGHT_BLUE}# Cancel a scheduled reboot${RESET}"
		return 0
	fi

	sudo shutdown -r "${1:-04:00}"
}

# See what command you are using the most (this parses the history command)
# Usage: mostused [num_items]
function mostused() {
	local NUM_ITEMS="${1:-10}"  # Default to 10 if NUM_ITEMS is not specified
	history \
	| awk ' { a[$4]++ } END { for ( i in a ) print a[i], i | "sort -rn | head -n'"${NUM_ITEMS}"'"}' \
	| awk '$1 > max{ max=$1} { bar=""; i=s=10*$1/max;while(i-->0)bar=bar"#"; printf "%25s %15d %s %s", $2, $1,bar, "\n"; }'
}

# Start a program but immediately disown it and detach it from the terminal
function runfree() {
	"$@" > /dev/null 2>&1 & disown
}

# Sends a desktop notification when a command finishes its execution
# Examples: sleep 1; alert  # Notifies when the sleep command completes
#           make && alert 'Success' || alert 'Error'  # Notify result status
#           tar -czvf file.tar.gz && alert  # Notifies if the command succeeds
#           false || alert "There was an error"  # Notifies if the command fails
# Link: https://askubuntu.com/questions/423646/use-of-default-alias-alert
function alert() {
	# Determine the icon based on the exit status of the last command
	# If exit status is zero (success), use 'terminal' as icon; otherwise use 'error'
	local ICON="$([[ $? == 0 ]] && echo terminal || echo error)"

	# Extract the last executed command from the history
	# Remove leading numbers and trailing 'alert' command if exists
	local LAST_COMMAND="$(history | tail -n1 | sed -e 's/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//')"

	# Send the desktop notification with highest urgency level ("critical")
	notify-send --urgency=critical -i "${ICON}" "${LAST_COMMAND}"
}

# Format a string that is safe to be used in regular expressions
function regexformat() {
	# Escape special regex characters for use in patterns
	# Note: In POSIX bracket expressions, backslash is literal, not an escape char.
	# Place backslash last to make intent explicit; parens/space don't need escaping.
	echo -n "$(printf '%s' "${1}" | sed 's/[.[() *^$+?{|\\]/\\&/g')"
}

# Trim leading and trailing characters on the clipboard
function trimcb() {
	# Fetch the current clipboard content and declare it as a local variable
	local CONTENT_TO_TRIM=$(clipboard)

	# If clipboard content is not empty, trim it and send it back to the clipboard
	if [[ -n "${CONTENT_TO_TRIM}" ]]; then
		echo -e "${CONTENT_TO_TRIM}" | sed 's/^[ \t]*//;s/[ \t]*$//' | clipboard
	fi
}

# Long format directory listing with color columns (only requires gawk)
function llcolor {
	if hascommand --strict gawk; then
		# Show long directory listings with color columns
		command ls -l --all --classify --group-directories-first --human-readable --color=always "$@" | awk '
			BEGIN {
				FPAT = "([[:space:]]*[^[:space:]]+)";
				OFS = "";
			}
			{
				$1 = "\033[0;37m" $1 "\033[0m";
				$2 = "\033[0;34m" $2 "\033[0m";
				$3 = "\033[0;35m" $3 "\033[0m";
				$4 = "\033[0;31m" $4 "\033[0m";
				$5 = "\033[0;33m" $5 "\033[0m";
				$6 = "\033[0;32m" $6 "\033[0m";
				$7 = "\033[0;32m" $7 "\033[0m";
				$8 = "\033[0;36m" $8 "\033[0m";
				print
			}
		'
	else # Gawk not installed...
		# Show long directory listings with highest compatibility
		command ls -Fls "$@"
	fi
}

# Commands pushd and popd now output the directory stack after modification
# and also prevents duplicate directories being added to the directory stack
function pushd() {
	builtin pushd "${@}" > /dev/null
	dirsdedup
	echo "Directory Stack:"
	dirs -v
}

function popd() {
	builtin popd "${@}" > /dev/null
	echo "Directory Stack:"
	dirs -v
}

# Remove duplicate directories in the directory stack for pushd
function dirsdedup() {
	# Declare an array to hold the new directory stack without duplicates
	declare -a NEW_STACK=()
	# Declare a copy of the current directory stack, excluding the first element
	declare -a CURRENT_STACK_COPY=("${DIRSTACK[@]:1}")
	# Declare an associative array to keep track of directories seen
	declare -A SEEN_DIRECTORIES
	# Local variables for loop iteration
	local DIRECTORY INDEX
	# Mark the current working directory as seen
	SEEN_DIRECTORIES[$PWD]=1

	# Iterate through the copied directory stack
	for DIRECTORY in "${CURRENT_STACK_COPY[@]}"
	do
		# If the directory has not been seen before, add it to the new stack
		if [ -z "${SEEN_DIRECTORIES[$DIRECTORY]}" ]; then
			NEW_STACK+=("$DIRECTORY")
			SEEN_DIRECTORIES[$DIRECTORY]=1
		fi
	done

	# Rebuild the directory stack from the new stack, in reverse order
	builtin dirs -c
	for ((INDEX=${#NEW_STACK[@]}-1; INDEX>=0; INDEX--))
	do
		builtin pushd -n "${NEW_STACK[INDEX]}" >/dev/null
	done
}

# View a comma delimited (.CSV) file
function csvview() {
	# Check for the presence of arguments
	if [[ $# -eq 0 ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}csvview${RESET}: View comma-delimited (.CSV) files"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}csvview${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}file.csv${BRIGHT_MAGENTA}>${RESET}..."
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}csvview${RESET} ${BRIGHT_YELLOW}data.csv${RESET}"
		echo -e "  ${BRIGHT_CYAN}csvview${RESET} ${BRIGHT_YELLOW}file1.csv file2.csv${RESET}  ${BRIGHT_BLUE}# Multiple files${RESET}"
		return 1
	fi

	# Loop through all the arguments
	for FILE in "${@}"; do
		# Check if file exists
		if [[ ! -f "${FILE}" ]]; then
			echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}The file ${BRIGHT_YELLOW}${FILE}${BRIGHT_CYAN} does not exist${RESET}"
			continue
		# Check if file is readable
		elif [[ ! -r "${FILE}" ]]; then
			echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}The file ${BRIGHT_YELLOW}${FILE}${BRIGHT_CYAN} is not readable${RESET}"
			continue
		fi

		# Display the formatted CSV file
		command cat "${FILE}" | command sed 's/,/ ,/g' | column -t -s, | command less -S
	done
}

# Send file(s) to the trash
# Link: https://www.tecmint.com/trash-cli-manage-linux-trash-from-command-line/
function trash() {
	# Check for the presence of arguments or help requested
	if [[ $# -eq 0 ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}trash${RESET}: Send files to the trash"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}trash${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}file${BRIGHT_MAGENTA}>${RESET}..."
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}trash${RESET} ${BRIGHT_YELLOW}oldfile.txt${RESET}"
		echo -e "  ${BRIGHT_CYAN}trash${RESET} ${BRIGHT_YELLOW}file1.txt file2.txt${RESET}  ${BRIGHT_BLUE}# Multiple files${RESET}"
		return 1
	fi

	# Check if trash-cli exists...
	# https://github.com/andreafrancia/trash-cli
	if hascommand trash-put; then
		trash-put "${@}" && return 0

	# Check if rem exists...
	# Link: https://github.com/quackduck/rem
	elif hascommand rem; then
		rem "${@}" && return 0

	# Check if gio trash exists (glib2)...
	# Link: https://wiki.archlinux.org/title/Trash-cli#gio_trash
	elif hascommand gio; then
		gio trash "${@}" && return 0

	# Check if kioclient5 exists (kde-cli-tools)...
	# Link: https://wiki.archlinux.org/title/Trash-cli#kioclient5
	elif hascommand kioclient5; then
		kioclient5 move "${@}" trash:/ && return 0

	# Check for various trash directories
	elif [[ -d "${XDG_DATA_HOME:-${HOME}/.local/share}/Trash/files" ]]; then
		command mv -i "${@}" "${XDG_DATA_HOME:-${HOME}/.local/share}/Trash/files/" && return 0
	elif [[ -d "${XDG_DATA_HOME:-${HOME}/.local/share}/trash/files" ]]; then
		command mv -i "${@}" "${XDG_DATA_HOME:-${HOME}/.local/share}/trash/files/" && return 0
	elif [[ -d "${HOME}/.Trash" ]]; then
		command mv -i "${@}" "${HOME}/.Trash/" && return 0
	elif [[ -d "${HOME}/.trash" ]]; then
		command mv -i "${@}" "${HOME}/.trash/" && return 0

	# Create the trash directory per the XDG specification if none exists
	else
		command mkdir -p "${XDG_DATA_HOME:-${HOME}/.local/share}/Trash/files"
		command mv -i "${@}" "${XDG_DATA_HOME:-${HOME}/.local/share}/Trash/files/" && return 0
	fi

	# If none of the methods succeeded, return an error
	echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Failed to send files to the trash${RESET}"
	return 1
}

# Display the contents of the trash
function trashlist() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}trashlist${RESET}: List files in the trash"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}trashlist${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Auto-detects trash-cli, rem, gio, or kioclient5${RESET}"
		return 0
	fi

	# Check if trash-cli exists...
	# https://github.com/andreafrancia/trash-cli
	if hascommand --strict trash-list; then
		trash-list
	# Check if rem exists...
	# Link: https://github.com/quackduck/rem
	elif hascommand --strict rem; then
		rem -l
	# Check if gio trash exists (glib2)...
	# Link: https://wiki.archlinux.org/title/Trash-cli#gio_trash
	elif hascommand --strict gio; then
		gio list trash:///
	# Check if kioclient5 exists (kde-cli-tools)...
	# Link: https://wiki.archlinux.org/title/Trash-cli#kioclient5
	elif hascommand --strict kioclient5; then
		kioclient5 ls trash:/
	# Check for alternative trash directories and list files
	elif [[ -d "${XDG_DATA_HOME:-${HOME}/.local/share}/Trash/files" ]]; then
		ls -l "${XDG_DATA_HOME:-${HOME}/.local/share}/Trash/files/"
	elif [[ -d "${XDG_DATA_HOME:-${HOME}/.local/share}/trash/files" ]]; then
		ls -l "${XDG_DATA_HOME:-${HOME}/.local/share}/trash/files/"
	elif [[ -d "${HOME}/.Trash" ]]; then
		ls -l "${HOME}/.Trash/"
	elif [[ -d "${HOME}/.trash" ]]; then
		ls -l "${HOME}/.trash/"
	else
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}No trash directory found${RESET}"
	fi
}

# Empty and permanently delete all the files in the trash
function trashempty() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}trashempty${RESET}: Permanently delete all files in the trash"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}trashempty${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Prompts for confirmation before deleting${RESET}"
		echo -e "  ${BRIGHT_BLUE}Auto-detects trash-cli, rem, gio, or kioclient5${RESET}"
		return 0
	fi

	# Ask for user confirmation before deleting trash
	if ask "${BRIGHT_WHITE}Are you sure you want to ${BRIGHT_MAGENTA}permanently delete${BRIGHT_WHITE} all the files in the trash? ${BRIGHT_RED}This action cannot be undone.${RESET}" "N"; then
		# Check if trash-cli exists...
		# https://github.com/andreafrancia/trash-cli
		if hascommand --strict trash-empty; then
			trash-empty
		# Check if rem exists...
		# Link: https://github.com/quackduck/rem
		elif hascommand --strict rem; then
			rem --empty
		# Check if gio trash exists (glib2)...
		# Link: https://wiki.archlinux.org/title/Trash-cli#gio_trash
		elif hascommand --strict gio; then
			gio trash --empty
		# Check if kioclient5 exists (kde-cli-tools)...
		# Link: https://wiki.archlinux.org/title/Trash-cli#kioclient5
		elif hascommand --strict kioclient5; then
			kioclient5 empty trash:/
		# Check for alternative trash directories and delete files
		elif [[ -d "${XDG_DATA_HOME:-${HOME}/.local/share}/Trash/files" ]]; then
			local _TRASH="${XDG_DATA_HOME:-${HOME}/.local/share}/Trash/files"
			rm -rf "${_TRASH}"/{..?*,.[!.]*,*} 2>/dev/null
		elif [[ -d "${XDG_DATA_HOME:-${HOME}/.local/share}/trash/files" ]]; then
			local _TRASH="${XDG_DATA_HOME:-${HOME}/.local/share}/trash/files"
			rm -rf "${_TRASH}"/{..?*,.[!.]*,*} 2>/dev/null
		elif [[ -d "${HOME}/.Trash" ]]; then
			rm -rf "${HOME}/.Trash"/{..?*,.[!.]*,*} 2>/dev/null
		elif [[ -d "${HOME}/.trash" ]]; then
			rm -rf "${HOME}/.trash"/{..?*,.[!.]*,*} 2>/dev/null
		else
			# No supported method found for emptying trash
			echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}No trash directory or supported application found${RESET}"
		fi
	else
		# Operation was cancelled by the user
		echo -e "${BRIGHT_RED}Operation cancelled.${RESET}"
	fi
}

# Restore the trash only is trash-cli is installed
# trash-cli - Command Line Interface to FreeDesktop.org Trash
# Link: https://github.com/andreafrancia/trash-cli
if hascommand --strict restore-trash; then
	alias trashrestore='restore-trash'
elif hascommand --strict trash-restore; then
	alias trashrestore='trash-restore'
fi

# Recursively remove all empty directories from a given path
# Syntax: rmempty [directory]
function rmempty() {
	# Show help if --help or -h is passed
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}rmempty${RESET}: Recursively remove all empty directories"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}rmempty${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}directory${BRIGHT_MAGENTA}]${RESET}"
		echo
		echo -e "${BRIGHT_WHITE}Options:${RESET}"
		echo -e "  ${BRIGHT_YELLOW}-h${RESET}, ${BRIGHT_YELLOW}--help${RESET}    Show this help message"
		echo
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  Finds and removes all empty directories within the specified path."
		echo -e "  If no directory is specified, uses the current working directory."
		echo -e "  You will be prompted for confirmation before any directories are removed."
		echo
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}rmempty${RESET}               ${BRIGHT_BLUE}# Current directory${RESET}"
		echo -e "  ${BRIGHT_CYAN}rmempty${RESET} ${BRIGHT_YELLOW}/path/to/dir${RESET}  ${BRIGHT_BLUE}# Specified path${RESET}"
		return 0
	fi

	# Use the provided directory or default to current directory
	local TARGET_DIR="${1:-.}"

	# Resolve to absolute path
	local ABSOLUTE_PATH
	ABSOLUTE_PATH=$(realpath "${TARGET_DIR}" 2>/dev/null)

	# Check if realpath succeeded
	if [[ -z "${ABSOLUTE_PATH}" ]]; then
		echo -e "${BRIGHT_RED}Error:${RESET} ${BRIGHT_CYAN}Could not resolve path:${RESET} ${BRIGHT_YELLOW}${TARGET_DIR}${RESET}"
		return 1
	fi

	# Check if the target directory exists
	if [[ ! -d "${ABSOLUTE_PATH}" ]]; then
		echo -e "${BRIGHT_RED}Error:${RESET} ${BRIGHT_CYAN}Directory does not exist:${RESET} ${BRIGHT_YELLOW}${ABSOLUTE_PATH}${RESET}"
		return 1
	fi

	# Check if the target directory is readable
	if [[ ! -r "${ABSOLUTE_PATH}" ]]; then
		echo -e "${BRIGHT_RED}Error:${RESET} ${BRIGHT_CYAN}Directory is not readable:${RESET} ${BRIGHT_YELLOW}${ABSOLUTE_PATH}${RESET}"
		return 1
	fi

	# Find all empty directories (depth-first order so nested empties are found)
	local EMPTY_DIRS
	EMPTY_DIRS=$(find "${ABSOLUTE_PATH}" -type d -empty 2>/dev/null)

	# Count the empty directories
	local COUNT=0
	if [[ -n "${EMPTY_DIRS}" ]]; then
		COUNT=$(echo "${EMPTY_DIRS}" | wc -l)
	fi

	# If no empty directories found, inform the user and exit
	if [[ ${COUNT} -eq 0 ]]; then
		echo -e "${BRIGHT_GREEN}No empty directories found in:${RESET} ${BRIGHT_MAGENTA}${ABSOLUTE_PATH}${RESET}"
		return 0
	fi

	# Display the empty directories that will be removed
	echo -e "${BRIGHT_WHITE}Found ${BRIGHT_YELLOW}${COUNT}${BRIGHT_WHITE} empty director$([[ ${COUNT} -eq 1 ]] && echo "y" || echo "ies") in:${RESET} ${BRIGHT_MAGENTA}${ABSOLUTE_PATH}${RESET}"
	echo -e "${BRIGHT_BLACK}────────────────────────────────────────${RESET}"

	# Show the list of directories
	while IFS= read -r DIR; do
		echo -e "  ${BRIGHT_CYAN}${DIR}${RESET}"
	done <<< "${EMPTY_DIRS}"

	echo -e "${BRIGHT_BLACK}────────────────────────────────────────${RESET}"

	# Ask for confirmation before deleting
	if ask "${BRIGHT_YELLOW}Remove all ${COUNT} empty director$([[ ${COUNT} -eq 1 ]] && echo "y" || echo "ies")?${RESET}" N; then
		# Remove empty directories (depth-first ensures nested empties are removed)
		local REMOVED=0
		local FAILED=0

		while IFS= read -r DIR; do
			if rmdir "${DIR}" 2>/dev/null; then
				echo -e "${BRIGHT_GREEN}Removed:${RESET} ${BRIGHT_CYAN}${DIR}${RESET}"
				((REMOVED++))
			else
				echo -e "${BRIGHT_RED}Failed:${RESET} ${BRIGHT_CYAN}${DIR}${RESET}"
				((FAILED++))
			fi
		done <<< "$(echo "${EMPTY_DIRS}" | sort -r)"

		# Summary
		echo -e "${BRIGHT_BLACK}────────────────────────────────────────${RESET}"
		if [[ ${FAILED} -eq 0 ]]; then
			echo -e "${BRIGHT_GREEN}Successfully removed ${REMOVED} empty director$([[ ${REMOVED} -eq 1 ]] && echo "y" || echo "ies").${RESET}"
		else
			echo -e "${BRIGHT_YELLOW}Removed ${REMOVED}, failed ${FAILED}.${RESET}"
		fi
	else
		echo -e "${BRIGHT_RED}Operation cancelled.${RESET}"
		return 0
	fi
}

# Check the sha256 checksum of a file using a checksum file parameter like sha256sum.txt
function checksha256() {
	if [[ "$#" -lt 2 ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}checksha256${RESET}: Verify a file's SHA256 checksum against a checksum file"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}checksha256${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}file${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}checksum_file${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}checksha256${RESET} ${BRIGHT_YELLOW}download.iso sha256sum.txt${RESET}"
		return 1
	fi
	if hascommand --strict sha256sum; then
		if [[ $(sha256sum "${1}" | cut -d' ' -f 1) == $(grep -Pom1 '\b[a-fA-F0-9]{64}\b' "${2}") ]]; then
			echo -e "${BRIGHT_GREEN}Good"
		else
			echo -e "${BRIGHT_RED}Bad"
		fi
	else
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}The application sha256sum is not installed${RESET}"
	fi
}

# If we are in a graphical desktop environment...
if [[ -n "${DISPLAY}" ]] || [[ -n "${WAYLAND_DISPLAY}" ]]; then
	# Search Desktop applications
	function findapps() {
		local SEARCH_TERM="$1" # The keyword to search for

		# Ensure a search term is provided
		if [[ -z "${SEARCH_TERM}" ]]; then
			echo -e "\e[1;31mPlease provide a search term.\e[0m"
			return 1
		fi

		# Search in both system-wide and user-specific application directories
		local DIRECTORIES=("/usr/share/applications" "${XDG_DATA_HOME:-${HOME}/.local/share}/applications")

		echo -e "\e[1;36mApplications matching\e[0m '\e[33m${SEARCH_TERM}\e[0m':"
		echo -e "\e[1;90m------------------------------------\e[0m"

		# Fields to search within the .desktop file
		local FIELDS="Name|GenericName|Comment|Keywords"

		# Process each directory and collect results
		while read -r LINE; do
			echo "${LINE}"
		done < <(
			for DIR in "${DIRECTORIES[@]}"; do
				if [[ -d "${DIR}" ]]; then
					grep -i -l -E "(${FIELDS})=.*${SEARCH_TERM}" "${DIR}"/*.desktop | \
					while read -r DESKTOP_FILE; do
						local APP_NAME FIELD_MATCH
						APP_NAME=$(grep -m 1 '^Name=' "${DESKTOP_FILE}" | sed 's/Name=//')
						FIELD_MATCH=$(grep -i -m 1 -E "(${FIELDS})=.*${SEARCH_TERM}" "${DESKTOP_FILE}")
						echo -e "\e[1;32m✓\e[0m \e[1;33m${APP_NAME}\e[0m  \e[1;35m${DESKTOP_FILE}\e[0m"
						# Debug only: echo -e "    \e[1;90mMatch found in: ${FIELD_MATCH}\e[0m"
					done
				fi
			done | sort
		)
	}
fi

if hascommand --strict crontab; then
	# Interactively search for cron jobs matching specified time criteria
	function findcronjob() {
		echo -e "${BRIGHT_CYAN}Cron Job Finder${RESET}"
		echo -e "${BRIGHT_WHITE}Press Enter to match any value for a field${RESET}\n"

		# Helper function to expand ranges and build regex
		build_pattern() {
			local INPUT="$1"

			# Empty, "any", or "*" means match anything
			if [[ -z "${INPUT}" || "${INPUT}" == "any" || "${INPUT}" == "*" ]]; then
				echo '\S+'
				return
			fi

			local RESULT=()
			IFS=',' read -ra PARTS <<< "${INPUT}"

			for PART in "${PARTS[@]}"; do
				# Check if it's a range (e.g., 8-10)
				if [[ "${PART}" =~ ^([0-9]+)-([0-9]+)$ ]]; then
					local START="${BASH_REMATCH[1]}"
					local END="${BASH_REMATCH[2]}"
					for ((i = START; i <= END; i++)); do
						RESULT+=("${i}")
					done
				else
					RESULT+=("${PART}")
				fi
			done

			# Join with | for regex alternation
			local IFS='|'
			echo "${RESULT[*]}"
		}

		# 1. Hour selection
		local HOUR_INPUT HOUR_PATTERN
		echo -e "${BRIGHT_YELLOW}Hour${RESET} (0-23, ranges/comma-separated, e.g., 8-10 or 9,15,20):"
		echo -ne "${BRIGHT_CYAN}>${RESET} "
		read HOUR_INPUT
		HOUR_PATTERN=$(build_pattern "${HOUR_INPUT}")

		# 2. Minute selection
		local MINUTE_INPUT MINUTE_PATTERN
		echo -e "${BRIGHT_YELLOW}Minute${RESET} (0-59, ranges/comma-separated):"
		echo -ne "${BRIGHT_CYAN}>${RESET} "
		read MINUTE_INPUT
		MINUTE_PATTERN=$(build_pattern "${MINUTE_INPUT}")

		# 3. Day of month selection
		local DAY_INPUT DAY_PATTERN
		echo -e "${BRIGHT_YELLOW}Day of month${RESET} (1-31, ranges/comma-separated):"
		echo -ne "${BRIGHT_CYAN}>${RESET} "
		read DAY_INPUT
		DAY_PATTERN=$(build_pattern "${DAY_INPUT}")

		# 4. Month selection
		local MONTH_INPUT MONTH_PATTERN
		echo -e "${BRIGHT_YELLOW}Month${RESET} (1-12, ranges/comma-separated):"
		echo -ne "${BRIGHT_CYAN}>${RESET} "
		read MONTH_INPUT
		MONTH_PATTERN=$(build_pattern "${MONTH_INPUT}")

		# 5. Day of week selection
		local WEEKDAY_INPUT WEEKDAY_PATTERN
		echo -e "${BRIGHT_YELLOW}Day of week${RESET} (0-7, where 0/7=Sunday, ranges/comma-separated):"
		echo -ne "${BRIGHT_CYAN}>${RESET} "
		read WEEKDAY_INPUT
		WEEKDAY_PATTERN=$(build_pattern "${WEEKDAY_INPUT}")

		# 6. User selection
		local SUDO_CHOICE
		echo -e "\n${BRIGHT_YELLOW}Search root crontab with sudo?${RESET} (Y/n):"
		echo -ne "${BRIGHT_CYAN}>${RESET} "
		read SUDO_CHOICE

		local CRONTAB_COMMAND
		if [[ "${SUDO_CHOICE}" =~ ^[Nn] ]]; then
			CRONTAB_COMMAND="crontab -l"
		else
			CRONTAB_COMMAND="sudo crontab -l"
			sudo true  # Cache sudo
		fi

		# Build the full regex pattern
		local PATTERN="^\s*(${MINUTE_PATTERN})\s+(${HOUR_PATTERN})\s+(${DAY_PATTERN})\s+(${MONTH_PATTERN})\s+(${WEEKDAY_PATTERN})\s+"

		# Execute search
		echo -e "\n${BRIGHT_GREEN}Matching cron jobs:${RESET}"
		${CRONTAB_COMMAND} 2>/dev/null | grep -E "${PATTERN}" --color=always || echo -e "${BRIGHT_YELLOW}No matching jobs found${RESET}"
	}
fi

# Searches for filenames (can use wildcards)
alias f="findfile"
function findfile() {
	# Initialize the sudo prefix for running commands with elevated permissions
	local SUDO_PREFIX=""

	# Check for --sudo flag and remove it from arguments if present
	if [[ "$1" == "--sudo" ]]; then
		SUDO_PREFIX="sudo "
		shift
	fi

	# Check if any filename or pattern is specified; if not, show help text
	if [[ -z "$1" ]] || [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}findfile${RESET}: Search for filenames recursively"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}findfile${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}--sudo${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}pattern${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Options:${RESET}"
		echo -e "  ${BRIGHT_GREEN}--sudo${RESET}  Run with elevated permissions"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findfile${RESET} ${BRIGHT_YELLOW}'file.txt'${RESET}"
		echo -e "  ${BRIGHT_CYAN}findfile${RESET} ${BRIGHT_GREEN}--sudo${RESET} ${BRIGHT_YELLOW}'config'${RESET}  ${BRIGHT_BLUE}# Search system dirs${RESET}"
		return 1
	fi

	# Use fdfind if installed, else use fd or find as fallback
	if hascommand --strict fdfind; then
		# fdfind command options
		# --type 'file' : Only search for files (not directories)
		# --ignore-case : Perform a case-insensitive search
		# --no-ignore   : Do not respect .gitignore and .ignore files
		# --hidden      : Include hidden files in the search results
		# --follow      : Follow symlinks (WARNING: can get into an endless loop)
		echo "${SUDO_PREFIX}fdfind --type 'file' --ignore-case --no-ignore --hidden '$1' ."
		${SUDO_PREFIX}fdfind --type 'file' --ignore-case --no-ignore --hidden "$1" .

	elif hascommand --strict fd; then
		echo "${SUDO_PREFIX}fd --type 'file' --ignore-case --no-ignore --hidden '$1' ."
		${SUDO_PREFIX}fd --type 'file' --ignore-case --no-ignore --hidden "$1" .

	else  # Use find command as a last resort
		# find command options
		# -type f : Search for files only, not directories
		# -iname  : Perform a case-insensitive search
		# -follow : Dereference symlinks (follow them to their targets)
		echo "${SUDO_PREFIX}find . -type f -iname '$1'"
		${SUDO_PREFIX}find . -type f -iname "$1"
	fi
}

# Searches for text in source code files located in the current path
# Supported languages: Ada, Assembly, AWK, Batch, C, COBOL, Config, C++,
# C#(CS), CSS, Dart, Emacs Lisp, Erlang, Elixir, Fortran(90, 95, older), Go,
# Groovy, Header(C, C++), HTML, Haxe, Include, INI, Arduino, Java, JavaScript,
# JSON, Kotlin, Library, Lua, M4, Objective-C, MATLAB, Makefiles, Nim, Nix,
# Pascal, PHP, Perl, Python, R, Ruby, Racket, Rust, Scala, SASS/SCSS, Shell,
# Standard ML, SQL, Swift, TCL, Templates, LaTeX, TypeScript, VB, VBA, VBS,
# VHDL, Wren, XML, YAML, Zig
function findcode() {
	# Local constant for maximum line length cut-off
	# NOTE: This is necessary for certain files like minified javascript
	local -r LINE_LENGTH_CUTOFF=1000

	# The prefix to prepend to search commands for elevated permissions
	local SUDO_PREFIX=""

	# Check for --sudo flag and remove it from arguments if present
	if [[ "$1" == "--sudo" ]]; then
		SUDO_PREFIX="sudo "
		shift
	fi

	# If no parameter is specified, show help text
	if [[ -z "$1" ]] || [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}findcode${RESET}: Search for text in source code files recursively"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}findcode${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}--sudo${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}pattern${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Options:${RESET}"
		echo -e "  ${BRIGHT_GREEN}--sudo${RESET}  Run with elevated permissions"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findcode${RESET} ${BRIGHT_YELLOW}'function_name'${RESET}"
		echo -e "  ${BRIGHT_CYAN}findcode${RESET} ${BRIGHT_YELLOW}'console\\.log\\('${RESET}  ${BRIGHT_BLUE}# Regex search${RESET}"
		echo -e "  ${BRIGHT_CYAN}findcode${RESET} ${BRIGHT_GREEN}--sudo${RESET} ${BRIGHT_YELLOW}'todo'${RESET}     ${BRIGHT_BLUE}# Search system dirs${RESET}"
		return 1
	fi

	# If ripgrep is installed, use that
	# Link: https://github.com/BurntSushi/ripgrep
	if hascommand --strict rg; then
		echo -e "${BRIGHT_CYAN}Search using ${BRIGHT_YELLOW}ripgrep${BRIGHT_CYAN}:${RESET}"
		echo "${SUDO_PREFIX}rg --smart-case --no-ignore --hidden --pretty '$@' -g '!*.min.*' ."
		${SUDO_PREFIX}rg --smart-case --no-ignore --hidden --pretty "${@}" -g '!*.min.*' \
			-g '*.{ada,asm,awk,bat,c,cbl,cfg,conf,config,cpp,cpy,cs,css,dart,el,erl,ex,f,f90,f95,for,go,gradle,groovy,h,hpp,hrl,htm,html,hx,hxsl,inc,ini,ino,java,js,json,jsx,kt,lib,lua,m,m4,mat,mk,nim,nix,pascal,php,pl,plx,ps1,py,r,rb,rkt,rlib,rs,sc,scala,scss,sh,sml,sql,swift,tcl,template,tex,tpl,ts,tsx,vb,vba,vbs,vhd,vhdl,wren,xml,yaml,yml,zig}' | \
			awk -v len=$LINE_LENGTH_CUTOFF '{ $0=substr($0, 1, len); print $0 }'

	# If The Silver Searcher is installed, use that
	# Link: https://github.com/ggreer/the_silver_searcher
	# Hint: You can use --ignore "dir/or/file"
	elif hascommand --strict ag; then
		echo -e "${BRIGHT_CYAN}Search using ${BRIGHT_YELLOW}The Silver Searcher${BRIGHT_CYAN}:${RESET}"
		echo "${SUDO_PREFIX}ag --color --smart-case --hidden --literal --ignore '*.min.*' '$@'"
		${SUDO_PREFIX}ag --color             \
			--smart-case       \
			--hidden           \
			--literal          \
			--ignore "*.min.*" \
			--file-search-regex ".*\.(ada|asm|awk|bat|c|cbl|cfg|conf|config|cpp|cpy|cs|css|dart|el|erl|ex|f|f90|f95|for|go|gradle|groovy|h|hpp|hrl|htm|html|hx|hxsl|inc|ini|ino|java|js|json|jsx|kt|lib|lua|m|m4|mat|mk|nim|nix|pascal|php|pl|plx|ps1|py|r|rb|rkt|rlib|rs|sc|scala|scss|sh|sml|sql|swift|tcl|template|tex|tpl|ts|tsx|vb|vba|vbs|vhd|vhdl|wren|xml|yaml|yml|zig)" \
			"${@}"             \
			2> /dev/null       \
			| awk -v len=$LINE_LENGTH_CUTOFF '{ $0=substr($0, 1, len); print $0 }'

	# Use grep (see findtext function for options explanation)
	# Hint: You can use --exclude='/dir/or/file'
	else
		echo -e "${BRIGHT_CYAN}Search using ${BRIGHT_YELLOW}grep${BRIGHT_CYAN}:${RESET}"
		echo "${SUDO_PREFIX}grep --color=always --recursive --ignore-case --binary-files=without-match --with-filename --line-number '$@'"
		${SUDO_PREFIX}grep --color=always --recursive --ignore-case --binary-files=without-match --with-filename --line-number \
			--include=*.ada \
			--include=*.asm \
			--include=*.awk \
			--include=*.bat \
			--include=*.c \
			--include=*.cbl \
			--include=*.cfg \
			--include=*.conf \
			--include=*.config \
			--include=*.cpp \
			--include=*.cpy \
			--include=*.cs \
			--include=*.css \
			--include=*.dart \
			--include=*.el \
			--include=*.erl \
			--include=*.ex \
			--include=*.f90 \
			--include=*.f95 \
			--include=*.f \
			--include=*.for \
			--include=*.go \
			--include=*.gradle \
			--include=*.groovy \
			--include=*.h \
			--include=*.hpp \
			--include=*.hrl \
			--include=*.htm \
			--include=*.html \
			--include=*.hx \
			--include=*.hxsl \
			--include=*.inc \
			--include=*.ini \
			--include=*.ino \
			--include=*.java \
			--include=*.js \
			--include=*.json \
			--include=*.jsx \
			--include=*.kt \
			--include=*.lib \
			--include=*.lua \
			--include=*.m \
			--include=*.m4 \
			--include=*.mat \
			--include=*.mk \
			--include=*.nim \
			--include=*.nix \
			--include=*.pascal \
			--include=*.php \
			--include=*.pl \
			--include=*.plx \
			--include=*.ps1 \
			--include=*.py \
			--include=*.r \
			--include=*.rb \
			--include=*.rkt \
			--include=*.rlib \
			--include=*.rs \
			--include=*.sc \
			--include=*.scala \
			--include=*.scss \
			--include=*.sh \
			--include=*.sml \
			--include=*.sql \
			--include=*.swift \
			--include=*.tcl \
			--include=*.template \
			--include=*.tpl \
			--include=*.tex \
			--include=*.ts \
			--include=*.tsx \
			--include=*.vb \
			--include=*.vba \
			--include=*.vbs \
			--include=*.vhd \
			--include=*.vhdl \
			--include=*.wren \
			--include=*.xml \
			--include=*.yaml \
			--include=*.yml \
			--include=*.zig \
			--exclude='*.min.*' \
			"${@}" \
			| awk -v len=$LINE_LENGTH_CUTOFF '{ $0=substr($0, 1, len); print $0 }'
	fi
}

# Searches for text in all files in the current folder
function findtext() {
	# Local constant for maximum line length cut-off
	# NOTE: This is necessary for certain files like binaries
	local -r LINE_LENGTH_CUTOFF=1000

	# The prefix to prepend to search commands for elevated permissions
	local SUDO_PREFIX=""

	# Check for --sudo flag and remove it from arguments if present
	if [[ "$1" == "--sudo" ]]; then
		SUDO_PREFIX="sudo "
		shift
	fi

	# If no search text is specified, show help text
	if [[ -z "$1" ]] || [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}findtext${RESET}: Search for text in all files recursively"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}findtext${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}--sudo${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}pattern${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Options:${RESET}"
		echo -e "  ${BRIGHT_GREEN}--sudo${RESET}  Run with elevated permissions"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findtext${RESET} ${BRIGHT_YELLOW}'example text'${RESET}"
		echo -e "  ${BRIGHT_CYAN}findtext${RESET} ${BRIGHT_YELLOW}'Hello\\s+world\\.'${RESET}  ${BRIGHT_BLUE}# Regex search${RESET}"
		echo -e "  ${BRIGHT_CYAN}findtext${RESET} ${BRIGHT_GREEN}--sudo${RESET} ${BRIGHT_YELLOW}'todo'${RESET}      ${BRIGHT_BLUE}# Search system dirs${RESET}"
		return 1
	fi

	# If ripgrep is installed, use that
	# Link: https://github.com/BurntSushi/ripgrep
	if hascommand --strict rg; then
		echo -e "${BRIGHT_CYAN}Search using ${BRIGHT_YELLOW}ripgrep${BRIGHT_CYAN}:${RESET}"
		echo "${SUDO_PREFIX}rg --smart-case --no-ignore --hidden --pretty '$@' ."
		${SUDO_PREFIX}rg --smart-case --no-ignore --hidden --pretty "$@" .  | \
			awk -v len=$LINE_LENGTH_CUTOFF '{ $0=substr($0, 1, len); print $0 }'

	# If The Silver Searcher is installed, use that
	# Link: https://github.com/ggreer/the_silver_searcher
	# Hint: You can use --ignore "dir/or/file"
	elif hascommand --strict ag; then
		echo -e "${BRIGHT_CYAN}Search using ${BRIGHT_YELLOW}The Silver Searcher${BRIGHT_CYAN}:${RESET}"
		echo "${SUDO_PREFIX}ag --color --smart-case --hidden --literal '$@'"
		${SUDO_PREFIX}ag --color --smart-case --hidden --literal "$@" 2> /dev/null | \
			awk -v len=$LINE_LENGTH_CUTOFF '{ $0=substr($0, 1, len); print $0 }'

	else # Use grep
		# Link: https://www.howtogeek.com/496056/how-to-use-the-grep-command-on-linux/
		# Hint: You can use --exclude='/dir/or/file'
		# --ignore-case (-i)        : Makes the search case-insensitive
		# --binary-files=without-match (-I) : Ignores binary files
		# --with-filename (-H)      : Displays the filename along with the matching line
		# --recursive (-r)          : Searches through all subdirectories recursively
		# --line-number (-n)        : Adds the line number to the output
		# Optional:
		# --fixed-strings (-F)      : Treats the search term as a fixed string (not a regular expression)
		# --files-with-matches (-l) : Only outputs the filenames that contain a match (e.g., grep -irl "$@" *)
		echo -e "${BRIGHT_CYAN}Search using ${BRIGHT_YELLOW}grep${BRIGHT_CYAN}:${RESET}"
		echo "${SUDO_PREFIX}grep --color=always --recursive --ignore-case --binary-files=without-match --with-filename --line-number '$@'"
		${SUDO_PREFIX}grep \
			--color=always \
			--recursive \
			--ignore-case \
			--binary-files=without-match \
			--with-filename \
			--line-number \
			"${@}" \
		| awk -v len=${LINE_LENGTH_CUTOFF} '{ $0=substr($0, 1, len); print $0 }'
	fi
}

# Performs case-insensitive text replacement in a file or directory recursively
function replacetext() {
	# Check for --sudo flag and remove it from arguments if present
	local SUDO_PREFIX=""
	if [[ "$1" == "--sudo" ]]; then
		SUDO_PREFIX="sudo "
		shift
	fi

	# Handle the optional [file_path] parameter
	local FILE_PATH="$(command pwd)"
	if [[ $# -eq 3 ]]; then
		FILE_PATH=$3
	fi

	# If not enough arguments, show help
	if [[ $# -lt 2 ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}replacetext${RESET}: Perform case-insensitive text replacement in files recursively"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}replacetext${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}--sudo${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}find${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}replace${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}path${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Options:${RESET}"
		echo -e "  ${BRIGHT_GREEN}--sudo${RESET}  Run with elevated permissions"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}replacetext${RESET} ${BRIGHT_YELLOW}'foo' 'bar'${RESET}                ${BRIGHT_BLUE}# Replace in current dir${RESET}"
		echo -e "  ${BRIGHT_CYAN}replacetext${RESET} ${BRIGHT_YELLOW}'foo' 'bar' '/path'${RESET}        ${BRIGHT_BLUE}# Replace in specific path${RESET}"
		echo -e "  ${BRIGHT_CYAN}replacetext${RESET} ${BRIGHT_GREEN}--sudo${RESET} ${BRIGHT_YELLOW}'foo' 'bar' '/etc'${RESET}  ${BRIGHT_BLUE}# With sudo${RESET}"
		return 1
	fi

	# Escape special regex characters and the delimiter for the search pattern
	# SC2155: split declaration so sed failure isn't masked by local's exit code
	local FIND_TEXT
	FIND_TEXT=$(printf '%s' "${1}" | sed 's/[][\\.() *^$+?{|}/-]/\\&/g')
	# Escape only characters special in sed replacement text: & \ and the delimiter
	local REPLACE_TEXT
	REPLACE_TEXT=$(printf '%s' "${2}" | sed 's/[&\\/]/\\&/g')

	# Show safety check and ask for confirmation only for directory operations
	if [[ -d "${FILE_PATH}" ]]; then
		echo -e "${BRIGHT_GREEN}   Find: ${BRIGHT_CYAN}${1}${RESET}"
		echo -e "${BRIGHT_GREEN}Replace: ${BRIGHT_CYAN}${2}${RESET}"
		echo -e "${BRIGHT_RED}Warning:${BRIGHT_YELLOW} You are about to recursively operate on the directory ${BRIGHT_CYAN}${FILE_PATH}${RESET}"
		if ! ask "${BRIGHT_MAGENTA}Are you sure?" "N"; then
			echo -e "${BRIGHT_RED}Aborted${RESET}"
			return 1
		fi
	else
		echo -e "${BRIGHT_RED}ERROR: Path not found ${FILE_PATH}${RESET}"
		return 1
	fi

	# Execute the find-and-replace operation
	echo -e "${BRIGHT_GREEN}Replace: ${BRIGHT_CYAN}find \"${FILE_PATH}\" -type f -exec ${SUDO_PREFIX}sed -i \"s/${FIND_TEXT}/${REPLACE_TEXT}/gi\" {} +${RESET}"
	find "${FILE_PATH}" -type f -exec ${SUDO_PREFIX}sed -i "s/${FIND_TEXT}/${REPLACE_TEXT}/gi" {} +
}

# Enhanced lines function with uppercase variables and improved error messaging
function lines() {
	# Check for minimum required arguments
	if [[ $# -lt 2 ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}lines${RESET}: Display specific lines or line ranges from a file"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}lines${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}file${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}line_number${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}more_lines...${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}lines${RESET} ${BRIGHT_YELLOW}file.txt 123${RESET}          ${BRIGHT_BLUE}# Single line${RESET}"
		echo -e "  ${BRIGHT_CYAN}lines${RESET} ${BRIGHT_YELLOW}file.txt 123 456 78${RESET}   ${BRIGHT_BLUE}# Multiple lines${RESET}"
		echo -e "  ${BRIGHT_CYAN}lines${RESET} ${BRIGHT_YELLOW}file.txt 50-100${RESET}       ${BRIGHT_BLUE}# Line range${RESET}"
		echo -e "  ${BRIGHT_CYAN}lines${RESET} ${BRIGHT_YELLOW}file.txt 10 20 30-40${RESET}  ${BRIGHT_BLUE}# Mixed${RESET}"
		return 1
	fi

	# Assign first argument to FILENAME and shift arguments
	local FILENAME="$1"
	shift

	# Check if the specified file exists
	if [ ! -f "$FILENAME" ]; then
		echo -e "${BRIGHT_RED}Error:${RESET} File not found: ${BRIGHT_CYAN}$FILENAME${RESET}"
		return 1
	fi

	# Process each argument
	while [ $# -gt 0 ]; do
		local ARG="$1"

		# Handle line range
		if [[ "$ARG" == *-* ]]; then
			# Extract start and end lines from the range
			local START_LINE=$(echo "$ARG" | cut -d'-' -f1)
			local END_LINE=$(echo "$ARG" | cut -d'-' -f2)

			# Display lines within the specified range using 'sed'
			sed -n "${START_LINE},${END_LINE}p" "$FILENAME"

		else # Handle individual line number
			# Display the specified line using 'sed'
			sed -n "${ARG}p" "$FILENAME"
		fi

		# Shift to the next argument
		shift
	done
}

# Analyzes a given code file to provide metrics and statistics
function analyzecode() {
	# Validate input
	if [[ $# -eq 0 ]]; then
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}analyzecode${RESET} ${BRIGHT_GREEN}[filename]${RESET}"
		return 1
	fi

	# Check if the file exists and is readable
	local FILE="$1"
	if [[ ! -f ${FILE} ]] || [[ ! -r ${FILE} ]]; then
		echo "Error: File '${FILE}' does not exist or is not readable."
		return 1
	fi

	# Initialize counters and variables
	local TOTAL_LINES=$(wc -l < "${FILE}")
	local NON_COMMENT_LINES=0
	local COMMENT_LINES=0
	local BLANK_LINES=0
	local LONGEST_LINE=0
	local SHORTEST_LINE=999999
	local FILE_SIZE
	if [[ "$(uname)" == "Darwin" ]]; then
		FILE_SIZE=$(stat -f%z "${FILE}")
	else
		FILE_SIZE=$(stat -c%s "${FILE}")
	fi
	local TOTAL_CHARS=0

	# Process each line
	while IFS= read -r LINE; do
		local LINE_LENGTH=${#LINE}
		[[ $LINE_LENGTH -gt $LONGEST_LINE ]] && LONGEST_LINE=$LINE_LENGTH

		# Exclude blank lines for shortest line and character count
		if [[ "$LINE" =~ [^[:space:]] ]]; then
			[[ $LINE_LENGTH -lt $SHORTEST_LINE ]] && SHORTEST_LINE=$LINE_LENGTH
			((TOTAL_CHARS+=LINE_LENGTH))
		fi

		# Count blank lines
		if [[ "$LINE" =~ ^[[:space:]]*$ ]]; then
			((BLANK_LINES++))
		elif [[ "$LINE" =~ ^[[:space:]]*([#]|\/\/) || "$LINE" =~ \/\* || "$LINE" =~ \*\/ ]]; then
			((COMMENT_LINES++))
		else
			((NON_COMMENT_LINES++))
		fi
	done < "$FILE"

	# Handle edge case: if no non-blank lines were found, reset SHORTEST_LINE
	[[ ${SHORTEST_LINE} -eq 999999 ]] && SHORTEST_LINE=0

	# Calculate percentages based on non-blank lines
	local NON_BLANK_TOTAL_LINES=$((TOTAL_LINES - BLANK_LINES))
	local AVG_LINE_LENGTH=$((NON_BLANK_TOTAL_LINES ? TOTAL_CHARS / NON_BLANK_TOTAL_LINES : 0))
	local NON_COMMENT_LINE_PERCENT=$((TOTAL_LINES ? NON_COMMENT_LINES * 100 / TOTAL_LINES : 0))
	local COMMENT_LINE_PERCENT=$((TOTAL_LINES ? COMMENT_LINES * 100 / TOTAL_LINES : 0))
	local BLANK_LINE_PERCENT=$((TOTAL_LINES ? BLANK_LINES * 100 / TOTAL_LINES : 0))

	# Calculate indentation using awk
	local METRICS=$(awk '
		BEGIN {
			indentTabs = 0;
			indentSpaces = 0;
		}
		{
			if (match($0, /^[ \t]+/)) {
				indent = substr($0, RSTART, RLENGTH);
				indentTabs += gsub(/\t/, "", indent);
				indentSpaces += gsub(/ /, "", indent);
			}
		}
		END {
			print indentTabs, indentSpaces;
		}' "${FILE}")

	local INDENT_TABS=$(echo ${METRICS} | cut -d' ' -f1)
	local INDENT_SPACES=$(echo ${METRICS} | cut -d' ' -f2)

	local INDENT_TYPE="Unknown"
	[[ ${INDENT_TABS} -gt ${INDENT_SPACES} ]] && INDENT_TYPE="Tabs"
	[[ ${INDENT_SPACES} -gt ${INDENT_TABS} ]] && INDENT_TYPE="Spaces"

	# Display results
	echo "File Size: ${FILE_SIZE} bytes"
	echo "Total Lines: ${TOTAL_LINES}"
	echo "Longest Line: ${LONGEST_LINE} characters"
	echo "Shortest Line: ${SHORTEST_LINE} characters"
	echo "Average Line Length: ${AVG_LINE_LENGTH} characters"
	echo "Indentation: ${INDENT_TYPE}"
	echo "Non-Comment Lines: ${NON_COMMENT_LINES} (${NON_COMMENT_LINE_PERCENT}%)"
	echo "Comment Lines: ${COMMENT_LINES} (${COMMENT_LINE_PERCENT}%)"
	echo "Blank Lines: ${BLANK_LINES} (${BLANK_LINE_PERCENT}%)"
}

# List and sort all function names from code files (with line numbers)
function showfunctions() {
	# Check if a filename is provided
	if [[ -z "${1}" ]]; then
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}showfunctions${RESET} ${BRIGHT_GREEN}[filename]${RESET}"
		return 1
	fi

	# Perform a grep to find function names and include line numbers
	# Use awk for formatting, filtering comments, and cleaning up
	# Further filter with awk to exclude names that start with '_'
	# Remove leading spaces and sort by function name and then by line number, while also removing duplicates
	grep -n -E '(function[[:space:]]+\w+)|(def[[:space:]]+\w+)|(public[[:space:]]+static[[:space:]]+void[[:space:]]+\w+)|(public[[:space:]]+function[[:space:]]+\w+)' "${1}" | \
	awk -F: '$2 !~ /^[[:space:]]*(#|\/\/)/ { gsub(/^[[:space:]]+/, "", $2); print $1 ":\t" $2 }' | \
	sed -E 's/(function|def|public static void|public function)[[:space:]]+//' | \
	awk -F ':\t' '$2 !~ /^_/ {print $1 ":\t" $2}' | \
	sort -k2,2 -k1,1n | \
	uniq -f 1
}

# Swap indentations between tabs and spaces
function swapindent() {
	# This is the default number of spaces that a tab will be converted to
	local DEFAULT_TAB_SPACING=4

	# If no arguments are provided and no text piped in, or help requested, display help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]] || { [[ $# -eq 0 ]] && [[ -t 0 ]]; }; then
		echo -e "${BRIGHT_CYAN}swapindent${RESET}: Swap indentation between tabs and spaces"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}swapindent${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}file${BRIGHT_MAGENTA}]${RESET}"
		echo -e "       command | ${BRIGHT_CYAN}swapindent${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}- If a file is provided, it modifies the file in-place${RESET}"
		echo -e "  ${BRIGHT_BLUE}- If no file is provided, reads from stdin, writes to stdout${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}swapindent${RESET} ${BRIGHT_YELLOW}script.sh${RESET}               ${BRIGHT_BLUE}# Modify file in-place${RESET}"
		echo -e "  ${BRIGHT_YELLOW}cat script.sh${RESET} | ${BRIGHT_CYAN}swapindent${RESET}         ${BRIGHT_BLUE}# Output to stdout${RESET}"
		echo -e "  ${BRIGHT_YELLOW}cat script.sh${RESET} | ${BRIGHT_CYAN}swapindent${RESET} | ${BRIGHT_YELLOW}less${RESET}  ${BRIGHT_BLUE}# Preview changes${RESET}"
		return 0
	fi

	# Declare an array to hold the lines from the input
	local LINES=()

	# Declare an array to hold the modified lines
	local MODIFIED_LINES=()

	# Variables to hold state for the type of first indent (tab or space)
	# and the smallest count of leading spaces in lines
	local FIRST_INDENT_TYPE=""
	local SMALLEST_SPACE_COUNT=1000  # Initialize to a high value to find the minimum easily

	# Read lines from either a file or standard input into the 'LINES' array
	while IFS= read -r LINE; do
		LINES+=("${LINE}")  # Append line to LINES array

		# Check if the line starts with any kind of whitespace
		if [[ "${LINE}" =~ ^[[:space:]] ]]; then
			# If the first type of indentation has not yet been determined
			if [[ -z "${FIRST_INDENT_TYPE}" ]]; then
				# Determine if the first indent in the file is a tab or space
				if [[ "${LINE}" =~ ^$'\t' ]]; then
					FIRST_INDENT_TYPE="tab"
				elif [[ "${LINE}" =~ ^' ' ]]; then
					FIRST_INDENT_TYPE="space"
				fi
			fi

			# If the first indent is a space, count the leading spaces
			if [[ "${FIRST_INDENT_TYPE}" == "space" ]]; then
				local SPACE_COUNT=$(echo "${LINE}" | sed -E 's/[^ ].*//g' | wc -c)
				(( SPACE_COUNT-- ))  # Account for the newline character from wc

				# Update the SMALLEST_SPACE_COUNT if this line has fewer leading spaces
				[[ ${SPACE_COUNT} -lt ${SMALLEST_SPACE_COUNT} ]] && SMALLEST_SPACE_COUNT=${SPACE_COUNT}
			fi
		fi
	done < <(cat "${1:-/dev/stdin}" && echo)  # Append newline so read captures the last line

	# Loop through 'LINES' array to swap and output the indentations
	local MODIFIED_LINE
	for LINE in "${LINES[@]}"; do
		# If the first indent is a tab, convert tabs to spaces
		if [[ "${FIRST_INDENT_TYPE}" == "tab" ]]; then
			MODIFIED_LINE=$(echo "${LINE}" | sed "s/\t/$(printf "%${DEFAULT_TAB_SPACING}s")/g")
		else
			# If the first indent is a space, convert spaces to tabs
			# Create a string of 'SMALLEST_SPACE_COUNT' number of spaces
			local TAB_TO_SPACE_STRING=$(printf "%${SMALLEST_SPACE_COUNT}s")
			MODIFIED_LINE=$(echo "${LINE}" | sed "s/${TAB_TO_SPACE_STRING}/\t/g")
		fi

		# Append the modified line to MODIFIED_LINES array
		MODIFIED_LINES+=("${MODIFIED_LINE}")
	done

	# If a filename is provided, write the modified lines back into the file
	if [[ -n "$1" ]]; then
		printf "%s\n" "${MODIFIED_LINES[@]}" > "$1"
	else
		# If no filename, print the modified lines to stdout
		printf "%s\n" "${MODIFIED_LINES[@]}"
	fi
}

# Copy a file or directory with a progress bar
function cpp() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}cpp${RESET}: Copy files with progress bar (uses rsync)"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}cpp${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}source${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}destination${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}cpp${RESET} ${BRIGHT_YELLOW}largefile.iso${RESET} ${BRIGHT_YELLOW}/mnt/usb/${RESET}"
		echo -e "  ${BRIGHT_CYAN}cpp${RESET} ${BRIGHT_YELLOW}~/Downloads/video.mp4${RESET} ${BRIGHT_YELLOW}/backup/${RESET}"
		return 0
	fi

	# Check the parameters
	if [[ -z "${1}" ]]; then
		echo "Source is not specified."
		return 1
	fi
	if [[ -z "${2}" ]]; then
		echo "Destination path is not specified."
		return 1
	fi
	if [[ ! -d "${2}" ]]; then
		echo "Destination is not a directory."
		return 1
	fi

	# Check if rsync is available
	if hascommand --strict rsync; then
		# Use rsync with archive mode and overall progress bar
		rsync -ah --info=progress2 "${1}" "${2}"
	else
		# If rsync is not available, use strace with cp to show progress
		strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
		| awk '{
		count += $NF
		if (count % 10 == 0) {
			percent = int(count / total_size * 100)
			printf "%3d%% [", percent
			for (i = 0; i <= percent; i++)
				printf "="
				printf ">"
				for (i = percent; i < 100; i++)
					printf " "
					printf "]\r"
				}
			}
		END { print "" }' total_size=$([[ "$(uname)" == "Darwin" ]] && stat -f%z "${1}" || stat -c '%s' "${1}") count=0
	fi
}

# Copy a file and optionally go to the directory
function cpg() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}cpg${RESET}: Copy file and cd to destination directory"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}cpg${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}source${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}destination${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}cpg${RESET} ${BRIGHT_YELLOW}file.txt${RESET} ${BRIGHT_YELLOW}/tmp/${RESET}       ${BRIGHT_BLUE}# Copy and cd to /tmp${RESET}"
		echo -e "  ${BRIGHT_CYAN}cpg${RESET} ${BRIGHT_YELLOW}script.sh${RESET} ${BRIGHT_YELLOW}backup.sh${RESET}  ${BRIGHT_BLUE}# Copy with new name${RESET}"
		return 0
	fi

	# Check the parameters
	if [[ -z "${1}" ]]; then
		echo "Source is not specified."
		return 1
	fi
	if [[ -z "${2}" ]]; then
		echo "Destination is not specified."
		return 1
	fi
	if [[ -d "${2}" ]]; then
		# Destination is a directory, copy the file and go to the directory
		cp "${1}" "${2}" && cd "${2}"
	else
		# Destination is not a directory, just copy the file
		cp "${1}" "${2}"
	fi
}

# Move a file or directory and optionally go to the directory
function mvg() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}mvg${RESET}: Move file and cd to destination directory"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}mvg${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}source${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}destination${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}mvg${RESET} ${BRIGHT_YELLOW}file.txt${RESET} ${BRIGHT_YELLOW}/tmp/${RESET}   ${BRIGHT_BLUE}# Move and cd to /tmp${RESET}"
		echo -e "  ${BRIGHT_CYAN}mvg${RESET} ${BRIGHT_YELLOW}old.txt${RESET} ${BRIGHT_YELLOW}new.txt${RESET}  ${BRIGHT_BLUE}# Rename file${RESET}"
		return 0
	fi

	# Check the parameters
	if [[ -z "${1}" ]]; then
		echo "Source is not specified."
		return 1
	fi
	if [[ -z "${2}" ]]; then
		echo "Destination path is not specified."
		return 1
	fi

	if [[ -d "${2}" ]]; then
		# Destination is a directory, move the file and go to the directory
		mv "${1}" "${2}" && cd "${2}"
	else
		# Destination is not a directory, just move the file
		mv "${1}" "${2}"
	fi
}

# Create and go to the directory
alias md='mkdirg'
function mkdirg() {
	# Check if any arguments are provided
	if [[ $# -eq 0 ]]; then
		# Display usage message and return error code 1
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}mkdirg${RESET} ${BRIGHT_GREEN}[directory]${RESET}"
		return 1
	fi

	# Verify if the directory already exists
	if [ -d "$1" ]; then
		# Directory exists, change into it
		cd "$1"
	else
		# Directory doesn't exist, create it and change into it
		command mkdir -p "$1"
		cd "$1"
	fi
}

# Repeats a given command a specified number of times
function repeat() {
	# Check that at least two arguments are provided (number and command)
	if [[ $# -lt 2 ]]; then
		# Display usage message and return error code 1
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}repeat${RESET} ${BRIGHT_GREEN}[count] [command]${RESET}"
		return 1
	fi

	# Check that the first argument is a non-negative integer
	if ! [[ $1 =~ ^[0-9]+$ ]]; then
		# Display error message for invalid count
		echo "Error: The count must be a non-negative integer."
		return 1
	fi

	# Assign the provided count to maxCount and shift to remove it from arguments
	local count maxCount
	maxCount=$1; shift
	for ((count = 1; count <= maxCount; count++)); do
		# Execute the provided command using eval
		eval "$@"
	done
}

# Goes up a specified number of directories (i.e. up 4)
# If no argument is provided, it goes up by one directory
function up() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}up${RESET}: Navigate up multiple directory levels"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}up${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}levels${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}up${RESET}    ${BRIGHT_BLUE}# Same as cd ..${RESET}"
		echo -e "  ${BRIGHT_CYAN}up${RESET} ${BRIGHT_GREEN}2${RESET}  ${BRIGHT_BLUE}# Same as cd ../..${RESET}"
		echo -e "  ${BRIGHT_CYAN}up${RESET} ${BRIGHT_GREEN}5${RESET}  ${BRIGHT_BLUE}# Go up 5 directories${RESET}"
		return 0
	fi

	# Declare a variable to build the directory path
	local DIRECTORY_PATH=""

	# Set the number of levels to go up - default to 1 if not provided
	local LEVELS_TO_GO_UP=${1:-1}

	# Loop from 1 to the number of levels to go up
	for ((i = 1; i <= LEVELS_TO_GO_UP; i++)); do
		# Append "../" to the directory path for each iteration
		DIRECTORY_PATH="../${DIRECTORY_PATH}"
	done

	# Change to the built directory path
	cd "${DIRECTORY_PATH}"
}

# Returns the last 2 fields of the working directory
function pwdtail() {
	pwd | awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# Encryption has been changed to gpg from SSL due to security
# Link: https://stackoverflow.com/questions/28247821/openssl-vs-gpg-for-encrypting-off-site-backups
# Install: pkginstall gnupg # gpg2 on SUSE
if hascommand --strict gpg; then
	# Set an alias to clear the GPG cache
	alias gpgclear='echo RELOADAGENT | gpg-connect-agent'

	## Uses OpenSSL AES 256bit Cipher Block Chaining Encryption to encrypt a file
	function encrypt() {
		if [[ -p /dev/stdin ]]; then
			# If there is data being piped from stdin
			if [[ "${#}" -lt 1 ]]; then
				echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Output file not specified${RESET}"
				return 1
			fi

			echo "Encrypting data..."
			# equivalents in the gpg.conf file
			# s2k-mode 3
			# s2k-count 65011712
			# s2k-digest-algo SHA512
			# s2k-cipher-algo AES256
			gpg --s2k-mode 3 --s2k-count 65011712 --s2k-digest-algo SHA512 --s2k-cipher-algo AES256 --symmetric --output "${1}"

			if [[ $? -eq 0 ]]; then
				echo -e "${BRIGHT_GREEN}Data successfully encrypted to ${1}${RESET}"
			else
				echo -e "${BRIGHT_RED}Encryption failed${RESET}"
				return 1
			fi
		else
			# If no data from stdin, expect a file as argument
			if [[ "${#}" -lt 1 ]] || [[ "${1}" = "--help" ]] || [[ "${1}" = "-h" ]]; then
				echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}encrypt${RESET} ${BRIGHT_GREEN}[input_file]${RESET} ${BRIGHT_MAGENTA}(the output file will be named [input_file].gpg)${RESET}"
				echo -e "${BRIGHT_WHITE}   or: ${BRIGHT_YELLOW}command${RESET} | ${BRIGHT_CYAN}encrypt${RESET} ${BRIGHT_GREEN}[output_file]${RESET} ${BRIGHT_MAGENTA}(encrypt data piped from another command)${RESET}"
				return
			elif [[ ! -r "${1}" ]]; then
				echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}File ${BRIGHT_YELLOW}${1}${BRIGHT_CYAN} not found${RESET}"
				return 1
			fi

			echo "Encrypting ${1}..."
			if gpg --s2k-mode 3 --s2k-count 65011712 --s2k-digest-algo SHA512 --s2k-cipher-algo AES256 --symmetric "${1}"; then
				local _encrypted_file="${1}.gpg"
				echo -e "${BRIGHT_GREEN}File ${_encrypted_file} successfully encrypted${RESET}"
			else
				echo -e "${BRIGHT_RED}Encryption failed${RESET}"
				return 1
			fi
		fi
	}

	## Uses OpenSSL AES 256bit Cipher Block Chaining Encryption to decrypt a file
	function decrypt() {
		if [[ "${#}" -lt 1 ]] || [[ "${1}" = "--help" ]] || [[ "${1}" = "-h" ]]; then
			echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}decrypt${RESET} ${BRIGHT_GREEN}[encrypted_file.gpg]${RESET}"
			return
		elif [[ ! -r "${1}" ]]; then
			echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}File ${BRIGHT_YELLOW}${1}${BRIGHT_CYAN} not found${RESET}"
			return 1
		fi

		echo "Decrypting ${1}..."

		local _DECRYPTED_FILE="${1%.gpg}"  # Remove '.gpg' extension from the input file name

		if gpg --output "${_DECRYPTED_FILE}" --decrypt "${1}"; then
			echo -e "${BRIGHT_GREEN}File successfully decrypted to ${_DECRYPTED_FILE}${RESET}"
		else
			echo -e "${BRIGHT_RED}Error decrypting ${BRIGHT_YELLOW}${1}${RESET}"
			return 1
		fi
	}
fi

# Print a list of colors
function colors() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}colors${RESET}: Display basic 8-color terminal palette"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}colors${RESET}"
		echo -e "${BRIGHT_WHITE}See also:${RESET} ${BRIGHT_GREEN}colors256${RESET}, ${BRIGHT_GREEN}colors24bit${RESET}"
		return 0
	fi

	# Define variables for foreground, background, values, and sequence
	local foreground background values sequence

	# Print introductory information about color escapes and styles
	printf "Color escapes are %s\n" '\033[${value};...;${value}m'
	printf "Values 30..37 are \033[33mforeground colors\033[m\n"
	printf "Values 40..47 are \033[43mbackground colors\033[m\n"
	printf "Value 1 gives a  \033[1mbold-faced look\033[m\n\n"

	# Iterate through foreground colors (values 30 to 37)
	for foreground in {30..37}; do
		# Iterate through background colors (values 40 to 47)
		for background in {40..47}; do
			# Extract color names from numerical values
			# Use separate variables to avoid clobbering the loop iterators
			local FG_VAL=${foreground#37} # white
			local BG_VAL=${background#40} # black

			# Construct values string for color escape sequences
			values="${FG_VAL:+$FG_VAL;}${BG_VAL}"
			values=${values%%;}

			# Construct escape sequence for color styling
			sequence="${values:+\033[${values}m}"

			# Print formatted color examples
			printf " %-9s" "${sequence:-(default)}"
			printf " ${sequence}TEXT\033[m"
			printf " \033[${values:+${values+$values;}}1mBOLD\033[m"
		done
		echo; echo
	done
}

# Print a list of 256 colors
function colors256() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}colors256${RESET}: Display 256-color terminal palette"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}colors256${RESET}"
		echo -e "${BRIGHT_WHITE}See also:${RESET} ${BRIGHT_GREEN}colors${RESET}, ${BRIGHT_GREEN}colors24bit${RESET}"
		return 0
	fi

	# Define the number of colors per line
	colors_per_line=8

	for i in {0..255}; do
		printf "\x1b[38;5;${i}mcolor%-5d" "$i"

		# Check if the current color is the last in the line
		if (( (i + 1) % colors_per_line == 0 )); then
			echo # Move to the next line
		fi
	done
	# Add a final newline if needed
	if ((255 % colors_per_line != 0)); then
		echo
	fi
}

# Test for 24bit true color in the terminal
function colors24bit() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}colors24bit${RESET}: Test terminal 24-bit true color support"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}colors24bit${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Displays color gradients - smooth = true color supported${RESET}"
		echo -e "${BRIGHT_WHITE}See also:${RESET} ${BRIGHT_GREEN}colors${RESET}, ${BRIGHT_GREEN}colors256${RESET}"
		return 0
	fi

	echo 'If the gradients are smooth, you are displaying 24bit true color.'
	awk 'BEGIN{
		# Generate a long string of characters for testing
		s = "1234567890";
		s = s s s s s s s s s s s s s s s s s s s s s s s s; # Extended string
		len = length(s); # Length of the string

		# Generate and display color gradients
		for (colnum = 0; colnum < 256; colnum++) {
			r = 255 - (colnum * 255 / 255);
			g = (colnum * 510 / 255);
			b = (colnum * 255 / 255);
			if (g > 255) g = 510 - g;

			# Set background and foreground colors using ANSI escape sequences
			printf "\033[48;2;%d;%d;%dm", r, g, b; # Background color
			printf "\033[38;2;%d;%d;%dm", 255 - r, 255 - g, 255 - b; # Foreground color

			# Display a character with the defined colors and reset formatting
			printf "%s\033[0m", substr(s, (colnum % len) + 1, 1);
		}
		printf "\n"; # Move to the next line after printing colors
	}'
}

# Prints random height bars across the width of the screen
# (great with lolcat application on new terminal windows)
function sparkbars() {
	columns=$(tput cols)
	chars=▁▂▃▄▅▆▇█
	for ((i = 1; i <= $columns; i++))
	do
		echo -n "${chars:RANDOM%${#chars}:1}"
	done
	echo
}

# View Apache logs
function apachelog() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}apachelog${RESET}: View Apache web server logs"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}apachelog${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Auto-detects /var/log/httpd or /var/log/apache2${RESET}"
		return 0
	fi

	if [ -d /var/log/httpd ]; then
		sudo \ls -Ah /var/log/httpd && logview "/var/log/httpd/*_log"
	else
		sudo \ls -Ah /var/log/apache2 && logview "/var/log/apache2/*.log"
	fi
}

# Auto-find and edit the Apache configuration
function apacheconfig() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}apacheconfig${RESET}: Edit Apache configuration file"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}apacheconfig${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}config_path${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Auto-detects httpd.conf or apache2.conf location${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}apacheconfig${RESET}                             ${BRIGHT_BLUE}# Auto-find config${RESET}"
		echo -e "  ${BRIGHT_CYAN}apacheconfig${RESET} ${BRIGHT_GREEN}/etc/httpd/conf/httpd.conf${RESET}  ${BRIGHT_BLUE}# Specific path${RESET}"
		return 0
	fi

	if hascommand --strict httpd || hascommand --strict apache2 || hascommand --strict apachectl; then
		# Define an array with common paths
		declare -a paths=(
			"/etc/httpd/conf/httpd.conf"
			"/etc/httpd/httpd.conf"
			"/etc/apache2/apache2.conf"
			"/usr/local/apache2/apache2.conf"
			"/usr/local/etc/httpd/httpd.conf"
		)

		# Check if a custom path is provided
		[[ -n "$1" ]] && paths=("$1")
		for path in "${paths[@]}"; do
			if [[ -f $path ]]; then
				edit "$path"
				return 0
			fi
		done

		echo "Error: Apache config file could not be found."
		echo "Searching for possible locations:"
		httpd -V 2> /dev/null || apachectl -V 2> /dev/null || apache2 -V
	else
		echo "Apache is not installed."
	fi
}

# Find the Apache service and restart/start it
function apacherestart() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}apacherestart${RESET}: Test config and restart Apache service"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}apacherestart${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Tests configuration before restarting${RESET}"
		echo -e "  ${BRIGHT_BLUE}Auto-detects apache2/httpd service name${RESET}"
		return 0
	fi

	# Determine Apache config test command
	local apache_cmd
	if hascommand --strict apache2ctl; then
		apache_cmd="apache2ctl"
	elif hascommand --strict httpd; then
		apache_cmd="httpd"
	else
		echo -e "${BRIGHT_RED}Error: Could not find Apache executable (apache2ctl or httpd)${RESET}"
		return 1
	fi

	# Test configuration FIRST
	echo -e "${BRIGHT_CYAN}Testing Apache configuration...${RESET}"
	if ! sudo $apache_cmd -t; then
		echo -e "${BRIGHT_RED}✗ Configuration test failed - cannot restart Apache with invalid config${RESET}"
		echo -e "${BRIGHT_CYAN}Fix the configuration errors and try again${RESET}"
		return 1
	fi
	echo -e "${BRIGHT_GREEN}✓ Configuration is valid${RESET}"

	# Determine service name by trying common names
	local apache_service
	if hascommand --strict systemctl; then
		for service in apache2 httpd apache; do
			if systemctl list-unit-files | grep -q "^$service.service"; then
				apache_service="$service"
				break
			fi
		done

		if [[ -z "$apache_service" ]]; then
			echo -e "${BRIGHT_RED}Error: Could not find Apache service (tried apache2, httpd, apache)${RESET}"
			return 1
		fi

		echo -e "${BRIGHT_CYAN}Restarting Apache ($apache_service) via systemctl...${RESET}"
		if sudo systemctl restart $apache_service; then
			echo -e "${BRIGHT_GREEN}✓ Apache restarted successfully${RESET}"

			if sudo systemctl is-active $apache_service &>/dev/null; then
				echo -e "${BRIGHT_GREEN}✓ Apache is running${RESET}"
			else
				echo -e "${BRIGHT_RED}✗ Apache failed to start - check logs: sudo journalctl -u $apache_service${RESET}"
				return 1
			fi
		else
			echo -e "${BRIGHT_RED}✗ Failed to restart Apache${RESET}"
			return 1
		fi
	# [rest of init.d and service logic similar to before, but with service name detection]
	fi
}

# Auto-find and edit the Nginx configuration
function ngconfig() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}ngconfig${RESET}: Edit Nginx configuration file"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}ngconfig${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}config_path${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Auto-detects nginx.conf location${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}ngconfig${RESET}                        ${BRIGHT_BLUE}# Auto-find config${RESET}"
		echo -e "  ${BRIGHT_CYAN}ngconfig${RESET} ${BRIGHT_GREEN}/etc/nginx/nginx.conf${RESET}  ${BRIGHT_BLUE}# Specific path${RESET}"
		return 0
	fi

	if hascommand --strict nginx; then
		# Define an array with common paths
		declare -a paths=(
			"/etc/nginx/nginx.conf"
			"/usr/local/nginx/conf/nginx.conf"
			"/usr/local/etc/nginx/nginx.conf"
		)

		# Check if a custom path is provided
		[[ -n "$1" ]] && paths=("$1")

		for path in "${paths[@]}"; do
			if [[ -f $path ]]; then
				edit "$path"
				return 0
			fi
		done

		echo "Error: Nginx config file could not be found."
		echo "Please specify the location manually, or check your Nginx installation."
	else
		echo "Nginx is not installed."
	fi
}

# Find the Nginx service and restart/start it
function ngrestart() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}ngrestart${RESET}: Test config and restart Nginx service"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}ngrestart${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Tests configuration before restarting${RESET}"
		return 0
	fi

	# Test configuration FIRST before attempting restart
	echo -e "${BRIGHT_CYAN}Testing nginx configuration...${RESET}"
	if ! sudo nginx -t; then
		echo -e "${BRIGHT_RED}✗ Configuration test failed - cannot restart nginx with invalid config${RESET}"
		echo -e "${BRIGHT_CYAN}Fix the configuration errors and try again${RESET}"
		return 1
	fi
	echo -e "${BRIGHT_GREEN}✓ Configuration is valid${RESET}"

	# If we are using Systemd...
	if hascommand --strict systemctl; then
		# Check if Nginx executable is available
		if hascommand --strict nginx; then
			echo -e "${BRIGHT_CYAN}Restarting nginx via systemctl...${RESET}"
			if sudo systemctl restart nginx; then
				echo -e "${BRIGHT_GREEN}✓ Nginx restarted successfully${RESET}"

				# Check if service is actually running
				if sudo systemctl is-active nginx &>/dev/null; then
					echo -e "${BRIGHT_GREEN}✓ Nginx is running${RESET}"
				else
					echo -e "${BRIGHT_RED}✗ Nginx failed to start - check logs: sudo journalctl -u nginx${RESET}"
					return 1
				fi
			else
				echo -e "${BRIGHT_RED}✗ Failed to restart nginx${RESET}"
				return 1
			fi
		else
			echo -e "${BRIGHT_RED}Error: Could not find nginx executable${RESET}"
			return 1
		fi
	# If using init.d...
	elif [[ -d /etc/init.d ]] && [[ -f /etc/init.d/nginx ]]; then
		echo -e "${BRIGHT_CYAN}Restarting nginx via init.d...${RESET}"
		if sudo /etc/init.d/nginx restart; then
			echo -e "${BRIGHT_GREEN}✓ Nginx restarted successfully${RESET}"
		else
			echo -e "${BRIGHT_RED}✗ Failed to restart nginx${RESET}"
			return 1
		fi
	# Other systems including OpenRC...
	elif hascommand --strict service; then
		# Check if Nginx executable is available
		if hascommand --strict nginx; then
			echo -e "${BRIGHT_CYAN}Restarting nginx via service command...${RESET}"
			if sudo service nginx restart; then
				echo -e "${BRIGHT_GREEN}✓ Nginx restarted successfully${RESET}"
			else
				echo -e "${BRIGHT_RED}✗ Failed to restart nginx${RESET}"
				return 1
			fi
		else
			echo -e "${BRIGHT_RED}Error: Could not find nginx executable${RESET}"
			return 1
		fi
	else # Unknown
		echo -e "${BRIGHT_RED}Error: Could not find service controller (systemctl, service, or init.d)${RESET}"
		return 1
	fi
}

# Check the syntax of a PHP file for errors
function phpcheck() {
	if [[ $# -eq 0 ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}phpcheck${RESET}: Validate PHP syntax without executing the file"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}phpcheck${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}file.php${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}phpcheck${RESET} ${BRIGHT_YELLOW}index.php${RESET}"
		return 2
	fi
	echo -e "${BRIGHT_RED}[${BRIGHT_CYAN}PHP Check${BRIGHT_RED}]${BRIGHT_YELLOW}->${BRIGHT_GREEN}${1}${RESET}"
	php -l "${1}"
}

# Auto-find and edit the PHP configuration file
function phpconfig() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}phpconfig${RESET}: Edit PHP configuration file (php.ini)"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}phpconfig${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Auto-detects php.ini location via PHP itself${RESET}"
		return 0
	fi

	if hascommand --strict php; then
		local _php_ini_file=$(php -r 'echo php_ini_loaded_file();')
		if [[ -f "${_php_ini_file}" ]]; then
			echo "Found: ${_php_ini_file}"
			edit "${_php_ini_file}"
		elif [[ -f /etc/php.ini ]]; then
			echo "Found: /etc/php.ini"
			edit /etc/php.ini
		elif [[ -f /etc/php/php.ini ]]; then
			echo "Found: /etc/php/php.ini"
			edit /etc/php/php.ini
		else
			echo "Error: php.ini file could not be found automatically."
			echo "Searching for possible locations:"
			# sudo updatedb && locate php.ini
			php --ini
		fi
	else
		echo "PHP is not installed."
	fi
}

# Auto-find and edit the MySQL configuration file
function mysqlconfig() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}mysqlconfig${RESET}: Edit MySQL configuration file (my.cnf)"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}mysqlconfig${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Auto-detects my.cnf location${RESET}"
		return 0
	fi

	if hascommand --strict mysqld; then
		if [[ -f /etc/my.cnf ]]; then
			edit /etc/my.cnf
		elif [[ -f /etc/mysql/my.cnf ]]; then
			edit /etc/mysql/my.cnf
		elif [[ -f /usr/local/etc/my.cnf ]]; then
			edit /usr/local/etc/my.cnf
		elif [[ -f /usr/bin/mysql/my.cnf ]]; then
			edit /usr/bin/mysql/my.cnf
		elif [[ -f "${HOME}/my.cnf" ]]; then
			edit "${HOME}/my.cnf"
		else
			echo "Error: my.cnf file could not be found automatically."
			echo "Searching for possible locations:"
			# sudo updatedb && locate my.cnf
			mysqld --verbose --help | grep -A 1 "Default options"
		fi
	else
		echo "MySQL is not installed."
	fi
}

# Determine if a system reboot is required
function checkreboot() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}checkreboot${RESET}: Check if a system reboot is required"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}checkreboot${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Detects kernel updates on Arch, RHEL, Debian, SUSE${RESET}"
		return 0
	fi

	# Initialize a variable to indicate if a reboot is required
	local REBOOT_REQUIRED=0

	# Check if pacman exists (indicative of an Arch-based system)
	if command -v pacman &> /dev/null; then

		# Determine the running kernel's package name from uname -r
		# uname -r returns e.g. "6.18.8-zen2-1-zen" with a trailing flavor suffix
		local RUNNING_UNAME
		RUNNING_UNAME=$(uname -r)
		local KERNEL_PKG="linux"
		case "${RUNNING_UNAME}" in
			*-lts*)       KERNEL_PKG="linux-lts" ;;
			*-zen*)       KERNEL_PKG="linux-zen" ;;
			*-hardened*)  KERNEL_PKG="linux-hardened" ;;
		esac

		# Get the installed version of that specific kernel package
		local INSTALLED_VER
		INSTALLED_VER=$(pacman -Q "${KERNEL_PKG}" 2>/dev/null | awk '{print $2}')

		if [[ -n "${INSTALLED_VER}" ]]; then
			# Normalize both: replace all dashes with dots for comparison
			local ACTIVE_KERNEL=${RUNNING_UNAME//-/.}
			local CURRENT_KERNEL=${INSTALLED_VER//-/.}

			# uname -r has a trailing flavor suffix (e.g. ".zen", ".lts")
			# that pacman's version string doesn't include.
			# Check if active starts with installed version to handle this.
			if [[ "${ACTIVE_KERNEL}" != "${CURRENT_KERNEL}"* ]]; then
				echo -e "${BRIGHT_RED}->${RESET} ${BRIGHT_CYAN}Arch Linux${RESET}: ${BRIGHT_YELLOW}Running kernel (${ACTIVE_KERNEL}) does not match installed ${KERNEL_PKG} (${CURRENT_KERNEL}).${RESET}"
				REBOOT_REQUIRED=1
			fi
		fi

	# Use hascommand to check if rpm exists (indicative of a RedHat-based system like CentOS)
	elif hascommand --strict rpm; then
		if ! rpm -q kernel | grep -q $(uname -r); then
			echo -e "${BRIGHT_RED}->${RESET} ${BRIGHT_CYAN}Red Hat Linux${RESET}: ${BRIGHT_YELLOW}Kernel update detected. A reboot is required.${RESET}"
			REBOOT_REQUIRED=1
		fi

	# Check for the existence of /var/run/reboot-required (indicative of Ubuntu/Debian)
	elif [[ -f /var/run/reboot-required ]]; then
		# If the file exists, a reboot is required
		echo -e "${BRIGHT_RED}->${RESET} ${BRIGHT_CYAN}Ubuntu/Debian${RESET}: ${BRIGHT_YELLOW}A reboot is required.${RESET}"
		REBOOT_REQUIRED=1

	# Check if zypper exists (indicative of a SUSE-based system)
	elif command -v zypper &> /dev/null; then
		if zypper ps -s | grep -q 'yes'; then
			echo -e "${BRIGHT_RED}->${RESET} ${BRIGHT_CYAN}SUSE${RESET}: ${BRIGHT_YELLOW}Kernel or service update detected. A reboot is required.${RESET}"
			REBOOT_REQUIRED=1
		fi
	fi

	# General: Check for deleted libraries still in use
	local LIBRARIES=$(lsof -n +c 0 2> /dev/null | grep 'DEL.*lib' | awk '{print $1 ": " $NF}' | sort -u)
	if [[ -n ${LIBRARIES} ]]; then
		echo -e "${BRIGHT_RED}->${RESET} ${BRIGHT_CYAN}General${RESET}: ${BRIGHT_YELLOW}The following libraries require a reboot:${RESET}"
		echo "${LIBRARIES}"
		REBOOT_REQUIRED=1
	fi

	# Final message and exit code
	if [[ ${REBOOT_REQUIRED} -eq 0 ]]; then
		echo -e "${BRIGHT_RED}->${RESET} ${BRIGHT_CYAN}Results${RESET}: ${BRIGHT_GREEN}No reboot is required.${RESET}"
		return 0
	else
		echo -e "${BRIGHT_RED}->${RESET} ${BRIGHT_CYAN}Results${RESET}: ${BRIGHT_YELLOW}A reboot is required.${RESET}"
		return 1
	fi
}

# Interactively create, configure, and test a new Linux user
function createuser() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}createuser${RESET}: Create a new user account interactively"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}createuser${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}username${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Creates home directory, sets password, optionally grants sudo${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}createuser${RESET}          ${BRIGHT_BLUE}# Interactive prompts${RESET}"
		echo -e "  ${BRIGHT_CYAN}createuser${RESET} ${BRIGHT_GREEN}newuser${RESET}  ${BRIGHT_BLUE}# Specify username${RESET}"
		return 0
	fi

	local username

	# Check if the user can execute sudo commands
	if ! sudo -v; then
		echo -e "${BRIGHT_RED}Error:${RESET} You do not have sufficient permissions to run this script with necessary privileges"
		return 1
	fi

	# Check if a username was passed as a parameter
	if [ "$#" -eq 1 ]; then
		username="$1"
	else
		read -r -p $'Enter the username for the new user: ' username
	fi

	# Check if the user already exists
	if [[ -z "${username}" ]]; then
		echo -e "${BRIGHT_RED}User cannot be blank. Aborting.${RESET}"
		return 1
	elif id "${username}" &>/dev/null; then
		echo -e "${BRIGHT_RED}User ${username} already exists. Aborting.${RESET}"
		return 1
	fi

	# Confirm if the user should be created with a home directory
	if ask "${BRIGHT_GREEN}Create a new user with a home folder?${RESET}" N; then
		sudo useradd -m "${username}"
	else
		echo -e "${BRIGHT_RED}User creation aborted${RESET}"
		return 1
	fi

	# Set the user's password
	echo -e "${BRIGHT_YELLOW}\nSet the user's password:${RESET}"
	sudo passwd "${username}"

	# Ask if the user should change their password upon next login
	if ask "${BRIGHT_GREEN}Force user to change password on next login?${RESET}" N; then
		sudo passwd -e "${username}"
	else
		echo -e "${BRIGHT_YELLOW}No change password enforced${RESET}"
	fi

	# Ask if the user should have root (sudo) access
	if ask "${BRIGHT_MAGENTA}⚠️ Give user root access? ⚠️${RESET}" N; then
		sudo usermod -a -G sudo "${username}"
	else
		echo -e "${BRIGHT_YELLOW}No root access granted${RESET}"
	fi

	# Change the user's login shell to bash
	echo -e "${BRIGHT_CYAN}\nChange user’s login shell to bash${RESET}"
	sudo usermod --shell /bin/bash "${username}"

	# Verify the user's settings
	echo -e "${BRIGHT_YELLOW}\nVerifying user settings:${RESET}"
	sudo grep "${username}" /etc/passwd

	# Ask if you should copy over the local .bashrc to the new user
	if ask "${BRIGHT_GREEN}Copy over your local .bashrc?${RESET}" N; then
		sudo cp ~/.bashrc /home/"${username}"/
		sudo chown "${username}":"${username}" /home/"${username}"/.bashrc
		sudo chmod 644 /home/"${username}"/.bashrc
	else
		echo -e "${BRIGHT_YELLOW}No .bashrc copy${RESET}"
	fi

	# Test login with the new user
	if ask "${BRIGHT_GREEN}⚠️ Test a login as this user? ⚠️${RESET}" N; then
		echo -e "${BRIGHT_CYAN}\nTesting: Logging in as ${username}${RESET}"
		sudo su - "${username}"
	fi
}

# Remove a user from the system
alias deleteuser='sudo userdel'
function wipeuser() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}wipeuser${RESET}: Completely remove a user and their home directory"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}wipeuser${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}username${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Kills processes, removes home dir, removes from groups${RESET}"
		echo -e "  ${BRIGHT_BLUE}If no username given, shows interactive menu${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}wipeuser${RESET}          ${BRIGHT_BLUE}# Select from menu${RESET}"
		echo -e "  ${BRIGHT_CYAN}wipeuser${RESET} ${BRIGHT_GREEN}olduser${RESET}  ${BRIGHT_BLUE}# Remove specific user${RESET}"
		return 0
	fi

	local USERNAME="$1"

	# Check if the user can execute sudo commands
	if ! sudo -v; then
		echo -e "${BRIGHT_RED}Error:${RESET} You do not have sufficient permissions to run this script with necessary privileges"
		return 1
	fi

	# If username is not provided, get the list of users and use createmenu
	if [[ -z "${USERNAME}" ]]; then
		echo -e "${BRIGHT_CYAN}Select a user to delete:${RESET}"
		USERNAME=$(sudo awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd | createmenu)
	fi

	# If username is still empty (e.g. if the user cancels the menu selection), exit
	if [[ -z "${USERNAME}" ]]; then
		echo -e "${BRIGHT_RED}No user selected. Aborting.${RESET}"
		return 1

	# Check against this being the current user
	elif [[ "${USERNAME}" == "${USER}" ]]; then
		echo -e "${BRIGHT_RED}You cannot remove the currently logged-in user. Aborting.${RESET}"
		return 1
	fi

	# Check if the user exists
	if id "${USERNAME}" &>/dev/null; then

		# Confirm deletion
		if ask "${BRIGHT_RED}⚠️ Are you sure you want to delete user ${USERNAME} and all their data? ⚠️ This action cannot be undone! ⚠️${RESET}" N; then

			# Kill all processes by the user
			sudo pkill -U "${USERNAME}"

			# Remove the user and their home directory
			sudo userdel -rf "${USERNAME}"

			# Remove the user from any additional groups
			sudo delgroup "${USERNAME}" &>/dev/null

			echo -e "${BRIGHT_GREEN}User ${USERNAME} and their home directory have been deleted.${RESET}"
		else
			echo -e "${BRIGHT_YELLOW}User deletion aborted.${RESET}"
		fi
	else
		echo -e "${BRIGHT_RED}User ${USERNAME} does not exist.${RESET}"
	fi
}

# A full chmod calculator on command line (type chmodcalc for usage and examples)
function chmodcalc() {
	# Show help if requested
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}chmodcalc${RESET}: Calculate and display chmod permissions"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}chmodcalc${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}octal${BRIGHT_MAGENTA}>${RESET}"
		echo -e "       ${BRIGHT_CYAN}chmodcalc${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}owner${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}group${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}other${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}chmodcalc${RESET} ${BRIGHT_YELLOW}755${RESET}       ${BRIGHT_BLUE}# Show rwx for 755${RESET}"
		echo -e "  ${BRIGHT_CYAN}chmodcalc${RESET} ${BRIGHT_YELLOW}rwx rw r${RESET}  ${BRIGHT_BLUE}# Convert to octal (754)${RESET}"
		echo -e "${BRIGHT_WHITE}Octal values:${RESET} read=${BRIGHT_CYAN}4${RESET}, write=${BRIGHT_CYAN}2${RESET}, execute=${BRIGHT_CYAN}1${RESET}"
		return 0
	fi

	# Validate the number of arguments
	if [[ "$#" -eq 1 ]]; then
		# Validate the length of the argument (accept 1-4 digit octals)
		if [[ "${#1}" -gt 4 ]] || [[ "${#1}" -lt 1 ]]; then
			echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Invalid octal (use 1-4 digits).${RESET}"
			return 128
		fi

		# Handle 4-digit octals: extract the special bit prefix
		local SPECIAL_BIT=""
		local TEXT="$1"
		if [[ "${#TEXT}" -eq 4 ]]; then
			SPECIAL_BIT="${TEXT:0:1}"
			TEXT="${TEXT:1}"
		fi
		local -a PART=()
		local EXAMPLE
		local INDEX=0

		while (( INDEX++ < ${#TEXT} )); do
			# Extract individual octal digit
			local CHAR="${TEXT:INDEX-1:1}"

			# Map octal digit to permissions
			case ${CHAR} in
			0) PART[${INDEX}]="---" ;;
			1) PART[${INDEX}]="--x" ;;
			2) PART[${INDEX}]="-w-" ;;
			3) PART[${INDEX}]="-wx" ;;
			4) PART[${INDEX}]="r--" ;;
			5) PART[${INDEX}]="r-x" ;;
			6) PART[${INDEX}]="rw-" ;;
			7) PART[${INDEX}]="rwx" ;;
			*)
				echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Invalid octal digit at position ${BRIGHT_YELLOW}${INDEX}${RESET}"
				return 128
				;;
			esac

			# Create example representation
			EXAMPLE[${INDEX}]="${PART[${INDEX}]//-}"
		done

		# Display formatted output and examples
		echo -e "${BRIGHT_GREEN}${PART[1]}${RESET} ${BRIGHT_YELLOW}${PART[2]}${RESET} ${BRIGHT_RED}${PART[3]}${RESET}"

		# Display special bit info if a 4-digit octal was provided
		if [[ -n "${SPECIAL_BIT}" ]] && [[ "${SPECIAL_BIT}" -ne 0 ]]; then
			local SPECIAL_DESC=""
			(( SPECIAL_BIT & 4 )) && SPECIAL_DESC+="setuid "
			(( SPECIAL_BIT & 2 )) && SPECIAL_DESC+="setgid "
			(( SPECIAL_BIT & 1 )) && SPECIAL_DESC+="sticky "
			echo -e "${BRIGHT_MAGENTA}Special bit (${SPECIAL_BIT}):${RESET} ${SPECIAL_DESC}"
		fi

		echo -e "Examples:"
		local FULL_OCTAL="${SPECIAL_BIT}${TEXT}"
		echo -e "${BRIGHT_CYAN}chmod${RESET} ${BRIGHT_CYAN}-R${RESET} ${BRIGHT_MAGENTA}${FULL_OCTAL}${RESET} ${BRIGHT_BLUE}./*${RESET}"
		echo -e "${BRIGHT_CYAN}chmod${RESET} ${BRIGHT_CYAN}-R${RESET} ${BRIGHT_CYAN}u=${BRIGHT_GREEN}${EXAMPLE[1]}${RESET}${BRIGHT_CYAN},g=${BRIGHT_YELLOW}${EXAMPLE[2]}${RESET}${BRIGHT_CYAN},o=${BRIGHT_RED}${EXAMPLE[3]}${RESET} ${BRIGHT_BLUE}./*${RESET}"

	elif [[ "$#" -eq 3 ]]; then
		local FORMATTED=""
		local OCTAL_VALUE
		for PERMISSION in "$@"; do
			OCTAL_VALUE=0
			[[ ${PERMISSION} =~ .*r.* ]] && (( OCTAL_VALUE+=4 ))
			[[ ${PERMISSION} =~ .*w.* ]] && (( OCTAL_VALUE+=2 ))
			[[ ${PERMISSION} =~ .*x.* ]] && (( OCTAL_VALUE+=1 ))
			FORMATTED="${FORMATTED}${OCTAL_VALUE}"
		done
		echo -e "${BRIGHT_CYAN}${FORMATTED}${RESET}"
		chmodcalc "${FORMATTED}"

	else
		echo -e "${BRIGHT_CYAN}chmodcalc${RESET}: Calculate and display chmod permissions"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}chmodcalc${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}octal${BRIGHT_MAGENTA}>${RESET}"
		echo -e "       ${BRIGHT_CYAN}chmodcalc${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}owner${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}group${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}other${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}chmodcalc${RESET} ${BRIGHT_YELLOW}755${RESET}              ${BRIGHT_BLUE}# Show rwx for 755${RESET}"
		echo -e "  ${BRIGHT_CYAN}chmodcalc${RESET} ${BRIGHT_YELLOW}rwx rw r${RESET}         ${BRIGHT_BLUE}# Convert to octal (754)${RESET}"
		echo -e "${BRIGHT_WHITE}Octal values:${RESET} read=${BRIGHT_CYAN}4${RESET}, write=${BRIGHT_CYAN}2${RESET}, execute=${BRIGHT_CYAN}1${RESET}"
	fi
}

# Recursively set permissions for only files
function chmodfiles() {
	# Initialize local variables
	local _DIRECTORY="${2:-${PWD}}" # Default to current directory if no directory is provided
	local _PERMISSION="$1"          # The permission mode to be set

	# Check for missing permission parameter
	if [[ -z "${_PERMISSION}" ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}chmodfiles${RESET}: Set permissions for files recursively"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}chmodfiles${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}mode${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}directory${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}chmodfiles${RESET} ${BRIGHT_YELLOW}664${RESET}            ${BRIGHT_BLUE}# Current directory${RESET}"
		echo -e "  ${BRIGHT_CYAN}chmodfiles${RESET} ${BRIGHT_YELLOW}+x${RESET} ${BRIGHT_GREEN}/some/path${RESET}  ${BRIGHT_BLUE}# Specific directory${RESET}"
		return 1
	fi

	# Check if the specified directory exists
	if [ ! -d "${_DIRECTORY}" ]; then
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Directory ${BRIGHT_YELLOW}${_DIRECTORY}${BRIGHT_CYAN} not found${RESET}"
		return 2
	fi

	# Ask the user if sudo should be used for the operation
	local SUDO_PREFIX=''
	if ask "${BRIGHT_CYAN}Use administrator priveledges for this operation?${RESET}" N; then
		SUDO_PREFIX='sudo '
	fi

	# Ask for confirmation
	if ask "${BRIGHT_CYAN}Are you sure you want to change file permissions in ${BRIGHT_YELLOW}${_DIRECTORY}${BRIGHT_CYAN}?${RESET}" N; then
		# Change permissions for files recursively
		${SUDO_PREFIX}find "${_DIRECTORY}" -type f -exec chmod "${_PERMISSION}" {} \;
		echo -e "${BRIGHT_GREEN}Permissions set for files in ${BRIGHT_YELLOW}${_DIRECTORY}${RESET}"
	else
		echo -e "${BRIGHT_RED}Operation canceled${RESET}"
	fi
}

# Recursively set permissions for only directories
alias chmoddirectories='chmoddirs'
alias chmodfolders='chmoddirs'
function chmoddirs() {
	# Initialize local variables
	local _DIRECTORY="${2:-${PWD}}" # Default to current directory if no directory is provided
	local _PERMISSION="$1"          # The permission mode to be set

	# Check for missing permission parameter
	if [[ -z "${_PERMISSION}" ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}chmoddirs${RESET}: Set permissions for directories recursively"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}chmoddirs${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}mode${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}directory${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}chmoddirs${RESET} ${BRIGHT_YELLOW}775${RESET}            ${BRIGHT_BLUE}# Current directory${RESET}"
		echo -e "  ${BRIGHT_CYAN}chmoddirs${RESET} ${BRIGHT_YELLOW}+x${RESET} ${BRIGHT_GREEN}/some/path${RESET}  ${BRIGHT_BLUE}# Specific directory${RESET}"
		return 1
	fi

	# Check if the specified directory exists
	if [ ! -d "${_DIRECTORY}" ]; then
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Directory ${BRIGHT_YELLOW}${_DIRECTORY}${BRIGHT_CYAN} not found${RESET}"
		return 2
	fi

	# Ask the user if sudo should be used for the operation
	local SUDO_PREFIX=''
	if ask "${BRIGHT_CYAN}Use administrator priveledges for this operation?${RESET}" N; then
		SUDO_PREFIX='sudo '
	fi

	# Confirm the action before proceeding
	if ask "${BRIGHT_CYAN}Are you sure you want to change directory permissions in ${BRIGHT_YELLOW}${_DIRECTORY}${BRIGHT_CYAN}?${RESET}" N; then
		# Change permissions for directories recursively
		${SUDO_PREFIX}find "${_DIRECTORY}" -type d -name \* -exec chmod "${_PERMISSION}" {} \;
		echo -e "${BRIGHT_GREEN}Permissions set for directories in ${BRIGHT_YELLOW}${_DIRECTORY}${RESET}"
	else
		echo -e "${BRIGHT_RED}Operation canceled${RESET}"
	fi
}

# Recursively set permissions of code files and directories
# WARNING: Will add execute permissions to .sh files!
function chfix() {
	# Check if -h or --help is provided as the first argument
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}chfix${RESET}: Set permissions and ownership for files and directories recursively"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}chfix${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}file_mode${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}dir_mode${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}owner${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}directory${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Defaults:${RESET} file_mode=664, dir_mode=775, directory=current"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}chfix${RESET}                                ${BRIGHT_BLUE}# Use defaults${RESET}"
		echo -e "  ${BRIGHT_CYAN}chfix${RESET} ${BRIGHT_YELLOW}644 755${RESET}                        ${BRIGHT_BLUE}# Custom modes${RESET}"
		echo -e "  ${BRIGHT_CYAN}chfix${RESET} ${BRIGHT_YELLOW}644 755${RESET} ${BRIGHT_GREEN}www-data${RESET}               ${BRIGHT_BLUE}# With owner${RESET}"
		echo -e "  ${BRIGHT_CYAN}chfix${RESET} ${BRIGHT_YELLOW}664 775${RESET} ${BRIGHT_GREEN}www-data:dev /var/www${RESET}  ${BRIGHT_BLUE}# Full usage${RESET}"
		return 1
	fi

	# Initialize variables with default values or passed arguments
	# Write access is also given to the group (e.g. for a group of developers)
	local FILE_PERMISSIONS="${1:-0664}" # Default to User:rw  Group:rw  Other:r
	local DIR_PERMISSIONS="${2:-0775}"  # Default to User:rwx Group:rwx Other:rx
	local OWNER="${3:-}"                # Optional owner
	local DIRECTORY="${4:-${PWD}}"      # Default to current directory

	# Check if the specified directory exists
	if [ ! -d "${DIRECTORY}" ]; then
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Directory ${BRIGHT_YELLOW}${DIRECTORY}${BRIGHT_CYAN} not found${RESET}"
		return 2
	fi

	# Ask the user if sudo should be used for the operation
	local SUDO_PREFIX=''
	if ask "${BRIGHT_CYAN}Use administrator privileges for this operation?${RESET}" N; then
		SUDO_PREFIX='sudo '
	fi

	# Confirm the action
	if ask "${BRIGHT_CYAN}This will change all permissions and optionally ownership for directories and files in ${BRIGHT_YELLOW}${DIRECTORY}${RESET}. Are you sure?${RESET}" N; then
		# Change permissions
		${SUDO_PREFIX}find "${DIRECTORY}" -type f -exec chmod "${FILE_PERMISSIONS}" {} \;
		${SUDO_PREFIX}find "${DIRECTORY}" -type d -exec chmod "${DIR_PERMISSIONS}" {} \;

		# Add execute permissions to .sh files
		${SUDO_PREFIX}find "${DIRECTORY}" -type f -name "*.sh" -exec chmod +x {} \;

		# Change ownership if OWNER is specified
		[ -n "${OWNER}" ] && ${SUDO_PREFIX}chown -R "${OWNER}" "${DIRECTORY}"
		echo -e "${BRIGHT_GREEN}Permissions and ownership set for ${BRIGHT_YELLOW}${DIRECTORY}${RESET}"
	fi
}

# Copy/clone file permissions
function chmodcopy() {
	# Check if at least two arguments are provided (source and destination)
	if [ $# -lt 2 ]; then
		# Display usage information if the required arguments are not provided
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}chmodcopy${RESET} ${BRIGHT_GREEN}[source_file]${RESET} ${BRIGHT_YELLOW}[destination_file]${RESET} ${BRIGHT_CYAN}[additional_optional_chmod_parameters]${RESET}"
		return 1
	fi

	# Prompt the user to confirm if they want tu use administrator privileges
	local SUDO_PREFIX=''
	if ask "${BRIGHT_CYAN}Use administrator privileges for this operation?${RESET}" N; then
		SUDO_PREFIX='sudo '
	fi

	# Execute the chmod command with --reference option
	${SUDO_PREFIX}chmod --reference="${@}"
	echo -e "${BRIGHT_GREEN}Permissions copied${RESET}"
}

# Improved terminal clipboard management for viewing, setting, and
# clearing content, with support for piping input and output.
function clipboard() {
	# Help message
	if [[ "$1" == "--help" || "$1" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}clipboard${RESET}: Terminal clipboard management with piping support"
		echo -e "${BRIGHT_WHITE}Usage:${RESET}"
		echo -e "  ${BRIGHT_CYAN}clipboard${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}text${BRIGHT_MAGENTA}>${RESET}          ${BRIGHT_BLUE}# Copy text to clipboard${RESET}"
		echo -e "  command | ${BRIGHT_CYAN}clipboard${RESET}       ${BRIGHT_BLUE}# Copy command output to clipboard${RESET}"
		echo -e "  ${BRIGHT_CYAN}clipboard${RESET} | command       ${BRIGHT_BLUE}# Paste clipboard to command${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}clipboard${RESET} ${BRIGHT_YELLOW}'Hello World'${RESET}   ${BRIGHT_BLUE}# Copy text${RESET}"
		echo -e "  ${BRIGHT_YELLOW}cat file.txt${RESET} | ${BRIGHT_CYAN}clipboard${RESET}  ${BRIGHT_BLUE}# Copy file contents${RESET}"
		echo -e "  ${BRIGHT_CYAN}clipboard${RESET} | ${BRIGHT_YELLOW}less${RESET}          ${BRIGHT_BLUE}# View clipboard in less${RESET}"
		echo -e "  ${BRIGHT_YELLOW}pwd${RESET} | ${BRIGHT_CYAN}clipboard${RESET}           ${BRIGHT_BLUE}# Copy current directory${RESET}"
		return
	fi

	# Local variables
	local CLIPBOARD_CONTENT=""      # Content for clipboard
	local SEND_TO_CLIPBOARD=false   # Flag if content needs to be sent to clipboard

	# If we are logged in via SSH...
	if [[ -n "${SSH_CLIENT}" ]] || [[ -n "${SSH_TTY}" ]]; then
		# No local clipboard access in SSH
		return 1
	# Determine if text is passed as a parameter
	elif [[ -n "${1}" ]]; then
		CLIPBOARD_CONTENT="${1}"
		SEND_TO_CLIPBOARD=true
	# Determine if content is piped to clipboard
	elif [[ -p /dev/stdin ]]; then
		CLIPBOARD_CONTENT=$(cat -)
		SEND_TO_CLIPBOARD=true
	fi

	# Handle content that needs to be sent to clipboard
	if ${SEND_TO_CLIPBOARD}; then
		if [[ "${OSTYPE}" == "darwin"* ]] && hascommand --strict pbcopy; then
			# macOS
			echo -n "${CLIPBOARD_CONTENT}" | pbcopy
		elif hascommand --strict wl-copy && [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
			# Wayland
			echo -n "${CLIPBOARD_CONTENT}" | wl-copy &>/dev/null
		elif hascommand --strict xclip; then
			# X11 - xclip
			echo -n "${CLIPBOARD_CONTENT}" | xclip -selection clipboard &>/dev/null
		elif hascommand --strict xsel; then
			# X11 - xsel
			echo -n "${CLIPBOARD_CONTENT}" | xsel -ib &>/dev/null
		fi
	else
		# Handle content that needs to be pasted from clipboard
		if [[ "${OSTYPE}" == "darwin"* ]] && hascommand --strict pbpaste; then
			# macOS
			pbpaste
		elif hascommand --strict wl-paste && [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
			# Wayland
			wl-paste
		elif hascommand --strict xclip; then
			# X11 - xclip
			xclip -o -selection clipboard
		elif hascommand --strict xsel; then
			# X11 - xsel
			xsel -ob
		fi
	fi

	# If Tmux is running and there is content for the clipboard...
	if [[ -n "${TMUX}" ]] && [[ -n "${CLIPBOARD_CONTENT}" ]]; then
		echo -n "${CLIPBOARD_CONTENT}" | tmux loadb -
	fi
}

# Copy a file's contents to the clipboard
function file2cb() {
	# Check for parameters...
	if [[ $# -eq 0 ]]; then
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}file2cb ${BRIGHT_YELLOW}[filename]${BRIGHT_WHITE}"
		echo -e "${BRIGHT_WHITE}Copy a file's contents to the clipboard.${RESET}"
		return 1
	# Check if the file exists...
	elif [[ ! -f "$1" ]]; then
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}The file ${BRIGHT_YELLOW}$1${BRIGHT_CYAN} does not exist.${RESET}"
		return 1
	fi
	command cat "$1" | clipboard
}

# Save the clipboard contents to a file
function cb2file() {
	if [[ $# -eq 0 ]]; then
		echo -e "${BRIGHT_WHITE}cb2file:${RESET} Save the clipboard contents to a file"
		echo -e "${BRIGHT_WHITE}Usage:${BRIGHT_CYAN} cb2file${RESET} ${BRIGHT_YELLOW}<filename>${RESET}"
		return 1
	fi
	clipboard > "$1"
}

# Dump the clipboard contents to the console
function cbshow() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}cbshow${RESET}: Display current clipboard contents"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}cbshow${RESET}"
		return 0
	fi

	clipboard
}

# When using the which command, copy the output to the clipboard or Tmux buffer
alias which='_which_to_clipboard'
# Call the 'which' command and copy its output to clipboard
function _which_to_clipboard() {
	# Get the path of the requested which command
	local WHICH_OUTPUT=$(command which "$@" 2>&1)

	# Capture the exit status of the 'which' command
	local EXIT_STATUS=$?

	# Check if 'which' output is non-empty and not "/usr/bin/grc"
	if [[ ${EXIT_STATUS} -eq 0 ]] && [[ "${WHICH_OUTPUT}" != "/usr/bin/grc" ]]; then
		# Copy the output to clipboard and display in terminal
		echo "${WHICH_OUTPUT}" | clipboard
	fi

	# Display the standard output of 'which'
	echo "${WHICH_OUTPUT}"

	# Return the captured exit status
	return ${EXIT_STATUS}
}

# When using the pwd command, copy the directory to the clipboard or Tmux buffer
alias pwd='_pwd_to_clipboard'
function _pwd_to_clipboard() {
	# Run the real pwd command and capture its output
	local _PWD_OUTPUT="$(command pwd "$@")"
	echo "${_PWD_OUTPUT}"

	# If we are not in the enhancd program folder...
	if [[ "${PWD}" != *"/enhancd" ]]; then
		# Use the new clipboard command to copy the output
		clipboard "${_PWD_OUTPUT}"
	fi
}

# Compress a file (even binary files) to the clipboard as base64 text
function file2asc() {
	# Check if a parameter was passed and if the file exists
	if [[ ${#} -eq 0 ]] || [[ ! -f "${1}" ]]; then
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}file2asc${RESET} ${BRIGHT_GREEN}[filename]${RESET}"
		return 1
	fi

	# Check if gzip is installed
	if ! hascommand --strict gzip; then
		>&2 echo "Requires gzip/gunzip"
		return 1
	fi

	# Create the base64-encoded gzipped content
	# SC2155: split declaration so gzip/base64 failure isn't masked
	local ENCODED_CONTENT
	ENCODED_CONTENT=$(command cat "${1}" | gzip -9 | base64)

	# Send the content to clipboard
	if clipboard "${ENCODED_CONTENT}"; then
		echo "The clipboard now contains the file: ${1}"
	else
		# If clipboard function couldn't handle the content, fallback

		# We might have a headless environment with no clipboard
		if [[ -z "${PAGER}" ]]; then
			printf '=%.0s' {1..80}; echo
			echo "${ENCODED_CONTENT}"
			printf '=%.0s' {1..80}; echo
		else # Use the pager
			# To save text as a file from less, type s then type the file name
			echo "${ENCODED_CONTENT}" | "${PAGER}"
		fi
	fi

	# Done!
	echo "Use asc2file to convert the base64 ASCII text to a file."
}

# Convert compressed base64 clipboard back to a file
function asc2file() {
	# If no parameters...
	if [[ ${#} -eq 0 ]]; then
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}asc2file${RESET} ${BRIGHT_GREEN}[filename]${RESET}"
		return 1
	fi

	# Check for gunzip
	if ! hascommand --strict gunzip; then
		>&2 echo "Requires gzip/gunzip"
		return 1
	fi

	# Fetch the current clipboard content
	local CLIPBOARD_CONTENT=$(clipboard)
	if [[ -z "${CLIPBOARD_CONTENT}" ]]; then
		echo -e "${BRIGHT_YELLOW}Paste the text and press ${BRIGHT_CYAN}CTRL+d${BRIGHT_YELLOW} when done:${RESET} "
		CLIPBOARD_CONTENT=$(</dev/stdin)
	fi

	# Decode and gunzip the clipboard content, then save to file
	echo "${CLIPBOARD_CONTENT}" | base64 -di | gunzip > "${1}"

	# Display the saved file path
	if hascommand --strict realpath; then
		echo "The file was saved: $(command realpath "${1}")"
	else
		echo "The file was saved: ${1}"
	fi
}

# Convert an image to compressed JPG format
alias {png2jpg,image2jpg}='compressimage'
function compressimage() {
	# Show help message if no parameters are provided
	if [[ -z "$1" ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}compressimage${RESET}: Convert an image to compressed JPG format"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}compressimage${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}image${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}quality${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Defaults:${RESET} quality=85 (range 1-100)"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}compressimage${RESET} ${BRIGHT_YELLOW}screenshot.png${RESET}  ${BRIGHT_BLUE}# Use default quality${RESET}"
		echo -e "  ${BRIGHT_CYAN}compressimage${RESET} ${BRIGHT_YELLOW}photo.png${RESET} ${BRIGHT_GREEN}90${RESET}    ${BRIGHT_BLUE}# Higher quality${RESET}"
		echo -e "  ${BRIGHT_CYAN}compressimage${RESET} ${BRIGHT_YELLOW}large.png${RESET} ${BRIGHT_GREEN}60${RESET}    ${BRIGHT_BLUE}# More compression${RESET}"
		return 1
	fi

	# Check if ImageMagick's 'convert' and 'identify' commands are available
	if ! hascommand --strict convert || ! hascommand --strict identify; then
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}ImageMagick is not installed. Please install it first.${RESET}"
		return 1
	fi

	# Check if the input image file exists
	if [ ! -f "$1" ]; then
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}The input image file ${BRIGHT_YELLOW}$1${BRIGHT_CYAN} does not exist.${RESET}"
		return 1
	fi

	# Default quality setting
	local QUALITY=85

	# Validate optional quality argument
	if [ ! -z "$2" ]; then
		if [[ ! "$2" =~ ^[0-9]+$ ]] || [ "$2" -le 0 ] || [ "$2" -gt 100 ]; then
			echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Invalid quality percentage. It should be a positive integer between 1 and 100.${RESET}"
			return 1
		fi
		QUALITY=$2
	fi

	# Extract file name and output to the same directory as the source file
	local INPUT_FILENAME
	INPUT_FILENAME=$(basename -- "$1")
	local INPUT_DIR
	INPUT_DIR=$(dirname -- "$1")
	local OUTPUT_FILENAME="${INPUT_DIR}/${INPUT_FILENAME%.*}.jpg"

	# Perform the conversion
	convert "$1" -quality ${QUALITY} "${OUTPUT_FILENAME}"

	echo -e "${BRIGHT_GREEN}Success: ${BRIGHT_WHITE}Converted ${BRIGHT_YELLOW}$1${BRIGHT_WHITE} to ${BRIGHT_YELLOW}${OUTPUT_FILENAME}${BRIGHT_WHITE} with quality ${BRIGHT_YELLOW}${QUALITY}%${RESET}."
}

# Converts a markdown title string into a markdown tag
alias md2tag='convert2mdtag'
function convert2mdtag() {
	# Help text
	if [[ -z "${1}" ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}convert2mdtag${RESET}: Convert a heading to a markdown anchor link"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}convert2mdtag${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}heading${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Creates [Title](#anchor) format, copies to clipboard${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}convert2mdtag${RESET} ${BRIGHT_YELLOW}'## My Section'${RESET}  ${BRIGHT_BLUE}# [My Section](#my-section)${RESET}"
		echo -e "  ${BRIGHT_CYAN}convert2mdtag${RESET} ${BRIGHT_YELLOW}'Hello World'${RESET}    ${BRIGHT_BLUE}# [Hello World](#hello-world)${RESET}"
		return 0
	fi

	# Trim leading '#' or spaces and trailing spaces
	local TRIMMED_INPUT=$(echo "${1}" | sed -e 's/^[\# ]*//' -e 's/[ ]*$//')

	# Convert to lowercase, replace spaces with hyphens,
	# remove unwanted characters, and fix double dashes
	local TAG=$(echo "${TRIMMED_INPUT,,}" | sed -e 's/ /-/g' | tr -dc 'a-z0-9-' | sed 's/--*/-/g')

	# Output the result in the desired markdown link format
	echo "[${TRIMMED_INPUT}](#${TAG})" | clipboard
	echo "[${TRIMMED_INPUT}](#${TAG})"
}

# Remove unneeded execute permissions from strictly non-executable file types
# It is good practice to remove execute permissions from data files to enhance
# security, as files masquerading as these types could potentially be malicious
function fixinvalidexecutepermissions() {
	# Parse arguments to check for help flag
	local TARGET_DIRECTORY
	local SHOW_HELP=false

	# Process parameters
	while [[ $# -gt 0 ]]; do
		case "${1}" in
			-h|--help)
				SHOW_HELP=true
				shift
				;;
			*)
				# First non-flag argument is treated as target directory
				if [[ -z "${TARGET_DIRECTORY}" ]]; then
					TARGET_DIRECTORY="${1}"
				fi
				shift
				;;
		esac
	done

	# Show help if requested
	if ${SHOW_HELP}; then
		echo -e "${BRIGHT_CYAN}fixinvalidexecutepermissions${RESET}: Remove execute permissions from non-executable file types"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}fixinvalidexecutepermissions${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}directory${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Removes +x from docs, images, fonts, archives, etc.${RESET}"
		echo -e "  ${BRIGHT_BLUE}Enhances security by preventing accidental execution${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}fixinvalidexecutepermissions${RESET}              ${BRIGHT_BLUE}# Current directory${RESET}"
		echo -e "  ${BRIGHT_CYAN}fixinvalidexecutepermissions${RESET} ${BRIGHT_GREEN}~/Documents${RESET}  ${BRIGHT_BLUE}# Specific directory${RESET}"
		return 0
	fi

	# Use current directory as default if no directory specified
	TARGET_DIRECTORY="${TARGET_DIRECTORY:-.}"

	# Check if the user can execute sudo commands
	if ! sudo -v; then
		echo -e "${BRIGHT_RED}Error:${RESET} You do not have sufficient permissions to run this script with necessary privileges"
		return 1
	fi

	# Confirmation prompt using the provided ask function
	if ask "${BRIGHT_MAGENTA}Do you want to remove invalid execute permissions in directory: ${BRIGHT_CYAN}${TARGET_DIRECTORY}${RESET}" Y; then
		# Ask about including Git directories
		local INCLUDE_GIT=false
		if ask "${BRIGHT_MAGENTA}Include Git directories for execute permissions cleanup?${RESET} ${BRIGHT_YELLOW}(Not recommended)${RESET}" N; then
			INCLUDE_GIT=true
		fi

		# Document and Text Files
		local -a doc_extensions=(
			"ans" "asc" "azw" "azw3" "azw4" "cfg" "chm" "clf" "cnf" "conf" "csv"
			"doc" "docx" "dot" "dotx" "ebook" "eml" "epub" "fdf" "hlp" "htm"
			"html" "htmlz" "ics" "inf" "ini" "lng" "log" "lst" "mcw" "mht"
			"mobi" "mpp" "msg" "nfo" "odp" "ods" "odt" "opf" "org" "ott" "pdf"
			"plist" "po" "pot" "pps" "ppt" "pptx" "prn" "properties" "rpt" "rst"
			"rtf" "slk" "sxw" "template" "tex" "toc" "txt" "url" "wb1" "wk1"
			"wk3" "wk4" "wp5" "wpd" "wps" "wri" "wtf" "xls" "xlsm" "xlsx"
			"xlsxm" "xlt" "xlw" "xps" "xslt"
		)

		# Non-Executable Code and Markup Files (should never contain a shebang)
		local -a code_extensions=(
			"ascx" "c" "cc" "config" "cpp" "css" "ctl" "cxx" "dtd" "editorconfig"
			"exp" "frx" "h" "handlebars" "hpp" "htc" "inc" "jshintrc" "json"
			"jsonl" "kwinrule" "less" "mak" "manifest" "md" "mm" "mo" "proj"
			"project" "pxd" "qml" "rc" "res" "resx" "sass" "scc" "scss" "sql"
			"strings" "tpl" "vsixmanifest" "xhtml" "xlf" "xml" "xsd" "yaml" "yml"
		)

		# Font Files
		local -a font_extensions=(
			"afm" "eot" "fnt" "fon" "otf" "ttc" "ttf" "ufm" "woff" "woff2"
		)

		# Image Files
		local -a image_extensions=(
			"afdesign" "afphoto" "ai" "ani" "blp" "bmp" "bpg" "bw" "cbz" "cbr"
			"cdr" "cgm" "cpt" "cur" "dcx" "dib" "drw" "emf" "eps" "exif" "gif"
			"hdr" "heic" "heif" "ico" "idml" "iff" "ilbm" "img" "indd" "indl"
			"indt" "jfif" "jif" "jpeg" "jpg" "kdc" "lbm" "pbm" "pcd" "pcx" "pdn"
			"pgm" "pic" "pix" "png" "pnm" "ppm" "ps" "psd" "psp" "pspimage"
			"raw" "rgb" "rgba" "rle" "sgi" "spp" "svg" "svgz" "tga" "tif" "tiff"
			"vml" "webp" "wmf" "xcf" "xisf" "xmp"
		)

		# Audio Files
		local -a audio_extensions=(
			"8svx" "aa" "aac" "aax" "acm" "act" "aip" "amr" "as" "au" "awb"
			"cda" "dct" "dsm" "dss" "dvf" "dwd" "flac" "gsm" "iklax" "it" "ivs"
			"m3u" "m4a" "m4b" "m4p" "mid" "midi" "mmf" "mod" "mogg" "mp1" "mp2"
			"mp3" "mpa" "mpc" "msv" "mtm" "nmf" "nsf" "oga" "ogg" "opus" "pcm"
			"pls" "ra" "rmi" "s3m" "sam" "sln" "smp" "snd" "stm" "svx" "vba"
			"vce" "voc" "vox" "wav" "wma" "wv" "xm"
		)

		# Video Files
		local -a video_extensions=(
			"3g2" "3gp" "asf" "asx" "avi" "divx" "fla" "flv" "m1v" "m4v" "mkv"
			"mov" "mp4" "mpe" "mpeg" "mpg" "mpv" "qt" "qtif" "ram" "rm" "rmd"
			"rmm" "rp" "rt" "smi" "smil" "swf" "ts" "viv" "vob" "webm" "wmv"
		)

		# Subtitle Files
		local -a subtitle_extensions=(
			"srt" "sub" "vtt"
		)

		# Gaming and Emulation Files
		local -a gaming_emulation_extensions=(
			"chd" "gba" "gcm" "nds" "nes" "rom" "sav" "sfc" "state" "wad"
		)

		# Archive Files
		local -a archive_extensions=(
			"7z" "ace" "arj" "bz2" "cab" "csv.gz" "cue" "deb" "dmg" "ex_" "gz"
			"iso" "isz" "lha" "log.gz" "lzh" "mdf" "mds" "nrg" "pak" "pkg" "rar"
			"rar5" "rpm" "sitx" "tar" "tar.bz2" "tar.gz" "tgz" "xpi" "z" "zip"
			"zipx"
		)

		# Backup and Temporary Files
		local -a backup_temp_extensions=(
			"~" "bac" "backup" "bak" "bkp" "old" "orig" "original" "snapshot"
			"swp" "temp" "tmp"
		)

		# Checksum and Security Files
		local -a checksum_security_extensions=(
			"crc" "md5" "md5sum" "par" "par2" "sha1" "sha1sum" "sha256"
			"sha256sum" "sha512"
		)

		# Key and Certificate Files
		local -a key_certs_extensions=(
			"cer" "cert" "crt" "csr" "der" "jks" "key" "p12" "pfx" "pem" "ppk"
			"pub" "pubkey" "sig"
		)

		# Database Files
		local -a database_extensions=(
			"accdb" "db" "db3" "dbf" "idx" "mdb" "sqlite" "sqlite3"
		)

		# Miscellaneous Utilities
		local -a misc_utilities_extensions=(
			"cat" "chk" "cpl" "dat" "dll" "dmp" "drv" "dylib" "icl" "lib" "ocb"
			"ocx" "opml" "ost" "part" "pdb" "prefs" "pst" "reg" "rnd" "rng"
			"sys" "tlb" "torrent" "vxd" "wasm"
		)

		# Configuration Files
		local -a config_files=(
			".aspell.*.prepl" ".aspell.*.pws" ".bash_history" ".bash_logout"
			".bash_profile" ".bashrc" ".cshrc" ".csslintrc" ".cvsignore"
			".dircolors" ".dmrc" ".eslintrc" ".env" ".gitconfig" ".gitignore"
			".gitmodules" ".gtkrc-2.0" ".htaccess" ".htpasswd" ".ICEauthority"
			".inputrc" "Jenkinsfile" ".kshrc" ".lesshst" ".nanorc"
			".node_repl_history" ".npmignore" ".nvmrc" ".rnd" ".screenrc"
			".steampath" ".steampid" ".tmux.conf" ".vimrc" ".vuescanrc"
			".wget-hsts" ".Xauthority" ".Xclients" ".xinitrc" ".Xmodmap"
			".xprofile" ".Xresources" ".xscreensaver" ".yarnrc" ".zshrc"
		)

		# Combine all extensions into one array
		local -a all_extensions=(
			"${doc_extensions[@]}"
			"${code_extensions[@]}"
			"${font_extensions[@]}"
			"${image_extensions[@]}"
			"${audio_extensions[@]}"
			"${video_extensions[@]}"
			"${subtitle_extensions[@]}"
			"${gaming_emulation_extensions[@]}"
			"${archive_extensions[@]}"
			"${backup_temp_extensions[@]}"
			"${checksum_security_extensions[@]}"
			"${key_certs_extensions[@]}"
			"${database_extensions[@]}"
			"${misc_utilities_extensions[@]}"
		)

		# Build the find command arguments for file extensions and config files
		local -a FIND_ARGS=()
		local EXTENSION
		for EXTENSION in "${all_extensions[@]}"; do
			FIND_ARGS+=( -iname "*.${EXTENSION}" -o )
		done

		# Add patterns for configuration files (exact filenames)
		local FILENAME
		for FILENAME in "${config_files[@]}"; do
			FIND_ARGS+=( -iname "${FILENAME}" -o )
		done

		# Remove the last '-o' (logical OR) to prevent syntax error
		unset 'FIND_ARGS[${#FIND_ARGS[@]}-1]'

		# Construct find command based on whether to include Git directories
		if ${INCLUDE_GIT}; then
			# Include Git directories in the search
			sudo find "${TARGET_DIRECTORY}" \
				-type f \( "${FIND_ARGS[@]}" \) \
				-exec chmod a-x {} +
			echo -e "${BRIGHT_GREEN}✓${RESET} Execute permissions have been removed from non-executable files ${BRIGHT_YELLOW}(including Git directories)${RESET}"
		else
			# Exclude Git directories from the search using prune
			sudo find "${TARGET_DIRECTORY}" \
				-type d -name ".git" -prune -o \
				-type f \( "${FIND_ARGS[@]}" \) \
				-exec chmod a-x {} +
			echo -e "${BRIGHT_GREEN}✓${RESET} Execute permissions have been removed from non-executable files ${BRIGHT_BLUE}(Git directories excluded)${RESET}"
		fi
	else
		return 1
	fi
}

# Fixes permissions in a user's home folder
# If no user is specified, the current user is selected
function fixuserhome() {
	# Validate input parameters
	local _username
	if [[ -z "${1}" ]]; then
		_username="$(whoami)"
	else
		_username="${1}"
	fi

	# Attempt to retrieve the home directory
	# SC2155: split declaration so getent failure isn't masked
	local _home_dir
	_home_dir=$(getent passwd "${_username}" 2>/dev/null | cut -d: -f6)

	# Check if the retrieved directory is valid and exists
	if [[ -z "${_home_dir}" ]] || [[ ! -d "${_home_dir}" ]]; then
		# Default to /home/username if no valid directory is found
		_home_dir="/home/${_username}"
	fi

	# Verify if the home folder exists
	if [ -d "${_home_dir}" ]; then
		echo -e "Home directory found: ${BRIGHT_YELLOW}${_home_dir}${RESET}"
	else
		echo -e "${BRIGHT_RED}Error:${RESET} User ${BRIGHT_CYAN}${_username}${RESET} does not have a home directory"
		return 1
	fi

	# Check if the user can execute sudo commands
	if ! sudo -v; then
		echo -e "${BRIGHT_RED}Error:${RESET} You do not have sufficient permissions to run this script with necessary privileges"
		return 1
	fi

	# Confirm with the user
	if ask "${BRIGHT_RED}WARNING:${RESET} Change all permissions for user ${BRIGHT_CYAN}${_username}${RESET}'s home folder?" N; then

		if ask "Reset group ownership permissions to ${BRIGHT_CYAN}${_username}${RESET}?" Y; then
			runwithfeedback \
				"Set the owner and group as ${_username}" \
				"sudo chown -R '${_username}':'${_username}' '${_home_dir}'"
		else
			runwithfeedback \
				"Set the owner and group as ${_username}" \
				"sudo chown -R '${_username}' '${_home_dir}'"
		fi

		# Remove unneeded execute permissions from strictly non-executable file types
		fixinvalidexecutepermissions "${_home_dir}"

		runwithfeedback \
			"Make sure we have read and write access" \
			"chmod -R u+rw '${_home_dir}'"

		runwithfeedback \
			"Remove write access from group" \
			"chmod -R g-w '${_home_dir}'"

		runwithfeedback \
			"Remove all access from others" \
			"chmod -R o-rwx '${_home_dir}'"

		runwithfeedback \
			"Make .sh shell script files executable" \
			"find '${_home_dir}' -type f \( -name \"*.sh\" -o -name \".*.sh\" \) -exec chmod ug+x {} \;"

		runwithfeedback \
			"Make sure all directories have execute permissions" \
			"chmod -R ug+X '${_home_dir}'"

		# Remove group permissions for directories without group read
		runwithfeedback \
			"Remove group permissions for directories without group read" \
			"find '${_home_dir}' -type d ! -perm -g+r -execdir chmod g-wx {} \;"

		if [[ -d "${_home_dir}/.local/share/kwalletd" ]]; then
			runwithfeedback \
				"User only access to KDE Wallet keyring" \
				"chmod -R go-rwx '${_home_dir}/.local/share/kwalletd'"
		fi

		# If there is a ~/.local/share/keyrings directory...
		if [[ -d "${_home_dir}/.local/share/keyrings" ]]; then
			runwithfeedback \
				"User only access to GNOME keyring" \
				"chmod -R go-rwx '${_home_dir}/.local/share/keyrings'"
		fi

		# If there is an .ssh directory...
		if [[ -d "${_home_dir}/.ssh" ]]; then
			# Setting ownership for .ssh directory and files
			runwithfeedback \
				"Setting ownership for .ssh directory and files" \
				"chown -R '${_username}':'${_username}' '${_home_dir}/.ssh'"

			# Setting strict permissions for .ssh and private keys
			runwithfeedback \
				"User only access to .ssh and private keys" \
				"chmod -R go-rwx '${_home_dir}/.ssh'"
		fi

		# If there is a .putty directory...
		if [[ -d "${_home_dir}/.putty" ]]; then
			runwithfeedback \
				"User only access to .putty and ssh keys" \
				"chmod -R go-rwx '${_home_dir}/.putty'"
		fi

		# If there is a .pki directory...
		if [[ -d "${_home_dir}/.pki" ]]; then
			runwithfeedback \
				"User only access to .pki keys and certificates" \
				"chmod -R go-rwx '${_home_dir}/.pki'"
		fi

		# If there is a .gnupg directory...
		if [[ -d "${_home_dir}/.gnupg" ]]; then
			runwithfeedback \
				"User only access to .gnupg and private keys" \
				"chmod -R go-rwx '${_home_dir}/.gnupg'"
		fi

		# If KeePassXC/KeePass/KeeWeb is installed...
		if hascommand --strict keepassxc || hascommand --strict keepass || hascommand --strict keeweb; then
			runwithfeedback \
				"User only access to KeePassXC/KeePass/KeeWeb .kdbx files" \
				"find '${_home_dir}' -type f \( -name '*.kdbx' -o -name '.*.kdbx' \) -exec chmod go-rwx {} \;"
		fi

		# If there is a pass directory...
		if [[ -d "${_home_dir}/.password-store" ]]; then
			runwithfeedback \
				"User only access to pass data" \
				"chmod -R go-rwx '${_home_dir}/.password-store'"
		fi

		# If there is a Bitwarden directory...
		if [[ -d "${_home_dir}/.config/Bitwarden" ]]; then
			runwithfeedback \
				"User only access to Bitwarden data" \
				"chmod -R go-rwx '${_home_dir}/.config/Bitwarden'"
		fi
		if [[ -d "${_home_dir}/.var/app/com.bitwarden.desktop" ]]; then
			runwithfeedback \
				"User only access to Bitwarden data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/com.bitwarden.desktop'"
		fi

		# Check for Tor settings
		if [[ -d "${_home_dir}/.local/share/torbrowser" ]]; then
			runwithfeedback \
				"User only access to Tor browser data" \
				"chmod -R go-rwx '${_home_dir}/.local/share/torbrowser'"
		fi
		if [[ -d "${_home_dir}/.var/app/com.github.micahflee.torbrowser-launcher" ]]; then
			runwithfeedback \
				"User only access to Tor browser data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/com.github.micahflee.torbrowser-launcher'"
		fi

		# Check for Brave settings
		if [[ -d "${_home_dir}/.config/BraveSoftware" ]]; then
			runwithfeedback \
				"User only access to Brave browser data" \
				"chmod -R go-rwx '${_home_dir}/.config/BraveSoftware'"
		fi
		if [[ -d "${_home_dir}/.var/app/com.brave.Browser" ]]; then
			runwithfeedback \
				"User only access to Brave browser data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/com.brave.Browser'"
		fi

		# Check for Chrome settings
		if [[ -d "${_home_dir}/.config/google-chrome" ]]; then
			runwithfeedback \
				"User only access to Chrome browser data" \
				"chmod -R go-rwx '${_home_dir}/.config/google-chrome'"
		fi
		if [[ -d "${_home_dir}/.var/app/com.google.Chrome" ]]; then
			runwithfeedback \
				"User only access to Chrome browser data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/com.google.Chrome'"
		fi

		# Check for Chromium settings
		if [[ -d "${_home_dir}/.config/chromium" ]]; then
			runwithfeedback \
				"User only access to Chromium browser data" \
				"chmod -R go-rwx '${_home_dir}/.config/chromium'"
		fi
		if [[ -d "${_home_dir}/.var/app/org.chromium.Chromium" ]]; then
			runwithfeedback \
				"User only access to Chromium browser data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/org.chromium.Chromium'"
		fi
		if [[ -d "${_home_dir}/.var/app/net.sourceforge.chromium-bsu" ]]; then
			runwithfeedback \
				"User only access to Ungoogled Chromium browser data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/net.sourceforge.chromium-bsu'"
		fi

		# Check for Firefox settings
		if [[ -d "${_home_dir}/.mozilla" ]]; then
			runwithfeedback \
				"User only access to Firefox browser data" \
				"chmod -R go-rwx '${_home_dir}/.mozilla'"
		fi
		if [[ -d "${_home_dir}/.var/app/org.mozilla.firefox" ]]; then
			runwithfeedback \
				"User only access to Firefox browser data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/org.mozilla.firefox'"
		fi

		# Check for LibreWolf settings
		if [[ -d "${_home_dir}/.librewolf" ]]; then
			runwithfeedback \
				"User only access to LibreWolf browser data" \
				"chmod -R go-rwx '${_home_dir}/.librewolf'"
		fi
		if [[ -d "${_home_dir}/.var/app/io.gitlab.librewolf-community" ]]; then
			runwithfeedback \
				"User only access to LibreWolf browser data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/io.gitlab.librewolf-community'"
		fi

		# Check for Opera settings
		if [[ -d "${_home_dir}/.config/opera" ]]; then
			runwithfeedback \
				"User only access to Opera browser data" \
				"chmod -R go-rwx '${_home_dir}/.config/opera'"
		fi

		# Check for Vivaldi settings
		if [[ -d "${_home_dir}/.config/vivaldi" ]]; then
			runwithfeedback \
				"User only access to Vivaldi browser data" \
				"chmod -R go-rwx '${_home_dir}/.config/vivaldi'"
		fi

		# Check for Microsoft Edge settings
		if [[ -d "${_home_dir}/.config/microsoft-edge" ]]; then
			runwithfeedback \
				"User only access to Microsoft Edge browser data" \
				"chmod -R go-rwx '${_home_dir}/.config/microsoft-edge'"
		fi
		if [[ -d "${_home_dir}/.config/microsoft-edge-beta" ]]; then
			runwithfeedback \
				"User only access to Microsoft Edge browser data" \
				"chmod -R go-rwx '${_home_dir}/.config/microsoft-edge-beta'"
		fi

		# Check for Evolution settings
		if [[ -d "${_home_dir}/.config/evolution" ]]; then
			runwithfeedback \
				"User only access to Evolution email data" \
				"chmod -R go-rwx '${_home_dir}/.config/evolution'"
		fi
		if [[ -d "${_home_dir}/.var/app/org.gnome.Evolution" ]]; then
			runwithfeedback \
				"User only access to Evolution email data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/org.gnome.Evolution'"
		fi

		# Check for Geary settings
		if [[ -d "${_home_dir}/.local/share/geary" ]]; then
			runwithfeedback \
				"User only access to Geary email data" \
				"chmod -R go-rwx '${_home_dir}/.local/share/geary'"
		fi
		if [[ -d "${_home_dir}/.var/app/org.gnome.Geary" ]]; then
			runwithfeedback \
				"User only access to Geary email data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/org.gnome.Geary'"
		fi

		# Check for Thunderbird settings
		if [[ -d "${_home_dir}/.thunderbird" ]]; then
			runwithfeedback \
				"User only access to Thunderbird email data" \
				"chmod -R go-rwx '${_home_dir}/.thunderbird'"
		fi
		if [[ -d "${_home_dir}/.var/app/org.mozilla.Thunderbird" ]]; then
			runwithfeedback \
				"User only access to Thunderbird email data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/org.mozilla.Thunderbird'"
		fi

		# Check for Element settings
		if [[ -d "${_home_dir}/.config/Element" ]]; then
			runwithfeedback \
				"User only access to Element chat data" \
				"chmod -R go-rwx '${_home_dir}/.config/Element'"
		fi
		if [[ -d "${_home_dir}/.var/app/im.riot.Riot" ]]; then
			runwithfeedback \
				"User only access to Element chat data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/im.riot.Riot'"
		fi

		# Check for Signal settings
		if [[ -d "${_home_dir}/.config/Signal" ]]; then
			runwithfeedback \
				"User only access to Signal chat data" \
				"chmod -R go-rwx '${_home_dir}/.config/Signal'"
		fi
		if [[ -d "${_home_dir}/.var/app/org.signal.Signal" ]]; then
			runwithfeedback \
				"User only access to Signal chat data (Flatpak)" \
				"chmod -R go-rwx '${_home_dir}/.var/app/org.signal.Signal'"
		fi

		if [[ -f "${_home_dir}/.config/birthdays.csv" ]]; then
			runwithfeedback \
				"User only access to birthday/anniversary reminder data" \
				"chmod 600 '${_home_dir}/.config/birthdays.csv'"
		elif [[ -f "${_BDAY_FILE}" ]]; then
			runwithfeedback \
				"User only access to birthday/anniversary reminder data (from variable)" \
				"chmod 600 \"${_BDAY_FILE}\""
		fi

		# [OPTIONAL] Copy group permissions to other
		#runwithfeedback \
		#	"Copy group permissions to other" \
		#	"chmod -R o=g ${_home_dir}"

		# [OPTIONAL] Copy user permissions to group
		#runwithfeedback \
		#	"Copy user permissions to group" \
		#	"chmod -R g=u ${_home_dir}"

		# Set the setgid bit, so that files/folder under the directory
		# will be created with the same group as <directory>
		runwithfeedback \
			"Set the setgid bit to inherit folder permissions" \
			"chmod g+s '${_home_dir}'"

		# If Access Control Lists (ACL) is installed...
		# To "activate" ACL, you have to remount the drive with the "acl" option
		# NOTE: Btrfs and Xfs filesystem use the ACL mount option by default
		# Example /etc/fstab Entry:
		# UUID=abc123def456 / ext4 defaults,acl 0 1
		# Type "man acl" for more information
		if hascommand --strict setfacl; then
			# Use getfacl [directory] to check ACL for these directories
			runwithfeedback \
				"Set user default ACL entries" \
				"setfacl -d -m u::rwx '${_home_dir}'"
			runwithfeedback \
				"Set group default ACL entries" \
				"setfacl -d -m g::rx '${_home_dir}'"
			runwithfeedback \
				"Set others default ACL entries" \
				"setfacl -d -m o::--- '${_home_dir}'"
		fi

		echo "Done!"
	else
		return 0
	fi
}

# Copy over configuration settings from one account to root/default/another
# It also handles special cases for 'root' and 'default' (skel) directories
# Syntax:
#    configcopy [from_user] [to_user]
# Parameters:
#    from_user - The user from whom to copy the configuration files
#    to_user   - The user to whom to copy the configuration files
# Examples:
#     configcopy alice jimbob # Copies files from user alice's home to bob's home
#     configcopy default root # Copies files from /etc/skel to /root
alias copyconfig='configcopy'
function configcopy() {
	# Config files to copy over
	declare -a files=(
		".bash_logout"
		".bash_profile"
		".bashrc"
		".bashrc_help"
		".commacd.sh"
		".config/alacritty/alacritty.toml"
		".config/alacritty/alacritty.yml"
		".config/bat/config"
		".config/btop/btop.conf"
		".config/dolphinrc"
		".config/fresh/config.json"
		".config/git/config"
		".config/git/ignore"
		".config/gtkrc"
		".config/helix/config.toml"
		".config/katerc"
		".config/kitty/kitty.conf"
		".config/konsolerc"
		".config/konsolesshconfig"
		".config/kwriterc"
		".config/lazygit/config.yml"
		".config/micro/bindings.json"
		".config/micro/settings.json"
		".config/Notepadqq/Notepadqq.ini"
		".config/nvim/init.lua"
		".config/nvim/init.vim"
		".config/picom/picom.conf"
		".config/starship.toml"
		".config/Typora/conf/conf.user.json"
		".config/Typora/themes/base.user.css"
		".config/Typora/themes/jeff.css"
		".config/Typora/themes/night.user.css"
		".config/VSCodium/User/settings.json"
		".config/yakuakerc"
		".config/yt-dlp/config"
		".curlrc"
		".dircolors"
		".editorconfig"
		".gitconfig"
		".gitignore_global"
		".gtkrc-2.0"
		".inputrc"
		".nanorc"
		".p10k.zsh"
		".profile"
		".ripgreprc"
		".screenrc"
		".selected_editor"
		".tmux.conf"
		".vimrc"
		".wgetrc"
		".Xmodmap"
		".xprofile"
		".Xresources"
		".zshrc"
		"git-completion.bash"
		"git-prompt.sh"
		"gitalias.txt"
	)

	# Config directories to copy over
	declare -a dirs=(
		".config/alacritty"
		".config/bashrc"
		".config/bashrc/.qfc"
		".config/bashrc/bashmarks"
		".config/bashrc/enhancd"
		".config/bashrc/fzf-tab-completion"
		".config/bashrc/hstr"
		".config/bat"
		".config/btop"
		".config/devilspie2"
		".config/fish"
		".config/flameshot"
		".config/fontconfig"
		".config/geany"
		".config/ghostty"
		".config/git"
		".config/gtk-3.0"
		".config/gtk-4.0"
		".config/htop"
		".config/kitty"
		".config/Kvantum"
		".config/lazygit"
		".config/lxterminal"
		".config/mc"
		".config/micro/colorschemes"
		".config/micro/plug"
		".config/mpv"
		".config/nvim"
		".config/qterminal.org"
		".config/ranger"
		".config/rofi"
		".config/sxhkd"
		".config/swhkd"
		".config/terminator"
		".config/wezterm"
		".config/yt-dlp"
		".local/share/blesh/src/ble.sh"
		".local/share/dolphin"
		".local/share/konsole"
		".local/share/kxmlgui5/dolphin"
		".local/share/kxmlgui5/konsole"
		".local/share/qtermwidget6/color-schemes"
		".qfc"
		".vim"
		"bashmarks"
		"ble.sh"
		"enhancd"
		"fzf-tab-completion"
		"hstr"
	)

	# Declare routing variables as local to avoid polluting global scope
	local dirfrom dirto owner

	if [[ -z "${1}" ]] || [[ -z "${2}" ]] || [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}configcopy${RESET}: Copy config files between users"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}configcopy${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}from_user${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}to_user${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Special users:${RESET} ${BRIGHT_CYAN}root${RESET}, ${BRIGHT_CYAN}default${RESET} (/etc/skel)"
		echo -e "${BRIGHT_WHITE}Available users:${RESET} ${BRIGHT_CYAN}$(command awk -F: '$3 ~ /^[0-9]{4}$/' /etc/passwd | command cut -d: -f1 | command tr '\n' ' ' | command sed 's/[[:space:]]*$//')${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}configcopy${RESET} ${BRIGHT_YELLOW}alice bob${RESET}     ${BRIGHT_BLUE}# Copy from alice to bob${RESET}"
		echo -e "  ${BRIGHT_CYAN}configcopy${RESET} ${BRIGHT_YELLOW}default root${RESET}  ${BRIGHT_BLUE}# Copy /etc/skel to /root${RESET}"
		echo -e "  ${BRIGHT_CYAN}configcopy${RESET} ${BRIGHT_YELLOW}jeff default${RESET}  ${BRIGHT_BLUE}# Update /etc/skel${RESET}"
		return
	elif [ "${1}" == "${2}" ]; then
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}The from and to user parameters cannot be the same${RESET}"
		return 2
	elif [ ! -d "/home/${1}" ] && [ "${1}" != "root" ] && [ "${1}" != "default" ]; then
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}User ${BRIGHT_YELLOW}${1}${BRIGHT_CYAN} does not exist${RESET}"
		return 1
	elif [ ! -d "/home/${2}" ] && [ "${2}" != "root" ] && [ "${2}" != "default" ]; then
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}User ${BRIGHT_YELLOW}${2}${BRIGHT_CYAN} does not exist${RESET}"
		return 1
	elif [ "${1}" == "default" ] && [ "${2}" == "root" ]; then
		dirfrom=/etc/skel/
		dirto=/root/
		owner=root
	elif [ "${1}" == "default" ]; then
		dirfrom=/etc/skel/
		dirto=/home/"${2}"/
		owner="${2}"
	elif [ "${2}" == "default" ] && [ "${1}" == "root" ]; then
		dirfrom=/root/
		dirto=/etc/skel/
		owner=root
	elif [ "${2}" == "default" ]; then
		dirfrom=/home/"${1}"/
		dirto=/etc/skel/
		owner=root
	elif [ "${1}" == "root" ]; then
		dirfrom=/root/
		dirto=/home/"${2}"/
		owner="${2}"
	elif [ "${2}" == "root" ]; then
		dirfrom=/home/"${1}"/
		dirto=/root/
		owner=root
	else
		dirfrom=/home/"${1}"/
		dirto=/home/"${2}"/
		owner="${2}"
	fi

	# Ask for confirmation
	if ! ask "${BRIGHT_RED}Are you sure? ${BRIGHT_CYAN}This will overwrite configuration files in ${BRIGHT_YELLOW}${dirto%/}${RESET}" N; then
		return
	fi

	# Check if the user can execute sudo commands (only needed if copying to another user)
	if [[ "${owner}" != "${USER}" ]] && ! sudo -v 2>/dev/null; then
		echo -e "${BRIGHT_RED}Error:${RESET} You do not have sufficient permissions to run this command with sudo"
		return 1
	fi

	# Loop through and copy the files over
	for file in "${files[@]}"; do
		src="${dirfrom}${file}"
		dest="${dirto}${file}"
		dest_dir=$(dirname "${dest}")

		# Check if the source file exists
		if [[ -f "${src}" ]]; then
			# Ensure destination directory exists
			[[ ! -d "${dest_dir}" ]] && \
				sudo mkdir -p "${dest_dir}" && \
				sudo chown "${owner}":"${owner}" "${dest_dir}"

			# Copy and change permissions
			sudo cp "${src}" "${dest_dir}" && \
				sudo chown "${owner}":"${owner}" "${dest}" && \
				echo -e "${BRIGHT_GREEN}✓${RESET} Copied file: ${BRIGHT_CYAN}${file}${RESET}"
		fi
	done

	# Loop through and copy directories over
	for dir in "${dirs[@]}"; do
		src="${dirfrom}${dir}"
		dest="${dirto}${dir}"
		dest_dir=$(dirname "${dest}")

		# Check if the source directory exists
		if [[ -d "${src}" ]]; then
			# Ensure destination directory exists
			[[ ! -d "${dest_dir}" ]] && \
				sudo mkdir -p "${dest_dir}" && \
				sudo chown "${owner}":"${owner}" "${dest_dir}"

			# Copy directory and change ownership recursively
			sudo cp -R "${src}" "${dest_dir}" && \
				sudo chown -R "${owner}":"${owner}" "${dest}" && \
				echo -e "${BRIGHT_GREEN}✓${RESET} Copied directory ${BRIGHT_CYAN}${dir}${RESET}"
		fi
	done

	# We are done
	echo -e "Owner set to: ${BRIGHT_MAGENTA}${owner}${RESET}"
	echo -e "${BRIGHT_GREEN}Finished copying configuration files from ${BRIGHT_YELLOW}${dirfrom%/}${BRIGHT_GREEN} to ${BRIGHT_YELLOW}${dirto%/}${RESET}"
	return
}

# Synchronize files using rsync over SSH
function sync2ssh() {
	# Check the number of arguments
	if [[ $# -lt 3 ]]; then
		echo -e "${BRIGHT_WHITE}sync2ssh:${RESET} Synchronize files using rsync over SSH"
		echo -e "${BRIGHT_WHITE}Usage:${RESET}"
		echo -e "  ${BRIGHT_CYAN}sync2ssh${RESET} ${BRIGHT_YELLOW}[LOCAL_DIR] ${BRIGHT_BLUE}[USER@REMOTE_HOST${BRIGHT_CYAN}[:PORT]${BRIGHT_BLUE}] ${BRIGHT_YELLOW}[REMOTE_DIR]${RESET} ${BRIGHT_GREEN}[OPTIONAL_SSH_PASSWORD]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}sync2ssh${RESET} ${BRIGHT_YELLOW}~/local/folder/${RESET} ${BRIGHT_BLUE}user@example.com${RESET} ${BRIGHT_YELLOW}/path/on/remote${RESET}"
		echo -e "  ${BRIGHT_CYAN}sync2ssh${RESET} ${BRIGHT_YELLOW}~/local/folder/${RESET} ${BRIGHT_BLUE}user@example.com${RESET} ${BRIGHT_YELLOW}/path/on/remote${RESET} ${BRIGHT_GREEN}password123${RESET}"
		echo -e "  ${BRIGHT_CYAN}sync2ssh${RESET} ${BRIGHT_YELLOW}~/local/folder/${RESET} ${BRIGHT_BLUE}user@example.com${BRIGHT_WHITE}:${BRIGHT_CYAN}22${RESET} ${BRIGHT_YELLOW}/path/on/remote${RESET}"
		return 1
	fi

	# Append trailing slash to directories if it's not present
	local LOCAL_DIR
	[[ "${1: -1}" != "/" ]] && LOCAL_DIR="${1}/" || LOCAL_DIR="$1"
	local SSH_USER_HOST_PORT="$2"
	local REMOTE_DIR="$3"

	# Extract the port (if present)
	local SSH_PORT SSH_USER_HOST
	SSH_PORT="${SSH_USER_HOST_PORT##*:}"
	if [[ "${SSH_PORT}" == "${SSH_USER_HOST_PORT}" ]]; then
		SSH_PORT=22  # default SSH port
		SSH_USER_HOST="${SSH_USER_HOST_PORT}"
	else
		SSH_USER_HOST="${SSH_USER_HOST_PORT%%:*}"
	fi

	# Build the rsync command as an array to avoid eval
	# Rsync options:
	# --recursive: Transfer files and directories recursively
	# --links: Treat symbolic links as references to their target files/directories
	# --compress: Compress files during transfer for efficiency
	# --verbose: Display a detailed log of files being transferred
	# --delete: Delete files on the destination that aren't present at the source
	# -e: Use SSH with a 10-second connection timeout for transfers
	local RSYNC_CMD=()

	# Check if SSH password is provided
	if [[ -n "$4" ]]; then
		# Ensure sshpass is installed
		if ! hascommand --strict sshpass; then
			echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Install sshpass or use SSH keys instead${RESET}"
			return 1
		fi
		# Use SSHPASS env var instead of -p flag (avoids password in ps output)
		RSYNC_CMD=(env "SSHPASS=$4" sshpass -e)
	fi

	RSYNC_CMD+=(rsync --recursive --links --compress --verbose --delete
		-e "ssh -o ConnectTimeout=10 -p ${SSH_PORT}"
		"${LOCAL_DIR}" "${SSH_USER_HOST}:${REMOTE_DIR}")

	# Execute the rsync command directly (no eval needed)
	if ! "${RSYNC_CMD[@]}"; then
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}rsync command failed${RESET}"
		return 1
	fi

	echo -e "${BRIGHT_GREEN}Files synchronized successfully${RESET}"
}

# When executed, will toggle the hosts file on and off
function hoststoggle() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}hoststoggle${RESET}: Toggle hosts file between full and minimal"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}hoststoggle${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Backs up current hosts file and replaces with minimal version${RESET}"
		echo -e "  ${BRIGHT_BLUE}Run again to restore the backup${RESET}"
		echo -e "  ${BRIGHT_BLUE}Useful for testing if hosts blocking causes issues${RESET}"
		return 0
	fi

	# Confirm we want to do this...
	if ask "Are you sure you wish to modify the hosts file?" N; then

		# Check if the user can execute sudo commands
		if ! sudo -v; then
			echo -e "${BRIGHT_RED}Error:${RESET} You do not have sufficient permissions to run this script with necessary privileges"
			return 1
		fi

		# If the hosts backup file exists, restore it
		if [ -f /etc/hosts.backup_temporary ]; then
			sudo \rm -f /etc/hosts
			sudo \mv /etc/hosts.backup_temporary /etc/hosts
			sudo chmod 644 /etc/hosts
			echo -e "${BRIGHT_BLUE}Hosts file ${BRIGHT_GREEN}restored${BRIGHT_BLUE}.${RESET}"
			echo -e "(File is $(sudo cat /etc/hosts | wc -l) lines long.)"
			sudo head -16 /etc/hosts

		# Make a backup of the hosts file
		elif [ -f /etc/hosts ]; then
			sudo \mv /etc/hosts /etc/hosts.backup_temporary

			# Replaces the hosts file with a generic empty hosts file
			sudo bash -c 'printf "#\n# /etc/hosts: static lookup table for host names\n#\n\n127.0.0.1       localhost\n255.255.255.255 broadcasthost\n::1             localhost\n::1             ip6-localhost ip6-loopback\nfe00::0         ip6-localnet\nff00::0         ip6-mcastprefix\nff02::1         ip6-allnodes\nff02::2         ip6-allrouters\nff02::3         ip6-allhosts\n" > /etc/hosts'

			sudo chmod 644 /etc/hosts
			echo -e "${BRIGHT_BLUE}Hosts file ${BRIGHT_RED}disabled${BRIGHT_BLUE}.${RESET}"

		# Supports hBlock - A POSIX-compliant shell script that gets a list of domains
		# that serve ads, tracking scripts and malware from multiple sources and creates
		# a hosts file, among other formats, that prevents your system from connecting
		# to them. See https://github.com/hectorm/hblock
		elif hascommand --strict hblock; then
			if [ -f /etc/hosts.personal ]; then
				sudo /usr/bin/hblock --header /etc/hosts.personal
			else
				sudo /usr/bin/hblock
			fi
			sudo chmod 644 /etc/hosts
			echo -e "${BRIGHT_BLUE}Hosts file ${BRIGHT_YELLOW}recreated${BRIGHT_BLUE}.${RESET}"

		# No hosts file was found
		else
			echo -e "${BRIGHT_RED}ERROR: ${BRIGHT_CYAN}Hosts file and backup not found.${RESET}"
		fi
	fi
}

function timeelapsed() {
	# Check if at least one parameter is provided
	if [[ -z "${1}" ]]; then
		echo -e "Please provide a date in ${BRIGHT_CYAN}YYYY-MM-DD${RESET} format."
		return 1
	fi

	# Parameters
	local DATE_GIVEN="${1}"
	local MESSAGE="${2}"

	# Check if the first parameter is a valid date...
	if ! date -d "${DATE_GIVEN}" >/dev/null 2>&1; then
		echo -e "Invalid date format. Please provide a date in ${BRIGHT_CYAN}YYYY-MM-DD${RESET} format."
		return 1
	fi

	# Default message if the second parameter is empty...
	if [[ -z "${MESSAGE}" ]]; then
		MESSAGE="${BRIGHT_CYAN}The date${RESET} ${BRIGHT_GREEN}${DATE_GIVEN}${RESET} ${BRIGHT_CYAN}was"
	else
		MESSAGE="${BRIGHT_CYAN}${MESSAGE}${RESET}"
	fi

	# Calculate total days elapsed
	local TOTAL_DAYS=$(( ( $(date '+%s') - $(date -d "${DATE_GIVEN}" '+%s') ) / 86400 ))

	# Use date arithmetic for accurate year/month/day breakdown
	# (accounts for leap years and varying month lengths)
	local GIVEN_Y GIVEN_M GIVEN_D NOW_Y NOW_M NOW_D
	GIVEN_Y=$(date -d "${DATE_GIVEN}" '+%Y')
	GIVEN_M=$(date -d "${DATE_GIVEN}" '+%-m')
	GIVEN_D=$(date -d "${DATE_GIVEN}" '+%-d')
	NOW_Y=$(date '+%Y')
	NOW_M=$(date '+%-m')
	NOW_D=$(date '+%-d')

	local YEARS=$((NOW_Y - GIVEN_Y))
	local MONTHS=$((NOW_M - GIVEN_M))
	local DAYS=$((NOW_D - GIVEN_D))

	# Borrow from months if days went negative
	if [[ ${DAYS} -lt 0 ]]; then
		((MONTHS--))
		# Days in previous month (use date to get it right)
		DAYS=$((DAYS + $(date -d "${NOW_Y}-${NOW_M}-01 -1 day" '+%-d')))
	fi

	# Borrow from years if months went negative
	if [[ ${MONTHS} -lt 0 ]]; then
		((YEARS--))
		MONTHS=$((MONTHS + 12))
	fi

	# Display message with colors
	echo -e "${MESSAGE} ${BRIGHT_MAGENTA}${TOTAL_DAYS} total days${BRIGHT_CYAN} ago which is ${BRIGHT_YELLOW}${YEARS} years${BRIGHT_CYAN}, ${BRIGHT_YELLOW}${MONTHS} months${BRIGHT_CYAN}, and ${BRIGHT_YELLOW}${DAYS} days${BRIGHT_CYAN}!${RESET}"
}

# ROT13 (rotate by 13 positions) is a simple letter substitution cipher that
# replaces each letter with the letter 13 positions after it in the alphabet
# NOTE: Since the English alphabet has 26 letters, ROT13 acts as its own inverse
#       applying it twice gets you back to the original text.
function rot13() {
	if [[ $# -eq 0 ]]; then
		tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	else
		echo "$*" | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	fi
}

# Command to spell check command line input
# Example: spellcheck "definately"
# Example: spellcheck "I sincerly reccomend programing"
spellcheck() {

	# Check if any spell checker is installed
	if type -P aspell >/dev/null; then
		local SPELLCHECKER="aspell -a"
	elif type -P hunspell >/dev/null; then
		local SPELLCHECKER="hunspell"
	else
		echo -e "${BRIGHT_RED}No spell checker found: ${BRIGHT_CYAN}Please install aspell or hunspell${RESET}"
		return 1
	fi

	# Check if any arguments were provided
	if [[ $# -eq 0 ]]; then
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_GREEN}spellcheck ${BRIGHT_YELLOW}[text to check]${RESET}"
		return 1
	fi

	# Combine all arguments into a single string
	local TEXT="$*"

	# Run spell checker and process the output
	local LINE
	local WORD
	local SUGGESTIONS
	echo "${TEXT}" | ${SPELLCHECKER} | while read -r LINE; do
		# Skip the version header line
		if [[ ${LINE} == @\(#\)* || ${LINE} == Hunspell* ]]; then
			continue
		# Skip lines that just show '*' (correctly spelled words)
		elif [[ ${LINE} == \** && ${#LINE} -eq 1 ]]; then
			continue
		# Process spell check suggestions
		elif [[ ${LINE} == \&* ]]; then
			# Extract the misspelled word and suggestions
			WORD=$(echo "${LINE}" | cut -d' ' -f2)
			# Get everything after the ':' or last number for suggestions
			if [[ ${SPELLCHECKER} == "hunspell" ]]; then
				# Hunspell format: "& word num offset: suggestion1, suggestion2"
				SUGGESTIONS=$(echo "${LINE}" | cut -d':' -f2- | sed 's/^[ ]*//')
				# If no colon, get everything after the last number
				if [[ -z "${SUGGESTIONS}" ]]; then
					SUGGESTIONS=$(echo "${LINE}" | sed 's/^& [^ ]* [0-9]* [0-9]* //')
				fi
			else
				# Aspell format
				SUGGESTIONS=$(echo "${LINE}" | cut -d':' -f2- | sed 's/^[ ]*//')
			fi

			echo -e "${BRIGHT_RED}X Misspelled: ${BRIGHT_CYAN}${WORD}${RESET}"
			echo -e "${BRIGHT_GREEN}✓ Suggestions:${RESET} ${BRIGHT_YELLOW}${SUGGESTIONS}${RESET}"
			echo
		fi
	done
}

# Transform text using common string formatting and case operations
function formattext() {
	local TEXT=""
	local PARAMS=()

	# Internal function to show help message
	# Named with function prefix to avoid polluting global scope
	# (bash doesn't scope nested functions — they become global)
	function _formattext_show_help() {
		echo -e "${BRIGHT_CYAN}formattext${RESET}: Format text with various transformations"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}formattext${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}options${BRIGHT_MAGENTA}]${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}text${BRIGHT_MAGENTA}>${RESET}"
		echo -e "       command | ${BRIGHT_CYAN}formattext${RESET} ${BRIGHT_MAGENTA}[${BRIGHT_GREEN}options${BRIGHT_MAGENTA}]${RESET}"
		echo -e "${BRIGHT_WHITE}Note:${RESET} Text is processed in order of options specified"
		echo -e "${BRIGHT_WHITE}Options:${RESET}"
		echo -e "  ${BRIGHT_GREEN}-c${RESET}, ${BRIGHT_GREEN}--capitalize${RESET}               Capitalize every word"
		echo -e "  ${BRIGHT_GREEN}-C${RESET}, ${BRIGHT_GREEN}--titlecase${RESET}                Convert text to title case"
		echo -e "  ${BRIGHT_GREEN}-d${RESET}, ${BRIGHT_GREEN}--dashes-to-spaces${RESET}         Replace dashes with spaces"
		echo -e "  ${BRIGHT_GREEN}-f${RESET}, ${BRIGHT_GREEN}--filename-friendly${RESET}        Replace characters difficult for filenames"
		echo -e "  ${BRIGHT_GREEN}-i${RESET}, ${BRIGHT_GREEN}--input${RESET}                    Specify input text (-i=text or -i text)"
		echo -e "  ${BRIGHT_GREEN}-l${RESET}, ${BRIGHT_GREEN}--lowercase${RESET}                Convert text to lowercase"
		echo -e "  ${BRIGHT_GREEN}-q${RESET}, ${BRIGHT_GREEN}--smart-quotes${RESET}             Convert quotes to smart quotes"
		echo -e "  ${BRIGHT_GREEN}-Q${RESET}, ${BRIGHT_GREEN}--unsmart-quotes${RESET}           Smart quotes to regular quotes"
		echo -e "  ${BRIGHT_GREEN}-r${RESET}, ${BRIGHT_GREEN}--remove-duplicate-spaces${RESET}  Remove duplicate spaces"
		echo -e "  ${BRIGHT_GREEN}-s${RESET}, ${BRIGHT_GREEN}--spaces-to-dashes${RESET}         Replace spaces with dashes"
		echo -e "  ${BRIGHT_GREEN}-S${RESET}, ${BRIGHT_GREEN}--spaces-to-underscores${RESET}    Replace spaces with underscores"
		echo -e "  ${BRIGHT_GREEN}-t${RESET}, ${BRIGHT_GREEN}--trim${RESET}                     Trim leading and trailing whitespace"
		echo -e "  ${BRIGHT_GREEN}-T${RESET}, ${BRIGHT_GREEN}--tabs-to-spaces${RESET}           Replace tabs with spaces"
		echo -e "  ${BRIGHT_GREEN}-u${RESET}, ${BRIGHT_GREEN}--uppercase${RESET}                Convert text to uppercase"
		echo -e "  ${BRIGHT_GREEN}-U${RESET}, ${BRIGHT_GREEN}--underscores-to-spaces${RESET}    Replace underscores with spaces"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}formattext${RESET} ${BRIGHT_GREEN}--titlecase${RESET} ${BRIGHT_YELLOW}'hello world'${RESET}  ${BRIGHT_BLUE}# Returns: Hello World${RESET}"
		echo -e "  ${BRIGHT_CYAN}formattext${RESET} ${BRIGHT_GREEN}-r -C${RESET} ${BRIGHT_YELLOW}'hello   world'${RESET}      ${BRIGHT_BLUE}# Combine options${RESET}"
		echo -e "  ${BRIGHT_YELLOW}echo 'text'${RESET} | ${BRIGHT_CYAN}formattext${RESET} ${BRIGHT_GREEN}-u${RESET}           ${BRIGHT_BLUE}# Uppercase from pipe${RESET}"
		return 0
	}

	# Check for piped input
	local LINE
	if [[ ! -t 0 ]]; then
		# Read from stdin (pipe) line by line
		while IFS= read -r LINE; do
			if [[ -z "${TEXT}" ]]; then
				TEXT="${LINE}"
			else
				TEXT="${TEXT}"$'\n'"${LINE}"
			fi
		done

	# Else check to make sure we have parameters
	elif [[ $# -eq 0 ]]; then
		# Show help if no parameters provided
		_formattext_show_help
		return 0
	fi

	# Parse command line options
	while [[ $# -gt 0 ]]; do
		case "${1}" in
			-h|--help)
				_formattext_show_help
				return 0
				;;
			-i=*|--input=*)
				if [[ -z "${TEXT}" ]]; then
					TEXT="${1#*=}"  # If text is empty, set it
				else
					TEXT+=" ${1#*=}"  # Otherwise append with space
				fi
				shift
				;;
			-i|--input)
				if [[ -n "${2}" ]] && [[ "${2}" != -* ]]; then
					if [[ -z "${TEXT}" ]]; then
						TEXT="${2}"  # If text is empty, set it
					else
						TEXT+=" ${2}"  # Otherwise append with space
					fi
					shift 2
				else
					echo "Error: --input requires an argument" >&2
					return 1
				fi
				;;
			-*)
				PARAMS+=("${1}")
				shift
				;;
			*)
				if [[ -z "${TEXT}" ]]; then
					TEXT="${1}"  # First word without space
				else
					TEXT+=" ${1}"  # Subsequent words with space
				fi
				shift
				;;
		esac
	done

	# Check if no text is provided
	if [[ -z "${TEXT}" ]]; then
		return 1
	fi

	# Apply transformations in the specified order
	local PARAM
	local RESULT
	local SMALL_WORDS
	local CAPITALIZE_NEXT
	local WORD
	local INDEX
	local CHAR
	local LEFT_DOUBLE_QUOTE
	local RIGHT_DOUBLE_QUOTE
	local LEFT_SINGLE_QUOTE
	local RIGHT_SINGLE_QUOTE
	for PARAM in "${PARAMS[@]}"; do
		case "${PARAM}" in
			-c|--capitalize)
				TEXT=$(IFS=' ' read -ra words <<< "${TEXT}" && (IFS=' '; echo "${words[@]^}"))
				;;
			-C|--titlecase)
				RESULT=""
				SMALL_WORDS="a|an|and|as|at|but|by|en|for|if|in|nor|of|on|or|per|the|to|vs?\\.?|via"
				CAPITALIZE_NEXT=true
				for WORD in ${TEXT}; do
					if ${CAPITALIZE_NEXT} || ! [[ ${WORD} =~ ^(${SMALL_WORDS})$ ]]; then
						RESULT+="${WORD^} "
						CAPITALIZE_NEXT=false
					else
						RESULT+="${WORD,,} "
					fi
					# Check if we should capitalize the next word
					if [[ ${WORD: -1} =~ [:.?!-] ]]; then
						CAPITALIZE_NEXT=true
					fi
				done
				TEXT="${RESULT% }"
				;;
			-d|--dashes-to-spaces)
				TEXT="${TEXT//-/ }"
				;;
			-f|--filename-friendly)
				RESULT=""
				for ((INDEX=0; INDEX<${#TEXT}; INDEX++)); do
					CHAR="${TEXT:INDEX:1}"
					case "${CHAR}" in
						"<") RESULT+="＜" ;;
						">") RESULT+="＞" ;;
						":") RESULT+="：" ;;
						"\"") RESULT+="＂" ;;
						"/") RESULT+="／" ;;
						"\\") RESULT+="＼" ;;
						"|") RESULT+="｜" ;;
						"?") RESULT+="？" ;;
						"*") RESULT+="＊" ;;
						[[:cntrl:]]) RESULT+=" " ;;
						*) RESULT+="${CHAR}" ;;
					esac
				done
				TEXT="${RESULT}"
				;;
			-l|--lowercase)
				TEXT="${TEXT,,}"
				;;
			-q|--smart-quotes)
				if ! hascommand sed; then
					echo -e "${BRIGHT_RED}Error:${RESET} ${BRIGHT_CYAN}Smart quotes requires ${BRIGHT_YELLOW}sed${RESET}"
					return 1
				fi

				# Get the actual Unicode characters for smart quotes
				LEFT_DOUBLE_QUOTE=$(echo -ne '\u201C')  # Left double quote "
				RIGHT_DOUBLE_QUOTE=$(echo -ne '\u201D')  # Right double quote "
				LEFT_SINGLE_QUOTE=$(echo -ne '\u2018')  # Left single quote '
				RIGHT_SINGLE_QUOTE=$(echo -ne '\u2019')  # Right single quote '

				# First convert doubles
				TEXT=$(echo "${TEXT}" | sed -e "s/\"/${LEFT_DOUBLE_QUOTE}/g") # Replace all " with opening "
				TEXT=$(echo "${TEXT}" | sed -e "s/${LEFT_DOUBLE_QUOTE}\([^${RIGHT_DOUBLE_QUOTE}]*\)$/${LEFT_DOUBLE_QUOTE}\1/g") # Fix lone opening quotes at end
				TEXT=$(echo "${TEXT}" | sed -e "s/${LEFT_DOUBLE_QUOTE}\([^${RIGHT_DOUBLE_QUOTE}]*\)${LEFT_DOUBLE_QUOTE}/${LEFT_DOUBLE_QUOTE}\1${RIGHT_DOUBLE_QUOTE}/g") # Fix pairs

				# Then convert singles
				TEXT=$(echo "${TEXT}" | sed -e "s/'/${LEFT_SINGLE_QUOTE}/g") # Replace all ' with opening '
				TEXT=$(echo "${TEXT}" | sed -e "s/${LEFT_SINGLE_QUOTE}\([^${RIGHT_SINGLE_QUOTE}]*\)$/${LEFT_SINGLE_QUOTE}\1/g") # Fix lone opening quotes at end
				TEXT=$(echo "${TEXT}" | sed -e "s/${LEFT_SINGLE_QUOTE}\([^${RIGHT_SINGLE_QUOTE}]*\)${LEFT_SINGLE_QUOTE}/${LEFT_SINGLE_QUOTE}\1${RIGHT_SINGLE_QUOTE}/g") # Fix pairs
				;;
			-Q|--unsmart-quotes)
				# Convert from smart quotes back to regular
				TEXT="${TEXT//'/\'}"
				TEXT="${TEXT//'/\'}"
				TEXT="${TEXT//\"/\"}"
				TEXT="${TEXT//\"/\"}"
				;;
			-r|--remove-duplicate-spaces)
				while [[ "${TEXT}" =~ "  " ]]; do
					TEXT="${TEXT//  / }"
				done
				;;
			-s|--spaces-to-dashes)
				# First remove duplicate spaces, then convert to dashes
				while [[ "${TEXT}" =~ "  " ]]; do
					TEXT="${TEXT//  / }"
				done
				TEXT="${TEXT// /-}"
				;;
			-S|--spaces-to-underscores)
				TEXT="${TEXT// /_}"
				;;
			-t|--trim)
				TEXT="${TEXT#"${TEXT%%[![:space:]]*}"}"  # trim leading
				TEXT="${TEXT%"${TEXT##*[![:space:]]}"}"  # trim trailing
				;;
			-T|--tabs-to-spaces)
				TEXT="${TEXT//	/ }"
				;;
			-u|--uppercase)
				TEXT="${TEXT^^}"
				;;
			-U|--underscores-to-spaces)
				TEXT="${TEXT//_/ }"
				;;
		esac
	done

	echo "${TEXT}"
}

# Convenience aliases for common text formatting operations
# These support both direct input: lowercase "HELLO"
# and piped input: echo "HELLO" | lowercase
# NOTE: Aliases only work in interactive shells, not in scripts
alias trim='formattext --trim'
alias fixspaces='formattext --tabs-to-spaces --underscores-to-spaces --remove-duplicate-spaces'
alias lowercase='formattext --lowercase'
alias uppercase='formattext --uppercase'
alias capitalize='formattext --capitalize'
alias titlecase='formattext --titlecase'
alias smartquotes='formattext --smart-quotes'
alias unsmartquotes='formattext --unsmart-quotes'

# Reverse the text in a string
function reversetext() {
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]] || { [[ $# -eq 0 ]] && [[ -t 0 ]]; }; then
		echo -e "${BRIGHT_CYAN}reversetext${RESET}: Reverse the characters in text"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}reversetext${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}text${BRIGHT_MAGENTA}>${RESET}"
		echo -e "       command | ${BRIGHT_CYAN}reversetext${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}reversetext${RESET} ${BRIGHT_YELLOW}\"hello world\"${RESET}     ${BRIGHT_BLUE}# Returns: dlrow olleh${RESET}"
		echo -e "  ${BRIGHT_YELLOW}echo \"racecar\"${RESET} | ${BRIGHT_CYAN}reversetext${RESET}  ${BRIGHT_BLUE}# Returns: racecar${RESET}"
		echo -e "  ${BRIGHT_YELLOW}cat file.txt${RESET} | ${BRIGHT_CYAN}reversetext${RESET}    ${BRIGHT_BLUE}# Reverse file contents${RESET}"
		return 2
	fi

	local TEXT=""
	local REVERSED=""
	local LINE
	local INDEX

	# Check for piped input
	if [[ ! -t 0 ]]; then
		# Read from stdin (pipe) line by line
		while IFS= read -r LINE; do
			if [[ -z "${TEXT}" ]]; then
				TEXT="${LINE}"
			else
				TEXT="${TEXT}"$'\n'"${LINE}"
			fi
		done
	else
		TEXT="$*"
	fi

	# Iterate over each character in the string in reverse order
	for (( INDEX=${#TEXT}-1; INDEX>=0; INDEX-- )); do
		REVERSED+="${TEXT:INDEX:1}"
	done

	echo "${REVERSED}"
}

# Count the number of characters in a string
function countchars() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}countchars${RESET}: Count characters in a string"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}countchars${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}text${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}countchars${RESET} ${BRIGHT_YELLOW}'hello world'${RESET}  ${BRIGHT_BLUE}# Returns: 11${RESET}"
		return 0
	fi

	# Use wc -m to count the number of characters (-n prevents trailing newline)
	echo -n "$1" | wc -m
}

# Count the number of words in a string
function countwords() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}countwords${RESET}: Count words in a string"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}countwords${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}text${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}countwords${RESET} ${BRIGHT_YELLOW}'hello world'${RESET}  ${BRIGHT_BLUE}# Returns: 2${RESET}"
		return 0
	fi

	# Use wc -w to count the number of words (use $* to count all arguments)
	echo "$*" | wc -w
}

# Check if a string starts with a specific substring
function startswith() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}startswith${RESET}: Check if string starts with a prefix"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}startswith${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}string${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}prefix${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Returns:${RESET} 0 if true, 1 if false"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}startswith${RESET} ${BRIGHT_YELLOW}'hello' 'he'${RESET} && echo yes  ${BRIGHT_BLUE}# Yes${RESET}"
		echo -e "  ${BRIGHT_CYAN}startswith${RESET} ${BRIGHT_YELLOW}'hello' 'lo'${RESET} || echo no   ${BRIGHT_BLUE}# No${RESET}"
		return 0
	fi

	# Use parameter expansion to check if the string starts with the substring
	if [[ "$1" == "$2"* ]]; then
		return 0
	else
		return 1
	fi
}

# Check if a string ends with a specific substring
function endswith() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}endswith${RESET}: Check if string ends with a suffix"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}endswith${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}string${BRIGHT_MAGENTA}>${RESET} ${BRIGHT_MAGENTA}<${BRIGHT_YELLOW}suffix${BRIGHT_MAGENTA}>${RESET}"
		echo -e "${BRIGHT_WHITE}Returns:${RESET} 0 if true, 1 if false"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}endswith${RESET} ${BRIGHT_YELLOW}'hello' 'lo'${RESET} && echo yes  ${BRIGHT_BLUE}# Yes${RESET}"
		echo -e "  ${BRIGHT_CYAN}endswith${RESET} ${BRIGHT_YELLOW}'hello' 'he'${RESET} || echo no   ${BRIGHT_BLUE}# No${RESET}"
		return 0
	fi

	# Use parameter expansion to check if the string ends with the substring
	if [[ "$1" == *"$2" ]]; then
		return 0
	else
		return 1
	fi
}

# Fix specified filenames by trimming whitespace, replacing multiple spaces,
# tabs, and underscores with a single space, and converting to title case
function fixfilename() {
	local FILE
	local DIRECTORY
	local FILENAME
	local NEW_FILENAME
	local NEW_FILEPATH
	for FILE in "$@"; do
		if [[ -f "${FILE}" ]]; then
			DIRECTORY=$(dirname "${FILE}")
			FILENAME=$(basename "${FILE}")

			# Use formattext with multiple transformations:
			NEW_FILENAME=$(formattext \
				--tabs-to-spaces \
				--underscores-to-spaces \
				--titlecase \
				--filename-friendly \
				--remove-duplicate-spaces \
				--trim \
				--input="${FILENAME##-}")

			if [[ "${FILENAME}" != "${NEW_FILENAME}" ]]; then
				NEW_FILEPATH="${DIRECTORY}/${NEW_FILENAME}"
				echo -e "${BRIGHT_CYAN}Rename: ${BRIGHT_YELLOW}${FILENAME}${RESET}"
				echo -e "${BRIGHT_CYAN}    To: ${BRIGHT_YELLOW}${NEW_FILENAME}${RESET}"
				if ask "${BRIGHT_WHITE}Continue?${RESET}" Y; then
					mv -i "${FILE}" "${NEW_FILEPATH}"
					echo -e "${BRIGHT_GREEN}Renamed to ${BRIGHT_YELLOW}${NEW_FILENAME}${RESET}"
				else
					echo -e "${BRIGHT_CYAN}Skipped renaming ${BRIGHT_YELLOW}${FILENAME}${RESET}"
				fi
			else
				echo -e "${BRIGHT_MAGENTA}No changes needed for ${BRIGHT_YELLOW}${FILENAME}${RESET}"
			fi
		else
			echo -e "${BRIGHT_RED}File not found: ${BRIGHT_YELLOW}${FILE}${RESET}"
		fi
	done
}

#######################################################
# Show the initial information HUD on initial Bash load
#######################################################

# If we are NOT root or in a virtual terminal console or TMUX or Git Bash...
if [[ $EUID -ne 0 ]] && \
	[[ ! "$(tty)" =~ /dev/tty ]] && \
	[[ ! "${TERM}" =~ screen ]] && \
	[[ -z "${TMUX}" ]] && \
	[[ "${_KERNEL_NAME}" != "MINGW" ]] && \
	[[ "${_KERNEL_NAME}" != "CYGWI" ]] && \
	[[ -z "${INSIDE_EMACS}" ]] && \
	[[ -z "${VIM_TERMINAL}" ]] && \
	[[ ! "${TERM}" =~ vim ]] && \
	[[ ! "${TERM}" =~ nvim ]] && \
	[[ "${TERM_PROGRAM}" != "vscode" ]] && \
	[[ "${TERMINAL_EMULATOR}" != "JetBrains-JediTerm" ]] && \
	[[ "${TERM_PROGRAM}" != "Sublime_Terminal" ]] && \
	[[ "${TERM_PROGRAM}" != "atom" ]] && \
	[[ $_SKIP_SYSTEM_INFO = false ]]; then

	# Link: https://github.com/LinusDierheimer/fastfetch
	if hascommand --strict fastfetch; then
		fastfetch

	# Actively maintained fork of neofetch (drop-in compatible)
	# Link: https://github.com/hykilpikonna/hyfetch
	elif hascommand --strict hyfetch; then
		hyfetch

	# Link: https://ostechnix.com/neofetch-display-linux-systems-information/
	# NOTE: neofetch was archived in April 2024, consider hyfetch instead
	elif hascommand --strict neofetch; then
		neofetch
		printf '\033[A\033[K' # Move the cursor up one line

	# Link: https://github.com/KittyKatt/screenFetch
	elif hascommand --strict screenfetch; then
		screenfetch

	# Link: https://github.com/deater/linux_logo
	elif hascommand --strict linuxlogo; then
		linuxlogo

	# Link: https://lclarkmichalek.github.io/archey3/
	elif hascommand --strict archey; then
		archey

	# Link: https://github.com/dylanaraps/pfetch
	elif [[ -f "${HOME}/pfetch.sh" ]]; then
		"${HOME}/pfetch.sh"
	elif hascommand --strict pfetch.sh; then
		pfetch.sh
	elif hascommand --strict pfetch; then
		pfetch
	fi
fi

#######################################################
# Show text or ASCII on initial Bash load
# Create ASCII: jp2a --color ~/input_image.jpg > ~/.bash_motd_shown
# Test: cat ~/.bash_motd_shown
#######################################################

# If the file exists and we are NOT root...
if [[ -f "${HOME}/.bash_motd_shown" ]] && [[ $EUID -ne 0 ]]; then

	# Show the ASCII text or image
	cat "${HOME}/.bash_motd_shown"
fi

#######################################################
# Show upgrade information on new terminal windows
# Note: This is disabled by default because it takes several seconds to run
#######################################################

if [[ $_SKIP_UPGRADE_NOTIFY = false ]]; then

	# If this is an Arch based distrobution...
	# Add to your crontab (this runs every 3 hours): 0 */3 * * * /usr/bin/pacman -Sy
	if hascommand --strict pacman && hascommand --strict paccache; then

		# Show if there are updates available
		_PACKAGE_UPDATE_COUNT=$(pacman -Q --upgrades | wc -l)
		if [[ "$_PACKAGE_UPDATE_COUNT" -gt "0" ]]; then
			echo -e "${BRIGHT_YELLOW}*${RESET} ${BRIGHT_GREEN}There are${RESET} ${BRIGHT_WHITE}"$_PACKAGE_UPDATE_COUNT"${RESET} ${BRIGHT_GREEN}avaliable program updates${RESET}"
			echo -e "${BRIGHT_BLACK}*${RESET} ${BRIGHT_CYAN}Type${RESET} ${BRIGHT_MAGENTA}pacman -Qu${RESET} ${BRIGHT_CYAN}for more information${RESET}"
			echo
		fi

	# If this is an Ubuntu based distro...
	# Add to your crontab (this runs every 3 hours): 0 */3 * * * /usr/bin/apt update
	elif [[ -x "/usr/lib/update-notifier/apt-check" ]]; then

		# Show if there are updates available
		IFS=';' read _PACKAGE_UPDATE_COUNT _PACKAGE_SECURITY_UPDATE_COUNT < <(/usr/lib/update-notifier/apt-check 2>&1)
		if [[ "$_PACKAGE_UPDATE_COUNT" -gt "0" ]]; then
			echo -e "${BRIGHT_YELLOW}*${RESET} ${BRIGHT_GREEN}There are${RESET} ${BRIGHT_WHITE}"$_PACKAGE_UPDATE_COUNT"${RESET} ${BRIGHT_GREEN}avaliable program updates${RESET}"
		fi
		if [[ "$_PACKAGE_SECURITY_UPDATE_COUNT" -gt "0" ]]; then
			echo -e "${BRIGHT_BLACK}*${RESET} ${BRIGHT_CYAN}There are${RESET} ${BRIGHT_MAGENTA}"$_PACKAGE_SECURITY_UPDATE_COUNT"${RESET} ${BRIGHT_CYAN}security updates.${RESET}"
		fi
		if [[ "$_PACKAGE_UPDATE_COUNT" -gt "0" ]] || [[ "$_PACKAGE_SECURITY_UPDATE_COUNT" -gt "0" ]]; then
			echo
		fi
	fi
fi

################################################################################
# Birthday/anniversary reminder that shows a message in your teminal
# Reads the birthday CSV file: ~/.config/birthdays.csv
# The format is (year is optional and can be left blank):
# Month,Day,Year,"Message"
# Jan,1,2000,"This is a message!"
#
# Toilet application is a required dependency
# Arch/Manjaro:  sudo pacman -S toilet
# Ubuntu/Debian: sudo apt-get install toilet
################################################################################

# Make an alias to edit the birthday csv file
if [[ -f "${XDG_CONFIG_HOME:-${HOME}/.config}/birthdays.csv" ]]; then
	alias ebd="edit ~/.config/birthdays.csv"
elif [[ -f "${_BDAY_FILE}" ]]; then
	alias ebd="edit ${_BDAY_FILE}"
fi

# Show a birthday or anniversary reminder
function birthday() {
	# Help text
	if [[ "${1}" == "--help" ]] || [[ "${1}" == "-h" ]]; then
		echo -e "${BRIGHT_CYAN}birthday${RESET}: Display birthday reminders from CSV file"
		echo -e "${BRIGHT_WHITE}Usage:${RESET} ${BRIGHT_CYAN}birthday${RESET}"
		echo -e "${BRIGHT_WHITE}Description:${RESET}"
		echo -e "  ${BRIGHT_BLUE}Reads from ~/.config/birthdays.csv${RESET}"
		echo -e "  ${BRIGHT_BLUE}Format: Month,Day,Year,\"Message\"${RESET}"
		echo -e "  ${BRIGHT_BLUE}Example: Jan,15,1990,\"Happy Birthday John!\"${RESET}"
		return 0
	fi

	# Use extended globbing for more advanced pattern matching
	# This is also necessary for programmable completion
	shopt -s extglob

	# If the birthday CSV file exists and toilet is installed...
	if [[ $_SKIP_BDAY_REMINDER = false ]] && [[ -f "${_BDAY_FILE}" ]]; then

		# Loop through the birthday CSV file: ~/.config/birthdays.csv
		# The first line is ignored (header) and the format is:
		# Month,Day,Year,"Message"
		# Jan,1,1985,"This is a message!"
		while IFS=, read -r _BDAY_MONTH _BDAY_DAY _BDAY_YEAR _BDAY_MESSAGE; do

			# Compare the month (case insensitive) and the day (remove leading zeros)
			if [[ "$(date +%^b)" = "${_BDAY_MONTH^^}" ]] && [[ "$(date +%-d)" = "${_BDAY_DAY##+(0)}" ]]; then

				# Remove the surrounding quotes from the message
				_BDAY_MESSAGE="${_BDAY_MESSAGE%\"}"
				_BDAY_MESSAGE="${_BDAY_MESSAGE#\"}"

				# Show the message using toilet and the future font
				if hascommand --strict toilet; then
					toilet --font="${_BDAY_FONT}" --termwidth --gay "${_BDAY_MESSAGE}"
				elif hascommand --strict lolcat; then
					echo "${_BDAY_MESSAGE}" | lolcat --spread=0.4
				else
					echo -e "${BRIGHT_CYAN}${_BDAY_MESSAGE}${RESET}"
				fi

				# If the year is a number and not blank, show the age
				# Use date subtraction for accuracy (accounts for leap years)
				if [ -n "${_BDAY_YEAR}" ] && [ "${_BDAY_YEAR}" -eq "${_BDAY_YEAR}" ] 2>/dev/null; then
					echo -e "${BRIGHT_YELLOW}$(( $(date +%Y) - _BDAY_YEAR ))${RESET} Years"
				fi

				#echo ""
			fi

		# Strip off the first line in the CSV file
		done < <(tail -n +2 "${_BDAY_FILE}")
	fi
}

# If we aren't supposed to skip this...
if [[ $_SKIP_BDAY_REMINDER = false ]]; then
	# Call the birthday function
	birthday
fi

#######################################################
# Show the calendar when Bash starts
#######################################################

if [[ $_SHOW_BASH_CALENDAR = true ]]; then
	if hascommand --strict gcal; then
		gcal -H '\033[34m:\033[0m:\033[32m:\033[0m' -q "${_GCAL_COUNTRY_CODE}"
	else
		cal -3
	fi
fi

#######################################################
# bashmarks Directory Bookmarks
# Link: https://github.com/huyng/bashmarks
# Install: git clone git://github.com/huyng/bashmarks.git
# s <bookmark_name> - Saves the current directory as "bookmark_name"
# g <bookmark_name> - Goes (cd) to the directory associated with "bookmark_name"
# p <bookmark_name> - Prints the directory associated with "bookmark_name"
# d <bookmark_name> - Deletes the bookmark
# l                 - Lists all available bookmarks
#######################################################

# If bashmarks is installed, load it
if [[ -f "${HOME}/bashmarks/bashmarks.sh" ]]; then
	builtin source "${HOME}/bashmarks/bashmarks.sh"
elif [[ -f "${BASHRC_INSTALL_DIR}/bashmarks/bashmarks.sh" ]]; then
	builtin source "${BASHRC_INSTALL_DIR}/bashmarks/bashmarks.sh"
elif [[ -f "${HOME}/.local/bin/bashmarks.sh" ]]; then
	builtin source "${HOME}/.local/bin/bashmarks.sh"
elif [[ -f /usr/share/bashmarks/bashmarks.sh ]]; then
	builtin source /usr/share/bashmarks/bashmarks.sh
fi

#######################################################
# Zoxide is a smarter cd command (inspired by z and autojump)
# Link: https://github.com/ajeetdsouza/zoxide
# Install: curl -sS https://webinstall.dev/zoxide | bash
#######################################################

# If Zoxide is installed, run it's initialization
if hascommand --strict zoxide; then
	eval "$(zoxide init bash)"
fi

#######################################################
# commacd Improved cd
# Link: https://github.com/shyiko/commacd
# Install: curl -sSL https://github.com/shyiko/commacd/raw/v1.0.0/commacd.sh -o ~/.commacd.sh
#######################################################

# If commacd is installed
if [[ -f "${HOME}/.commacd.sh" ]]; then
	builtin source "${HOME}/.commacd.sh"
elif [[ -f /usr/share/commacd/commacd.bash ]]; then
	builtin source /usr/share/commacd/commacd.bash
elif [[ -f /usr/share/commacd/commacd.sh ]]; then
	builtin source /usr/share/commacd/commacd.sh
fi

#######################################################
# Improve navigation and searching your command history
#######################################################

# Search command line history
alias h='history | grep'

# Enable incremental history search with up/down arrows and other Readline features
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\033[A": history-search-backward'
bind '"\033[B": history-search-forward'

# Atuin - Magical shell history stored in a SQLite database
# (records command, directory, exit code, duration, hostname, and timestamp with full-text, fuzzy, or prefix search)
# Link: https://github.com/atuinsh/atuin
# Docs: https://docs.atuin.sh
# Install: sudo pacman -S atuin bash-preexec
if hascommand --strict atuin; then

	# Alias hh for atuin interactive search
	alias hh='atuin search -i'

	# Initialize atuin (keep up/down arrows for history-search-backward/forward)
	eval "$(atuin init bash --disable-up-arrow)"

# HSTR Easily navigate and search your command history and favorites
# (has favorites, syncs across shells, does not require an extra database, but does not show the time since a command)
# Link: https://github.com/dvorka/hstr
# Manual: man hstr
elif hascommand --strict hstr; then

	# Alias hh for hstr
	alias hh='hstr'

	# Get more colors
	export HSTR_CONFIG=hicolor

	# Bind hstr to CTRL+r (for Vi mode check doc)
	bind '"\C-r": "\C-a hstr -- \C-j"'

	# Bind 'kill last command' to CTRL+x k
	bind '"\C-xk": "\C-a hstr -k \C-j"'

# McFly - fly through your shell history using a small neural network
# (shows the time since the command, but does not have favorites, and has issues syncing history across multiple shells)
# NOTE: You can type % to match any number of characters when searching
# Link: https://github.com/cantino/mcfly
# Install: curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sh -s -- --git cantino/mcfly
elif hascommand --strict mcfly; then

	# Initialize McFly
	eval "$(mcfly init bash)"

	# Alias hh for McFly
	alias hh='mcfly search'

	# Enable fuzzy searching
	export MCFLY_FUZZY=2

	# Change the maximum number of results shown (default: 10)
	export MCFLY_RESULTS=60

	# To swap the color scheme for use in a light terminal, change this
	export MCFLY_LIGHT=FALSE

# Rich Enhanced Shell History (resh) Context-based replacement/enhancement for zsh and bash shell history
# (shows more information, has raw mode, but uses own database, does not have favorites, can't delete history)
# Link: https://github.com/curusarn/resh
# Install: (git clone https://github.com/curusarn/resh.git && cd resh && scripts/rawinstall.sh)
# Update: reshctl update
# WARNING: Install automatically adds lines to the end of the ~/.bashrc file
elif [[ -f ~/.resh/shellrc ]]; then

	# Source the scripts
	builtin source ~/.resh/shellrc
	[[ -f ~/.bash-preexec.sh ]] && builtin source ~/.bash-preexec.sh

	# Bind 'kill last command' to CTRL+x k
	bind '"\C-xk": "\C-a hstr -k \C-j"'

	# Alias hh for resh
	alias hh='resh'

fi

#######################################################
# qfc Command Line File Completion (CTRL+F to list files)
# Link: https://github.com/pindexis/qfc
# Install: git clone https://github.com/pindexis/qfc ${HOME}/.qfc
#######################################################

# If qfc is installed, run it's initiation script
# CTRL+f will pop up to select directories or files
# CTRL+/ to cd into directory using qfc
if [[ -f "${HOME}/.qfc/bin/qfc.sh" ]]; then
	builtin source "${HOME}/.qfc/bin/qfc.sh"
	qfc_quick_command 'cd' '\C-_' 'cd "$0"'
	qfc_quick_command 'edit' '\C-e' 'edit $0'
elif [[ -f "${BASHRC_INSTALL_DIR}/.qfc/bin/qfc.sh" ]]; then
	builtin source "${BASHRC_INSTALL_DIR}/.qfc/bin/qfc.sh"
	qfc_quick_command 'cd' '\C-_' 'cd "$0"'
	qfc_quick_command 'edit' '\C-e' 'edit $0'
elif [[ -f /usr/share/qfc/qfc.sh ]]; then
	builtin source /usr/share/qfc/qfc.sh
	qfc_quick_command 'cd' '\C-_' 'cd "$0"'
	qfc_quick_command 'edit' '\C-e' 'edit $0'
fi

#######################################################
# Settings and Exports
#######################################################

# Make sure 256 color terminals are enabled
# export TERM=xterm-256color
# Linux tries very hard to set it to a sane value depending on things
# like which terminal you are actually using and how you are connected
# You can override a particular value which the login process
# often chooses but which is not to your liking
case $TERM in "") TERM=xterm-256color;; esac

# For use with LS_COLORS
export use_color=true

# Tell NCURSES to use UTF-8 encoding
export NCURSES_NO_UTF8_ACS=1

if hascommand --strict moar; then
	# Use moar
	# Link: https://github.com/walles/moar
	export PAGER='moar'
	export MANPAGER='moar'
	alias less='moar'
	alias les='moar -no-linenumbers'
elif hascommand --strict ov; then
	# Use ov (feature-rich pager with section jumping, follow mode, multi-color highlighting)
	# Link: https://github.com/noborus/ov
	export PAGER='ov'
	export MANPAGER="ov --section-delimiter '^[^\s]' --section-header"
	alias les='ov --line-number'
elif [[ -n "$LESSOPEN" ]]; then
	# Use less over most if it has syntax highlighting
	export PAGER='less'
	export MANPAGER='less'
	alias les='less -n'
elif hascommand --strict most; then
	# Use most
	# Link: https://www.jedsoft.org/most/
	export PAGER='most'
	export MANPAGER='most'
	alias less='most'
	alias les='command less -n'
else
	export PAGER='less'
	export MANPAGER='less'
	alias les='less -n'
fi

# If bat is installed...
# https://github.com/sharkdp/bat
if hascommand --strict batcat; then
	export PAGER='less' # Bat expects and uses less
	export MANPAGER='batcat --style=plain'
	alias bat='batcat --force-colorization'
	# Use ov as bat's pager for section jumping, follow mode, and multi-color highlights
	if hascommand --strict ov; then
		export BAT_PAGER='ov'
	fi
elif hascommand --strict bat; then
	export PAGER='less' # Bat expects and uses less
	export MANPAGER='bat --style=plain'
	alias bat='bat --force-colorization'
	# Use ov as bat's pager for section jumping, follow mode, and multi-color highlights
	if hascommand --strict ov; then
		export BAT_PAGER='ov'
	fi
fi

# If bat-extras is installed with the extra commands:
# batgrep, batman, batpipe, batwatch, batdiff, prettybat
# Link: https://github.com/eth-p/bat-extras
if hascommand --strict batman; then
	alias man='batman'
fi

# ccat is the colorizing cat
# Link: https://github.com/owenthereal/ccat
if hascommand --strict ccat; then
	alias cat='ccat'
fi

# Color for manpages in less makes manpages a little easier to read
if [[ -f /usr/share/source-highlight/src-hilite-lesspipe.sh ]]; then
	export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
elif hascommand --strict src-hilite-lesspipe.sh; then
	export LESSOPEN="| src-hilite-lesspipe.sh %s"
fi

# NOTE: Use \less with the back-slash to remove line numbers
# or you can use -n or --line-numbers if moar/most are not installed
export LESS='-N -x4 --force --ignore-case --quit-if-one-screen --no-init --RAW-CONTROL-CHARS --LONG-PROMPT --prompt=%t?f%f :stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#######################################################
# Vivid LS_COLORS Generator
# Link: https://github.com/sharkdp/vivid
# Themes: https://github.com/sharkdp/vivid/tree/master/themes
#######################################################
# LS_COLORS (lscolors-git in Arch AUR repository)
# Link: https://github.com/trapd00r/LS_COLORS
# Install:
# mkdir /tmp/LS_COLORS && curl -L https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master | tar xzf - --directory=/tmp/LS_COLORS --strip=1
# ( cd /tmp/LS_COLORS && sh install.sh )
#######################################################

# Colors for ls
export CLICOLOR=1

if hascommand --strict vivid; then
	# Vivid is installed
	export LS_COLORS="$(vivid generate snazzy)"
	_LS_COLORS_SOURCE="Vivid"
elif [[ -f "${XDG_DATA_HOME:-${HOME}/.local/share}/lscolors.sh" ]]; then
	# LS_COLORS is installed locally
	builtin source "${XDG_DATA_HOME:-${HOME}/.local/share}/lscolors.sh"
	_LS_COLORS_SOURCE="LS_COLORS Local"
elif [[ -f /usr/share/LS_COLORS/dircolors.sh ]]; then
	# LS_COLORS is installed system wide
	builtin source /usr/share/LS_COLORS/dircolors.sh
	_LS_COLORS_SOURCE="LS_COLORS System Wide"
elif hascommand --strict dircolors; then
	# dircolors is used by ls to set LS_COLORS for colorized directory output
	# Check if a custom .dircolors file exists in the user's home directory
	if test -r ~/.dircolors; then
		# If the file exists and is readable, use it to set LS_COLORS instead
		eval "$(dircolors -b ~/.dircolors)"
	else
		# If no custom .dircolors file exists then use the default settings
		eval "$(dircolors -b)"
	fi
	_LS_COLORS_SOURCE="dircolors"
else
	# Otherwise, export a full featured custom ls color profile
	LS_COLORS='bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;30:do=38;5;127:ex=38;5;208;1:pi=38;5;126:fi=0:ln=target:mh=38;5;222;1:no=0:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;3;38;5;0:su=38;5;220;1;3;100;1:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*.txt=38;5;253:*README=38;5;220;1:*README.rst=38;5;220;1:*README.md=38;5;220;1:*LICENSE=38;5;220;1:*COPYING=38;5;220;1:*INSTALL=38;5;220;1:*COPYRIGHT=38;5;220;1:*AUTHORS=38;5;220;1:*HISTORY=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*PATENTS=38;5;220;1:*VERSION=38;5;220;1:*NOTICE=38;5;220;1:*CHANGES=38;5;220;1:*.log=38;5;190:*.adoc=38;5;184:*.asciidoc=38;5;184:*.etx=38;5;184:*.info=38;5;184:*.markdown=38;5;184:*.md=38;5;184:*.mkd=38;5;184:*.nfo=38;5;184:*.org=38;5;184:*.pod=38;5;184:*.rst=38;5;184:*.tex=38;5;184:*.textile=38;5;184:*.bib=38;5;178:*.json=38;5;178:*.jsonl=38;5;178:*.jsonnet=38;5;178:*.libsonnet=38;5;142:*.ndjson=38;5;178:*.msg=38;5;178:*.pgn=38;5;178:*.rss=38;5;178:*.xml=38;5;178:*.fxml=38;5;178:*.toml=38;5;178:*.yaml=38;5;178:*.yml=38;5;178:*.RData=38;5;178:*.rdata=38;5;178:*.xsd=38;5;178:*.dtd=38;5;178:*.sgml=38;5;178:*.rng=38;5;178:*.rnc=38;5;178:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.db=38;5;60:*.fmp12=38;5;60:*.fp7=38;5;60:*.localstorage=38;5;60:*.mdb=38;5;60:*.mde=38;5;60:*.sqlite=38;5;60:*.typelib=38;5;60:*.nc=38;5;60:*.cbr=38;5;141:*.cbz=38;5;141:*.chm=38;5;141:*.djvu=38;5;141:*.pdf=38;5;141:*.PDF=38;5;141:*.mobi=38;5;141:*.epub=38;5;141:*.docm=38;5;111;4:*.doc=38;5;111:*.docx=38;5;111:*.odb=38;5;111:*.odt=38;5;111:*.rtf=38;5;111:*.pages=38;5;111:*.odp=38;5;166:*.pps=38;5;166:*.ppt=38;5;166:*.pptx=38;5;166:*.ppts=38;5;166:*.pptxm=38;5;166;4:*.pptsm=38;5;166;4:*.csv=38;5;78:*.tsv=38;5;78:*.numbers=38;5;112:*.ods=38;5;112:*.xla=38;5;76:*.xls=38;5;112:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.key=38;5;166:*config=1:*cfg=1:*conf=1:*rc=1:*authorized_keys=1:*known_hosts=1:*.ini=1:*.plist=1:*.profile=1:*.bash_profile=1:*.bash_login=1:*.bash_logout=1:*.zshenv=1:*.zprofile=1:*.zlogin=1:*.zlogout=1:*.viminfo=1:*.pcf=1:*.psf=1:*.hidden-color-scheme=1:*.hidden-tmTheme=1:*.last-run=1:*.merged-ca-bundle=1:*.sublime-build=1:*.sublime-commands=1:*.sublime-keymap=1:*.sublime-settings=1:*.sublime-snippet=1:*.sublime-project=1:*.sublime-workspace=1:*.tmTheme=1:*.user-ca-bundle=1:*.rstheme=1:*.epf=1:*.git=38;5;197:*.gitignore=38;5;240:*.gitattributes=38;5;240:*.gitmodules=38;5;240:*.awk=38;5;172:*.bash=38;5;172:*.bat=38;5;172:*.BAT=38;5;172:*.sed=38;5;172:*.sh=38;5;172:*.zsh=38;5;172:*.vim=38;5;172:*.kak=38;5;172:*.ahk=38;5;41:*.py=38;5;41:*.ipynb=38;5;41:*.xsh=38;5;41:*.rb=38;5;41:*.gemspec=38;5;41:*.pl=38;5;208:*.PL=38;5;160:*.pm=38;5;203:*.t=38;5;114:*.msql=38;5;222:*.mysql=38;5;222:*.pgsql=38;5;222:*.sql=38;5;222:*.tcl=38;5;64;1:*.r=38;5;49:*.R=38;5;49:*.gs=38;5;81:*.clj=38;5;41:*.cljs=38;5;41:*.cljc=38;5;41:*.cljw=38;5;41:*.scala=38;5;41:*.sc=38;5;41:*.dart=38;5;51:*.asm=38;5;81:*.cl=38;5;81:*.lisp=38;5;81:*.rkt=38;5;81:*.el=38;5;81:*.elc=38;5;241:*.eln=38;5;241:*.lua=38;5;81:*.moon=38;5;81:*.c=38;5;81:*.C=38;5;81:*.h=38;5;110:*.H=38;5;110:*.tcc=38;5;110:*.c++=38;5;81:*.h++=38;5;110:*.hpp=38;5;110:*.hx=38;5;110:*.hxx=38;5;110:*.hxsl=38;5;110:*.ii=38;5;110:*.M=38;5;110:*.m=38;5;110:*.cc=38;5;81:*.cs=38;5;81:*.cp=38;5;81:*.cpp=38;5;81:*.cxx=38;5;81:*.cr=38;5;81:*.go=38;5;81:*.f=38;5;81:*.F=38;5;81:*.for=38;5;81:*.ftn=38;5;81:*.f90=38;5;81:*.F90=38;5;81:*.f95=38;5;81:*.F95=38;5;81:*.f03=38;5;81:*.F03=38;5;81:*.f08=38;5;81:*.F08=38;5;81:*.nim=38;5;81:*.nimble=38;5;81:*.s=38;5;110:*.S=38;5;110:*.rs=38;5;81:*.scpt=38;5;219:*.swift=38;5;219:*.sx=38;5;81:*.vala=38;5;81:*.vapi=38;5;81:*.hi=38;5;110:*.hs=38;5;81:*.lhs=38;5;81:*.agda=38;5;81:*.lagda=38;5;81:*.lagda.tex=38;5;81:*.lagda.rst=38;5;81:*.lagda.md=38;5;81:*.agdai=38;5;110:*.zig=38;5;81:*.v=38;5;81:*.pyc=38;5;240:*.tf=38;5;168:*.tfstate=38;5;168:*.tfvars=38;5;168:*.css=38;5;125;1:*.less=38;5;125;1:*.sass=38;5;125;1:*.scss=38;5;125;1:*.htm=38;5;125;1:*.html=38;5;125;1:*.jhtm=38;5;125;1:*.mht=38;5;125;1:*.eml=38;5;125;1:*.mustache=38;5;125;1:*.coffee=38;5;074;1:*.java=38;5;074;1:*.js=38;5;074;1:*.mjs=38;5;074;1:*.jsm=38;5;074;1:*.jsp=38;5;074;1:*.ada=38;5;81:*.cbl=38;5;81:*.conf=38;5;81:*.cpy=38;5;81:*.ctp=38;5;81:*.erl=38;5;81:*.groovy=38;5;81:*.hrl=38;5;81:*.inc=38;5;81:*.ino=38;5;81:*.kt=38;5;81:*.lib=38;5;81:*.mat=38;5;81:*.mk=38;5;81:*.pascal=38;5;81:*.php=38;5;81:*.plx=38;5;81:*.sml=38;5;81:*.template=38;5;81:*.tpl=38;5;81:*.twig=38;5;81:*.vb=38;5;81:*.vba=38;5;81:*.vbs=38;5;81:*.wren=38;5;81:*Dockerfile=38;5;155:*.dockerignore=38;5;240:*Makefile=38;5;155:*MANIFEST=38;5;243:*pm_to_blib=38;5;240:*.nix=38;5;155:*.dhall=38;5;178:*.rake=38;5;155:*.am=38;5;242:*.in=38;5;242:*.hin=38;5;242:*.scan=38;5;242:*.m4=38;5;242:*.old=38;5;242:*.out=38;5;242:*.SKIP=38;5;244:*.diff=48;5;197;38;5;232:*.patch=48;5;197;38;5;232;1:*.bmp=38;5;97:*.dicom=38;5;97:*.tiff=38;5;97:*.tif=38;5;97:*.TIFF=38;5;97:*.cdr=38;5;97:*.flif=38;5;97:*.gif=38;5;97:*.icns=38;5;97:*.ico=38;5;97:*.jpeg=38;5;97:*.JPG=38;5;97:*.jpg=38;5;97:*.nth=38;5;97:*.png=38;5;97:*.psd=38;5;97:*.pxd=38;5;97:*.pxm=38;5;97:*.xpm=38;5;97:*.webp=38;5;97:*.ai=38;5;99:*.eps=38;5;99:*.epsf=38;5;99:*.drw=38;5;99:*.ps=38;5;99:*.svg=38;5;99:*.avi=38;5;114:*.divx=38;5;114:*.IFO=38;5;114:*.m2v=38;5;114:*.m4v=38;5;114:*.mkv=38;5;114:*.MOV=38;5;114:*.mov=38;5;114:*.mp4=38;5;114:*.mpeg=38;5;114:*.mpg=38;5;114:*.ogm=38;5;114:*.rmvb=38;5;114:*.sample=38;5;114:*.wmv=38;5;114:*.3g2=38;5;115:*.3gp=38;5;115:*.gp3=38;5;115:*.webm=38;5;115:*.gp4=38;5;115:*.asf=38;5;115:*.flv=38;5;115:*.ts=38;5;115:*.ogv=38;5;115:*.f4v=38;5;115:*.VOB=38;5;115;1:*.vob=38;5;115;1:*.ass=38;5;117:*.srt=38;5;117:*.ssa=38;5;117:*.sub=38;5;117:*.sup=38;5;117:*.vtt=38;5;117:*.3ga=38;5;137;1:*.S3M=38;5;137;1:*.aac=38;5;137;1:*.amr=38;5;137;1:*.au=38;5;137;1:*.caf=38;5;137;1:*.dat=38;5;137;1:*.dts=38;5;137;1:*.fcm=38;5;137;1:*.m4a=38;5;137;1:*.mod=38;5;137;1:*.mp3=38;5;137;1:*.mp4a=38;5;137;1:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.opus=38;5;137;1:*.s3m=38;5;137;1:*.sid=38;5;137;1:*.wma=38;5;137;1:*.ape=38;5;136;1:*.aiff=38;5;136;1:*.cda=38;5;136;1:*.flac=38;5;136;1:*.alac=38;5;136;1:*.mid=38;5;136;1:*.midi=38;5;136;1:*.pcm=38;5;136;1:*.wav=38;5;136;1:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.afm=38;5;66:*.fon=38;5;66:*.fnt=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.ttf=38;5;66:*.otf=38;5;66:*.woff=38;5;66:*.woff2=38;5;66:*.PFA=38;5;66:*.pfa=38;5;66:*.7z=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;40:*.tbz=38;5;40:*.tgz=38;5;40:*.warc=38;5;40:*.WARC=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.zoo=38;5;40:*.zpaq=38;5;40:*.zst=38;5;40:*.zstd=38;5;40:*.zz=38;5;40:*.apk=38;5;215:*.ipa=38;5;215:*.deb=38;5;215:*.rpm=38;5;215:*.jad=38;5;215:*.jar=38;5;215:*.ear=38;5;215:*.war=38;5;215:*.cab=38;5;215:*.pak=38;5;215:*.pk3=38;5;215:*.vdf=38;5;215:*.vpk=38;5;215:*.bsp=38;5;215:*.dmg=38;5;215:*.crx=38;5;215:*.xpi=38;5;215:*.iso=38;5;124:*.img=38;5;124:*.bin=38;5;124:*.nrg=38;5;124:*.qcow=38;5;124:*.fvd=38;5;124:*.sparseimage=38;5;124:*.toast=38;5;124:*.vcd=38;5;124:*.vdi=38;5;124:*.vhd=38;5;124:*.vhdl=38;5;124:*.vhdx=38;5;124:*.vfd=38;5;124:*.vmdk=38;5;124:*.swp=38;5;244:*.swo=38;5;244:*.tmp=38;5;244:*.sassc=38;5;244:*.pacnew=38;5;33:*.un~=38;5;241:*.orig=38;5;241:*.BUP=38;5;241:*.bak=38;5;241:*.o=38;5;241:*core=38;5;241:*.mdump=38;5;241:*.rlib=38;5;241:*.dll=38;5;241:*.aria2=38;5;241:*.dump=38;5;241:*.stackdump=38;5;241:*.zcompdump=38;5;241:*.zwc=38;5;241:*.part=38;5;239:*.r[0-9]{0,2}=38;5;239:*.zx[0-9]{0,2}=38;5;239:*.z[0-9]{0,2}=38;5;239:*.pid=38;5;248:*.state=38;5;248:*lockfile=38;5;248:*lock=38;5;248:*.err=38;5;160;1:*.error=38;5;160;1:*.stderr=38;5;160;1:*.pcap=38;5;29:*.cap=38;5;29:*.dmp=38;5;29:*.allow=38;5;112:*.deny=38;5;196:*.service=38;5;45:*@.service=38;5;45:*.socket=38;5;45:*.swap=38;5;45:*.device=38;5;45:*.mount=38;5;45:*.automount=38;5;45:*.target=38;5;45:*.path=38;5;45:*.timer=38;5;45:*.snapshot=38;5;45:*.lnk=38;5;39:*.application=38;5;116:*.cue=38;5;116:*.description=38;5;116:*.directory=38;5;116:*.m3u=38;5;116:*.m3u8=38;5;116:*.md5=38;5;116:*.properties=38;5;116:*.sfv=38;5;116:*.theme=38;5;116:*.torrent=38;5;116:*.urlview=38;5;116:*.webloc=38;5;116:*.asc=38;5;192;3:*.bfe=38;5;192;3:*.enc=38;5;192;3:*.gpg=38;5;192;3:*.signature=38;5;192;3:*.sig=38;5;192;3:*.p12=38;5;192;3:*.pem=38;5;192;3:*.pgp=38;5;192;3:*.p7s=38;5;192;3:*id_dsa=38;5;192;3:*id_rsa=38;5;192;3:*id_ecdsa=38;5;192;3:*id_ed25519=38;5;192;3:*.32x=38;5;213:*.cdi=38;5;213:*.fm2=38;5;213:*.rom=38;5;213:*.sav=38;5;213:*.st=38;5;213:*.a00=38;5;213:*.a52=38;5;213:*.A64=38;5;213:*.a64=38;5;213:*.a78=38;5;213:*.adf=38;5;213:*.atr=38;5;213:*.gb=38;5;213:*.gba=38;5;213:*.gbc=38;5;213:*.gel=38;5;213:*.gg=38;5;213:*.ggl=38;5;213:*.ipk=38;5;213:*.j64=38;5;213:*.nds=38;5;213:*.nes=38;5;213:*.sms=38;5;213:*.8xp=38;5;121:*.8eu=38;5;121:*.82p=38;5;121:*.83p=38;5;121:*.8xe=38;5;121:*.stl=38;5;216:*.dwg=38;5;216:*.ply=38;5;216:*.wrl=38;5;216:*.xib=38;5;208:*.iml=38;5;166:*.DS_Store=38;5;239:*.localized=38;5;239:*.CFUserTextEncoding=38;5;239:*CodeResources=38;5;239:*PkgInfo=38;5;239:*.nib=38;5;57:*.car=38;5;57:*.dylib=38;5;241:*.entitlements=1:*.pbxproj=1:*.strings=1:*.storyboard=38;5;196:*.xcconfig=1:*.xcsettings=1:*.xcuserstate=1:*.xcworkspacedata=1:*.pot=38;5;7:*.pcb=38;5;7:*.mm=38;5;7:*.gbr=38;5;7:*.scm=38;5;7:*.xcf=38;5;7:*.spl=38;5;7:*.Rproj=38;5;11:*.sis=38;5;7:*.1p=38;5;7:*.3p=38;5;7:*.cnc=38;5;7:*.def=38;5;7:*.ex=38;5;7:*.example=38;5;7:*.feature=38;5;7:*.ger=38;5;7:*.ics=38;5;7:*.map=38;5;7:*.mf=38;5;7:*.mfasl=38;5;7:*.mi=38;5;7:*.mtx=38;5;7:*.pc=38;5;7:*.pi=38;5;7:*.plt=38;5;7:*.rdf=38;5;7:*.ru=38;5;7:*.sch=38;5;7:*.sty=38;5;7:*.sug=38;5;7:*.tdy=38;5;7:*.tfm=38;5;7:*.tfnt=38;5;7:*.tg=38;5;7:*.vcard=38;5;7:*.vcf=38;5;7:*.xln=38;5;7:'
	_LS_COLORS_SOURCE="Custom Colors"
fi

#######################################################
# grc Generic Colouriser
# Link: https://github.com/garabik/grc
#######################################################

if [[ "${_SKIP_GRC}" = false ]] && hascommand --strict grc; then
	GRC_ALIASES=true

	# If we are not defaulting to manually set values and using includes...
	if [[ "${_GRC_USE_BASHRC_BUILTIN}" != true ]]; then
		# Source the first include found
		if [[ -f "${HOME}/.local/bin/grc.sh" ]]; then
			builtin source "${HOME}/.local/bin/grc.sh"
		elif [[ -f "/etc/profile.d/grc.sh" ]]; then
			builtin source "/etc/profile.d/grc.sh"
		elif [[ -f "/etc/grc.sh" ]]; then
			builtin source "/etc/grc.sh"
		else
			# No includes found, we will have to use the built-in aliases
			_GRC_USE_BASHRC_BUILTIN=true
		fi
	fi

	# If we need to use the manual built-in aliases...
	if [[ "${_GRC_USE_BASHRC_BUILTIN}" == true ]]; then
		# Find the grc command
		GRC="$(command -v grc)"

		# If the terminal is interactive and GRC command is found...
		if tty -s && [ -n "${TERM}" ] && [ "${TERM}" != "dumb" ] && [ -n "${GRC}" ]; then
			alias colourify="${GRC} -es"
			alias as='colourify as'
			alias blkid='colourify blkid'
			alias configure='colourify ./configure'
			[[ "$(type -t df)" != 'alias' ]] && alias df='colourify df --human-readable --print-type --exclude-type=squashfs'
			[[ "$(type -t diff)" != 'alias' ]] && alias diff='colourify diff'
			alias dig='colourify dig'
			alias docker='colourify docker'
			alias docker-compose='colourify docker-compose'
			alias docker-machine='colourify docker-machine'
			alias du='colourify du'
			# alias env='colourify env'
			alias fdisk='colourify fdisk'
			alias findmnt='colourify findmnt'
			alias free='colourify free -m'
			alias g++='colourify g++'
			alias gas='colourify gas'
			alias gcc='colourify gcc'
			alias getsebool='colourify getsebool'
			alias head='colourify head'
			alias id='colourify id'
			alias ifconfig='colourify ifconfig'
			alias ip='colourify ip'
			alias iptables='colourify iptables'
			alias journalctl='colourify journalctl'
			alias kubectl='colourify kubectl'
			alias ld='colourify ld'
			alias lsof='colourify lsof'
			alias lspci='colourify lspci'
			alias m='colourify mount'
			alias make='colourify make'
			alias mount='colourify mount'
			alias mtr='colourify mtr'
			alias netstat='colourify netstat'
			alias ping='colourify ping -c 5'
			# alias ps='colourify ps auxf'
			alias semanage='colourify semanage'
			alias sockstat='colourify sockstat'
			alias ss='colourify ss'
			alias tail='colourify tail'
			alias traceroute='colourify traceroute'
			alias traceroute6='colourify traceroute6'
		fi
	fi

	# Aliasing ps causes issues with some scripts
	alias ps &>/dev/null && unalias ps

	# Create another alias for ps color instead
	alias pss='colourify ps auxf'

	# Override lsblk to enhance the color output
	#alias lsblk='colourify lsblk --exclude 1,7 --output NAME,MAJ:MIN,RM,SIZE,RO,TYPE,MOUNTPOINTS'
	alias lsblk='colourify lsblk --exclude 1,7 --output NAME,MAJ:MIN,TYPE,FSTYPE,RM,MOUNTPOINTS,LABEL,SIZE,FSUSE%,RO,UUID 2> /dev/null || colourify lsblk --exclude 1,7'

else # grc is not installed...
	# List block devices but show more info including the files systems and permissions
	# and removes all mem and loopback devices (like snap packages) from the list
	#alias lsblk='command lsblk --exclude 1,7 --output NAME,MAJ:MIN,RM,SIZE,RO,TYPE,MOUNTPOINTS'
	alias lsblk='command lsblk --exclude 1,7 --output NAME,MAJ:MIN,TYPE,FSTYPE,RM,MOUNTPOINTS,LABEL,SIZE,FSUSE%,RO,UUID 2> /dev/null || command lsblk --exclude 1,7'

	# Make df look better if not already aliased at this point
	[[ "$(type -t df)" != 'alias' ]] && alias df='command df --human-readable --print-type --exclude-type=squashfs'
fi

#######################################################
# mysql-colorize
# Link: https://github.com/zpm-zsh/mysql-colorize
# Install: git clone https://github.com/horosgrisa/mysql-colorize.bash ~/.bash/mysql-colorize
#######################################################

# If qfc is installed
if [[ -f "${HOME}/.bash/mysql-colorize/mysql-colorize.bash" ]]; then
	builtin source "${HOME}/.bash/mysql-colorize/mysql-colorize.bash"
fi

#######################################################
# Nethogs shows which processes are using network bandwidth
# Link: https://github.com/raboof/nethogs
#######################################################
# lsof command stands for List Of Open File
# Link: https://www.geeksforgeeks.org/lsof-command-in-linux-with-examples/
#######################################################
# iftop is a network analyzing tool used to view the bandwidth related stats
# Link: https://www.geeksforgeeks.org/iftop-command-in-linux-with-examples/
#######################################################

if hascommand --strict nethogs; then
	# Watch real time network activity by process
	alias netwatch='sudo nethogs -d 0.5 -C'
elif hascommand --strict iftop; then
	# Use iftop
	alias netwatch='sudo iftop'
else
	# Watch real time network activity using lsof instead
	alias netwatch='lsof -i -r 10'
fi

#######################################################
# Diff Enhancement
#######################################################

if hascommand --strict delta; then
	if hascommand --strict batdiff; then
		# bat-extras diff uses delta
		# Link: https://github.com/eth-p/bat-extras
		alias diff='batdiff --delta'
	else
		# delta - Beautiful side by side colored diff with Git support and syntax highlighting
		# Link: https://github.com/dandavison/delta
		# Info: Add listed settings to your ~/.gitconfig
		alias diff='delta --side-by-side --line-numbers'
	fi
	export DIFFPROG='delta --side-by-side --line-numbers'
elif hascommand --strict difft; then
	# Difftastic is a structural diff tool that compares files based on their syntax
	# Supports over 30 programming languages
	# Link: https://github.com/Wilfred/difftastic
	alias diff='difft'
	export DIFFPROG='difft'
elif hascommand --strict icdiff; then
	# Icdiff - Improved (side by side) colored diff
	# Link: https://github.com/jeffkaufman/icdiff
	alias diff='icdiff --line-numbers --strip-trailing-cr'
	export DIFFPROG="icdiff --line-numbers --strip-trailing-cr"
elif hascommand --strict diff-so-fancy; then
	# diff-so-fancy strives to make your diffs human readable instead of machine readable
	# Link: https://github.com/so-fancy/diff-so-fancy
	alias diff='_diff_f() { command diff -u "$@" | diff-so-fancy; }; _diff_f'
	export DIFFPROG='diff-so-fancy'
elif hascommand --strict colordiff; then
	# Colorize diff output if colordiff is installed
	alias diff='colordiff'
	export DIFFPROG="colordiff"
else
	if [[ ${EDITOR} = 'nvim' ]]; then
		export DIFFPROG="nvim -d"
	elif [[ ${EDITOR} = 'vim' ]]; then
		export DIFFPROG="vim -d"
	else
		export DIFFPROG="command diff --side-by-side --suppress-common-lines --ignore-all-space --ignore-blank-lines --strip-trailing-cr --report-identical-files"
	fi
fi

#######################################################
# Desktop Environment
#######################################################

# If we are inside a desktop environment (and not TTY or SSH)
if ([[ -n "$DISPLAY" ]] || [[ -n "$WAYLAND_DISPLAY" ]]) && [[ -n "$XDG_CURRENT_DESKTOP" ]]; then

	# Alias to log out the currect user
	alias logout="sudo pkill -u ${USER}"

	# Check if the user's session type is X11
	if [[ "${XDG_SESSION_TYPE}" == "x11" ]]; then
		# Ensure the ffmpeg command is available
		if hascommand --strict ffmpeg; then
			# Create an alias to capture video on X11 using ffmpeg
			# Documentation for ffmpeg: https://ffmpeg.org/documentation.html
			alias grabvideo='ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -qscale 0'
		fi

		# Fix QT_QPA_PLATFORM if wrongly set to offscreen (makes Qt/KDE apps invisible)
		if [[ $QT_QPA_PLATFORM == "offscreen" ]]; then
				export QT_QPA_PLATFORM=xcb
		fi

	# Check if the user's session type is Wayland
	elif [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
		# Ensure the wf-recorder command is available (requires wl-roots compositor)
		if hascommand wf-recorder; then
			# Create an alias to capture video on Wayland using wf-recorder
			# Documentation for wf-recorder: https://github.com/ammen99/wf-recorder
			alias grabvideo='wf-recorder -f output.mp4'
		fi

		# Fix QT_QPA_PLATFORM if wrongly set to offscreen (makes Qt/KDE apps invisible)
		if [[ $QT_QPA_PLATFORM == "offscreen" ]]; then
				export QT_QPA_PLATFORM=wayland
		fi
	fi

	# If a gui diff/merge application is installed, use that instead
	for _DIFF_APP_GUI in \
		meld \
		kompare \
		kdiff3 \
		xxdiff
	do
		if hascommand --strict ${_DIFF_APP_GUI}; then
			# Create a function capturing the diff tool value at define time
			# (eval-based closure so the function doesn't depend on the loop variable)
			eval "gdiff() { \"${_DIFF_APP_GUI}\" \"\$@\" > /dev/null 2>&1 & disown; }"

			# Optionally, set DIFFPROG
			# export DIFFPROG="${_DIFF_APP_GUI}"
			break
		fi
	done

	# Loop through potential file managers and set alias for the first found
	for _FILE_MANAGER in \
		kde-open \
		gnome-open \
		xdg-open \
		exo-open \
		krusader \
		doublecmd \
		dolphin \
		thunar \
		pcmanfm \
		nautilus \
		nemo \
		caja \
		konqueror \
		ranger \
		nnn \
		mc
	do
		if hascommand --strict ${_FILE_MANAGER}; then
			if [[ "${_FILE_MANAGER}" == "kde-open" ]]; then
				# Only use kde-open on KDE desktops
				[[ "$XDG_CURRENT_DESKTOP" == *KDE* ]] || continue
				alias ui="kde-open \"\${PWD}\""
			elif [[ "${_FILE_MANAGER}" == "gnome-open" ]]; then
				# Only use gnome-open on GNOME desktops
				[[ "$XDG_CURRENT_DESKTOP" == *GNOME* ]] || continue
				alias ui="gnome-open \"\${PWD}\""
			elif [[ "${_FILE_MANAGER}" == "exo-open" ]]; then
				# Only use exo-open on Xfce desktops
				[[ "$XDG_CURRENT_DESKTOP" == *XFCE* ]] || continue
				alias ui="exo-open --launch FileManager \"\${PWD}\" > /dev/null 2>&1 & disown"
			elif [[ "${_FILE_MANAGER}" =~ ^(ranger|nnn|mc)$ ]]; then
				# These commands do not need backgrounding or output suppression
				alias ui="${_FILE_MANAGER} \"\${PWD}\""
			else
				# General case for GUI-based file managers (xdg-open, dolphin, etc.)
				alias ui="${_FILE_MANAGER} \"\${PWD}\" > /dev/null 2>&1 & disown"
			fi
			break  # Stop the loop once the first available file manager is found
		fi
	done
fi

#######################################################
# Bash Completion
# Link: https://github.com/scop/bash-completion
#######################################################

# Use extended globbing for more advanced pattern matching
# This is necessary for programmable completion
shopt -s extglob

if [[ ! ${_SKIP_BASH_COMPLETION} = true ]]; then
	# Use bash-completion, if available
	if [[ -f "/usr/share/bash-completion/bash_completion" ]]; then
		builtin source "/usr/share/bash-completion/bash_completion"
	elif [[ -f "/etc/bash_completion" ]]; then
		builtin source "/etc/bash_completion"
	elif [[ -f "${HOME}/bash_completion" ]]; then
		builtin source "${HOME}/bash_completion"
	elif [[ -f "${XDG_DATA_HOME:-${HOME}/.local/share}/bash_completion" ]]; then
		builtin source "${XDG_DATA_HOME:-${HOME}/.local/share}/bash_completion"
	elif [[ -f "${XDG_CONFIG_HOME:-${HOME}/.config}/bash_completion" ]]; then
		builtin source "${XDG_CONFIG_HOME:-${HOME}/.config}/bash_completion"
	fi
fi

#######################################################
# Cod is a completion daemon for bash, fish, and zsh
# Link: https://github.com/dim-an/cod
#######################################################

if hascommand --strict cod; then
	builtin source <(cod init $$ bash)
fi

###########################################################################
# fzf-tab-completion tab completion using fzf in bash, GNU readline apps
# Link: https://github.com/lincheney/fzf-tab-completion
# Install: git clone https://github.com/lincheney/fzf-tab-completion
###########################################################################

# Check if the fzf-bash-completion.sh script exists in known locations
if [[ -f "/usr/share/fzf-tab-completion/bash/fzf-bash-completion.sh" ]]; then
	# Source the fzf bash completion script
	builtin source "/usr/share/fzf-tab-completion/bash/fzf-bash-completion.sh"

	# Bind the tab key to the fzf_bash_completion function
	bind -x '"\t": fzf_bash_completion'

	# Bind Shift+Tab to the default completion function as a backup
	bind '"\033[Z": complete'

	# If nodejs is installed, enable fzf-tab-completion for nodejs repl
	if hascommand node; then
		alias node='node -r /usr/share/fzf-tab-completion/node/fzf-node-completion.js'
	fi
elif [[ -f "${HOME}/fzf-tab-completion/bash/fzf-bash-completion.sh" ]]; then
	# Source the fzf bash completion script if git cloned
	builtin source "${HOME}/fzf-tab-completion/bash/fzf-bash-completion.sh"

	# Bind the tab key to the fzf_bash_completion function
	bind -x '"\t": fzf_bash_completion'

	# Bind Shift+Tab to the default completion function as a backup
	bind '"\033[Z": complete'

	# If nodejs is installed, enable fzf-tab-completion for nodejs repl
	if hascommand node; then
		alias node="node -r ${HOME}/fzf-tab-completion/node/fzf-node-completion.js"
	fi
elif [[ -f "${BASHRC_INSTALL_DIR}/fzf-tab-completion/bash/fzf-bash-completion.sh" ]]; then
	# Source the fzf bash completion script if git cloned
	builtin source "${BASHRC_INSTALL_DIR}/fzf-tab-completion/bash/fzf-bash-completion.sh"

	# Bind the tab key to the fzf_bash_completion function
	bind -x '"\t": fzf_bash_completion'

	# Bind Shift+Tab to the default completion function as a backup
	bind '"\033[Z": complete'

	# If nodejs is installed, enable fzf-tab-completion for nodejs repl
	if hascommand node; then
		alias node="node -r ${BASHRC_INSTALL_DIR}/fzf-tab-completion/node/fzf-node-completion.js"
	fi
fi

#######################################################
# Enable the "Command not found" hook
# Link: https://github.com/falconindy/pkgfile
# NOTE: pkgfile is targetted at Arch Linux users
# Install: pacman -S pkgfile
#######################################################

if [[ -r /usr/share/doc/pkgfile/command-not-found.bash ]]; then
	builtin source /usr/share/doc/pkgfile/command-not-found.bash
fi

#######################################################
# Better Bash Defaults
# Link: http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
#######################################################

# Bind the Right arrow key to forward-char (move cursor forward)
bind '"\033[C": forward-char'

# Bind the Left arrow key to backward-char (move cursor backward)
bind '"\033[D": backward-char'

# CTRL+u will now undo (CTRL+z may or may not work)
bind '"\C-u": undo'
# bind '"\C-z": undo'

# CRTL+q will now clear the entire line in the terminal (remember quit command)
bind '"\C-q": kill-whole-line'

# CTRL+d will disconnect even if there is text on the line
bind '"\C-d":"\C-k\C-u\C-d"'

# Disable the bell sound but make it visible
bind 'set bell-style visible'

# Update window size after each command and, if necessary, update the values of LINES and COLUMNS
# shopt -s checkwinsize
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=3

# Turn on recursive globbing (enables ** to recurse all directories)
# For example, ls **/*.txt will list all text files in the current directory hierarchy
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Report the status of terminated background jobs immediately rather than before the next primary prompt
set -o notify

# Bash checks that a command found in the hash table exists before trying to execute it
shopt -s checkhash

# Bash includes filenames beginning with a "." in the results of filename expansion
shopt -s dotglob

# Disable core dumps because of the following reasons:
# 1. Security:    Core dumps can contain sensitive data, such as passwords or
#                 encryption keys which are a potential security risk!
# 2. Disk Space:  Core dumps can be large and consume significant disk space
# 3. Performance: Writing core dumps to disk can impact system performance
#                 particularly if crashes are frequent or if the disk is slow
# You can also edit the /etc/security/limits.conf file and add the following:
# * soft core 0  <- without the # in the beginning
# * hard core 0  <- without the # in the beginning
# For more information on disabling core dumps in systemd, visit the following:
# https://www.cyberciti.biz/faq/disable-core-dumps-in-linux-with-systemd-sysctl/
ulimit -S -c 0

# Don't let my shell warn me of incoming mail
shopt -u mailwarn
unset MAILCHECK

# Prevent overwriting an existing file with the >, >&, and <> redirection operators
# Use `>|` to force redirection to an existing file
#set -o noclobber

# Turns off CTRL+D to log out
#set -o ignoreeof

# Fix the HOME and END keys in PuTTY
if [[ "$COLORTERM" ]]; then # rxvt
	bind '"\033[7~": beginning-of-line'
	bind '"\033[8~": end-of-line'
else # xterm
	bind '"\033[1~": beginning-of-line'
	bind '"\033[4~": end-of-line'
fi

#######################################################
### SMARTER TAB-COMPLETION (Readline bindings)
#######################################################

# Perform file completion in a case insensitive fashion
bind 'set completion-ignore-case on'

# Treat hyphens and underscores as equivalent
bind 'set completion-map-case on'

# Display matches for ambiguous patterns at first tab press instead of bell
bind 'set show-all-if-ambiguous on'

# This line sets the completions to be listed immediately instead of ringing
# the bell when the completing word has more than one possible completion but
# no partial completion can be made
bind 'set show-all-if-unmodified on'

# Immediately add a trailing slash when autocompleting symlinks to directories
bind 'set mark-symlinked-directories on'

# Add a trailing slash when completing a directory name
bind 'set mark-directories on'

# Set autoexpansion of the '~' when TAB is pressed
bind 'set expand-tilde off'

# This line sets readline to display possible completions using different
# colors to indicate their file types. The colors are determined by the
# environmental variable LS_COLORS, which can be nicely configured
bind 'set colored-stats on'

# This lines sets completions to be appended by characters that indicate their
# file types reported by the stat system call
bind 'set visible-stats on'

#######################################################
### BETTER DIRECTORY NAVIGATION
#######################################################

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null

# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
shopt -s direxpand 2> /dev/null

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# The source builtin uses the value of PATH to find the directory containing the file supplied as an argument
shopt -s sourcepath

# If Readline is being used, Bash will not attempt to search the PATH for possible completions when completion is attempted on an empty line
shopt -s no_empty_cmd_completion

#######################################################
# User Specific Aliases
# This runs towards the end of the script in order to
# have supporting aliases and features and also so
# these can be over-written or modified (see unalias)
#######################################################

if [[ -f "${HOME}/.bash_aliases" ]]; then
	builtin source "${HOME}/.bash_aliases"
elif [[ -f "${BASHRC_INSTALL_DIR}/aliases" ]]; then
	builtin source "${BASHRC_INSTALL_DIR}/aliases"
fi

#######################################################
# Enhancd next-generation cd command with an interactive filter
# Link: https://github.com/b4b4r07/enhancd
# Install: cd ~ && git clone https://github.com/b4b4r07/enhancd
# NOTE: Breaks/replaces Bash shell option "shopt -s cdable_vars"
#######################################################

# If enhancd is installed, initialize it
if [[ -f "/usr/share/enhancd/init.sh" ]]; then
	ENHANCD_FILTER=fzy:sk:fzf:peco:percol:pick:icepick:selecta:sentaku:zf
	export ENHANCD_FILTER
	builtin source "/usr/share/enhancd/init.sh"
elif [[ -f "${HOME}/enhancd/init.sh" ]]; then
	ENHANCD_FILTER=fzy:sk:fzf:peco:percol:pick:icepick:selecta:sentaku:zf
	export ENHANCD_FILTER
	builtin source "${HOME}/enhancd/init.sh"
elif [[ -f "${BASHRC_INSTALL_DIR}/enhancd/init.sh" ]]; then
	ENHANCD_FILTER=fzy:sk:fzf:peco:percol:pick:icepick:selecta:sentaku:zf
	export ENHANCD_FILTER
	builtin source "${BASHRC_INSTALL_DIR}/enhancd/init.sh"
fi

#######################################################
# Fasd keeps track of files and directories you have
# accessed so that you can quickly reference them
# a  - any (directory or file)
# s  - show / search / select
# d  - directory
# f  - file
# sd - interactive directory selection
# sf - interactive file selection
# z  - cd, same functionality as j in autojump
# zz - cd with interactive selection
# Link: https://github.com/clvv/fasd
#######################################################

# If fasd is installed, initialize it
if hascommand --strict fasd; then
	eval "$(fasd --init auto)"
fi

#######################################################
# Automatically source node.js and npm
#######################################################

# Check if npm command exists
if hascommand --strict npm; then

	# Define an array to store possible locations of NVM initialization files
	# Order of the locations matters as this will use the first file it finds
	_NVM_FILE_LOCATIONS=(
		"${HOME}/.nvm/init-nvm.sh"
		"${HOME}/.nvm/nvm.sh"
		"${XDG_DATA_HOME:-${HOME}/.local/share}/nvm/init-nvm.sh"
		"${XDG_DATA_HOME:-${HOME}/.local/share}/nvm/nvm.sh"
		"${XDG_CONFIG_HOME:-${HOME}/.config}/nvm/init-nvm.sh"
		"${XDG_CONFIG_HOME:-${HOME}/.config}/nvm/nvm.sh"
		"/usr/share/nvm/init-nvm.sh"
		"/opt/nvm/init-nvm.sh"
		"/opt/nvm/nvm.sh"
		"/usr/share/nvm/nvm.sh"
	)

	# Iterate over the locations
	for _NVM_FILE in "${_NVM_FILE_LOCATIONS[@]}"; do
		# Check if the current file exists
		if [[ -L "${_NVM_FILE}" || -f "${_NVM_FILE}" ]]; then
			# If the file exists, source it to initialize NVM and set the
			# NVM_DIR based on the directory of the found initialization file
			if _RESOLVED_PATH="$(resolvesymlink "${_NVM_FILE}" 2>/dev/null)" && \
				[[ -n "${_RESOLVED_PATH}" ]] && [[ -f "${_RESOLVED_PATH}" ]] && \
				builtin source "${_RESOLVED_PATH}" 2>/dev/null && \
				NVM_DIR="$(builtin cd "$(command dirname "${_RESOLVED_PATH}")" && command pwd 2>/dev/null)"; then

				export NVM_DIR
				break # Break out of the loop
			fi
		fi
	done

	# Define an array to store possible locations of the bash_completion file
	_NVM_FILE_LOCATIONS=(
		"${NVM_DIR}/bash_completion"
		"${HOME}/.nvm/bash_completion"
		"${XDG_DATA_HOME:-${HOME}/.local/share}/nvm/bash_completion"
		"${XDG_CONFIG_HOME:-${HOME}/.config}/nvm/bash_completion"
		"/usr/share/nvm/bash_completion"
		"/opt/nvm/bash_completion"
	)

	# Iterate over the locations
	for _NVM_FILE in "${_NVM_FILE_LOCATIONS[@]}"; do
		# Check if the current bash_completion file exists
		if [[ -f "${_NVM_FILE}" ]]; then
			# If the file exists, source it to load NVM bash completion
			builtin source "${_NVM_FILE}" 2>/dev/null
			break # Break out of the loop
		fi
	done

	# Clean up
	unset _RESOLVED_PATH _NVM_FILE_LOCATIONS _NVM_FILE
fi

#######################################################
# Automatically source all files/links in the directory:
# ~/.config/bashrc/bashrc.d
#######################################################

# If the auto-source folder exists and has files in it...
if [[ -d "${BASHRC_INSTALL_DIR}/bashrc.d" ]]; then

	# If the directory is not empty...
	if [[ "$(command ls -A "${BASHRC_INSTALL_DIR}/bashrc.d")" ]]; then

		# Loop through files (in alphabetical order) and source them
		# To specify a load order, files can be prefixed with numbers
		# (e.g. 00--filename, 50--filename, 95--filename)
		for file in "${BASHRC_INSTALL_DIR}"/bashrc.d/*; do
			builtin source "${file}"
		done
	fi
fi

#######################################################
# Custom Bash Prompt Configuration
# This script configures a personalized, attractive, and informative Bash prompt
# that displays useful information such as the current user, date, time, working
# directory, and Git repository status organized by an attractive color scheme
# NOTE This default prompt will be used if another prompt is not installed
# Link: https://ezprompt.net/ (some modifications below)
#######################################################
# Git Code Reference:
# > Renamed
# * Ahead
# + New File
# ? Untracked
# x Deleted
# ! Dirty
#######################################################

# Get current branch in Git repo
function _prompt_git_branch() {
	if hascommand --strict git; then
		if [[ $_GIT_IS_SLOW = false ]]; then
			BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
			if [[ -n "${BRANCH}" ]]; then
				STAT=$(_prompt_git_status)
				echo " [${BRANCH}${STAT}]"
			else
				echo ""
			fi
		else
			_prompt_git_fast "${@}"
		fi
	else
		# Git is not installed, return empty string
		echo ""
	fi
}

# Get current status of Git repo
function _prompt_git_status() {
	# Check if we are in a git directory
	if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
		echo ""
		return
	fi

	# Cache the git status
	local STATUS=$(git status --porcelain 2>&1)

	# Check for conditions using pattern matching on porcelain status
	# Porcelain format: XY where X=index status, Y=working-tree status
	local DIRTY=$(echo "${STATUS}" | grep -c '^[ MADRCU][MD]')
	local UNTRACKED=$(echo "${STATUS}" | grep -c '^??')
	local AHEAD=$(git rev-list --count @{u}..HEAD 2>/dev/null || echo 0)
	local NEW_FILE=$(echo "${STATUS}" | grep -c '^A')
	local RENAMED=$(echo "${STATUS}" | grep -c '^R')
	# Match deletions in both index (D.) and working-tree (.D)
	local DELETED=$(echo "${STATUS}" | grep -c '^\(.D\|D.\)')
	# Staged changes: anything with a non-space in the index column
	# Exclude new/renamed/deleted since they have their own symbols
	local STAGED=$(echo "${STATUS}" | grep -c '^[MC] ')

	# Build the status string
	local BITS=''
	[[ ${RENAMED:-0} -ne 0 ]]   && BITS=">${BITS}"
	[[ ${AHEAD:-0} -ne 0 ]]     && BITS="*${BITS}"
	[[ ${NEW_FILE:-0} -ne 0 ]]  && BITS="+${BITS}"
	[[ ${UNTRACKED:-0} -ne 0 ]] && BITS="?${BITS}"
	[[ ${DELETED:-0} -ne 0 ]]   && BITS="x${BITS}"
	[[ ${DIRTY:-0} -ne 0 ]]     && BITS="!${BITS}"
	[[ ${STAGED:-0} -ne 0 ]]    && BITS="~${BITS}"

	# Output result
	[[ -n "${BITS}" ]] && echo " ${BITS}" || echo ""
}

# Faster Git information for Git Bash and slow networks
# https://stackoverflow.com/questions/4485059/git-bash-is-extremely-slow-in-windows-7-x64/19500237#19500237
# https://stackoverflow.com/questions/4485059/git-bash-is-extremely-slow-in-windows-7-x64/13476961#13476961
# https://stackoverflow.com/questions/39518124/check-if-directory-is-git-repository-without-having-to-cd-into-it/39518382#39518382
function _prompt_git_fast() {
	if hascommand --strict git; then
		git -C . rev-parse 2>/dev/null >/dev/null && \
		echo " [$(git symbolic-ref --short -q HEAD 2>/dev/null || \
			git rev-parse -q --short HEAD 2>/dev/null)]"
	else
		# Git is not installed, return empty string
		echo ""
	fi
}

# Return the path for the multi-line prompt
function _prompt_pwd_full() {
	# Returns the full path but still shows the home directory as ~
	echo "${PWD}" | sed "s@${HOME}@~@"
}

# Clear out the prompt command before we begin
# (Some environments can set this and cause errors)
export PROMPT_COMMAND=''

# Set the prompt based on the environment
if [[ "$_KERNEL_NAME" = "MINGW" ]] || [[ "$_KERNEL_NAME" = "CYGWI" ]]; then

	# If using Git Bash or Cygwin use faster and less intensive functions
	export PS1='\[\033[0;35m\]\u \
\[\033[0;34m\]\D{%b %d} \
\[\033[0;36m\]\A \
\[\033[0;33m\]\w\
\[\033[0;31m\]`_prompt_git_fast`\
\[\033[0m\]\n\$ '

else # Standard default prompt

	# Prompt color changes if logged on as root
	if [[ ${EUID} -gt 0 ]]; then
		_COLOR_USER="\033[0;32m"
	else
		_COLOR_USER="\033[1;31m"
	fi

	# Date formats can be found here (man strftime):
	# https://manpages.ubuntu.com/manpages/xenial/man3/strftime.3.html
	# https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/

	# Ff connected SSH, show the host...
	if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
		if [[ $_PROMPT_BUILTIN_FULL_PATH = false ]]; then
			# Remote SSH with short path (1 line)
			export PS1="\[\033[0;35m\]\u\
@\[\033[1;35m\]\h \
\[\033[0;34m\]\D{%b %-d} \
\[\033[0;36m\]\D{%-H:%M} \
\[\033[0;33m\]\w\
\[\033[0;31m\]\$(_prompt_git_branch) \
\[${_COLOR_USER}\]>\[\033[0m\] "
		else
			# Remote SSH with full path (2 lines)
			export PS1="\[\033[0;35m\]\u\
@\[\033[1;35m\]\h \
\[\033[0;34m\]\D{%b %-d} \
\[\033[0;36m\]\D{%-H:%M:%S} \
\[\033[0;33m\]\$(_prompt_pwd_full)\
\[\033[0;31m\]\$(_prompt_git_branch)\
\[\033[0m\]\n\[${_COLOR_USER}\]>\[\033[0m\] "
		fi

	else # Local prompt - only show the name

		if [[ $_PROMPT_BUILTIN_FULL_PATH = false ]]; then
			# Local with short path (1 line)
			export PS1="\[\033[0;35m\]\u \
\[\033[0;34m\]\D{%b %-d} \
\[\033[0;36m\]\D{%-H:%M} \
\[\033[0;33m\]\w\
\[\033[0;31m\]\$(_prompt_git_branch) \
\[${_COLOR_USER}\]>\[\033[0m\] "
		else
			# Local with full path (2 lines)
			export PS1="\[\033[0;35m\]\u \
\[\033[0;34m\]\D{%b %-d} \
\[\033[0;36m\]\D{%-H:%M:%S} \
\[\033[0;33m\]\$(_prompt_pwd_full)\
\[\033[0;31m\]\$(_prompt_git_branch)\
\[\033[0m\]\n\[${_COLOR_USER}\]>\[\033[0m\] "
		fi
	fi
fi

#######################################################
# Attempt to find and load some of the top installed prompts
# Only set and replace the custom prompt script if installed
# Otherwise, the standard prompt in a section above is already set
#######################################################

# The original older Extreme Ultimate .bashrc File prompt with added Git support
if [[ -f "${HOME}/.bashrc_prompt" ]] && [[ $_SKIP_PROMPT_ORIGINAL = false ]]; then
	builtin source "${HOME}/.bashrc_prompt"
elif [[ -f "${BASHRC_INSTALL_DIR}/prompt" ]] && [[ $_SKIP_PROMPT_ORIGINAL = false ]]; then
	builtin source "${BASHRC_INSTALL_DIR}/prompt"

# Trueline Bash (true 24-bit color and glyph support)
# This is the preferred prompt since it looks amazing,
# has so many features, is easily extended using functions,
# and is a single Bash script file that is easy to install.
# NOTE: You can place trueline.sh in the ~/.config/bashrc directory to keep it out of home
# Link: https://github.com/petobens/trueline
# Install: wget https://raw.githubusercontent.com/petobens/trueline/master/trueline.sh -P ~/
# Fonts: https://github.com/powerline/fonts
elif hascommand --strict trueline && [[ $_SKIP_PROMPT_TRUELINE = false ]]; then
	builtin source "$(command which trueline)"
elif [[ -f /usr/bin/trueline ]] && [[ $_SKIP_PROMPT_TRUELINE = false ]]; then
	builtin source /usr/bin/trueline
elif [[ -f "${BASHRC_INSTALL_DIR}/trueline.sh" ]] && [[ $_SKIP_PROMPT_TRUELINE = false ]]; then
	builtin source "${BASHRC_INSTALL_DIR}/trueline.sh"
elif [[ -f "${HOME}/trueline/trueline.sh" ]] && [[ $_SKIP_PROMPT_TRUELINE = false ]]; then
	builtin source "${HOME}/trueline/trueline.sh"
elif [[ -f "${HOME}/trueline.sh" ]] && [[ $_SKIP_PROMPT_TRUELINE = false ]]; then
	builtin source "${HOME}/trueline.sh"

# Powerline-Go Global Install (this prompt uses no special glyphs)
# Link: https://github.com/justjanne/powerline-go
elif [[ -f "/usr/bin/powerline-go" ]] && [[ $_SKIP_PROMPT_POWERLINE_GO = false ]]; then

	# Prompt Configuration for Powerline-Go
	function _powerline_go_update_ps1() {
		PS1="$(/usr/bin/powerline-go -error $? -jobs $(jobs -p | wc -l))"

		# Automatically clear errors after showing them once (can cause problems)
		#set "?"
	}
	PROMPT_COMMAND="_powerline_go_update_ps1; $PROMPT_COMMAND"
# Powerline-Go Home Folder Install (this prompt uses no special glyphs)
elif [[ -f "$GOPATH/bin/powerline-go" ]] && [[ $_SKIP_PROMPT_POWERLINE_GO = false ]]; then

	# Prompt Configuration for Powerline-Go
	function _powerline_go_update_ps1() {
		PS1="$($GOPATH/bin/powerline-go -error $? -jobs $(jobs -p | wc -l))"

		# Automatically clear errors after showing them once (can cause problems)
		#set "?"
	}
	PROMPT_COMMAND="_powerline_go_update_ps1; $PROMPT_COMMAND"

# Powerline-Shell (details about git/svn/hg/fossil branch and Python virtualenv environment)
# Link: https://github.com/b-ryan/powerline-shell
elif hascommand --strict powerline-shell && [[ $_SKIP_PROMPT_POWERLINE_SHELL = false ]]; then

	# Prompt Configuration for Powerline-Shell
	function _powerline_shell_update_ps1() {
		PS1=$(powerline-shell $?)
	}
	PROMPT_COMMAND="_powerline_shell_update_ps1; $PROMPT_COMMAND"

# Pureline (256 color written in bash script)
# Link: https://github.com/chris-marsh/pureline
# Install:
# git clone https://github.com/chris-marsh/pureline.git
# cp pureline/configs/powerline_full_256col.conf ~/.pureline.conf
elif [[ -f "${HOME}/pureline/pureline" ]] && [[ $_SKIP_PROMPT_PURELINE = false ]]; then
	builtin source "${HOME}/pureline/pureline" "${HOME}/.pureline.conf"

# Starship Cross Shell Prompt (focus on compatibility and written in Rust)
# Link: https://starship.rs
# Install: sh -c "$(curl -fsSL https://starship.rs/install.sh)"
elif hascommand --strict starship && [[ $_SKIP_PROMPT_STARSHIP = false ]]; then
	eval "$(starship init bash)"

# Oh My Posh Cross Shell Prompt (highly themeable, supports bash)
# Link: https://ohmyposh.dev
# Install: curl -s https://ohmyposh.dev/install.sh | bash -s
elif hascommand --strict oh-my-posh && [[ $_SKIP_PROMPT_OH_MY_POSH = false ]]; then
	eval "$(oh-my-posh init bash)"

# Oh-My-Git (only used for Git but has huge support for it, requires font)
# Link: https://github.com/arialdomartini/oh-my-git
# Install: git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git
elif [[ -f "${HOME}/.oh-my-git/prompt.sh" ]] && [[ $_SKIP_PROMPT_OH_MY_GIT = false ]]; then
	builtin source "${HOME}/.oh-my-git/prompt.sh"

# Bash Git Prompt (shows git repository, branch name, difference with remote branch, number of files staged, changed, etc)
# Link: https://github.com/magicmonty/bash-git-prompt
# Install: git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
elif [[ -f /usr/lib/bash-git-prompt/gitprompt.sh ]] && [[ $_SKIP_PROMPT_BASH_GIT_PROMPT = false ]]; then
	# To only show the git prompt in or under a repository directory
	GIT_PROMPT_ONLY_IN_REPO=1
	# To use upstream's default theme
	# GIT_PROMPT_THEME=Default
	# To use upstream's default theme, modified by arch maintainer
	GIT_PROMPT_THEME=Default_Arch
	builtin source /usr/lib/bash-git-prompt/gitprompt.sh
elif [[ -f "${HOME}/.bash-git-prompt/gitprompt.sh" ]] && [[ $_SKIP_PROMPT_BASH_GIT_PROMPT = false ]]; then
	# To only show the git prompt in or under a repository directory
	GIT_PROMPT_ONLY_IN_REPO=1
	# To use upstream's default theme
	# GIT_PROMPT_THEME=Default
	# To use upstream's default theme, modified by arch maintainer
	GIT_PROMPT_THEME=Default_Arch
	builtin source "${HOME}/.bash-git-prompt/gitprompt.sh"

# Bash Powerline (no need for patched fonts, supports git, previous command execution status, platform-dependent prompt symbols)
# Link: https://github.com/riobard/bash-powerline
# Install: curl https://raw.githubusercontent.com/riobard/bash-powerline/master/bash-powerline.sh > ~/.bash-powerline.sh
elif [[ -f "${HOME}/.bash-powerline.sh" ]] && [[ $_SKIP_PROMPT_BASH_POWERLINE = false ]]; then
	builtin source "${HOME}/.bash-powerline.sh"

# Sexy Bash Prompt (supports git, 256 color)
# Link: https://github.com/twolfson/sexy-bash-prompt
# Install: (cd /tmp && ([[ -d sexy-bash-prompt ]] || git clone --depth 1 --config core.autocrlf=false https://github.com/twolfson/sexy-bash-prompt) && cd sexy-bash-prompt && make install)
elif [[ -f "${HOME}/.bash_prompt" ]] && [[ $_SKIP_PROMPT_SEXY_BASH_PROMPT = false ]]; then
	builtin source "${HOME}/.bash_prompt"

# Liquid Prompt (adaptive prompt with low color and no glyphs)
# Link: https://github.com/nojhan/liquidprompt
# Install: git clone --branch stable https://github.com/nojhan/liquidprompt.git ~/liquidprompt
elif [[ -f "${HOME}/liquidprompt/liquidprompt" ]] && [[ $_SKIP_PROMPT_LIQUIDPROMPT = false ]]; then
	builtin source "${HOME}/liquidprompt/liquidprompt"

# Original Powerline Status Line for Vim Bash Zsh fish tmux IPython Awesome i3 Qtile
# Link: https://github.com/powerline/powerline
# Install: https://medium.com/earlybyte/powerline-for-bash-6d3dd004f6fc
# NOTE: Requires Python and can be used with Trueline in Bash
# WARNING: This path may change or break in the future with new Python versions
elif [[ $_SKIP_PROMPT_POWERLINE = false ]]; then
	_POWERLINE_PATH=$(find /usr/lib/python3* -type f -path "*/site-packages/powerline/bindings/bash/powerline.sh" 2>/dev/null | head -n 1)
	if [[ -f "$_POWERLINE_PATH" ]]; then
		builtin source "$_POWERLINE_PATH"
	fi
fi

#######################################################
# Play nice with Midnight Commander subshell
# Link: https://midnight-commander.org/
# Link: https://superuser.com/questions/526201/how-to-change-the-prompt-of-mcs-subshell
#######################################################

if [[ -n "$(ps -p "${PPID}" -o comm= 2>/dev/null | grep -x mc)" ]]; then
	# The Midnight Commander subshell doesn't like aliases for pwd
	alias pwd &>/dev/null && unalias pwd

	# Exit here
	return
fi

#######################################################
# Blesh: Bash Line Editor replaces default GNU Readline (Do this step last)
# Link: https://github.com/akinomyoga/ble.sh
# Link for configuration: https://github.com/akinomyoga/ble.sh/blob/master/blerc
# WARNING: Can be buggy with certain prompts (like Trueline)
# To Update (in a ble.sh session): ble-update
# To Install:
# mkdir -P ~/.local/share/blesh/src && cd ~/.local/share/blesh/src
# git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
# make -C ble.sh install PREFIX=~/.local
# To Run Without Installation:
# git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
# make -C ble.sh
#######################################################

# Define an array of possible locations for ble.sh (checked in order)
_BLESH_PATHS=(
	"${XDG_DATA_HOME:-${HOME}/.local/share}/blesh/ble.sh"     # User-level installation
	"${XDG_DATA_HOME:-${HOME}/.local/share}/doc/blesh/ble.sh" # User-level installation
	"${HOME}/ble.sh/out/ble.sh"                               # Local Git installation
	"/usr/share/blesh/ble.sh"                                 # System-wide installation
)

# Loop through each potential path to find where ble.sh might be located
for _BLESH_PATH in "${_BLESH_PATHS[@]}"; do
	# Check if ble.sh exists at the current path in the loop
	if [[ -f $_BLESH_PATH ]]; then

		# Check if Blesh should be skipped
		if [[ $_SKIP_BLESH = false ]]; then

			# If found, source ble.sh from the located path
			builtin source "${_BLESH_PATH}"

			# Set the prompt end-of-line mark to a specific character
			bleopt prompt_eol_mark='⏎'

			# Easier to read syntax highlighting for function names
			ble-face -s syntax_function_name  fg=171,bold
			ble-face -s command_function      fg=171
			ble-face -s varname_expr          fg=171,bold

			# Bind 'C-d' to exit in ble.sh and suppress any output or error
			ble-bind -x 'C-d' 'exit' > /dev/null 2>&1 # CTRL+d to exit

			# Create an alias to load/reload ble.sh
			alias blesh="ble-reload"
		else
			# Create an alias to load/reload ble.sh
			alias blesh="builtin source ${_BLESH_PATH} && bleopt prompt_eol_mark='⏎' && ble-face -s syntax_function_name fg=171,bold && ble-face -s command_function fg=171 && ble-face -s varname_expr fg=171,bold && ble-bind -x 'C-d' 'exit' > /dev/null 2>&1"
		fi

		# Exit the loop as ble.sh has been found and sourced
		break
	fi
done

# Clean up
unset _BLESH_PATH
unset _BLESH_PATHS

#######################################################
### HISTORY DEFAULTS
#######################################################

# If missing, recreate a new empty history file so apps don't show errors
if [[ -z ${HISTFILE+x} ]]; then
	[[ ! -f "${HOME}/.bash_history" ]] && touch "${HOME}/.bash_history"
else
	[[ ! -f "$HISTFILE" ]] && touch "$HISTFILE"
fi

# Turn off bash history completely
# set +o history

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Huge history. Doesn't appear to slow things down, so why not?
export HISTFILESIZE=100000
export HISTSIZE=${HISTFILESIZE}

# Avoid duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=ignoreboth:erasedups

# Append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend histverify

# Save and reload the history after each command finishes
# WARNING: Some of these mess up the history counter and is slower as history grows larger
# WARNING: It can also break some more advanced installed prompts
# This has issues with McFly so only set if it's not installed
if ! hascommand --strict mcfly; then
	## Append new history to history file, clear internal history list, and re-read the history file
	export PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"
	## -Or- just record each line as it gets issued but new history is not in other sessions (faster)
	#export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"
fi

# Save multi-line commands as one command
shopt -s cmdhist

# Consecutive duplicate commands, invocations of common commands like ls without parameters,
# plus calls to the bg, fg and exit built-ins will not be appended to the history list
export HISTIGNORE='&:[ ]*:ls:ll:[bf]g:history:clear:cls:exit'

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
export HISTTIMEFORMAT='%F %T '

# Allow CTRL+S for history navigation (with CTRL+R)
stty -ixon

#######################################################
# Terminology is a graphical EFL terminal emulator that can run in TTY sessions
# To split the window horizontally press Ctrl+Shift+PgUp
# To split the window vertically press Ctrl+Shift+PgDn
# To create Tabs press Ctrl+Shift+T and cycle through using Ctrl+1-9
# Link: https://github.com/borisfaure/terminology
# Link: https://linoxide.com/terminology-terminal/
#######################################################

if [[ $_SKIP_TERMINOLOGY_TTY = false ]] && hascommand --strict terminology; then
	# If we are in a TTY window , not in TMUX, and not logged in via SSH...
	if [[ "$(tty)" =~ /dev/tty ]] && [[ ! "$TERM" =~ screen ]] && [[ -z "$SSH_CLIENT" ]] && [[ -z "$SSH_TTY" ]]; then

		# If TMUX is installed and set to load at TTY
		if [[ $_TMUX_LOAD_TTY = true ]] && hascommand --strict tmux; then

			# Get the default session name
			if [[ -z "${_TMUX_LOAD_SESSION_NAME}" ]]; then
				if [[ "$(tmux list-sessions 2> /dev/null | wc -l)" -gt 0 ]]; then
					_TMUX_LOAD_SESSION_NAME=""
				else
					_TMUX_LOAD_SESSION_NAME="$(whoami)"
				fi
			fi

			# Create the TMUX session if it doesn't exist
			TMUX='' tmux -u new-session -d -s "${_TMUX_LOAD_SESSION_NAME}" 2> /dev/null
			terminology --fullscreen --borderless --256color --exec "tmux attach -t ${_TMUX_LOAD_SESSION_NAME}"

		# No TMUX
		else
			terminology --fullscreen --borderless --256color && exit
		fi

	fi

#######################################################
# Automatically launch TMUX if this is a TTY Console or SSH session
# Most terminals can launch TMUX and automatically exit when TMUX is detached:
# konsole -e 'tmux new-session -A -s main'
# xfce4-terminal -e 'tmux new-session -A -s main'
# gnome-terminal -e 'tmux new-session -A -s main'
# kitty sh -c "tmux new-session -A -s main"
# terminology --exec "tmux new-session -A -s main"
# guake -e tmux
# Yakuake Profile -> Command -> /bin/bash -c "tmux new-session -A -s main"
# Alacritty: https://github.com/alacritty/alacritty/issues/2956
# ssh user@server -t tmux new-session -A -s main
#######################################################

# If TMUX is installed...
elif hascommand --strict tmux; then

	# We're in a TTY terminal...
	if [[ "$(tty)" =~ /dev/tty ]] && [[ ! "$TERM" =~ screen ]]; then
		[[ $_TMUX_LOAD_TTY = true ]] && tm

	# We're logged in via SSH...
	elif [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
		[[ $_TMUX_LOAD_SSH = true ]] && tm

	# We are local and not using SSH or TTY...
	else
		[[ $_TMUX_LOAD_LOCAL = true ]] && tm
	fi
fi

#######################################################
# Tilix VTE Configuration
# Link: https://gnunn1.github.io/tilix-web/manual/vteconfig/
#######################################################

if [[ $TILIX_ID ]] || [[ $VTE_VERSION ]]; then
	if [[ -f /etc/profile.d/vte.sh ]]; then
		source /etc/profile.d/vte.sh
	fi
fi
