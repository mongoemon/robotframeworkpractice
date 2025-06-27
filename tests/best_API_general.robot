*** Settings ***
Resource    ../resources/api_keywords.resource
Library     RequestsLibrary
Library     Collections
Test Template     Perform API Request

*** Variables ***
${BASE_URL}       https://reqres.in/api

*** Test Cases ***
Get Users         GET     /users/2      None    200
Create User       POST    /users        {"name": "morpheus", "job": "leader"}    201
Update User       PUT     /users/2      {"name": "neo", "job": "the one"}    200
Delete User       DELETE  /users/2      None    204

*** Keywords ***
Perform API Request
    [Arguments]    ${method}    ${endpoint}    ${payload}    ${expected_status}
    ${response}=    Perform API Request    ${method}    ${endpoint}    ${payload}    ${expected_status}
    Log    ${response.status_code}
    Log    ${response.content}
