*** Settings ***
Library    ../src/SynData/SynData.py    localization=de_DE  logging=${True}  replayfile=${CURDIR}/../data/acceptance_tests/replay_file_test_suite_61.csv

*** Test Cases ***
Generate Some Data Without Context
    ${data}    Get First Name
    Should Be Equal As Strings    Christophorus    ${data}
    ${data}    Get First Name    sex=m
    Should Be Equal As Strings    Anrich    ${data}
    ${data}    Get First Name    sex=f
    Should Be Equal As Strings    Marta    ${data}
    ${data}    Get Name
    Should Be Equal As Strings    Oskar Tietjen    ${data}

Generate Some Data With Context
    Set Context  Policyholder    localization=de_DE
    ${data}    Get Name    sex=f
    Should Be Equal As Strings    Helgard Ahrens    ${data}
    Set Context  Legal Representative   localization=de_DE  
    ${data}    Get Name    sex=m
    Should Be Equal As Strings    Rudolf Stricker    ${data}
    Set Context  Policyholder
    ${data}    Get First Name
    Should Be Equal As Strings    Helgard    ${data}
