*** Settings ***
Library    Browser
Library    Collections
Library    OperatingSystem


*** Variables ***
${current_month}    Evaluate    import datetime; datetime.datetime.now().strftime('%m')
${current_year}     Evaluate    import datetime; datetime.datetime.now().strftime('%Y')
${current_date}    Evaluate    import datetime; datetime.datetime.now().strftime('%Y-%m-%d')
*** Test Cases *** 
Create a Job
    New Browser    chromium    headless=No
    Set Browser Timeout    999 sec
    ${har} =    Create Dictionary     path=D:/RobotCode/report/discHar.file   omitContent=True
    New Context    recordHar=${har}    
    New Page     https://d3f8foaty9qexz.cloudfront.net/login

    # Login
    Type Text    [id="login_email"]    richardnguyen221
    Type Text    [id="login_password"]    gg2025
    Click    xpath=//button[@data-testid='loginButton']

    # Access Job form
    Click    xpath=//a[@href='/jobs']
    Click    xpath=//p[@class='button-content' and text()='Create Job']
    Sleep    1s





    # 1. Provider and Location
    Click    xpath=(//input[@id='jobPostingForm_employerId'])[1]
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='ADE Power Limited']

    Click    xpath=(//input[@id='jobPostingForm_locationId'])[1]
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='ADE Power - Pontefract']

    Click    xpath=(//input[@id='jobPostingForm_skillId'])[1]
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='Butler']

    Click With Options    xpath=(//input[@id='jobPostingForm_rateType'])    force=True
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='Overtime']
    Sleep    0.5s

    Click With Options    xpath=(//span[input[@id='jobPostingForm_posted']])    force=True
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='2']
    Sleep    0.5s
    
    Click    xpath=(//label//span[text()='Over 18 Only']//preceding::input[@id='jobPostingForm_isOver18'])
    Sleep    0.5s

    Type Text    [id="jobPostingForm_payrate"]    12
    Click    xpath=(//label//span[text()='Internal Posted Job']//preceding::input[@type='radio'])[2]
    Sleep    3s
    

    #2. Dates and Times
    Click    xpath=//div[@class='header-title']//span[text()='Dates and Times']
    Sleep    0.5s

    Click    xpath=//td[@title='2025-01-15']
    Sleep    0.5s
    Click    xpath=//td[@title='2025-01-16']
    Sleep    0.5s
    Click    xpath=(//span[@class='anticon anticon-minus'])[1]
    Sleep    0.5s

    Click    xpath=(//input[@placeholder='Select time'])[1] 
    Type Text    xpath=(//input[@placeholder='Select time'])[1]    12:30
    Click    xpath=(//button[@class='ant-btn ant-btn-primary ant-btn-sm']/span[text()='OK'])[1]
    Sleep    0.5s
    Click    xpath=(//input[@placeholder='Select time'])[2] 
    Type Text    xpath=(//input[@placeholder='Select time'])[2]    16:30
    Click    xpath=(//button[@class='ant-btn ant-btn-primary ant-btn-sm']/span[text()='OK'])[2]
    Sleep    0.5s
    Type Text     xpath=(//input[@class='ant-input primary-input input-height date-picker-style'])[1]    1
    Click    xpath=(//input[@placeholder='Select time'])[3] 
    Sleep    0.5s
    Type Text    xpath=(//input[@placeholder='Select time'])[3]    13:30
    Click    xpath=(//button[@class='ant-btn ant-btn-primary ant-btn-sm']/span[text()='OK'])[3]
    Sleep    0.5s
    Click    xpath=(//input[@placeholder='Select time'])[4] 
    Type Text    xpath=(//input[@placeholder='Select time'])[4]    17:30
    Click    xpath=(//button[@class='ant-btn ant-btn-primary ant-btn-sm']/span[text()='OK'])[4]
    Sleep    0.5s
    Type Text     xpath=(//input[@class='ant-input primary-input input-height date-picker-style'])[2]    2
    Sleep    0.5s
    Click    xpath=//input[@name='shiftType' and @value='individual_shift']
    Sleep    0.5s
    Click    xpath=//input[@name='shiftType' and @value='group_shift']
    Sleep    0.5s

    Click     xpath=(//span[@class='ant-checkbox-inner'])[2]
    Sleep    0.5s
    Type Text    [id='jobPostingForm_repeatFor']    1
    Click     xpath=(//span[@class='ant-checkbox-inner'])[3]
    Sleep    0.5s
    Click    xpath=//input[@id='jobPostingForm_untilEndDate']
    Sleep    0.5s
    Click    xpath=(//td[@title='2025-01-27'])[2]
    Click    xpath=(//span[@class='ant-checkbox-inner'])[3]
    Sleep    3s





    #3. Job Description
    Click    xpath=//div[@class='header-title']//span[text()='Job Description']
    Sleep    0.5s

    Type Text    [id="jobPostingForm_description"]    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
    Sleep    0.5s

    Type Text    [id="jobPostingForm_specialRequirements"]    It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
    Sleep    0.5s

    Click    xpath=(//input[@id='jobPostingForm_shirt'])
    Sleep    0.5s
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='White T-Shirt']

    Click    xpath=(//input[@id='jobPostingForm_jean'])
    Sleep    0.5s
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='Black Jeans']

    Click    xpath=(//input[@id='jobPostingForm_shoe'])
    Sleep    0.5s
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='Protective Shoes']

    Click    xpath=(//input[@id='jobPostingForm_additionalUniform'])
    Sleep    0.5s
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='Gloves']

    Sleep    2s




    #4. Licenses and Training
    Click    xpath=//div[@class='header-title']//span[text()='Licences and Training']
    Sleep    0.5s

    Click    xpath=//input[contains(@id, 'rc_select_16')]    
    Sleep    0.5s
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='ADE Power Limited']

    Click    xpath=//input[contains(@id, 'rc_select_17')]    
    Sleep    0.5s
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='Data Entry']

    Click    xpath=//input[contains(@id, 'jobPostingForm_licenses')] 
    Sleep    0.5s   
    Click    xpath=//div[@class='ant-select-item-option-content' and text()='Alcohol Licence']
    Click    xpath=//input[contains(@id, 'jobPostingForm_licenses')]  

    Click    xpath=//span[contains(text(), 'Allow Seeker without the above licences to see the job posting')]/following-sibling::span//input[@type='checkbox']

    Sleep    2s


    #5. Licenses and Training
    Click    xpath=//div[@class='header-title']//span[text()='Seeker']
    Sleep    0.5s

    Type Text    xpath=//input[contains(@id, 'rc_select_19')]    Abim
    Wait For Elements State    xpath=//div[@class='name-seeker' and text()='Abimbola Abodunrin']    visible
    Click    xpath=//div[@class='name-seeker' and text()='Abimbola Abodunrin']

    Type Text    xpath=//input[contains(@id, 'rc_select_20')]    Chir
    Wait For Elements State    xpath=//div[@class='name-seeker' and text()='Chirag Dave']    visible
    Click    xpath=//div[@class='name-seeker' and text()='Chirag Dave']

    #6. Review
    Click    xpath=//div[@class='header-title']//span[text()='Review and Post']
    Scroll To Element    xpath=//button[text()='Post']
    Sleep    2s
