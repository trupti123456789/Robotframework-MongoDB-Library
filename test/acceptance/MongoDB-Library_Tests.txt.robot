*** Settings ***
#Resource                        ../Resources/Common.robot
Suite Setup                     Setup Browser
Suite Teardown                  End suite
Library                         MongoDB-Library_Tests.txt.robot
Library                        ../Mongo.robot

*** Variables ***
${MDBHost}                      localhost
${MDBPort}                      27017

*** Test Cases ***
    [tags]        Mongo
Connect-Disconnect
    [Tags]                      regression
    Comment                     Connect to MongoDB Server
    Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    Comment                     Disconnect from MongoDB Server
    Disconnect From MongoDB

