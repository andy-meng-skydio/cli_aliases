SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo apt install bash-completion expect
git submodule update --init
cp complete-alias/complete_alias ~/.complete_alias
chmod +x $SCRIPT_DIR/yub_script

if [ -f ~/.bashrc ]; then
  echo "found .bashrc file"
  if grep -Fq /cli_aliases ~/.bashrc
  then
      echo "aliases already linked in .bashrc"
  else
      echo "adding cli_aliases to .bashrc"
      echo . $PWD"/cli_aliases" >> ~/.bashrc
      echo "export CLI_ALIAS_FOLDER="$SCRIPT_DIR >> ~/.bashrc
      echo 'complete -F _complete_alias "${!BASH_ALIASES[@]}"' >> ~/.bashrc
  fi
else
  echo ".bashrc not found"
fi