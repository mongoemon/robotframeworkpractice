*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/custom_keywords.resource
Resource   ../keywords/saucedemo_login_keywords.resource

*** Variables ***
${BROWSER}    chrome
${SAUCE_URL}   https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
