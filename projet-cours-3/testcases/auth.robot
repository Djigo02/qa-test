*** Settings ***
Library    SeleniumLibrary

Resource    ../resources/auth.robot

Suite Setup    Ouvrir l'URL jenkins


Suite Teardown    Fermer le navigateur

*** Test Cases ***
Cas d'utilisation 1 - Authentification avec Login correct et un mauvais mot de passe
    [Tags]    smoke    auth
    Ouvrir l'URL jenkins
    Saisir le bon username
    Saisir un mauvais mot de passe
    Cliquez sur se "Sign in"
    Vérifier le message d'erreur

Cas d'utilisation 2 - Authentification avec un mauvais Login et un mot de passe correct
    [Tags]    sanity    auth
    Ouvrir l'URL jenkins
    Saisir un mauvais username
    Saisir le bon mot de passe
    Cliquez sur se "Sign in"
    Vérifier le message d'erreur

Cas d'utilisation 3 - Authentification avec Login vide et un mot de passe vide
    [Tags]    smoke    auth
    Ouvrir l'URL jenkins
    Saisir un mauvais username
    Saisir un mauvais mot de passe
    Cliquez sur se "Sign in"
    Vérifier le message d'erreur

Cas d'utilisation 4 - Authentification avec Login correct et un mot de passe correct
    [Tags]    smoke    auth
    Ouvrir l'URL jenkins
    Saisir le bon username
    Saisir le bon mot de passe
    Cliquez sur se "Sign in"
    Vérifier le message de succès