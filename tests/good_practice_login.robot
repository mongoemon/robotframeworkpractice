*** Settings ***
Resource    ../resources/common.resource
Resource    ../keywords/saucedemo_login_keywords.resource
Library     SeleniumLibrary

*** Test Cases ***
Login With Custom Keywords
    Open SauceDemo Login Page
    Input Username    ${USERNAME}
    saucedemo_login_keywords.Input Password    ${PASSWORD}
    Click Login Button
    Should See Products Page
    [Teardown]    Close Browser Session
