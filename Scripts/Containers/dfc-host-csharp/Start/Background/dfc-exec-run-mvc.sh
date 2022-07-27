#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2
message_info "Перейдите по адресу https://localhost, чтобы увидеть запущенный проект" 1
docker-compose -p $dfc_global__project_name exec -u dfc-user --detach dfc-host-csharp zsh -c "dotnet run --urls=https://0.0.0.0/" >&1
message_info "Чтобы остановить проект нужно использовать файл 'dfc-stop.sh'" 1

message_info "В контейнере 'dfc-host-csharp' на заднем плане запущен 'mvc' проект" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
