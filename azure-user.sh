#!/bin/bash
# Automate process of creating, deleting, and assigning users

user=$1
command=$2
domain=ashishsaxena7outlook.onmicrosoft.com


# check for Azure install

if [ -z $(which az) ]; then
echo "Azure not installed"
exit 1
fi

# Login

az login -u $user

# check administrator status
admin = $(az role assignment list --include-classic-administrators --query "[?id=='NA(classic admins)'].principalName" | grep -E $user)
if [ -z $admin ]; then
    echo "Not an Admin, cannot proceed"
    exit 1
fi


# Define functions

create($userdisplayname, $domain, $subscription){
    userdisplayname = $1
    random=Arlington${time}
    usercheck=$(az role assignment list --query [].userPrincipalName | grep -E $userprincipalname)

    if [ -n $usercheck ]; then
    echo "$userdisplayname already exists"
    exit 1
    fi

    az ad user create --display-name $userdisplayname --password $random --user-principal-name $userdisplayname@$domain
    echo "$userdisplayname has been created"
    echo "password is $random"

}



delete(){
    userdisplayname = $1
    userprincipalname=$userdisplayname@$domain
    usercheck2=$(az role assignment list --query [].userPrincipalName | grep -E $userprincipalname)
    admin2=$(az role assignment list --include-classic-administrators --query "[?id=='NA(classic admins)'].principalName" | grep -E $userprincipalname)

    if [ -z $usercheck2 ]; then
        echo "User specified does not exist"
        exit 1


    elif [ -n $admin2 ]; then
        echo "cannot delete user that is an admin"
        exit 1
    fi
    az ad user delete --upn-or-object-id $userprincipalname
    echo "$userdisplayname has been terminated"

}


#assignment($user, $role, $action){
assignment(){
    user = $1
    principal=$user@$domain
    action =$2
    role = $3

    checkuser3=$(az ad user list --query [].userPrincipalName | grep -E $principal)

    if [ -z $checkuser3]; then
    echo "Invalid user"
    exit 1
    
    elif ! [$role="reader"] || ![$role="contributer"]; then
    echo "Invalid role, must be a reader or contributer"
    exit 1
    fi

    az role assignment $action --assignee $user --role $role

        # if [user has role]; then
    #     echo 'yes/no'

    #     case read answer
    #         yes ) az role assignment delete --assignee $user --role $role
    # else
    #     az role assignment create --assignee $user --role $role
    # fi

}

$command $3 $4 $5


# case $command
#     create ) create();
#     delete ) delete();
#     assign ) assignment();

# esac
