# re-run path_helper so that we pick up changes to /etc/paths.d/*
eval `/usr/libexec/path_helper -s`

eval $(/opt/homebrew/bin/brew shellenv)

# check for pyenv files, and load them if present
if [ -e "$HOME/.pyenv/.pyenvrc" ]; then
  source $HOME/.pyenv/.pyenvrc
  if [ -e "$HOME/.pyenv/completions/pyenv.zsh" ]; then
    source $HOME/.pyenv/completions/pyenv.zsh
  elif [ -e "/usr/local/opt/pyenv/completions/pyenv.zsh" ]; then
    source /usr/local/opt/pyenv/completions/pyenv.zsh
  fi
fi
