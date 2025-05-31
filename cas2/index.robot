*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                http://localhost:8080/
${USERNAME}           mauvais_username
${INVALID_PASSWORD}   mauvais_mot_de_passe

*** Test Cases ***
Cas2_LoginCorrecteMotDePasseIncorrect
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

Vérifier le message d'erreur
    Wait Until Element Contains    //div[contains(@class,'error')]    Nom d'utilisateur ou mot de passe incorrect    10s

Fermer le navigateur
    Close Browser
