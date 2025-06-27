*** Settings ***
Resource    ../resources/common.resource
Library     SeleniumLibrary

*** Test Cases ***
Login With Variables
    Open Browser    ${SAUCE_URL}    ${BROWSER}
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Page Should Contain    Products
    Close Browser
