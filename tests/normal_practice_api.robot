*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com
${POST_ID}    1

*** Test Cases ***
Normal Practice: API Call With Variables
    Create Session    demo    ${BASE_URL}
    ${resp}=    GET On Session    demo    /posts/${POST_ID}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.text}
