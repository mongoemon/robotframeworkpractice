*** Settings ***
Resource    ../resources/api_keywords.resource
Library     RequestsLibrary
Test Template    Get Post And Validate

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
    ${resp}=    Get Post By Id    ${post_id}
    Should Be Equal As Strings    ${resp.status_code}    ${expected_status}
