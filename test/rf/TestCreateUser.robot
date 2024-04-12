*** Settings ***
Library     ../../src/SynData/SynData.py
Library     Collections

Test Template       Check Create Person

*** Test Cases ***
Check Simple Person                                     any             any         ${True}
    [Documentation]     Testfall erzeugt eine neue Person, die weiblich oder männlich sein soll. Vor- und Nachname
    ...                 werden zufällig gesetzt.
    [Tags]              gender_any
Check Female Person With German Attribute               weiblich        female      ${True}
    [Documentation]     Testfall erzeugt eine weibliche Person, die über das Kennzeichen "weiblich" generiert werden soll.
    [Tags]              gender_female
Check Female Person With English Attribute              female          female      ${True}
    [Documentation]     Testfall erzeugt eine weibliche Person, die über das Kennzeichen "female" generiert werden soll.
    [Tags]              gender_female
Check Female Person With German Symbol                  w               female      ${True}
    [Documentation]     Testfall erzeugt eine weibliche Person, die über die Abkürzung "w" generiert werden soll.
    [Tags]              gender_female
Check Female Person With English Symbol                 f               female      ${True}
    [Documentation]     Testfall erzeugt eine weibliche Person, die über die Abkürzung "f" generiert werden soll.
    [Tags]              gender_female
Check Female Person With Salutation                     mrs             female      ${True}
    [Documentation]     Testfall erzeugt eine weibliche Person, die über die Anrede "mrs" generiert werden soll.
    [Tags]              gender_female
Check Male Person With German Attribute                 männlich        male        ${True}
    [Documentation]     Testfall erzeugt eine männliche Person, die über das Kennzeichen "männlich" generiert werden soll.
    [Tags]              gender_male
Check Male Person With English Attribute                male            male        ${True}
    [Documentation]     Testfall erzeugt eine männliche Person, die über das Kennzeichen "male" generiert werden soll.
    [Tags]              gender_male
Check Male Person With Symbol                           m               male        ${True}
    [Documentation]     Testfall erzeugt eine männliche Person, die über die Abküzung "m" generiert werden soll.
    ...                 Diese Abkürzung ist in der deutschen und englischen Sprache identisch.
    [Tags]              gender_male
Check Male Person With Salutation                       mr              male        ${True}
    [Documentation]     Testfall erzeugt eine männliche Person, die über die Anrede "mr" generiert werden soll.
    [Tags]              gender_male
Check Diverse Person With German Attribute              divers          third sex   ${True}
    [Documentation]     Testfall erzeugt eine Person, deren Geschlecht als divers eingestuft wird. In diesem Fall wird
    ...                 das über das Kennzeichen "divers" gemacht.
    [Tags]              gender_third_sex
Check Diverse Person With English Sex Attribute         third sex       third sex   ${True}
    [Documentation]     Testfall erzeugt eine Person, deren Geschlecht als divers eingestuft wird. In diesem Fall wird
    ...                 das über das Kennzeichen "third sex" gemacht.
    [Tags]              gender_third_sex
Check Diverse Person With English Gender Attribute      third gender    third sex   ${True}
    [Documentation]     Testfall erzeugt eine Person, deren Geschlecht als divers eingestuft wird. In diesem Fall wird
    ...                 das über das Kennzeichen "third gender" gemacht.
    [Tags]              gender_third_sex
Check Diverse Person With German Symbol                 d               third sex   ${True}
    [Documentation]     Testfall erzeugt eine Person, deren Geschlecht als divers eingestuft wird. In diesem Fall wird
    ...                 das über die Abkürzung "d" gemacht.
    [Tags]              gender_third_sex
Check Diverse Person With Salutation                    mx              third sex   ${True}
    [Documentation]     Testfall erzeugt eine Person, deren Geschlecht als divers eingestuft wird. In diesem Fall wird
    ...                 das über die Anrede "mx" gemacht.
    [Tags]              gender_third_sex
Check Person With Undefined Gender Symbol               x               any         ${True}
    [Documentation]     Testfall erzeugt eine Person über eine nicht definierte Abkürzung. In diesem Fall wird eine
    ...                 männliche oder eine weibliche Person generiert.
    [Tags]              gender_any
Check Person With Undefined Gender Attribute            rest            any         ${True}
    [Documentation]     Testfall erzeugt eine Person über eine nicht definierte Kennzeichnung. In diesem Fall wird eine
    ...                 männliche oder eine weibliche Person generiert.
    [Tags]              gender_any

*** Keywords ***
Check Create Person
    [Arguments]     ${gender}=any
    ...             ${expected_gender}=any
    ...             ${check_gender}=${False}
    &{person}   Create Person   ${gender}
    Log Dictionary  ${person}
    Dictionary Should Contain Key   ${person}   forename    A forename has to generated.
    Dictionary Should Contain Key   ${person}   surname     A surename has to generated.
    Dictionary Should Contain Key   ${person}   gender      A gender has to set.
    IF  ${check_gender}
        IF  '${expected_gender}' == 'any'
            ${list}     Create List     male    female
            List Should Contain Value   ${list}     ${person.gender}      Gender should be male or female.
        ELSE
            Should Be Equal     ${person.gender}    ${expected_gender}      Gender should have the expected value.
        END
    END