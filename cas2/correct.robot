*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                http://localhost:8080/
${USERNAME}           jgotechmaker
${INVALID_PASSWORD}   passer

*** Test Cases ***
Cas4_LoginCorrectMotDePasseCorrect
    Ouvrir l'URL jenkins
    Saisir le bon username
    Saisir un mauvais mot de passe
    Cliquez sur se "Sign in"
    Vérifier le message d'erreur
    Fermer le navigateur

*** Keywords ***
Ouvrir l'URL jenkins
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    3

Saisir le bon username
    Input Text    id=j_username    ${USERNAME}

Saisir un mauvais mot de passe
    Input Password    id=j_password    ${INVALID_PASSWORD}

Cliquez sur se "Sign in"
    Click Button    name=Submit
    Sleep    5

Vérifier le message d'erreur
    Page Should Contain    Bienvenue sur Jenkins !
    

Fermer le navigateur
    Close Browser
