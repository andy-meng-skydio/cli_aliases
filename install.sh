sudo apt install bash-completion

if [ -f ~/.bashrc ]; then
  echo "found .bashrc file"
  if grep -Fq /cli_aliases ~/.bashrc
  then
      echo "aliases already linked in .bashrc"
  else
      echo "adding cli_aliases to .bashrc"
      echo . $PWD"/cli_aliases" >> ~/.bashrc
  fi
else
  echo ".bashrc not found"
fi