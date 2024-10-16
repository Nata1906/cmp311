#! /bin/bash

create_user() {
        read -p "enter name user: " username
        if id "$username" &>/dev/null; then
                echo "user $username is found"
        else
                sudo useradd "$username"
                sudo passwd "$username"
        fi
}

remove_user() {
        read -p "enter name user: " username
        if id "$username" &>/dev/null; then
                sudo deluser -r "$username"
                echo "user $username remowe"
        else
                echo "user $username not found"
        fi
}

change_password() {
        read -p "enter name user: "username
        if id "$username" &/dev/null; then
                sudo passwd "$username"
                echo "user $username password change"
        else
                echo "user $username not found"
        fi
}
check_user() {
        read -p "enter name user: "username
        if id "$username" &>/dev/null; then
                echo "user $username is found"
        else
                echo "user $username not found"
        fi
}

while true; do
        echo "user manager"
        echo "1) create user"
        echo "2) remove user"
        echo "3) change password"
        echo "4) check user"
        echo "5) exit"
        read -p "enter number (1-5): " action

        case $action in
                1) create_user ;;
                2) remove_user ;;
                3) change_password ;;
                4) check_user ;;
                5) echo "exit."; break ;;
                *) echo "!!!ERROR NAMBER!!!, try again((" ;;
        esac
done




