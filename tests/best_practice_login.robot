*** Settings ***
Resource    ../resources/common.resource
Resource    ../keywords/saucedemo_login_keywords.resource
Library     SeleniumLibrary
Test Template    Login With Role

*** Test Cases ***
Login As Standard User
    standard_user    secret_sauce    Products
Login As Locked Out User
    locked_out_user    secret_sauce    Epic sadface: Sorry, this user has been locked out.
Login As Problem User
    problem_user    secret_sauce    Products
Login As Performance Glitch User
    performance_glitch_user    secret_sauce    Products

*** Keywords ***
Login With Role
    [Arguments]    ${username}    ${password}    ${expected}
    Open SauceDemo Login Page
    Input Username    ${username}
    saucedemo_login_keywords.Input Password    ${password}
    Click Login Button
    Page Should Contain    ${expected}
    [Teardown]    Close Browser Session
