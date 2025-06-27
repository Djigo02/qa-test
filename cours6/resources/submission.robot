***Settings***
Library    SeleniumLibrary

Variables   ../pageobject/locator.py

Variables   ../pageobject/variable.py

*** Keywords ***
Open web browser
    Open Browser    ${URL_AUTOMATION}   ${BROWSER}
    Maximize Browser Window
    Sleep    2

# ID 1001
User examines home page contents
    Page Should Contain    ${TITLE_HOME}
    Sleep    2

# ID 1002
Click Login link
    Click Element    id=${id_sign_in}
    Sleep    2

Type valid login credentials
    Input Text    id=${id_email}    ${USERNAME_AUTOMATION}
    Input Text    id=${id_password}    ${PASSWORD_AUTOMATION}
    Sleep    2

Click Submit button
    Click Element    id=${submit_button}
    Sleep    2
    Page Should Contain    ${TITLE_DASHBOARD}

# # ID 1003
Click "New Customer" button
    Click Element    id=${id_new_customer}
    Sleep    2
Type customer email
    Input Text    id=${id_email_address}    ${EMAIL_CUSTOMER}
    Sleep    1
Type customer first name
    Input Text    id=${id_first_name}    ${FIRST_NAME}
    Sleep    1
Type customer last name
    Input Text    id=${id_last_name}    ${LAST_NAME}
    Sleep    1
Type customer city
    Input Text    id=${id_city}    ${CITY}
    Sleep    1
Select customer state
    Select From List By Value    id=${id_state}    ${STATE}
    Sleep    1
Select customer gender
    Click Element    ${xpath_gender}
    Sleep    1
Optionally check promotion checkbox
    Click Element    name=${name_promotion}
    Sleep    1
Click Save Customer button
    Click Element    ${path_submit}
    Sleep    2
    Page Should Contain    Success! New customer added.
    Sleep    2
Close web browser
    Close Browser
