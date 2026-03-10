set working-directory := '..'

_:
  @echo "Please provide a tool to install or 'all' to install all."

all:
  @echo "=> Installing all"
  just install git-m

git-m:
  @echo "=> Installing 'git-m'"
  ln -sf $(pwd)/bin/git-m $HOME/bin/git-m
