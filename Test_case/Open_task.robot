*** Settings ***

Library         AppiumLibrary
Resource        ../Res/Variables.robot

*** Test Cases ***

Login
    Open todoist Application
    Wait Until Page Contains Element    ${Login_button_google}  10s
    Click Element    ${Login_button_google}
    Wait Until Page Contains Element    ${Login_google_popup}   10s
    Click Element   ${Login_google_email_omg2}
    Wait Until Page Contains Element    ${Main_page}    20s

Create_task

    Wait Until Page Contains Element    ${Create_task}   20s
    Click Element    ${Create_task}
    Wait Until Page Contains Element    ${title_input_field}    10s
    Input Text    ${title_input_field}    ${Input_info1}[title]
    Input Text    ${desc_input_field}    ${Input_info1}[des]
    Click Element    ${add}
    Press Keycode    4

Open_task

    Wait Until Page Contains Element    ${Task}     10s
    Click Element    ${Task}
    Press Keycode    4