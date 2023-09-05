*** Settings ***
Resource                      common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite

*** Test Cases ***
Login to DotCompliance suite
    [tags]                    Lead
    Setup Browser               
    Login                     
