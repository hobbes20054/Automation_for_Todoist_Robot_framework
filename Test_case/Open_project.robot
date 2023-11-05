*** Settings ***

Library         AppiumLibrary
Library         Process
Resource        ../Res/Variables.robot

*** Test Cases ***

Login
    Open todoist Application
    Wait Until Page Contains Element    ${Login_button_google}  10s
    Click Element    ${Login_button_google}
    Wait Until Page Contains Element    ${Login_google_popup}   10s
    Click Element   ${Login_google_email_omg2}
    Wait Until Page Contains Element    ${Main_page}    10s

Create_project
    Sleep    10s
    Click Element    ${Menu}
    Wait Until Page Contains Element    ${Side_menu_add_project}    10s
    Click Element    ${Side_menu_add_project}
    Wait Until Page Contains Element    ${Project_title_input_field}    10s
    Input Text    ${Project_title_input_field}    ${Input_project_name}[name]
    Click Element    ${Project_add_bth}

Open_project
    Sleep    5s
    Click Element    ${Menu}
    Wait Until Page Contains Element    ${Side_menu_add_project}    10s
    Click Element    ${Project}
    Wait Until Page Contains    project1

