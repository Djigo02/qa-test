*** Settings ***
Resource    ../resources/fakestore_keywords.robot

Suite Setup    Create Session To FakeStore

*** Test Cases ***

Get List Of All Products
    ${products}=    Get List Of All Products
    BuiltIn.Length Should Be    ${products}    20
    Log To Console    ${products}

Get Product By ID
    ${product_id}=    Set Variable    3
    ${product}=    Get Product By ID    ${product_id}
    Should Not Be Empty    ${product}
    Log To Console    ${product}

Post New Product
    ${new_product}=    Create Dictionary    title=Test Product    price=19.99    description=This is a test product.    category=electronics
    ${created_product}=    Post New Product    ${new_product}
    Should Not Be Empty    ${created_product}
    Log To Console    ${created_product}
Delete Product By ID
    ${product_id}=    Set Variable    1
    ${response}=    Delete Product By ID    ${product_id}
    Log To Console    ${response}