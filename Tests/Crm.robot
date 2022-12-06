*** Settings ***
Documentation       This is some basic info about the whole suite
Library             SeleniumLibrary
#Run the script
#robot -d results tests/crm.robot
*** Variables ***

*** Test Cases ***
Should be able to add new customer
    [Documentation]         This is some info about the test
    [Tags]                  1006    Smoke  Contacts
    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s
    log                     Starting the test case!
    open browser            https://automationplayground.com/crm/       chrome
    #resize browser window for recording
    set window position     x=34   y=16
    set window size         width=1235  height=700

    page should contain     Customers Are Priority One!

    click link              id=SignIn
    page should contain     Login

    input text              id=email-id     admin@robotframeworktutorial.com
    input text              id=password     qwe
    click button            id=submit-id
    page should contain     Our Happy Customers

    click link              id=new-customer
    page should contain     Add Customer

    input text              id=EmailAddress      bruce.wayne@batman.com
    input text              id=FirstName        Bruce
    input text              id=LastName         Wayne
    input text              id=City             Dallas
    select from list by value    id=StateOrRegion       TX
    select radio button     gender  male
    select checkbox         name=promos-name
    click button            Submit
    wait until page contains    Success! New customer added.

    sleep                   3s
    close browser

*** Keywords ***
