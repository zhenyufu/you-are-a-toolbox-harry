# you-are-a-toolbox-harry
Some tools and commands

## Content
```
├── bash_script : platform-specific .harry.bash (mac/linux)
├── docker : docker-compose starter files
├── dot_config
│   ├── herdr : herdr terminal config
│   ├── nvim : neovim/lazyvim config
│   ├── tmux.conf
│   └── vimrc
├── linux
│   └── app_config : linux app configs (keybindings, libinput-gestures, redshift)
├── harry-deploy.bash : copy repo config to system config
├── harry-save.bash : copy system config to repo config
├── scripts : utility scripts (.harry-source.bash, pm wake, workspace switcher)
├── random
```
<img src="random/harry.jpg" width="250">

## docker compose starter files
To launch a container use: `./harry-docker.bash <directory>`

| Application | Directory | Comment |
|---|---|---|
| Mysql  | mysql  |  |
| Jupyter Notebook | notebook |   |
| Flask  | flask |   |
