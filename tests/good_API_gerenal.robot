*** Settings ***
Library           RequestsLibrary
Library           Collections
Test Template     Perform API Request

*** Variables ***
${BASE_URL}       https://reqres.in/api

*** Test Cases ***
Get Users         GET     /users/2      None
Create User       POST    /users        {"name": "morpheus", "job": "leader"}
Update User       PUT     /users/2      {"name": "neo", "job": "the one"}
Delete User       DELETE  /users/2      None

*** Keywords ***
Perform API Request
    [Arguments]    ${method}    ${endpoint}    ${payload}
    [Tags]    api    ${method}
    Create Session    reqres    ${BASE_URL}    verify=false
    ${headers}=    Create Dictionary    Content-Type=application/json
    IF    '${method}' == 'GET'
        ${response}=    GET On Session     reqres    ${endpoint}    headers=${headers}
        Should Be Equal As Integers    ${response.status_code}    200
    ELSE IF    '${method}' == 'POST'
        ${response}=    POST On Session    reqres    ${endpoint}    data=${payload}    headers=${headers}
        Should Be Equal As Integers    ${response.status_code}    201
    ELSE IF    '${method}' == 'PUT'
        ${response}=    PUT On Session     reqres    ${endpoint}    data=${payload}    headers=${headers}
        Should Be Equal As Integers    ${response.status_code}    200
    ELSE IF    '${method}' == 'DELETE'
        ${response}=    DELETE On Session  reqres    ${endpoint}    headers=${headers}
        Should Be Equal As Integers    ${response.status_code}    204
    END
    Log    ${response.status_code}
    Log    ${response.content}
