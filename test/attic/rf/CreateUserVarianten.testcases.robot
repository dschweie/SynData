*** Settings ***

Documentation     Diese Datei wurde erzeugt durch LF-ET 2.1.5 (211102a) und Kommandozeile:
...     -GenTest "C:/Users/dirko/PycharmProjects/SynData/test/lfet/CreateUserVarianten.lfet" -Group "robot" -SwitchCoverage "1" -NonExecutableRules "50" -RecommendedTestCases -Random -Statistics -ExportRobotFramework "C:/Users/dirko/PycharmProjects/SynData/test/rf/CreateUserVarianten.testcases.robot"
...     
...     Aktueller Benutzer: dirko
...     Aktuelles Verzeichnis (user.dir): "C:\Tools\testing\LF-ET"
...     Benötigte Zeit: 00:00:01.951 (06.11.2021 11:53:32.394 - 06.11.2021 11:53:34.345)
...     
...     Entscheidungstabelle: C:\Users\dirko\PycharmProjects\SynData\test\lfet\CreateUserVarianten.lfet
...     
...     TestValueGroups: robot, *ti.att.robot, *ti.check.robot
...     Config: 
...     
...     Testfälle mit Fehlern: 0
...     
...     Testfälle mit Warnungen: 0
...     
...     Informationen: 0

Library     ../../src/SynData/SynData.py
Library     String
Library     Collections

*** Test Cases ***

0001 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R01 | B02=any
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    any
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0002 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R01 | B02=any
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    any
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0003 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R01 | B02=any
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R26 | B05=N
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    any
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0004 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R01 | B02=any
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    any
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0005 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R01 | B02=any
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    any
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0006 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R01 | B02=any
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    any
     Set Test Variable    ${forenames}    7
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0007 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R17 | B03=0
     ...     | R24 | B04=N
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0008 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R18 | B03=1
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0009 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R19 | B03=2
     ...     | R24 | B04=N
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0010 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R20 | B03=3
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0011 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R21 | B03=4
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0012 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R22 | B03=5+
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${forenames}    6
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0013 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0014 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0015 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0016 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0017 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0018 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${forenames}    7
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0019 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0020 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0021 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0022 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0023 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0024 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${forenames}    8
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0025 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0026 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0027 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0028 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0029 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0030 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${forenames}    8
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    male      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0031 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0032 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0033 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0034 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0035 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0036 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${forenames}    6
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0037 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0038 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0039 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0040 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0041 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0042 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${forenames}    6
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0043 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0044 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0045 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0046 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0047 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0048 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${forenames}    6
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0049 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0050 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0051 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0052 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0053 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0054 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${forenames}    8
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0055 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0056 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0057 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0058 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0059 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0060 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${forenames}    7
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    female      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0061 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0062 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0063 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0064 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0065 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0066 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${forenames}    7
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0067 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0068 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0069 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0070 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0071 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0072 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${forenames}    8
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0073 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0074 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0075 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0076 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0077 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0078 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${forenames}    7
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0079 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0080 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0081 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0082 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0083 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0084 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${forenames}    6
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0085 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0086 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0087 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0088 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0089 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0090 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${forenames}    7
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     Should Be Equal     ${person.gender}    third sex      Gender should have the expected value.
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0091 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    siaae
     Set Test Variable    ${forenames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0092 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    riqkb
     Set Test Variable    ${forenames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${forename_separator}    ${SPACE}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=-
     IF    "male"=="${person.gender}"
         Length Should Be    ${names}    1    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     ELSE
         ${count}    Get Length    ${names}
         Should Be True    3 > ${count}    Only one forename should be found. Remark: Female names like Ann-Kathrin are allowed for females and third sex.
     END
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    1    The surname must be a single surname.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.

0093 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    jhckm
     Set Test Variable    ${forenames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Contain X Times    ${person_keys}    birthname    1    The person must have one birth name.
     Should Be Equal As Strings    ${person.birthname}    ${surname_items}[0]	The birth name of the person has to be the first part of surname.

0094 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    qqkcn
     Set Test Variable    ${forenames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0095 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    rgopt
     Set Test Variable    ${forenames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.

0096 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    leqpk
     Set Test Variable    ${forenames}    7
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${forename_separator}    -
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
     &{person}   Create Person   gender=${gender}    forenames=${forenames}    forename_hyphen=${hyphen}    compound_name=${compound_name}    birth_name=${birth_name}
     @{person_keys}    Get Dictionary Keys    ${person}
     @{names}    Split String    ${person.forename}    separator=${forename_separator}
     Length Should Be    ${names}    ${forenames}    There must be ${forenames} forenames in the person data.
     @{surname_items}    Split String    ${person.surname}    separator=-
     Length Should Be    ${surname_items}    2    The surname must be generated with two surnames separated by a hyphen.
     Should Not Contain    ${person_keys}    birthname    The person must not have a birth name.
