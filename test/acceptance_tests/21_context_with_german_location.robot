*** Settings ***
Library    ../src/SynData/SynData.py    localization=de_DE

Test Teardown    Release Context

*** Test Cases ***

Repeated Execution Of A Keyword Must Yield Identical Results
    [Documentation]    When a context is set, the data should be consistent. 
    ...                This also means that a random value should be returned 
    ...                at most when a keyword is called for the first time. 
    ...                After that, the keyword is expected to always return the
    ...                same value within the defined context.
    ...
    ...                This test case sets a context and then calls ``Get Name``
    ...                a total of three times, and all three results must be 
    ...                identical.
    [Setup]    Set Context    REOAKMYIR21    de_DE
    ${first_call}    Get Name    
    ${second_call}   Get Name
    ${third_call}    Get Name
    Should Be Equal As Strings    ${first_call}     ${second_call}
    Should Be Equal As Strings    ${second_call}    ${third_call}

Identical Results Even After Switching To A Different Context And Back
    [Documentation]    In a test case, it is conceivable that two people play a 
    ...                role, for example. In this case, I can set a context for 
    ...                each role, and the results must be consistent even after 
    ...                switching between roles.
    ...
    ...                In this test case, a total of two contexts are set. 
    ...                Data generated in the first context must also be returned
    ...                when switching to the second context in the meantime.
    ...
    ...                This test case uses ``Get Name`` for both contexts to 
    ...                verify that the data is consistent.
    [Setup]    Set Context    IREASTADCAB21A    de_DE
    ${first_call_a}    Get Name
    Set Context        IREASTADCAB21B    fi_FI
    ${first_call_b}    Get Name
    Set Context        IREASTADCAB21A
    ${second_call_a}   Get Name
    Should Be Equal As Strings    ${first_call_a}    ${second_call_a}
    Should Not Be Equal As Strings    ${first_call_a}    ${first_call_b}

Consistent Data Within The Context When First Name Is Set
    [Documentation]    In some cases, the keywords generate information that is 
    ...                dependent on other information. For example, a first name
    ...                is formed from ``Get First Name`` and ``Get Name``. If a 
    ...                tester first calls ``Get First Name``, then ``Get Name`` 
    ...                must contain the same first name that was previously 
    ...                returned by ``Get First Name``.
    [Setup]    Set Context    CDWTCWFNIS21    de_DE
    ${first_name}    Get First Name    m
    ${name}    Get Name
    Should Match Regexp    ${name}    ^${first_name}\\s.+$

Consistent Data Within The Context When The Last Name Is Set
    [Documentation]    In some cases, the keywords generate information that is 
    ...                dependent on other information. For example, a last name 
    ...                is formed from ``Get Last Name`` and ``Get Name``. 
    ...                If a tester first calls ``Get Last Name``, then 
    ...                ``Get Name`` must contain the same last name that was 
    ...                previously returned by ``Get Last Name``.
    [Setup]    Set Context    CDWTCWTLNIS21    de_DE
    ${last_name}    Get Last Name    
    ${name}    Get Name
    Should Match Regexp    ${name}    ^.+\\s${last_name}$

Consistent Data Within The Context When A Name Is Set
    [Documentation]    In some cases, the keywords generate information that is 
    ...                dependent on other information.
    ...
    ...                In this test case, a name consisting of a first and 
    ...                last name is first created in the context using the 
    ...                keyword ``Get Name``.
    ...
    ...                When ``Get First Name`` and ``Get Last Name`` are then 
    ...                called, the results must be consistent with the result 
    ...                of ``Get Name``.
    [Setup]    Set Context    CDWTCWANIS21    de_DE
    ${name}    Get Name
    ${first_name}    Get First Name
    ${last_name}     Get Last Name
    Should Be Equal As Strings    ${name}    ${first_name} ${last_name}