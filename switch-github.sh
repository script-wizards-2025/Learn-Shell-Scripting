#!/bin/bash 


Github_username=$1

if [ -z "${Github_username}" ];then
    echo "Usage: $0 <Github-username>"
    exit 1
fi
# Github_Accounts[username]=<ssh alias> <git email> 
declare -A Github_Accounts=(
["rkdaas"]="github-first gupta.ritik2002@gmail.com"
["onlydevops-2k25"]="github-second onlygatestudy@gmail.com"
["radhagovind-daas2k25"]="github-third ritikgupta2002@gmail.com"
)

# get account details and check whether github user exists or not 
account_info="${Github_Accounts[${Github_username}]}"
if [ -z "${account_info}" ];then
    echo "Error: Account ${Github_username} not found ! "
    exit 1 
fi

function Switchuser()
{
IFS=' ' read -r alias email <<< ${Github_Accounts[$Github_username]} 
echo "Switching to GitHub account: $Github_username"
# Switch SSH key
ssh -T "git@$alias"
git config user.name "${Github_username}"
git config user.email "${email}"
echo "📝 Active Git Config: User = $(git config --get user.name), Email = $(git config --get user.email)"
echo "✅ Successfully switched to GitHub account: $Github_username"
}

# main script 
Switchuser

