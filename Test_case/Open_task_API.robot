*** Settings ***

Library         AppiumLibrary
Resource        ../Res/Variables.robot
Library         Collections
Library         RequestsLibrary
Library         OperatingSystem

*** Variables ***
${base_url}     https://api.todoist.com/sync/v9/sync
${bearerToken}      Bearer 89b09496b5688d756d960b1987021095f658a513

*** Test Cases ***
Retrieve_task
    Create Session    mysession    ${base_url}

    ${headers}  Create Dictionary   Authorization=${bearerToken}    Content-Type=application/json

    ${array}    Create List
    ${my_variable}  Set Variable    items
    Append To List    ${array}  ${my_variable}

    ${body}=    Create Dictionary   sync_token=*    resource_types=${array}

    ${response}=    Post Request    mysession    /  data=${body}    headers=${headers}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

