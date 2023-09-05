*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite

*** Test Cases ***
Login to DotCompliance suite
    [tags]                    Lead
    Setup Browser               
    Login                     

    LaunchApp    Master Documents
    ClickText    New
    UseModal    On
    ClickText    SimpleDocument which require approval within the quality system
    ClickText    Next
    UseModal    Off
    UseModal    On
    UseModal    Off
    TypeText    *Document Name    Auto02PQ1Prereq_DifOwner
    PickList    *Document Type    Other
    PickList    *Business Unit    General
    ComboBox    Search Departments...    test
    ClickText    Save    partial_match=False


    ClickText    Upload FilesOr drop files
    VerifyText   test.docx               partial_match=True
    TypeText    Upload FilesOr drop files    C:\\fakepath\\test.docx
    UseModal    On
    ClickText    Done
    UseModal    Off


