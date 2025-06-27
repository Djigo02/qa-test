*** Settings ***
Library    SeleniumLibrary
Library    Dialogs

Resource    ../resources/submission.robot

Suite Setup    Open web browser


Suite Teardown    Close web browser

*** Test Cases ***
Home page should load
    User examines home page contents
Login should succeed with valid credentials
    Click Login link
    Type valid login credentials
    Click Submit button
Should be able to add new customer
    Click "New Customer" button
    Type customer email
    Type customer first name
    Type customer last name
    Type customer city
    Select customer state
    Select customer gender
    Optionally check promotion checkbox
    Click Save Customer button


