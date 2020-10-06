# ryanairtest

## Running Tests

### Running tests via IDE
  - With the 'ryanairtest' code open all tests can be run via 'test_runner' in the folder 'RyanairAPI'. This will run the feature tests in the 'BookingController' and 'UserController' folders
  - The tests can also be run at the feature level via 'TestBookingController' within the 'BookingController' main folder and 'TestUserController' within the 'UserController' main folder
  - Tests can even be run at their feature folder levels by running the 'Runner' within each folder (e.g. 'ResponseBody > ResponseBodyRunner')
  
  ### Running tests via command line
  - Tests can be run from the terminal by navigating to the main 'ryanairtest' folder and running the command $ mvn test

## Reporting
- A link to the Karate test reports is provided when running from IDE and command line
- The test reports can also be found by navigating to correct folder > ryanairtest/target/surefire-reports/karate-summary.html
