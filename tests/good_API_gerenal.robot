*** Settings ***
Library           RequestsLibrary
Library           Collections
Test Template     Perform API Request

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com

*** Test Cases ***
Get Post         GET     /posts/2      None
Create Post      POST    /posts        {"title": "foo", "body": "bar", "userId": 1}
Update Post      PUT     /posts/2      {"id": 2, "title": "baz", "body": "qux", "userId": 1}
Delete Post      DELETE  /posts/2      None

*** Keywords ***
Perform API Request
    [Arguments]    ${method}    ${endpoint}    ${payload}
    [Tags]    api    ${method}
    Create Session    json    ${BASE_URL}    verify=false
    ${headers}=    Create Dictionary    Content-Type=application/json
    IF    '${method}' == 'GET'
        ${response}=    GET On Session     json    ${endpoint}    headers=${headers}
        Should Be Equal As Integers    ${response.status_code}    200
    ELSE IF    '${method}' == 'POST'
        ${response}=    POST On Session    json    ${endpoint}    data=${payload}    headers=${headers}
        Should Be Equal As Integers    ${response.status_code}    201
    ELSE IF    '${method}' == 'PUT'
        ${response}=    PUT On Session     json    ${endpoint}    data=${payload}    headers=${headers}
        Should Be Equal As Integers    ${response.status_code}    200
    ELSE IF    '${method}' == 'DELETE'
        ${response}=    DELETE On Session  json    ${endpoint}    headers=${headers}
        Should Be Equal As Integers    ${response.status_code}    200
    END
    Log    ${response.status_code}
    Log    ${response.content}
