*** Settings ***
Library     ../../src/SynData/SynData.py

*** Test Cases ***

Context Setzen
    Set Context    Alpha
    ${context}    Get Context
    Should Be Equal As Strings    ${context}    Alpha

Get Names Without Context
    Release Context
    ${name_a}    Get Name    f
    ${name_b}    Get Name    f

Get Names With Non German Context
    Set Context    RoboCon    fi-FI
    ${name_a}    Get Name    m
    ${name_b}    Get Name    m
    Should Be Equal As Strings    ${name_a}    ${name_b}
    Release Context
    Set Context    RoboCon
    ${name_c}    Get Name
    Should Be Equal As Strings    ${name_a}    ${name_c}

Test Usage Of Different Item With Non German Context
    Set Context    TC27    it_IT
    ${last_name}     Get Last Name 
    ${first_name}    Get First Name    m
    ${name}          Get Name
    Should Be Equal As Strings    ${name}    ${first_name} ${last_name}