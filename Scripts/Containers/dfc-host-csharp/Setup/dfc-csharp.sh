#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-csharp ash -c "mkdir -p ~/.dotnet" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-csharp ash -c "curl https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh > ~/.dotnet/dotnet-install.sh" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-csharp ash -c "chmod +x ~/.dotnet/dotnet-install.sh" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-csharp ash -c "~/.dotnet/dotnet-install.sh -c 6.0" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-csharp ash -c "~/.dotnet/dotnet-install.sh -c 6.0 --runtime dotnet" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-csharp ash -c "~/.dotnet/dotnet-install.sh -c 6.0 --runtime aspnetcore" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-csharp ash -c "alias dotnet='~/.dotnet/dotnet'" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-csharp ash -c "echo 'alias dotnet=\"~/.dotnet/dotnet\"' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-csharp ash -c "echo 'export DOTNET_CLI_TELEMETRY_OPTOUT=1' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1

message_info "В контейнере 'dfc-host-csharp' установлен пакет 'csharp' и готов к работе" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
