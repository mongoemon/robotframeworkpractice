*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/responsive_keywords.resource
Suite Setup       Open Browser To Home Page
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://www.saucedemo.com/

*** Test Cases ***
Desktop View Should Display Properly
    Set Window Size To Desktop
    Page Should Contain Element    id=user-name
    Page Should Contain Element    id=password

Tablet View Should Display Properly
    Set Window Size To Tablet
    Page Should Contain Element    id=user-name
    Page Should Contain Element    id=password

Mobile View Should Display Properly
    Set Window Size To Mobile
    Page Should Contain Element    id=user-name
    Page Should Contain Element    id=password
