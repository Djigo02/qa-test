*** Settings ***
Library    SeleniumLibrary
Library    Dialogs

Resource    ../resources/submission.robot

Suite Setup    Ouvrir l'URL


Suite Teardown    Fermer le navigateur

*** Test Cases ***
Inscription
    Saisir le bon username
    Choisir item 2
    Sélectionner check 1 et 3
    Choisir une date
    Cliquer sur le bouton "Submit"
    Vérifier le message d'erreur