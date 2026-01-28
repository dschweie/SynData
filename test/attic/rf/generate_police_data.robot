*** Settings ***
Library     ../../src/SynData/SynData.py
Library     Collections
Library     OperatingSystem
Library     String
Library     BuiltIn

*** Test Cases ***
Compile Test Data
    Repeat Keyword     411    Generate Data For Police


*** Keywords ***
Generate Data For Police
    &{dict_filter}      Convert JSON To Dictionary  {}
    &{person}       Create Person   compound_name=${False}   forename_hyphen=${False}     birth_name=${False}
    &{person}       Add Address By Filter   ${person}   ${dict_filter}
    &{person}       Add Cellphone Number    ${person}   information_path=communication.landline
    &{person}       Add Landline Number     ${person}   information_path=communication.landline
    Log Dictionary  ${person}
    Log Dictionary  ${person.communication}
    Log Dictionary  ${person.communication.landline}
    ${number}       Get From Dictionary     ${person.communication.landline}    number
    ${number}       Get Substring           ${number}   0   -2
    ${line}         Catenate    SEPARATOR=\t    ${person.address.street} ${person.address.housenumber}      ${person.address.postcode}  ${person.address.city}      ${number} 10     ${number} 59
    Append To File  .\de_data.csv   ${line}\n

Convert JSON To Dictionary
    [Arguments]     ${json}
    ${retval}   Evaluate    json.loads('''${json}''')  json
    [Return]    ${retval}