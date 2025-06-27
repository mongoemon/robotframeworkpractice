*** Settings ***
Resource    ../resources/api_keywords.resource
Library     RequestsLibrary

*** Variables ***
${POST_ID}    1

*** Test Cases ***
Good Practice: API Call With Keywords
    Get Post By Id    ${POST_ID}
