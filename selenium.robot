*** Settings ***
Library        SeleniumLibrary
*** Test Cases ***
TestCase1
    Open Browser    url=https://the-internet.herokuapp.com/login    browser=chrome
    Input Text    username    tomsmith
    Input Text    password    SuperSecretPassword!
    Click Button     class:radius
    Element Should Contain    id=flash    You logged into a secure area!
    Sleep    50s
    