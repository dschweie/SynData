*** Settings ***
Library     FakerLibrary    locale=de_DE  


*** Test Cases ***
Generate An Address
    ${address}    Address

Fill Registration
    ${firstname}     First Name
    ${lastname}      Last Name
    ${account}       Name