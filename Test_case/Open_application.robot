*** Settings ***

Library         AppiumLibrary

*** Variables ***
${Login_button1}    com.todoist:id/btn_google

*** Test Cases ***

Open_application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=com.todoist  appActivity=com.todoist.activity.HomeActivity   automationName=Uiautomator2
    Wait Until Page Contains Element    ${Login_button1}
