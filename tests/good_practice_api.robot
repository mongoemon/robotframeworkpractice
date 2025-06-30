*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com
${POST_ID}    1

*** Test Cases ***
Good Practice: API Call With Keywords
    Get Post By Id    ${POST_ID}

*** Keywords ***
Get Post By Id
    [Arguments]    ${post_id}
    Create Session    json    ${BASE_URL}
    ${resp}=    Get Request    json    /posts/${post_id}
    Should Be Equal As Integers    ${resp.status_code}    200
    Log    ${resp.json()}
    RETURN    ${resp}
