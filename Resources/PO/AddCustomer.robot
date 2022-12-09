*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${ADDCUSTOMER_HEADER_LABEL}             Add Customer
${ADDCUSTOMER_SUBMIT_BUTTON}            xpath://button[contains(text(),'Submit')]
${ADDCUSTOMER_EMAIL_TEXTBOX}            id:EmailAddress
${ADDCUSTOMER_FIRST_NAME_TEXTBOX}       id:FirstName
${ADDCUSTOMER_LAST_NAME_TEXTBOX}        id:LastName
${ADDCUSTOMER_CITY_TEXTBOX}             id:City
${ADDCUSTOMER_STATE_DROPDOWN}           id=StateOrRegion
${ADDCUSTOMER_GENDER_RADIO}             gender
${ADDCUSTOMER_PROMO_CHECKBOX}           name:promos-name
*** Keywords ***
Verify Page Loaded
    wait until page contains            ${ADDCUSTOMER_HEADER_LABEL}
Add New Customer
    Fill Customer Fields
    Click Submit Button
Fill Customer Fields
    input text                          ${ADDCUSTOMER_EMAIL_TEXTBOX}            bruce.wayne@batman.com
    input text                          ${ADDCUSTOMER_FIRST_NAME_TEXTBOX}       Bruce
    input text                          ${ADDCUSTOMER_LAST_NAME_TEXTBOX}        Wayne
    input text                          ${ADDCUSTOMER_CITY_TEXTBOX}             Dallas
    select from list by value           ${ADDCUSTOMER_STATE_DROPDOWN}           TX
    select radio button                 ${ADDCUSTOMER_GENDER_RADIO}             male
    select checkbox                     ${ADDCUSTOMER_PROMO_CHECKBOX}
Click Submit Button
    click button                        ${ADDCUSTOMER_SUBMIT_BUTTON}