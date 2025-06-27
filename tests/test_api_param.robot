*** Settings ***
Library    JSONLibrary
Resource    ../resources/UsersAPI.resource
Suite Setup    Create Users Session

*** Test Cases ***
GET /users Return users data with params
    ${params}=    Create Dictionary    page=2
    ${response}=    Get Users With Params    ${params}
    Log To Console    ${response.json}
    ${json}=    Evaluate    json.dumps(${response.json()})    json
    ${response_code}=    Set Variable    ${response.status_code}
    Log To Console    Response code is= ${response_code}

POST /users Create user with params
    ${data}=    Create Dictionary    name=morpheus    job=leader
    ${response}=    Create User With Data    ${data}
    Log To Console    ${response.json}
    ${json}=    Evaluate    json.dumps(${response.json()})    json
    ${response_code}=    Set Variable    ${response.status_code}
    Log To Console    Response code is= ${response_code}

PUT /users Update user with params
    ${data}=    Create Dictionary    name=neo    job=the one
    ${response}=    Update User With Data    2    ${data}
    Log To Console    ${response.json}
    ${json}=    Evaluate    json.dumps(${response.json()})    json
    ${response_code}=    Set Variable    ${response.status_code}
    Log To Console    Response code is= ${response_code}

DELETE /users Delete user with params
    ${response}=    Delete User    2
    ${response_code}=    Set Variable    ${response.status_code}
    Log To Console    Response code is= ${response_code}