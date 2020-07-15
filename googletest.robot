*** Settings ***
Library    Collections
Library    SeleniumLibrary


*** Test Cases ***
open google page
        open browser    https://www.google.com    headlesschrome   options=add_argument("--disable-gpu"); add_argument("--no-sandbox")
        maximize browser window
        log to console    google site is opened
        ${title}=    Get Title
        Should Be Equal    Google    ${title}    msg= Title is ${title} instead of Google
        [Teardown]    close all browsers