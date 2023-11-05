*** Settings ***

Library         AppiumLibrary
Resource        ../Res/Variables.robot
Library         Collections
Library         RequestsLibrary
Library         OperatingSystem

*** Variables ***
${base_url}     https://api.todoist.com/sync/v9/sync
${bearerToken}      Bearer 89b09496b5688d756d960b1987021095f658a513
${char_set}    ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
${random_string}    ${EMPTY}
${random_uuid}    ${0}
${random_temp_id_int}    ${0}

*** Test Cases ***
Create_project
    Create Session    mysession    ${base_url}

#   Setting up headers
    ${headers}  Create Dictionary   Authorization=${bearerToken}    Content-Type=application/json

#   Converting variable into array
    ${array}    Create List
    ${my_variable}  Set Variable    projects
    Append To List    ${array}  ${my_variable}

#   Setup random uuid
    ${random_uuid}    Evaluate    random.randrange(1, 999999)

#   Setup random temp_id
    ${random_temp_id_int}    Evaluate    random.randrange(1, 999999)

   ${random_char}    Evaluate    random.choice('${char_set}')  # Selects a random character from the character set
    ${random_string}    Set Variable    ${random_string}${random_char}


 #  Set args body for project name
    ${args_data}    Create Dictionary
    Set To Dictionary    ${args_data}   name=Shopping List3

#   Creating commands body
    ${commands}    Create List
    ${command_data}    Create Dictionary
    Set To Dictionary    ${command_data}    type=project_add
    Set To Dictionary    ${command_data}    temp_id=${random_temp_id_int}-${random_string}
    Set To Dictionary    ${command_data}    uuid=${random_uuid}
    Set To Dictionary    ${command_data}    args=${args_data}
    Append To List    ${commands}    ${command_data}


#   Set body for post request
    ${body}=    Create Dictionary   sync_token=*    resource_types=${array}     commands=${commands}

#   Perform Post request with url
    ${responds}=    Post Request    mysession    /  data=${body}    headers=${headers}
    Log To Console    ${responds.status_code}
    Log To Console    ${responds.content}
