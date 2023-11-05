*** Settings ***

Library         AppiumLibrary

*** Variables ***
#*** First page ***
${Login_button_google}    com.todoist:id/btn_google

#*** Google Login page ***
${Login_google_popup}  com.google.android.gms:id/list
${Login_google_email_omg2}  xpath=//android.widget.TextView[@resource-id="com.google.android.gms:id/account_name" and @text="omg2another2@gmail.com"]
${Login_google_email_omg1}  xpath=//android.widget.TextView[@resource-id="com.google.android.gms:id/account_name" and @text="omg1another1@gmail.com"]

#*** Main Page ***
${Main_page}    com.todoist:id/bottom_app_bar
${Create_task}   com.todoist:id/fab
${Menu}         xpath=//android.widget.ImageButton[@content-desc="Menu"]
${Task}         com.todoist:id/item
${Checkbox}     com.todoist:id/checkmark

#*** Side Menu ***
${Side_menu_add_project}    xpath=//android.view.View[@content-desc="Add"]
${Project}                  xpath=//android.widget.TextView[@text="project1"]

#*** Create Project Page ***
${Project_title_input_field}    com.todoist:id/name
${Project_add_bth}    com.todoist:id/menu_form_submit

#*** Create Project Info ***
&{Input_project_name}   name=project1

#*** Create Task Page ***
${title_input_field}        android:id/message
${desc_input_field}         xpath=//android.widget.EditText[@resource-id="com.todoist:id/description"]
${add}                      android:id/button1

#*** Create Task Info ***
&{Input_info1}      title=swimming    des=training
&{Input_info2}      title=jogging    des=running



*** Keywords ***

Open todoist Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=RFCRC0FZ8PM    appPackage=com.todoist  appActivity=com.todoist.activity.HomeActivity   automationName=Uiautomator2