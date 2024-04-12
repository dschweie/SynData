*** Settings ***
Documentation       Suite description
Library             ../../../src/SynData/SynData.py
Library             BuiltIn
Library             Collections
Library             String
Library             JSONLibrary
Test Template       Check Create Person With Address

*** Test Cases ***
First Attempt   {"country":{"value":"DE"},"state":{"value":"Rheinland-Pfalz","operator":"equals"}}

*** Keywords ***
Check Create Person With Address
    [Arguments]     ${string_filter}={}
    ...             ${string_expected}={}
    ...             ${check_result}=${True}
    &{dict_filter}      Convert JSON To Dictionary  ${string_filter}
    Log Dictionary  ${dict_filter}
    &{person}       Create Person   compound_name=${False}   forenames=2     forename_hyphen=${False}     birth_name=${True}
    &{second}       Add Address By Filter   ${person}   ${dict_filter}
    &{person}       Add Cellphone Number    ${person}
    Log Dictionary  ${person}
    Log Dictionary  ${second}
    IF  ${check_result}
        &{dict_expected}    Convert JSON To Dictionary  ${string_expected}
    END

Convert JSON To Dictionary
    [Arguments]     ${json}
    ${retval}   Evaluate    json.loads('''${json}''')  json
    [Return]    ${retval}