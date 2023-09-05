*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite

*** Test Cases ***
Login to DotCompliance suite
    [tags]                    Lead
    Setup Browser               
    Login                     
Preq1:One record that the user above is not its owner exists and in an editable state=Auto02PQ1Prereq_DifOwner
    LaunchApp    Master Documents
    ClickText    New
    UseModal    On
    ClickText    SimpleDocument which require approval within the quality system
    ClickText    Next
    UseModal    Off
    UseModal    On
    UseModal    Off
    TypeText    *Document Name    artest104
    PickList    *Document Type    Other
    PickList    *Business Unit    General
    ComboBox    Search Departments...    test
    ClickText    Save    partial_match=False
 

    ClickText    Upload FilesOr drop files
    TypeText    Upload FilesOr drop files    C:\\fakepath\\screenshot-Live_Testing_Session-ad47ba82-2555-42c9-9cf4-63059740cbce.png
    UseModal    On
    ClickText    Done
    UseModal    Off
