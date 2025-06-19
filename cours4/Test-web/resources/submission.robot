***Settings***
Library    SeleniumLibrary

Variables   ../pageobject/locator.py

Variables   ../pageobject/variable.py

*** Keywords ***
Ouvrir l'URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2

Saisir le bon username
    Input Text    ${id_name}    ${USERNAME}

Choisir item 2
    Select From List By Index    ${id_selection}    ${Number_item}

Sélectionner check 1 et 3
    FOR    ${item}    IN    ${id_check1}    ${id_check3}
        Click Element    ${item}
    END
    #Click Element    ${id_check1}
    #Click Element    ${id_check3}
    Sleep    2

Choisir une date
    Input Text    ${id_date}    ${DATE}

Cliquer sur le bouton "Submit"
    #Click Button    name=Submit
    Click Element    ${submit_button}
    ${username} =	Get Value From User    Donnez votre nom:
    Log    L'utilisateur ${username} a teste

Vérifier le message d'erreur
    Page Should Contain    ${SUCCESS_MESSAGE}
    Sleep    2

Fermer le navigateur
    Close Browser
