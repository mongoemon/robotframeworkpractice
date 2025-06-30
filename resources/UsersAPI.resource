*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${API_ENDPOINT}    https://dummyjson.com
${USERS_PATH}      /users
${API_KEY}         dummyjson-demo-key

*** Keywords ***
Create Users Session
    Create Session    api_session    ${API_ENDPOINT}

Reset Users Session
    Delete All Sessions
    Create Session    api_session    ${API_ENDPOINT}

Get Users With Params
    [Arguments]    ${params}
    ${headers}=    Create Dictionary    Accept=application/json    x-api-key=${API_KEY}
    ${response}=    GET On Session    api_session    ${USERS_PATH}    headers=${headers}    params=${params}
    RETURN    ${response}

Create User With Data
    [Arguments]    ${data}
    ${headers}=    Create Dictionary    Content-Type=application/json    x-api-key=${API_KEY}
    ${response}=    POST On Session    api_session    ${USERS_PATH}/add    json=${data}    headers=${headers}
    RETURN    ${response}

Update User With Data
    [Arguments]    ${user_id}    ${data}
    ${headers}=    Create Dictionary    Content-Type=application/json    x-api-key=${API_KEY}
    ${response}=    PUT On Session    api_session    ${USERS_PATH}/${user_id}    json=${data}    headers=${headers}
    RETURN    ${response}

Delete User
    [Arguments]    ${user_id}
    ${headers}=    Create Dictionary    x-api-key=${API_KEY}
    ${response}=    DELETE On Session    api_session    ${USERS_PATH}/${user_id}    headers=${headers}
    RETURN    ${response}
