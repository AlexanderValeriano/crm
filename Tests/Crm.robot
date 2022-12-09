*** Settings ***
Documentation       This is some basic info about the whole suite
Library             SeleniumLibrary
#Run the script
#robot -d results tests/crm.robot
*** Variables ***
${BROWSER}                              chrome
${URL}                                  https://automationplayground.com/crm/
${VALID_LOGIN_EMAIL}                    admin@robotframeworktutorial.com
${VALID_LOGIN_PASSWORD}                 qwe

*** Test Cases ***
Should be able to add new customer
    [Documentation]                     This is some info about the test
    [Tags]                              1006    Smoke  Contacts
    #Initialize Selenium
    set selenium speed                  .2s
    set selenium timeout                10s
    #open the browser
    log                                 Starting the test case!
    open browser                        ${URL}       ${BROWSER}
    #resize browser window for recording
    set window position                 x=34   y=16
    set window size                     width=1235  height=900

    wait until page contains            Customers Are Priority One!

    click link                          id=SignIn
    wait until page contains            Login

    input text                          id=email-id     ${VALID_LOGIN_EMAIL}
    input text                          id=password     ${VALID_LOGIN_PASSWORD}
    click button                        id=submit-id
    wait until page contains            Our Happy Customers

    click link                          id=new-customer
    wait until page contains            Add Customer

    input text                          id=EmailAddress      bruce.wayne@batman.com
    input text                          id=FirstName        Bruce
    input text                          id=LastName         Wayne
    input text                          id=City             Dallas
    select from list by value           id=StateOrRegion       TX
    select radio button                 gender  male
    select checkbox                     name=promos-name
    click button                        xpath://button[contains(text(),'Submit')]
    wait until page contains            Success! New customer added.

    click link                          Sign Out
    wait until page contains            Signed Out

    close browser

*** Keywords ***
