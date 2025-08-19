# My custom config for console prompt (Linux & Git For Windows)
Feel free to use if you want

Colors based on "Outer Wilds" and its DLC "Echoes Of The Eye"

## Installation script

# ⚠ Preexisting file will be overwritten ⚠
### Make sure to create a backup if you want to keep your actual .bashrc for later uses

```shell
OLD_DIR=$(pwd)
cd ~
git clone https://github.com/HikariYlan/bash_config.git
cd bash_config
cp .bashrc ~/.bashrc
source ~/.bashrc
cd ..
rm -rf bash_config
cd ${OLD_DIR}
```

Just copy-paste this script into Linux's terminal or Git Bash's terminal and it should work

## Display changes

Base prompt:

`absolute_path_to_current_folder > `

With a git repo (main branch):

`absolute_path_to_current_folder (branch_name → comparison_with_upstream / checking_changes) > `

With a git repo (other branch):

`absolute_path_to_current_folder (branch_name ↱ comparison_with_upstream / checking_changes) > `

## Aliases

- stat = git status
- log = git log
- push = git push
- fpush <branch_name> = git push -u origin <branch_name>
- pull = git pull
- commit "<commit_message>" = git commit -m "<commit_message>"