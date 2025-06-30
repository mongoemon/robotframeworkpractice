*** Settings ***
Resource    ../../resources/api_keywords.resource
Library     RequestsLibrary
Test Template    Get Post And Validate

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Get Post 1
    1    200
Get Post 2
    2    200
Get Post Invalid
    9999    404

*** Keywords ***
Get Post And Validate
    [Arguments]    ${post_id}    ${expected_status}
    Create Session    json    ${BASE_URL}
    ${resp}=    Get Request    json    /posts/${post_id}
    Should Be Equal As Integers    ${resp.status_code}    ${expected_status}
    Log    ${resp.json()}
