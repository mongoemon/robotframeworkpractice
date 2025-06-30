*** Settings ***
Library           RequestsLibrary
Library           Collections
Test Template     Get Users With Auth

*** Variables ***
${BASE_URL}       https://reqres.in/api
${TOKEN}          12345abcde

*** Test Cases ***
Get Users With Valid Token      valid_token
Get Users Without Token         no_token

*** Keywords ***
Get Users With Auth
    [Arguments]    ${auth_type}
    [Tags]    api    ${auth_type}
    Create Session    reqres    ${BASE_URL}    verify=false
    ${headers}=    Create Dictionary
    IF    '${auth_type}' == 'valid_token'
        Set To Dictionary    ${headers}    Authorization    Bearer ${TOKEN}
    END
    ${response}=    GET On Session    reqres    url=/users?page=2    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    IF    '${auth_type}' == 'no_token'
        Log    No token sent, but endpoint is public
    END
    Log    Response: ${response.content}
