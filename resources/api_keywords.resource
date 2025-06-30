*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Keywords ***
Create Or Get API Session
    [Arguments]    ${alias}    ${base_url}
    ${sessions}=    GET On Session    ${alias}
    Run Keyword If    '${sessions}' == 'None'    Create Session    ${alias}    ${base_url}    verify=false

Perform API Request
    [Arguments]    ${method}    ${endpoint}    ${payload}=None    ${expected_status}=None
    Create Or Get API Session    json    ${BASE_URL}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    Run Keyword If    '${method}' == 'GET'    GET On Session     json    ${endpoint}    headers=${headers}
    ...    ELSE IF    '${method}' == 'POST'    POST On Session    json    ${endpoint}    data=${payload}    headers=${headers}
    ...    ELSE IF    '${method}' == 'PUT'     PUT On Session     json    ${endpoint}    data=${payload}    headers=${headers}
    ...    ELSE IF    '${method}' == 'DELETE'  DELETE On Session  json    ${endpoint}    headers=${headers}
    ...    ELSE    Fail    Unsupported method: ${method}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}
    RETURN    ${response}

Validate Response Content
    [Arguments]    ${response}    ${expected_key}    ${expected_value}
    ${json}=    To Json    ${response.content}
    Dictionary Should Contain Value    ${json}    ${expected_value}

Get Post By Id
    [Arguments]    ${post_id}
    Create Session    json    ${BASE_URL}
    ${resp}=    Get Request    json    /posts/${post_id}
    Should Be Equal As Integers    ${resp.status_code}    200
    Log    ${resp.json()}
    RETURN    ${resp}
