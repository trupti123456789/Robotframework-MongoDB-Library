*** Settings ***
Library                         MongoDBLibrary
Library                         QWeb
Library                         QForce
Library                         String
Suite Setup                     OpenBrowser                 about:blank           Chrome
Library                         pymongo
*** Variables ***
${MDBHost}                      localhost
${MDBPort}                      27017

*** Keywords ***

Setup Browser
    Set Library Search Order    QWeb                        QForce
    Open Browser                about:blank                 Chrome
    SetConfig                   LineBreak                   ${EMPTY}              #\ue000
    SetConfig                   DefaultTimeout              20s                   #sometimes salesforce is slow


End suite
    Set Library Search Order    QWeb                        QForce
    Close All Browsers

Connect To MongoDB Server
    [Arguments]                 ${host}=${MDBHost}          ${port}=${MDBPort}
    Connect To MongoDB          ${host}                     ${port}

Disconnect From MongoDB Server
    Disconnect From MongoDB

Save MongoDB Records
    [Arguments]                 ${database}                 ${collection}         ${data}
    ${record_id}=               Save MongoDB Records        ${database}           ${collection}               ${data}
    [Return]                    ${record_id}

Retrieve All MongoDB Records
    [Arguments]                 ${database}                 ${collection}
    ${records}=                 Retrieve All MongoDB Records                      ${database}                 ${collection}
    [Return]                    ${records}

Retrieve Some MongoDB Records
    [Arguments]                 ${database}                 ${collection}         ${query}
    ${records}=                 Retrieve Some MongoDB Records                     ${database}                 ${collection}                 ${query}
    [Return]                    ${records}

Remove MongoDB Records
    [Arguments]                 ${database}                 ${collection}         ${query}
    Remove MongoDB Records      ${database}                 ${collection}         ${query}

Drop MongoDB Collection
    [Arguments]                 ${database}                 ${collection}
    Drop MongoDB Collection     ${database}                 ${collection}

Drop MongoDB Database
    [Arguments]                 ${database}
    Drop MongoDB Database       ${database}

Retrieve Mongodb Records With Desired Fields
    [Arguments]                 ${database}                 ${collection}         ${query}                    ${fields}    ${exclude_id}
    ${records}=                 Retrieve Mongodb Records With Desired Fields      ${database}                 ${collection}                 ${query}         ${fields}    ${exclude_id}
    [Return]                    ${records}


