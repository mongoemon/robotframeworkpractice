*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}        http://localhost:4723/wd/hub
${PLATFORM_NAME}     Android
${PLATFORM_VERSION}  11
${DEVICE_NAME}       emulator-5554
${APP}               ${CURDIR}/../../apps/ApiDemos-debug.apk

*** Test Cases ***
Open ApiDemos And Check Views
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    app=${APP}    automationName=UiAutomator2
    Wait Until Page Contains Element    accessibility_id=Views
    Page Should Contain Element         accessibility_id=Views
    [Teardown]    Close Application
