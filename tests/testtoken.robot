*** Settings ***
Library           RequestsLibrary
Library           Collections
Test Template     Get Post With Auth

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com
${TOKEN}          12345abcde

*** Test Cases ***
Get Post With Valid Token      valid_token
Get Post Without Token         no_token

*** Keywords ***
Get Post With Auth
    [Arguments]    ${auth_type}
    [Tags]    api    ${auth_type}
    Create Session    json    ${BASE_URL}    verify=false
    ${headers}=    Create Dictionary
    IF    '${auth_type}' == 'valid_token'
        Set To Dictionary    ${headers}    Authorization    Bearer ${TOKEN}
    END
    ${response}=    GET On Session    json    url=/posts/2    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    IF    '${auth_type}' == 'no_token'
        Log    No token sent, but endpoint is public
    END
    Log    Response: ${response.content}
