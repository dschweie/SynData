*** Settings ***
Library    ../src/SynData/SynData.py    localization=de_DE

*** Test Cases ***

Get German Name
    [Documentation]    The keyword ``Get Name`` should return a name consisting 
    ...                of a first name and last name.
    ...
    ...                With localization set to Germany and without context, 
    ...                the system checks whether a syntactically correct result 
    ...                is returned.
    ${name}    Get Name  
    Should Be True    ${{$name is not None}}
    Should Match Regexp     ${name}    pattern=^\\S[^\\d]+\\s[^\\d]+$
    ...                     msg=Since the name is generated randomly, a check is performed to ensure that a string is returned that has at least one space in the middle separating the first name from the last name.

Get German Female First Name 
    [Documentation]    The keyword ``Get First Name`` should return a first name
    ...                and it is possible to select the first name by sex.
    ...
    ...                This test case requests a female first name.
    ...
    ...                With localization set to Germany and without context, 
    ...                the system checks whether a syntactically correct result 
    ...                is returned.
    ${name}    Get First Name    f
    Should Be True    ${{$name is not None}}
    Should Match Regexp     ${name}    pattern=^\\S[^\\d]+$
    ...                     msg=Since the first name is generated randomly, it is only checked against a regular expression.

Get German Male First Name 
    [Documentation]    The keyword ``Get First Name`` should return a first name
    ...                and it is possible to select the first name by sex.
    ...
    ...                This test case requests a male first name.
    ...
    ...                With localization set to Germany and without context, 
    ...                the system checks whether a syntactically correct result 
    ...                is returned.
    ${name}    Get First Name    m
    Should Be True    ${{$name is not None}}
    Should Match Regexp     ${name}    pattern=^\\S[^\\d]+$
    ...                     msg=Since the first name is generated randomly, it is only checked against a regular expression.

Get German Last Name
    [Documentation]    The keyword ``Get Last Name`` should return a last name.
    ...
    ...                With localization set to Germany and without context, 
    ...                the system checks whether a syntactically correct result 
    ...                is returned.
    ${name}    Get Last Name
    Should Be True    ${{$name is not None}}
    Should Match Regexp     ${name}    pattern=^\\S[^\\d]+$
    ...                     msg=Since the name is generated randomly, a check is performed to ensure that a string is returned that has at least one space in the middle separating the first name from the last name.

Two German Female Names Should Not Be Equal
    [Documentation]    This test case checks whether two randomly generated 
    ...                names consisting of a first name and a last name are 
    ...                different. The first name should be chosen from the set 
    ...                of female first names
    ...
    ...                Since no context is set, the keyword generates a random 
    ...                name each time it is called.
    ...
    ...                In very rare cases, the test case may fail because two 
    ...                calls produce identical results. With more than 1,500 
    ...                female first names and more than 3,500 last names, the 
    ...                probability of this happening is very low.
    ${name_a}    Get First Name    f
    ${name_b}    Get First Name    f
    Should Not Be Equal As Strings    ${name_a}    ${name_b}
