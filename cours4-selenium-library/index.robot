*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://selenium-practice.netlify.app/
${USERNAME}      mon_username
${DATE}          23-02-2002
${SUCCESS_MESSAGE}    Submitted Successfully

*** Test Cases ***
Inscription
    Ouvrir l'URL
    Saisir le bon username
    Choisir item 2
    Sélectionner check 1 et 3
    Choisir une date
    Cliquer sur le bouton "Submit"
    Vérifier le message d'erreur
    Fermer le navigateur

*** Keywords ***
Ouvrir l'URL
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    2

Saisir le bon username
    Input Text    id=name    ${USERNAME}

Choisir item 2
    Select From List By Index    id=selection    2

Sélectionner check 1 et 3
    Click Element    id=check1
    Click Element    id=check3
    Sleep    2

Choisir une date
    Input Text    id=date    ${DATE}

Cliquer sur le bouton "Submit"
    #Click Button    name=Submit
    Click Element    xpath=/html/body/form/button

Vérifier le message d'erreur
    Page Should Contain    Submitted Successfully
    Sleep    2

Fermer le navigateur
    Close Browser
