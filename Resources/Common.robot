*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin Web Test
    #set selenium speed                  .2s
    set selenium timeout                10s
    log                                 Starting the test case!
    open browser                        ${URL}       ${BROWSER}
    #resize browser window for recording
    set window position                 x=34   y=16
    set window size                     width=1235  height=900

    wait until page contains            Customers Are Priority One!

End Web Test
    close all browsers