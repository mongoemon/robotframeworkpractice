*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Set Window Size To Desktop
    Set Window Size    1920    1080

Set Window Size To Tablet
    Set Window Size    768     1024

Set Window Size To Mobile
    Set Window Size    375     812
