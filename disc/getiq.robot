*** Settings ***
Library    Browser


*** Test Cases *** 

Test Selector
    New Browser    chromium    headless=Yes
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
    Click    xpath=//a[text()="Kiểm tra IQ" and contains(@href, '/iq-test') and contains(@class, 'hover:bg-[var(--color-floral-white)')]

    Click    xpath=//button[.//h4[text()='Tôi đã sẵn sàng']]

    ${iqAnswer}=     Get Elements    //div[@class='input-image-radio']
    
    FOR    ${index}    IN RANGE    25
        # Get random numbers in range < 8
        ${random_numbers}=    Evaluate    random.sample(range(8), 1)    

        # Click on the random answer
        Click    ${iqAnswer[${random_numbers[0]}]}

        Sleep    0.75 sec
    END
    
    Click    xpath=//button[.//span[text()='Hoàn thành']]
    Sleep    1 sec
    Scroll To    ${None}    80%    left    smooth
    Sleep    0.5 sec
    Click    xpath=//button[contains (@class, 'opacity-100') and .//span[text()='Gửi đáp án']]
    Sleep    1.5 sec
    #Click    xpath=//button[.//span[text()='Tiếp theo']]

    Sleep    1 sec

