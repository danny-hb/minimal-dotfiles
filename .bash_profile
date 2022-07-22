# re-run path_helper so that we pick up changes to /etc/paths.d/*
eval `/usr/libexec/path_helper -s`

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# setup brew variables, including adding it to the path
eval $(/opt/homebrew/bin/brew shellenv)


# check for pyenv files, and load them if present
if [ -e "$HOME/.pyenv/.pyenvrc" ]; then
  source $HOME/.pyenv/.pyenvrc
  if [ -e "$HOME/.pyenv/completions/pyenv.bash" ]; then
    source $HOME/.pyenv/completions/pyenv.bash
  elif [ -e "/usr/local/opt/pyenv/completions/pyenv.bash" ]; then
    source /usr/local/opt/pyenv/completions/pyenv.bash
  fi
fi

export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export WORKON_HOME=$HOME/.virtualenvs
pyenv virtualenvwrapper_lazy

