# Dotfiles

dotfiles managed with gnu stow.

1. Clone this repository to your home directory:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Make sure you have stow installed

3. Link configs using stow and the --dotfiles flag
   ```bash
   stow --dotfiles nvim
   stow --dotfiles kitty
   ```

For removing a symbolic link:
   ```bash
   stow -D nvim
   stow -D kitty
   ```

