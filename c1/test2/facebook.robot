*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                https://front-logistique.groupeisi.com/login
${USERNAME}           email@domaine.com
${INVALID_PASSWORD}   mauvais_mot_de_passe

*** Test Cases ***
Cas1_LoginCorrecteMotDePasseIncorrect
    Ouvrir l'URL logistique
    Saisir le username
    Saisir un mauvais mot de passe
    Cliquez sur "Sign in"
    Vérifier le message d'erreur
    Fermer le navigateur

*** Keywords ***
Ouvrir l'URL logistique
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    3

Saisir le username
    Input Text    name=email    ${USERNAME}

Saisir un mauvais mot de passe
    Input Password    name=password    ${INVALID_PASSWORD}

Cliquez sur "Sign in"
    Click Element    //*[@id="tab5"]/div[3]/button
    Sleep    5

Vérifier le message d'erreur
    Wait Until Element Is Visible    //*[@id="toast-container"]/div    5s
    ${erreur}=    Get Text    //*[@id="toast-container"]/div
    Log    Le message récupéré : ${erreur}
    Should Contain    ${erreur}    Email ou mot de passe incorrect

Fermer le navigateur
    Close Browser
