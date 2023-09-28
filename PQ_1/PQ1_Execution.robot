*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
Library                       QVision
Library                       FakerLibrary

*** Test Cases ***
Login to DotCompliance suite
    [tags]                    Lead
    Setup Browser               
    Login                     
    LaunchApp        Master Documents
    ClickText        New
    UseModal         On
    ClickText        ControlledDocument which require review and approval within the quality system
    ClickText        Next
    TypeText         *Document Name              ART MDC1
    PickList         *Document Type              Procedure
    PickList         *Business Unit              General
    ComboBox         Search Departments...       test
    PickList         *Is this a Form or Translation?                         No
    ClickText        Save                        partial_match=False
    UseModal         Off
    UploadFile       Upload Files                ../resources/artest.docx    delay=10s
    ClickText        Done

    ClickText    Edit    partial_match=False
    UseModal    On
    TypeText    *Document Revision Name    ART MDC1!!
    VerifyText    0.1
    TypeText    Revision Number    0.2
    ComboBox    Search People...    Admin User
    ClickText    Review Target Date    anchor=Document Type
    ClickText    Today
    PickList    Document State    Pending Approval
    ClickText    Effective Date (GMT)    anchor=Document State
    ClickText    Today
    PickList    Effective Criteria    Based on Target Effective Date
    ClickText    Target Effective Date    anchor=Effective Criteria
    ClickText    Today
    TypeText    % of Training Completion    50
    TypeText    Description of Change    abc123!
    TypeText    Rationale of Revision    abc123!
    ClickCheckbox    Enable Collaboration    on
    ClickCheckbox    Data Migration Record    on
    ClickCheckbox    Checked Out    on
    ClickText    Date    anchor=Enable CollaborationEnable Collaboration Help Info
    ClickText    Today
    ComboBox    Search People...    Admin User
    ComboBox    Search Change Controls...    RR-1
    ComboBox    Search Action Items...    Test
    ComboBox    Search CAPAs...    capa    index=1
    TypeText    File URL    1https://dcs51v--51qa.sandbox.my.salesforce.com/sfc/servlet.shepherd/version/download/0683M000002WIgJQAW
    TypeText    PDF URL    1
    ClickText    Save    partial_match=False
    UseModal    Off
${number}=      GetFieldValue           Master Document Number                        
     Log To Console    ${number}  

