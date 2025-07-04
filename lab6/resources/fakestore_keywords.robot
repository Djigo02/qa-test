*** Settings ***
Library    RequestsLibrary
Variables  ../pageobject/variable.py

*** Keywords ***
Create Session To Petstore
    Create Session    Petstore    ${BASE_URL}    headers=${HEADERS}
    Log To Console    Created session to Petstore at ${BASE_URL}

Create Petstore Pet
    [Arguments]    ${pet_data}
    ${response}=    POST On Session    Petstore    /pet    json=${pet_data}
    Should Be True    ${response.ok}    Petstore API call failed with status code ${response.status_code}

Get Petstore Pet
    [Arguments]    ${pet_id}
    ${response}=    GET On Session    Petstore    /pet/${pet_id}
    Should Be True    ${response.ok}    Petstore API call failed with status code ${response.status_code}
    RETURN    ${response.json()}

Update Petstore Pet
    [Arguments]    ${pet_id}    ${pet_data}
    ${response}=    PUT On Session    Petstore    /pet    json=${pet_data}
    Should Be True    ${response.ok}    Petstore API call failed with status code ${response.status_code}
    RETURN    ${response.json()}

Delete Petstore Pet
    [Arguments]    ${pet_id}
    ${response}=    DELETE On Session    Petstore    /pet/${pet_id}
    Should Be True    ${response.ok}    Petstore API call failed with status code ${response.status_code}
    Log To Console    Deleted pet with ID ${pet_id}

# Verify 404 Error
#     [Arguments]    ${pet_id}
#     ${response}=    GET On Session    Petstore    /pet/${pet_id}
#     Should Be Equal As Integers    ${response.status_code}    404
#     Log To Console    Verified 404 error for pet ID ${pet_id}