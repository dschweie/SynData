*** Settings ***
Library    ../src/SynData/SynData.py    localization=de

*** Test Cases ***

German First Name Without Context
    Release Context
    ${name_a}    Get First Name    m
