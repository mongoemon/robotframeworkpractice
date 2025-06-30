*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Bad Practice: Hardcoded API Call
    Create Session    demo    https://jsonplaceholder.typicode.com
    ${resp}=    GET On Session    demo    /posts/1
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.text}
