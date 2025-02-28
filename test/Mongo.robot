*** Settings ***
Library                    QForce
#Library                   QMobile
Library                    QVision
Library                    DatabaseLibrary
#Library                   YAMLLibrary
Suite Setup                Open Browser                about:blank                 chrome    Read Database Config
Library                    ./lib/python.py             ${CURDIR}/../../Data/config.yaml
Library                    ./lib/mongoDBlibrary.py     ${MONGO_CONNECTION_STRING}
*** Variables ***
${CONFIG_FILE}             ${CURDIR}/../Data/config.yaml

*** Keywords ***
Read Database Config
    #${config}=            LoadConfig                  ${CONFIG_FILE}
    Set Suite Variable      ${MDBHost}                  ${CONFIG_FILE}/[default][MDBHost]
    Set Suite Variable     ${MDBPort}                  ${CONFIG_FILE}/[default][MDBPort]
    Set Suite Variable     ${MDBUser}                  ${CONFIG_FILE}/[default][MDBUser]
    Set Suite Variable     ${MDBPassword}              ${CONFIG_FILE}/[default][MDBPassword]
    Set Suite Variable     ${MDBDatabase}              ${CONFIG_FILE}/[default][MDBDatabase]

*** Test Cases ***
Connect-Disconnect
    [Tags]                 regression
  
    Read Database Config
    Connect To Database     ${MDBHost} ${MDBPort} ${MDBUser} ${MDBPassword} ${MDBDatabase}
    #Connect To Database  | mongodb+srv://chaudharytruptisfdc:mongo@123@cluster0.grwdhih.mongodb.net/ | 27017 | 10 | None | <type 'dict'> | False |
    # Library              QForce
    # Library              QWeb
    # Library              QVision
    # Library
    # Library              DatabaseLibrary
    # Suite Setup          Open Browser                about:blank                 chrome


    # *** Variables ***
    # ${MDBHost}           localhost
    # ${MDBPort}           ${27017}
    # ${MDBUser}           admin
    # ${MDBPassword}       admin
    # ${MDBDatabase}       admin

    # *** Test Cases ***
    # Connect-Disconnect
    #                      [Tags]                      regression
    #                      Connect To Database         ${MDBHost}                  ${MDBPort}                        ${MDBUser}    ${MDBPassword}    ${MDBDatabase}
    #Disconnect From MongoDB

    # *** Test Cases ***
    # #Connect-Disconnect
    #                      [Tags]                      regression
    #                      Connect To Database         ${MDBHost}                  ${MDBPort}
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          mongodb://admin:admin@foo.bar.org     ${27017}
    #                      Connect to Database         mongodb://admin:admin@foo.bar.org     ${27017}
    #                      Connect To Database         foo.bar.org                 |         ${27017}
    #                      Connect To Database         mongodb://admin:admin@Trupti@tr       ${27017}
    #                      Connect To Database         Trupti@tr                   |         ${27017}

    #                      Comment                     Disconnect from MongoDB Server
    #                      Disconnect From Database

    # Get MongoDB Databases
    #                      [Tags]                      regression
    #                      Comment
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      Comment                     Retrieve a list of databases on the MongoDB server
    #                      @{output} =                 Get MongoDB Databases
    #                      Log Many                    @{output}
    #                      Comment                     Verify the order in which the databases are returned by checking specific elements of return for exact db name
    #                      Should Contain              @{output}[0]                test
    #                      Should Contain              @{output}[1]                admin
    #                      Should Contain              @{output}[2]                local
    #                      Comment                     Verify that db name is contained in the list output
    #                      Should Contain              ${output}                   admin
    #                      Should Contain              ${output}                   local
    #                      Should Contain              ${output}                   test
    #                      Comment                     Log as a list
    #                      Log                         ${output}
    #                      Comment                     Disconnect from MongoDB Server
    #                      Disconnect From MongoDB
    #                      |
    # Save MongoDB Records
    #                      [Tags]                      regression
    #                      ${MDBDB} =                  Set Variable                foo
    #                      ${MDBColl} =                Set Variable                foo
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      Comment                     Get current record count in collection to ensure that count increases correctly
    #                      ${CurCount} =               Get MongoDB Collection Count          ${MDBDB}                ${MDBColl}
    #                      ${output} =                 Save MongoDB Records        ${MDBDB}                          ${MDBColl}    {"timestamp":1, "msg":"Hello 1"}
    #                      Log                         ${output}
    #                      Set Suite Variable          ${recordno1}                ${output}
    #                      ${output} =                 Save MongoDB Records        ${MDBDB}                          ${MDBColl}    {"timestamp":2, "msg":"Hello 2"}
    #                      Log                         ${output}
    #                      Set Suite Variable          ${recordno2}                ${output}
    #                      ${output} =                 Save MongoDB Records        ${MDBDB}                          ${MDBColl}    {"timestamp":3, "msg":"Hello 3"}
    #                      Log                         ${output}
    #                      Set Suite Variable          ${recordno3}                ${output}
    #                      Comment                     Verify that the record count increased by the number of records saved above (3)
    #                      ${output} =                 Get MongoDB Collection Count          ${MDBDB}                ${MDBColl}
    #                      Should Be Equal             ${output}                   ${${CurCount} + 3}
    #                      Disconnect From MongoDB

    # Update An Existing MongoDB Record
    #                      [Tags]                      regression
    #                      ${MDBDB} =                  Set Variable                foo
    #                      ${MDBColl} =                Set Variable                foo
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      Comment                     Get current record count in collection to ensure that count increases correctly
    #                      ${CurCount} =               Get MongoDB Collection Count          ${MDBDB}                ${MDBColl}
    #                      ${output} =                 Save MongoDB Records        ${MDBDB}                          ${MDBColl}    {"timestamp":1, "msg":"Hello 1"}
    #                      Log                         ${output}
    #                      Set Suite Variable          ${recordno1}                ${output}
    #                      ${output} =                 Save MongoDB Records        ${MDBDB}                          ${MDBColl}    {"timestamp":2, "msg":"Hello 2"}
    #                      Log                         ${output}
    #                      Set Suite Variable          ${recordno2}                ${output}
    #                      ${output} =                 Save MongoDB Records        ${MDBDB}                          ${MDBColl}    {"timestamp":3, "msg":"Hello 3"}
    #                      Log                         ${output}
    #                      Set Suite Variable          ${recordno3}                ${output}
    #                      Comment                     Verify that the record count increased by the number of records saved above (3)
    #                      ${output} =                 Get MongoDB Collection Count          ${MDBDB}                ${MDBColl}
    #                      Should Be Equal             ${output}                   ${${CurCount} + 3}
    #                      Disconnect From MongoDB

    # Get MongoDB Collections
    #                      [Tags]                      regression
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      @{output}                   Get MongoDB Collections     foo
    #                      Comment                     Log as an array the returned list of collections
    #                      Log Many                    @{output}
    #                      Comment                     Log as a list the returned list of collections
    #                      Log                         ${output}
    #                      Comment                     Verify that known collection names are in the list returned
    #                      Should Contain              ${output}                   foo
    #                      Should Contain              ${output}                   system.indexes
    #                      Comment                     Disconnect from MongoDB Server
    #                      Disconnect From MongoDB

    # Validate MongoDB Collection
    #                      [Tags]                      regression
    #                      ${MDBDB} =                  Set Variable                foo
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      ${MDBColl} =                Set Variable                foo
    #                      Comment                     Validate a Collection
    #                      ${allResults} =             Validate MongoDB Collection           ${MDBDB}                ${MDBColl}
    #                      Log                         ${allResults}
    #                      ${MDBColl} =                Set Variable                system.indexes
    #                      Comment                     Validate a Collection
    #                      ${allResults} =             Validate MongoDB Collection           ${MDBDB}                ${MDBColl}
    #                      Log                         ${allResults}
    #                      Comment                     Disconnect from MongoDB Server
    #                      Disconnect From MongoDB

    # Get MongoDB Collection Count
    #                      [Tags]                      regression
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      ${output}                   Get MongoDB Collection Count          foo                     foo
    #                      Should Be Equal As Strings                              ${output}                         6
    #                      Comment                     Should Not Be Equal As Strings        ${output}               0
    #                      Comment                     Disconnect from MongoDB Server
    #                      Disconnect From MongoDB

    # Retrieve All MongoDB Records
    #                      [Tags]                      regression
    #                      ${myVar} =                  Set Variable                Blah, Foo, Bar, 4da8713952dfbd08ce000000
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      ${output}                   Retrieve All MongoDB Records          foo                     foo
    #                      Log                         ${output}
    #                      Log                         ${recordNo1}
    #                      Log                         ${recordNo2}
    #                      Log                         ${recordNo3}
    #                      Should Contain X Times      ${output}                   '${recordNo1}'                    1
    #                      Should Contain X Times      ${output}                   '${recordNo2}'                    1
    #                      Should Contain X Times      ${output}                   '${recordNo3}'                    1
    #                      Disconnect From MongoDB

    # Retrieve Some MongoDB Records
    #                      [Tags]                      regression
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      ${output}                   Retrieve Some MongoDB Records         foo                     foo    {"timestamp": {"$gte" : 2}}
    #                      Log                         ${output}
    #                      Should Not Contain          ${output}                   '${recordNo1}'                    1
    #                      Should Contain X Times      ${output}                   '${recordNo2}'                    1
    #                      Should Contain X Times      ${output}                   '${recordNo3}'                    1
    #                      Disconnect From MongoDB

    # Remove MongoDB Records By id
    #                      [Tags]                      regression
    #                      ${MDBDB} =                  Set Variable                foo
    #                      ${MDBColl} =                Set Variable                foo
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      Comment                     Verify that the record we want to remove exists.
    #                      ${output}                   Retrieve All MongoDB Records          ${MDBDB}                ${MDBColl}
    #                      Log                         ${output}
    #                      Should Contain              ${output}                   '${recordNo2}'
    #                      Comment                     Remove the record from MongoDB
    #                      ${output}                   Remove MongoDB Records      ${MDBDB}                          ${MDBColl}    {"_id": "${recordNo2}"}
    #                      Log                         ${output}
    #                      Comment                     Verify that the record was removed from the database.
    #                      ${output}                   Retrieve All MongoDB Records          ${MDBDB}                ${MDBColl}
    #                      Log                         ${output}
    #                      Should Not Contain          ${output}                   '${recordNo2}'
    #                      Comment                     Disconnect from MongoDB Server
    #                      Disconnect From MongoDB

    # Remove MongoDB Records
    #                      [Tags]                      regression
    #                      ${MDBDB} =                  Set Variable                foo
    #                      ${MDBColl} =                Set Variable                foo
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      Comment                     Verify that the record we want to remove exists.
    #                      ${output}                   Retrieve All MongoDB Records          ${MDBDB}                ${MDBColl}
    #                      Log                         ${output}
    #                      Should Contain              ${output}                   'timestamp', 1
    #                      Comment                     Remove the record from MongoDB
    #                      ${output}                   Remove MongoDB Records      ${MDBDB}                          ${MDBColl}    {"timestamp": {"$lt": 2}}
    #                      Log                         ${output}
    #                      Comment                     Verify that the record was removed from the database.
    #                      ${output}                   Retrieve All MongoDB Records          ${MDBDB}                ${MDBColl}
    #                      Log                         ${output}
    #                      Should Not Contain          ${output}                   'timestamp', 1
    #                      Comment                     Disconnect from MongoDB Server
    #                      Disconnect From MongoDB

    # Drop MongoDB Collection
    #                      [Tags]                      regression
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      Drop MongoDB Collection     FooBar                      OhYeah
    #                      @{output}                   Get MongoDB Collections     FooBar
    #                      Log Many                    @{output}
    #                      Should Not Contain          ${output}                   OhYeah
    #                      Comment                     Disconnect from MongoDB Server
    #                      Disconnect From MongoDB

    # Drop MongoDB Database
    #                      [Tags]                      regression
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      Comment                     Drop a Database if it exists
    #                      Drop MongoDB Database       FooBar
    #                      Comment                     Get a list of databases on MongoDB Server and verify that database was dropped
    #                      @{output} =                 Get MongoDB Databases
    #                      Should Not Contain          ${output}                   FooBar
    #                      Comment                     Disconnect from MongoDB Server
    #                      Disconnect From MongoDB

    # Test Suite Cleanup
    #                      [Tags]                      regression
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      Comment                     Drop a Database if it exists
    #                      Drop MongoDB Database       foo
    #                      Comment                     Get a list of databases on MongoDB Server and verify that database was dropped
    #                      @{output} =                 Get MongoDB Databases
    #                      Should Not Contain          ${output}                   foo
    #                      Comment                     Disconnect from MongoDB Server
    #                      Disconnect From MongoDB

    # Retrieve Mongodb Records With Desired Fields
    #                      [Tags]                      regression
    #                      Comment                     Connect to MongoDB Server
    #                      Connect To MongoDB          ${MDBHost}                  ${MDBPort}
    #                      Comment                     Set test data
    #                      ${MDBDB} =                  Set Variable                users
    #                      ${MDBColl} =                Set Variable                account
    #                      ${output} =                 Save MongoDB Records        ${MDBDB}                          ${MDBColl}    {"firstName": "Clark", "lastName": "Kent", "address": {"streetAddress": "21 2nd Street", "city": "Metropolis"}}
    #                      Comment                     Retrieve Mongodb Records With Desired Fields
    #                      ${fields} =                 Retrieve Mongodb Records With Desired Fields                  ${MDBDB}    ${MDBColl}    {}    address.city    ${false}
    #                      Log                         ${fields}
    #                      Should Contain              ${fields}                   city
    #                      Should Contain              ${fields}                   Metropolis

    # *** Settings ***
    # Library              RobotMongoDBLibrary.Insert
    # Library              RobotMongoDBLibrary.Update
    # Library              RobotMongoDBLibrary.Find
    # Library              RobotMongoDBLibrary.Delete


    # *** Variables ***
    # # CONNECT WITH PARAMS
    # # &{MONGODB_CONNECT_STRING}                      host=127.0.0.1              port=27017                        username=admin    password=password    database=robotdb    collection=customer

    # # CONNECT WITH CONNECTION STRING CLUSTER
    # &{MONGODB_CONNECT_STRING}=                       connection=mongodb://admin:password@127.0.0.1:27017,127.0.0.2:27017,127.0.0.3:27017/robotdb?authSource=robotdb    database=robotdb    collection=customer


    # *** Test Cases ***
    # Test insert data into mongodb
    #                      &{DATA}                     Create Dictionary           _id=X100001                       name=Tarathep    address=Thailand    phone=8888888888
    #                      ${MSG}                      InsertOne                   ${MONGODB_CONNECT_STRING}         ${DATA}
    #                      Should Be Equal             ${MSG}                      INSERTED SUCCESS


    # Test find by fillter data from mongodb
    #                      &{FILLTER}                  Create Dictionary           name=Tarathep                     address=Thailand
    #                      ${RESULTS}                  Find                        ${MONGODB_CONNECT_STRING}         ${FILLTER}
    #                      FOR                         ${RESULT}                   IN        @{RESULTS}
    #                      Log To Console              ${RESULT["phone"]}
    #                      END


    # Test update data phone into mongodb by ID
    #                      &{NEWDATA}                  Create Dictionary           phone=0649359xxx
    #                      ${MSG}                      Update                      ${MONGODB_CONNECT_STRING}         X100001    ${NEWDATA}
    #                      Should Be Equal             ${MSG}                      UPDATED SUCCESS


    # Test find data by ID from mongodb
    #                      ${RESULTS}                  FindOneByID                 ${MONGODB_CONNECT_STRING}         X100001
    #                      Log To Console              ${RESULTS}


    # Test delete data by ID into mongodb
    #                      ${MSG}                      DeleteOneByID               ${MONGODB_CONNECT_STRING}         X100001
    #                      Should Be Equal             ${MSG}                      DELETED SUCCESS