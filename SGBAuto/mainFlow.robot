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
    Sleep    2s
    Click    xpath=//a[@class='header-search-suggest-result-item' and @data-title='Thế Giới Trong Quả Trứng']
    Sleep    2s
    Click    xpath=//span[text()='Thêm vào giỏ hàng']
    Sleep    2s

    Type Text    [id="search-input"]    Bình Minh
    Sleep    1.5s
    Wait For Elements State    xpath=//a[@class='header-search-suggest-result-item' and @data-title='Như Ánh Bình Minh Chuyển Mình Rực Rỡ']    visible
    Click    xpath=//a[@class='header-search-suggest-result-item' and @data-title='Như Ánh Bình Minh Chuyển Mình Rực Rỡ']
    Sleep    1.5s
    Click    xpath=//button[@id="qty-increase"]
    Sleep    1s
    Click    xpath=//button[@id="qty-increase"]
    Sleep    1s
    Click    xpath=//button[@id="qty-decrease"]
    Sleep    1s
    Click    xpath=//span[text()='Thêm vào giỏ hàng']
    Sleep    1s
    Click    xpath=//a[text()="Xem giỏ hàng"]
    Sleep    1s
    Click    xpath=(//input[@type='checkbox' and contains(@class, 'cursor-pointer bg-primary border border-grey-300 cart__select-all')])[2]
    Sleep    1s
    Click    xpath=(//a[@href='https://saigonbooks-staging.goldenowl.asia/checkout/'])
    Sleep    2s
    Click    xpath=//a[@id="change-address"]
    Sleep    1s
    Type Text    [id="address_name"]    Trần Nguyên Khôi
    Sleep    1s
    Type Text    [id="address_phone"]    0993128123
    Sleep    1s
    Type Text    [id="address_email"]    tnkhoi0301@mailinator.com
    Sleep    1s
    Click    xpath=//select[@id='address_province']
    Sleep    1s
    Select Options By    xpath=//select[@id='address_province']    value    Hồ Chí Minh
    Sleep    1s
    Click    xpath=//select[@id='address_district']
    Sleep    1s
    Select Options By    xpath=//select[@id='address_district']    value    10
    Sleep    1s
    Click    xpath=//select[@id='address_ward']
    Sleep    1s
    Select Options By    xpath=//select[@id='address_ward']    value    12
    Sleep    1s
    Type Text    [id="address_address"]    941/23A Thành Thái
    Sleep    1s
    Click    xpath=//a[@id='update_address']
    Sleep    1s 
    Click    xpath=//input[@id='payment_method_cod']
    Sleep    0.5s
    Click    xpath=//input[@id='payment_method_saigonbook_vnpay']
    Sleep    0.5s
    Click    xpath=//input[@id='payment_method_cod']

    Sleep    5s
