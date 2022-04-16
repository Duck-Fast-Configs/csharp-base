#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_input "Варианты запуска:\n"
message_input "1. Ничего не запускать\n"
message_input "2. Запустить приложение 'console'\n"
message_input "3. Запустить приложение 'console' в фоновом режиме\n"
message_input "4. Запустить приложение 'ASP.NET Core Web App (Model-View-Controller)'\n"
message_input "5. Запустить приложение 'ASP.NET Core Web App (Model-View-Controller)' в фоновом режиме\n"
message_input "6. Выйти\n"
message_input "=> "
read -p '' project_start

case $project_start in
"2")
    message_space 1
    message_info "Процесс запускается" 2
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-csharp/Start && sh dfc-exec-run-console.sh -d1) >&3
    ;;
"3")
    message_space 1
    message_info "Процесс запускается в фоновом режиме" 2
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-csharp/Start/Background && sh dfc-exec-run-console.sh -d1) >&3
    ;;
"4")
    message_space 1
    message_info "Процесс запускается" 2
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-csharp/Start && sh dfc-exec-run-mvc.sh -d1) >&3
    ;;
"5")
    message_space 1
    message_info "Процесс запускается в фоновом режиме" 2
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-csharp/Start/Background && sh dfc-exec-run-mvc.sh -d1) >&3
    ;;
"6")
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
*)
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
