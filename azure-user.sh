#!/bin/bash

user=$2
command=$3
domain=ashishsaxena7outlook.onmicrosoft.com


# login

az login u-$user

# check administrator status
admin = $(az role assignment list --include-classic-administrators --query "[?id=='NA(classic admins)'].principalName" | grep -E $user)
if [ -z $admin ]; then
    echo "Not an Admin, cannot proceed"
    exit 1
fi


# Functions

create(){
    userdisplayname = $1
    random=Arlington${time}
    az ad user create --display-name $userdisplayname --password $random --user-principal-name $userdisplayname@$domain
    echo "$userdisplayname has been created"
    echo "password is $random"

#    az ad user delete --upn-or-object-id $userdisplayname@$domain
}



delete(){
    userdisplayname = $1
    userprincipalname=$userdisplayname@$domain
    admin=$(az role assignment list --include-classic-administrators --query "[?id=='NA(classic admins)'].principalName" | grep -E $userprincipalname)

    if ! [ -z $admin ]; then
        echo "can not delete user that is an admin"
        exit 1
    fi
    az ad user delete --upn-or-object-id $userprincipalname
    echo "$userdisplayname has been terminated"

#    az ad user delete --upn-or-object-id $userdisplayname@$domain
}


assignment(){
    assignment = $1
    user =$2
    role = $3

    az role assignment $assignment --assignee $user --role $role
}

$command $4 $5 $6