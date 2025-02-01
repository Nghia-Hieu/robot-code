*** Settings ***
Library    Browser
Library    Collections
Library    OperatingSystem


*** Test Cases *** 
Create a Bill
    New Browser    chromium    headless=Yes
    Set Browser Timeout    29 sec
    #${har} =    Create Dictionary     path=D:/RobotCode/report/discHar.file   omitContent=True
    #New Context    recordHar=${har}    
    New Page     https://saigonbooks-staging.goldenowl.asia/

    # Search a book
    Type Text    [id="search-input"]    Trứng
    Wait For Elements State    xpath=//a[@class='header-search-suggest-result-item' and @data-title='Thế Giới Trong Quả Trứng']    visible
    Sleep    0.5s
    Click    xpath=//a[@class='header-search-suggest-result-item' and @data-title='Thế Giới Trong Quả Trứng']
    Sleep    1s
    Click    xpath=//span[text()='Thêm vào giỏ hàng']

    Type Text    [id="search-input"]    Bình Minh
    Sleep    0.5s
    Wait For Elements State    xpath=//a[@class='header-search-suggest-result-item' and @data-title='Như Ánh Bình Minh Chuyển Mình Rực Rỡ']    visible
    Click    xpath=//a[@class='header-search-suggest-result-item' and @data-title='Như Ánh Bình Minh Chuyển Mình Rực Rỡ']
    Sleep    1.5s
    Click    xpath=//button[@id="qty-increase"]
    Click    xpath=//button[@id="qty-increase"]
    Click    xpath=//button[@id="qty-decrease"]
    Sleep    0.5s
    Click    xpath=//span[text()='Thêm vào giỏ hàng']
    Click    xpath=//a[text()="Xem giỏ hàng"]
    Sleep    1s
    Click    xpath=//input[@type='checkbox' and contains(@class, 'cart__select-all')]
    Click    xpath=(//a[@href='https://saigonbooks-staging.goldenowl.asia/checkout/'])
    Sleep    1s
    Click    xpath=//a[@id="change-address"]
    Type Text    [id="address_name"]    Trần Nguyên Khôi
    Type Text    [id="address_phone"]    0993128123
    Type Text    [id="address_email"]    tnkhoi0301@mailinator.com
    Click    xpath=//select[@id='address_province']
    Select Options By    xpath=//select[@id='address_province']    value    Hồ Chí Minh
    Sleep    0.5s
    Click    xpath=//select[@id='address_district']
    Select Options By    xpath=//select[@id='address_district']    value    10
    Sleep    0.5s
    Click    xpath=//select[@id='address_ward']
    Select Options By    xpath=//select[@id='address_ward']    value    12
    Sleep    0.5s
    Type Text    [id="address_address"]    941/23A Thành Thái
    Sleep    0.5s
    Click    xpath=//a[@id='update_address']

    Sleep    3s
