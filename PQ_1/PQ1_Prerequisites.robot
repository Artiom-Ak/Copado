*** Settings ***
Resource             ../resources/common.robot
Suite Setup          Setup Browser
Suite Teardown       End suite

*** Test Cases ***
Login to DotCompliance suite
    [tags]           Lead
    Setup Browser
    Login
Preq1:One record that the user above is not its owner exists and in an editable state=Auto02PQ1Prereq_DifOwner
    LaunchApp        Master Documents
    ClickText        New
    UseModal         On
    ClickText        SimpleDocument which require approval within the quality system
    ClickText        Next
    UseModal         Off
    UseModal         On
    UseModal         Off
    TypeText         *Document Name              artest110
    PickList         *Document Type              Other
    PickList         *Business Unit              General
    ComboBox         Search Departments...       test
    ClickText        Save                        partial_match=False
    UploadFile       Upload Files                ../resources/artest.docx
    ClickText        Edit Revision Owner
    ComboBox         Search People...            QA User
    ClickText        Save
Preq2:One Master Documents records, type Simple including Document Revisions in Effective state exists in the system:Name: Temp1, Business unit = General, Is Template = checked Document Type = Appendix, Language = English.
    LaunchApp        Master Documents
    ClickText        New
    UseModal         On
    ClickText        SimpleDocument which require approval within the quality system
    ClickText        Next
    TypeText         *Document Name              artest107
    PickList         *Document Type              Appendix
    PickList         *Business Unit              General
    ClickCheckbox    Is Template                 on
    ComboBox         Search Departments...       test
    PickList         Language                    English
    ClickText        Save                        partial_match=False
    UseModal         Off
    UploadFile       Upload Files                ../resources/artest.docx
    ClickText        Done
Preq3:One Master Documents records, type Controlled including Document Revisions in 'Effective', Revision Number 2.0 and above state exists in the system:Name: Form1, Business unit = General, Document Type = Form
    LaunchApp        Master Documents
    ClickText        New
    UseModal         On
    ClickText        Next
    TypeText         *Document Name              Form1
    PickList         *Document Type              Form
    PickList         *Business Unit              General
    ComboBox         Search Departments...       test
    ClickText        Save                        partial_match=False
    PickList         *Is this a Form or Translation?                         No
    ClickText        Save                        partial_match=False
    UseModal         Off
