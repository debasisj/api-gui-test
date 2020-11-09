# api-gui-test

This framework uses Karate DSL - https://github.com/intuit/karate

## Set up 

1. JDK 8 or up
2. Maven
3. Scala Plugin
4. Cucumber Plugin (not necessary if not writing new script)
5. Gherkin Plugin (not necessary if not writing new script)

After set up, clone the project to your local.

##To Run Functional Test

To run word comparision test use `mvn clean test -Dtest=PlatformTestRunner` in the root of the project. This will run all service tests.

At the end of the test a nice cucumber report will be generated which will be found target/generated-reports/*



