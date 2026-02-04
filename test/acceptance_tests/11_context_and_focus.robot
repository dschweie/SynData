*** Settings ***
Documentation    A context can be set with a focus that limits the scope of a 
...    context to a test case or test suite. If the default value 
...    ``global`` is set, the scope is not restricted.
...
...    This test suite defines various test cases that are designed to check 
...    whether the rules for possible contexts are handled correctly.
...
...    Contrary to general teaching, the test cases in this test suite are 
...    partially dependent on each other. The reason for this is that, for 
...    example, a context with a global focus cannot be meaningfully tested 
...    with a single test case.
Library    ../src/SynData/SynData.py    localization=de_DE
Suite Setup    Create Contexts With Global And Suite Focus



*** Test Cases ***
Test 01 Ensure That No Context Is Set
    ${context}    Get Context
    Should Be Equal As Strings    None    ${context}

Test 11 Try To Access Data From Global Customer
    Set Context    Customer    localization=en_US    focus=global
    ${current_name}    Get Name
    Should Be Equal As Strings    ${GlobalCustomerName}    ${current_name}

Test 12 Try To Access Data From Suite Customer
    Set Context    Customer    focus=suite
    ${current_name}    Get Name
    Should Be Equal As Strings    ${SuiteCustomerName}    ${current_name}

Test 21 Create Context With Test Focus
    Set Context    Dealer    de_DE    test
    ${current_name}    Get Name    sex=f
    Set Suite Variable    $DealerTest21     ${current_name}
    ${current_context}    Get Context
    Should Be Equal As Strings    Dealer    ${current_context}

Test 22 Test Context Should Be None
    ${current_context}    Get Context
    Should Be Equal As Strings    None     ${current_context}

Test 23 Without A Valid Context Different Test Data Should Be Generated
    ${first_call}     Get First Name
    ${second_call}    Get First Name
    Should Not Be Equal As Strings    ${first_call}    ${second_call}

Test 24 New Context With Test Focus Should Generate A New Name
    Set Context    Dealer    de_DE    test
    ${current_name}    Get Name    sex=f
    Should Not Be Equal As Strings    ${DealerTest21}    ${current_name}
    
Test 31 Create A New Global Context Without Release
    Set Context    Uncle    localization=de_DE    focus=global
    ${current_context}    Get Context
    Should Not Be Equal As Strings    Uncle    ${current_context}

Test 32 The Global Context Should Be Still Set
    ${current_context}    Get Context
    Should Not Be Equal As Strings    Uncle    ${current_context}

Test 41 Create A New Suite Context Without Release
    Set Context    Aunt    localization=de_DE    focus=suite
    ${current_context}    Get Context
    Should Not Be Equal As Strings    Uncle    ${current_context}

Test 42 The Suite Context Should Be Still Set
    ${current_context}    Get Context
    Should Not Be Equal As Strings    Aunt    ${current_context}

*** Keywords ***
Create Contexts With Global And Suite Focus
    Set Context    Customer    en_US    global
    ${first_name}    Get First Name
    ${last_name}     Get Last Name
    Set Global Variable    $GlobalCustomerFirstName    ${first_name}
    Set Global Variable    $GlobalCustomerLastName     ${last_name}
    Set Global Variable    $GlobalCustomerName         ${first_name} ${last_name}
    Set Context    Customer    localization=fi_FI    focus=suite
    ${first_name}    Get First Name
    ${last_name}     Get Last Name
    Set Global Variable    $SuiteCustomerFirstName     ${first_name}
    Set Global Variable    $SuiteCustomerLastName      ${last_name}
    Set Global Variable    $SuiteCustomerName          ${first_name} ${last_name}
    Release Context