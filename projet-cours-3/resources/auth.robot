***Settings***
Library    SeleniumLibrary

Variables    ../pageobject/locator.py

Variables    ../pageobject/variable.py

***Keywords***
Ouvrir l'URL jenkins
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    3

Saisir le bon username
    Input Text    ${id_textbox_username}    ${USERNAME}

Saisir un mauvais mot de passe
    Input Password    ${id_textbox_password}    ${INVALID_PASSWORD}

Saisir le bon username
    Input Text    ${id_textbox_username}    ${USERNAME}

Saisir un mauvais username
    Input Text    ${id_textbox_username}    utilisateur_incorrect

Saisir le bon mot de passe
    Input Password    ${id_textbox_password}    ${PASSWORD}

Saisir un mauvais mot de passe
    Input Password    ${id_textbox_password}    ${INVALID_PASSWORD}

Cliquez sur se "Sign in"
    Click Button    ${name_btn_submit}
    Sleep    5

Vérifier le message d'erreur
    Page Should Contain    ${ERROR_MESSAGE}
Vérifier le message de succès
    Page Should Contain    ${HOME_PAGE_TITLE}
    

Fermer le navigateur
    Close Browser
