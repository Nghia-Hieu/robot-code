*** Settings ***
Library    Browser


*** Test Cases *** 

# Test Eight Components
#     New Browser    chromium    headless=No
#     # New Context    viewport={'width': 1600, 'height': 960}
#     # Set Browser Timeout    10 sec

#     New Page    https://d3f8foaty9qexz.cloudfront.net/login
#     Type Text    [id="login_email"]    Robot
#     Type Text    [id="login_password"]    Robot
#     Check Checkbox     xpath=//label[span[text()="Remember me"]]
#     # Click    xpath=//button[@data-testid='loginButton']
#     Sleep    60 sec
    

Test Selector
    New Browser    chromium    headless=No
    Set Browser Timeout    999 sec
    New Context
    New Page     https://staging.tracnghiemtinhcach.vn
    Wait For Elements State     xpath=//button[@class="button-default-v2"]    visible

    Click    xpath=//button[@class="button-default-v2"]
    Type Text    [id="email"]    mailinh1193@mailinator.com
    Type Text    [id="password"]    Aa@12345
    Click    xpath=//button[text()="Đăng nhập"]

    Click    xpath=//button[@aria-label="Accept cookies"]

    Click    xpath=(//span[text()="Bài test" and contains(@class, 'cursor-pointer')])
    Click    xpath=//a[text()="Tính cách DISC" and contains(@href, '/disc-test') and contains(@class, 'hover:bg-[var(--color-floral-white)')]

    Click    xpath=//button[.//h4[text()='Làm ngay']]
    Click    xpath=//button[text()='Tôi đã hiểu']

    ${blueChoosen}=     Get Elements    //div[contains(@style,'border-color: var(--color-sherpa-blue-1)')]
    ${redChoosen}=     Get Elements    //div[contains(@style,'border-color: var(--color-sunglo)')]
    
    FOR    ${index}    IN RANGE    24
        # Get 2 random numbers in range < 4
        ${random_numbers}=    Evaluate    random.sample(range(4), 2)    random

        # Click on the first random element
        Click    ${blueChoosen[${random_numbers[0]}]}

        # Click on the second random element
        Click    ${redChoosen[${random_numbers[1]}]}
        Sleep    0.5 sec
    END
    
    Click    xpath=//button[.//span[text()='Hoàn thành']]
    #Evaluate    document.querySelector(//div[@class='footer-page']).scrollIntoView({ behavior: 'smooth', block: 'center' })
    Sleep    1 sec
    Scroll To    ${None}    80%    left    smooth
    Sleep    0.5 sec
    Click    xpath=//button[contains (@class, 'opacity-100') and .//span[text()='Gửi đáp án']]
    Sleep    1 sec
    Click    xpath=//button[.//span[text()='Tiếp theo']]

    Sleep    1 sec

