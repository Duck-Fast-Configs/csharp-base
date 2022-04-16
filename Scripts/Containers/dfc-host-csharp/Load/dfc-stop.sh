#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec --detach -u root dfc-host-csharp ash -c "pkill -f stress-ng" >&1

message_info "В контейнере 'dfc-host-csharp' остановлено стресс-тестирование" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh