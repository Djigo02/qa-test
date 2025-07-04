*** Settings ***
Resource    ../resources/fakestore_keywords.robot

Suite Setup    Create Session To Petstore

*** Test Cases ***
Create Petstore Pet
    [Documentation]    Creee un pet dans Petstore
    ${pet_data}=    Create Dictionary    id=2001    name=CocoLaye    status=offered
    ${response}=    Create Petstore Pet    ${pet_data}
    Log To Console    Created pet with2: ${pet_data}
    Sleep    2s

Get Petstore Pet
    [Documentation]    Renvoie un pet par son ID
    ${pet_id}=    Set Variable    2001
    ${response}=    Get Petstore Pet    ${pet_id}
    Log To Console    Retrieved pet: ${response}
    Sleep    2s

Update Petstore Pet
    [Documentation]    Met à jour un pet dans Petstore 
    ${pet_id}=    Set Variable    2001
    ${pet_data}=    Create Dictionary    id=${pet_id}    name=Taliban    status=sold
    ${response}=    Update Petstore Pet    ${pet_id}    ${pet_data}    
    Log To Console    Updated pet: ${response}
    Sleep    2s

Delete Petstore Pet
    [Documentation]    Supprime un pet dans Petstore
    ${pet_id}=    Set Variable    2001
    Delete Petstore Pet    ${pet_id}
    Log To Console    Deleted pet with ID: ${pet_id}
    Sleep    2s

# Verify 404 Error
#     [Documentation]    Vérifie que l'ID du pet n'existe pas
#     ${pet_id}=    Set Variable    2001
#     ${response}=    Verify 404 Error    ${pet_id}
#     Should Be Equal As Integers    ${response.status_code}    404
#     Log To Console    Verified 404 error for pet ID: ${pet_id}
#     Sleep    2s