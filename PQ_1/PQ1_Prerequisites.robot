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
    ClickText        Actions                     partial_match=False
    ClickText        Approve
    TypeText         Description of Change       test
    TypeText         Rationale of Revision       abc123!
    ComboBox         Search People...            Admin User
    ClickText        Next
    TypeText         User                        admin
    TypeText         User Password               Dotbcs00
    ClickText        Sign
Preq3:One Master Documents records, type Controlled including Document Revisions in 'Effective', Revision Number 2.0 and above state exists in the system:Name: Form1, Business unit = General, Document Type = Form
    LaunchApp        Master Documents
    ClickText        New
    UseModal         On
    ClickText        ControlledDocument which require review and approval within the quality system
    ClickText        Next
    TypeText         *Document Name              Form6
    PickList         *Document Type              Form
    PickList         *Business Unit              General
    ComboBox         Search Departments...       test
    PickList         *Is this a Form or Translation?                         No
    ClickText        Save                        partial_match=False
    UseModal         Off
    UploadFile       Upload Files                ../resources/artest.docx
    ClickText        Done
    ClickText        Actions                     partial_match=False    delay=10s
    ClickText        Send for Review
    TypeText         Search by Name              Admin
    ClickItem        checkbox                    Anchor=Admin User           partial_match=False
    ClickText        Next                        partial_match=False
    TypeText         Search by Name              Admin
    ClickItem        checkbox                    Anchor=Admin User           partial_match=False
    ClickText        Next                        partial_match=False
    TypeText         Description of Change       test
    TypeText         Rationale of Revision       abc123!
    ComboBox         Search People...            Admin User
    ClickText        Next
    TypeText         User                        admin
    TypeText         User Password               Dotbcs00
    ClickText        Sign
    ClickText        Actions                     partial_match=False
    ClickText        Start Review
    TypeText         User                        admin
    TypeText         User Password               Dotbcs00
    ClickText        Sign
    ClickText        Actions                     partial_match=False
    ClickText        Send for Approval
    TypeText         User                        admin
    TypeText         User Password               Dotbcs00
    ClickText        Sign
    ClickText        Actions                     partial_match=False
    ClickText        Start Approval
    TypeText         User                        admin
    TypeText         User Password               Dotbcs00
    ClickText        Sign
    ClickText        Actions                     partial_match=False         delay=2s
    ClickText        QA Approval - Skip Training
    TypeText         Comments                    test
    ClickText        Next
    TypeText         User                        admin                       delay=2s
    TypeText         User Password               Dotbcs00
    ClickText        Sign
    LaunchApp        Master Documents                                    delay=5s
    TypeText         Search this list...         Form2\n
    ClickText        Form2
    ClickText        New                         partial_match=False
    ClickText        Confirm
    ClickText        Actions                     partial_match=False
    ClickText        Send for Review
    TypeText         Search by Name              admin
    ClickItem        checkbox                    Anchor=Admin User           partial_match=False
    ClickText        Next                        partial_match=False
    TypeText         Search by Name              admin
    ClickItem        checkbox                    Anchor=Admin User           partial_match=False
    ClickText        Next                        partial_match=False
    TypeText         Description of Change       test
    TypeText         Rationale of Revision       test
    ComboBox         Search People...            Admin User
    ClickText        Next
    TypeText         User                        admin
    TypeText         User Password               Dotbcs00
    ClickText        Sign
    ClickText        Actions                     partial_match=False
    ClickText        Start Review
    TypeText         User                        admin
    TypeText         User Password               Dotbcs00
    ClickText        Sign
    ClickText        Actions                     partial_match=False
    ClickText        Send for Approval
    TypeText         User                        admin
    TypeText         User Password               Dotbcs00
    ClickText        Sign
    ClickText        Actions                     partial_match=False
    ClickText        Start Approval
    TypeText         User                        admin
    TypeText         User Password               Dotbcs00
    ClickText        Sign
    ClickText        Actions                     partial_match=False
    ClickText        QA Approval - Skip Training
    TypeText         Comments                    test
    ClickText        Next
    TypeText         User                        admin
    TypeText         User Password               Dotbcs00
    ClickText        Sign
Preq4:One Product Item record exists in the system with related opened product version
    LaunchApp        Product Items
    ClickText        New
    UseModal         On
    TypeText         *Product Name               ARTPI
    PickList         *Unit of Measure            Kg
    ClickText        Save                        partial_match=False
    UseModal         Off