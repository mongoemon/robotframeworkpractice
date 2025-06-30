*** Settings ***
Resource    ../../resources/UsersAPI.resource
Variables   ../../variables/dev_env.py
Suite Setup    Create Users Session

*** Test Cases ***
GET /users in ${ENV_NAME}
    ${params}=    Create Dictionary    page=2
    ${response}=    Get Users With Params    ${params}
    Should Be Equal As Integers    ${response.status_code}    200

POST /users in ${ENV_NAME}
    ${data}=    Create Dictionary    name=morpheus    job=leader
    ${response}=    Create User With Data    ${data}
    Should Be Equal As Integers    ${response.status_code}    201
