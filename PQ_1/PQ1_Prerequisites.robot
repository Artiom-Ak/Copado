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
    TypeText    *Document Name    artest106
    PickList    *Document Type    Other
    PickList    *Business Unit    General
    ComboBox    Search Departments...    test
    ClickText    Save    partial_match=False
    UploadFile           Upload Files    ../resources/artest.docx
    ClickText            Done
    ClickText    Edit Revision Owner
    ComboBox    Search People...    QA User
    ClickText    Save
Preq2:One Master Documents records, type Simple including Document Revisions in ‘Effective’ state exists in the system:Name: Temp1, Business unit = General, Is Template = checked Document Type = Appendix, Language = English.
    ClickText    Master Documents List
    ClickText    New Master Document
    UseModal    On
    ClickText    SimpleDocument which require approval within the quality system
    ClickText    Next
    TypeText    *Document Name    artest107
    PickList    *Document Type    Appendix
    PickList    *Business Unit    General
    ClickCheckbox    Is Template    on
    ComboBox    Search Departments...    test
    PickList    Language    English
    ClickText    Save    partial_match=False
    UseModal    Off
    UploadFile           Upload Files    ../resources/artest.docx
    ClickText            Done