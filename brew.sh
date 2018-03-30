# Ensure we are running the latest version of homebrew
brew update

# Upgrade already installed packages
brew upgrade

brew install tmux
brew install wget
brew install the_silver_searcher # ag
brew install fpp                 # Facebook path picker
brew install reattach-to-user-namespace # make pbcopy and pbpaste work in tmux
brew install emacs

brew install fzf
$(brew --prefix)/opt/fzf/install # To install useful key bindings and fuzzy completion

# Remove outdated versions
brew cleanup
