*** Settings ***

Documentation     Diese Datei wurde erzeugt durch LF-ET 2.1.5 (211102a) und Kommandozeile:
...     -GenTest "C:/Users/dirko/PycharmProjects/SynData/test/lfet/CreateUserVarianten.lfet" -Group "robot" -SwitchCoverage "1" -NonExecutableRules "50" -RecommendedTestCases -ExportRobotFramework "CreateUserVarianten.testcases.robot"
...     
...     Aktueller Benutzer: dirko
...     Aktuelles Verzeichnis (user.dir): "C:\Tools\testing\LF-ET"
...     Benötigte Zeit: 00:00:00.544 (06.11.2021 09:35:10.451 - 06.11.2021 09:35:10.995)
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
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0002 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R01 | B02=any
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    any
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0003 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R01 | B02=any
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R26 | B05=N
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    any
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${False}

0004 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R01 | B02=any
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    any
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0005 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R01 | B02=any
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    any
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0006 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R01 | B02=any
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    any
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0007 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R17 | B03=0
     ...     | R24 | B04=N
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0008 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R18 | B03=1
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0009 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R19 | B03=2
     ...     | R24 | B04=N
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0010 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R20 | B03=3
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0011 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R21 | B03=4
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0012 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R02 | B02=m
     ...     | R22 | B03=5+
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    m
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0013 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0014 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0015 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0016 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0017 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0018 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R03 | B02=mr
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mr
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0019 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0020 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0021 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0022 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0023 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0024 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R04 | B02=male
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    male
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0025 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0026 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0027 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0028 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0029 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0030 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R05 | B02=männlich
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    männlich
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0031 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0032 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0033 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0034 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0035 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0036 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R06 | B02=w
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    w
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0037 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0038 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0039 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0040 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0041 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0042 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R07 | B02=f
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    f
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0043 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0044 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0045 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0046 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0047 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0048 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R08 | B02=mrs
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mrs
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0049 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0050 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0051 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0052 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0053 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0054 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R09 | B02=female
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    female
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0055 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0056 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0057 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0058 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0059 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0060 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R10 | B02=weiblich
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    weiblich
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0061 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0062 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0063 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0064 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0065 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0066 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R11 | B02=d
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    d
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0067 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0068 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0069 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0070 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0071 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0072 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R12 | B02=mx
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    mx
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0073 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0074 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0075 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0076 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0077 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0078 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R13 | B02=third sex
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third sex
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0079 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0080 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0081 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0082 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0083 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0084 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R14 | B02=third gender
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    third gender
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0085 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0086 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0087 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0088 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0089 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0090 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R15 | B02=divers
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle
     Set Test Variable    ${gender}    divers
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0091 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R17 | B03=0
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    *
     Set Test Variable    ${fornames}    0
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0092 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R18 | B03=1
     ...     | R24 | B04=N
     ...     | R26 | B05=N
     ...     | R29 | B05=N | B06=J
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    *
     Set Test Variable    ${fornames}    1
     Set Test Variable    ${hyphen}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${compound_name}    ${False}
     Set Test Variable    ${birth_name}    ${True}

0093 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R19 | B03=2
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R28 | B05=J | B06=J
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    *
     Set Test Variable    ${fornames}    2
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${True}

0094 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R20 | B03=3
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    *
     Set Test Variable    ${fornames}    3
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0095 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R21 | B03=4
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    *
     Set Test Variable    ${fornames}    4
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}

0096 CreateUserVarianten 
     [Documentation]     CreateUserVarianten
     ...     | R16 | B02=*
     ...     | R22 | B03=5+
     ...     | R23 | B04=J
     ...     | R25 | B05=J
     ...     | R27 | B06=N
     [Tags]     @_empfohlene_testfälle     @negative
     Set Test Variable    ${gender}    *
     Set Test Variable    ${fornames}    5+
     Set Test Variable    ${hyphen}    ${True}
     Set Test Variable    ${compound_name}    ${True}
     Set Test Variable    ${birth_name}    ${False}
