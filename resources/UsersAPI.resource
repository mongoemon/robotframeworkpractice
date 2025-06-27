*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${API_ENDPOINT}    https://reqres.in/api
${USERS_PATH}      /users
${API_KEY}         reqres-free-v1

*** Keywords ***
Create Users Session
    Create Session    api_session    ${API_ENDPOINT}

Reset Users Session
    Delete All Sessions
    Create Session    api_session    ${API_ENDPOINT}

Get Users With Params
    [Arguments]    ${params}
    # Generally get no need API_KEY in headers because it's a public endpoint 
    # but if you want to use it, you can uncomment the next line
    ${headers}=    Create Dictionary    Accept=application/json
    # ${headers}=    Create Dictionary    Accept=application/json    x-api-key=${API_KEY}
    ${response}=    GET On Session    api_session    ${USERS_PATH}    headers=${headers}    params=${params}
    [Return]    ${response}

Create User With Data
    [Arguments]    ${data}
    ${headers}=    Create Dictionary    Content-Type=application/json    x-api-key=${API_KEY}
    ${response}=    POST On Session    api_session    ${USERS_PATH}    json=${data}    headers=${headers}
    [Return]    ${response}

Update User With Data
    [Arguments]    ${user_id}    ${data}
    ${headers}=    Create Dictionary    Content-Type=application/json    x-api-key=${API_KEY}
    ${response}=    PUT On Session    api_session    ${USERS_PATH}/${user_id}    json=${data}    headers=${headers}
    [Return]    ${response}

Delete User
    [Arguments]    ${user_id}
    ${headers}=    Create Dictionary    x-api-key=${API_KEY}
    ${response}=    DELETE On Session    api_session    ${USERS_PATH}/${user_id}    headers=${headers}
    [Return]    ${response}
