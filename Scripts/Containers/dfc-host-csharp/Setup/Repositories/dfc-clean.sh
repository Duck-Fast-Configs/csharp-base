#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u root dfc-host-csharp zsh -c "echo -n '' > /etc/apk/repositories" >&1
(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-csharp/Setup && sh dfc-update.sh -d1) >&3

message_info "В контейнере 'dfc-host-csharp' очищены все репозитории пакетов" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
