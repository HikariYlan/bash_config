# My custom config for console prompt (Linux & Git For Windows)
Feel free to use if you want
Colors based on "Outer Wilds" and its DLC "Echoes Of The Eye"

## Installation script

# ⚠ All preexisting file will be overwritten ⚠

```shell
cd ~
git clone https://github.com/HikariYlan/bash_config.git
cd bash_config
cp bashrc.txt ~/.bashrc
source ~/.bashrc
cd ..
rm -rf bash_config
```

Just copy-paste this script into any console prompt and it should work

## Display changes

Base prompt:
`absolute_path_to_current_folder > `

With a git repo in the current folder:
`absolute_path_to_current_folder (branch_name → comparison_with_upstream / checking_changes) > `

## Aliases

- stat = git status
- log = git log
- push = git push
- fpush <branch_name> = git push -u origin <branch_name>
- pull = git pull
- commit "<commit_message>" = git commit -m "<commit_message>"