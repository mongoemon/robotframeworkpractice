*** Keywords ***
Open SauceDemo Login Page
    Open Browser    ${SAUCE_URL}    ${BROWSER}
    Maximize Browser Window

Input Username
    [Arguments]    ${username}
    Input Text    id=user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Click Login Button
    Click Button    id=login-button

Should See Products Page
    Page Should Contain    Products

Close Browser Session
    Close Browser
