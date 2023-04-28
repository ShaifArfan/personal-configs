if status is-interactive
    # Commands to run in interactive sessions can go here
end

#node version (set --universal nvm_default_version your_version)
nvm use $nvm_default_version

#these are the settings for the theme
#them theme i am currently is called "bobthefish"(https://github.com/oh-my-fish/theme-bobthefish)
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
set -g theme_display_date no
set -g theme_display_node yes
set -g theme_display_git_default_branch yes
set -g theme_project_dir_length 3
set -g theme_title_display_process yes

#fish key bindings
fish_vi_key_bindings
alias mongo_start="sudo systemctl start mongod"
alias mongo_status="sudo systemctl status mongod"
alias mongo_stop="sudo systemctl stop mongod"
alias psql_start="sudo -u postgres psql"

#pyenv
pyenv init - | source
