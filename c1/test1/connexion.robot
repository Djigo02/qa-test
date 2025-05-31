*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                http://18.201.83.167:8080
${USERNAME}           admin
${INVALID_PASSWORD}   mauvais_mot_de_passe

*** Test Cases ***
Cas1_LoginCorrecteMotDePasseIncorrect
    Ouvrir l'URL jenkins(http://18.201.83.167:8080)
    Saisir le bon username (admin)
    Saisir un mauvais mot de passe (mauvais_mot_de_passe)
    Cliquez sur se "Sign in"
    Vérifier le message d'erreur
    Fermer le navigateur

*** Keywords ***
Ouvrir l'URL jenkins(http://18.201.83.167:8080)
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    3

Saisir le bon username (admin)
    Input Text    id=j_username    ${USERNAME}

Saisir un mauvais mot de passe (mauvais_mot_de_passe)
    Input Password    id=j_password    ${INVALID_PASSWORD}

Cliquez sur se "Sign in"
    Click Button    name=Submit

Vérifier le message d'erreur
    Wait Until Element Contains    //div[contains(@class,'error')]    Nom d'utilisateur ou mot de passe incorrect    10s

Fermer le navigateur
    Close Browser
