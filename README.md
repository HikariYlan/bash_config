# My custom config for console prompt (Linux & Git For Windows)
Feel free to use if you want

Colors based on "Outer Wilds" and its DLC "Echoes Of The Eye"

## Installation/Uninstallation

### ✅ A backup of your preexisting file will be available at ~/bashrc_backup ✅
The installation script called "install.sh" is available in the "Releases" section

The uninstallation script called "uninstall.sh" is also available in the "Releases" section.
It will restore you .bashrc to its previous state, or simply delete it if you didn't have one already.

## Display changes

Base prompt:

![base_prompt](images/base_prompt.png)

With a git repo (main branch):

![with_repo](images/with_repo.png)

With a git repo (other branch):

![other_branch](images/other_branch.png)

## Aliases

- stat = git status
- log = git log
- push = git push
- fpush <branch_name> = git push -u origin <branch_name>
- pull = git pull
- commit "<commit_message>" = git commit -m "<commit_message>"