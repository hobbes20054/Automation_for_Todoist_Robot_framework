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
