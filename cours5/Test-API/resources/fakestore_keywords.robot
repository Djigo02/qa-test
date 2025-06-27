*** Settings ***
Library    RequestsLibrary
Variables  ../pageobject/variable.py

*** Keywords ***
Create Session To FakeStore
    Create Session    fakestore    ${BASE_URL}    headers=${HEADERS}

Get List Of All Products
    ${response}=    GET ON SESSION    fakestore    ${BASE_URL}/products
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}
Get Product By ID
    [Arguments]    ${product_id}
    ${response}=    GET ON SESSION    fakestore    ${BASE_URL}/products/${product_id}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}
Post New Product
    [Arguments]    ${product_data}
    ${response}=    POST ON SESSION    fakestore    ${BASE_URL}/products    json=${product_data}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}
Delete Product By ID
    [Arguments]    ${product_id}
    ${response}=    DELETE ON SESSION    fakestore    ${BASE_URL}/products/${product_id}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}