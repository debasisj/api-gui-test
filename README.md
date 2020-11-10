# api-gui-test

This framework uses Karate DSL - https://github.com/intuit/karate

## Set up 

1. JDK 8 or up
2. Maven
3. Cucumber Plugin (not necessary if not writing new script)
4. Gherkin Plugin (not necessary if not writing new script)

After set up, clone the project to your local.  

### Key set up

These tests need weather api key which is private. For best practices, is to store them as an env variable key and get the value at the run time. 

### Local env set up 
Depending on your OS, follow the general instructions how to set them up and set as follows:

`weather_api_key:you_key`

## To Run Functional Test

To run word comparision test use `mvn clean test -Dtest=PlatformTestRunner` in the root of the project. This will run all service tests.

At the end of the test a nice cucumber report will be generated which will be found target/generated-reports/*

Open `cucumber-html-reports/overview-features.html` to see the overall results in a html format

## CICD - ON AWS CodeBuild

Service tests can run AWS Codebuild. 

`buildspec.yml` has been included for this purpose 

To run tests in CodeBuild :
1. Create a AWS Codebuild project 
2. Point the Codebuild project to GitHub Repo 
3. Create a trigger - either new commit or corn script to run in specific time. 
4. Crete AWS SSM Key `/weather/apikey` and store the key value - this will be used ny CodeBuild to get the env variable.

Now you can host a static s3 web site for the generated html report. Optionally you can serve it through AWS Cloudfront 

For above:
1. Create a s3 bucket 
2. Then follow the instruction here https://docs.aws.amazon.com/AmazonS3/latest/dev/EnableWebsiteHosting.html to enable it for static website hosting. 
3. Mention root page as `overview-features.html`
4. Now replace the name of S3 bucket name with newly created name in `buildspec.yml` - S3_BUCKET_STATIC_WEB=your.s3.bucketname.for.static.website.hosting
5. Buildspec post build commands will push the generated html filed and related resources to the S3 bucket which can be viewed as site.





