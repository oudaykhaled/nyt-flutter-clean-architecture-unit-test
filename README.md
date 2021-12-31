# Table of Content
- [News Reader](#news-reader)
    * [Requirements](#requirements)
    * [API Key](#api-key)
- [App Architecture](#app-architecture)
    * [Model/Entities](#model-entities)
    * [Data layer](#data-layer)
      * [Remote data source](#remote-data-source)
      * [Local data source](#local-data-source)
      * [Repository](#repository)
    * [Usecases/Interactors](#usecases-interactors)
    * [BLoC](#bloc)
      * [Bloc](#bloc)
      * [BlocBuilder](#blocbuilder)
      * [BlocProvider](#blocprovider)
- [Getting Started](#getting-started)
    * [Checkout the Code](#checkout-the-code)
    * [Major Libraries / Tools](#major-libraries---tools)
- [Setting up Prerequisites](#setting-up-prerequisites)
    * [Install LCOV](#install-lcov)
    * [Install scrcpy](#install-scrcpy)
    * [Generate files](#generate-files)
- [Running Quality Gates and Deployment Commands](#running-quality-gates-and-deployment-commands)
    * [Linting](#linting)
    * [Testing](#testing)
      * [Tests](#tests)
      * [Integration tests](#integration-tests)
        + [Running the Unit Tests](#running-the-unit-tests)
    * [Test Coverage](#test-coverage)
- [CI-CD - Build via Bitrise (yml file)](#ci-cd---build-via-bitrise--yml-file-)
    * [Building the application using Bitrise](#building-the-application-using-bitrise)
- [License](#license)

# News Reader
News Reader is simple flutter app to hit the NY Times Most Popular Articles API and show a list of articles, that shows details when items on the list are tapped (a typical master/detail app).

We'll be using the most viewed section of this API.

[http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?api-key=sample-key](http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?api-key=sample-key)
To test this API, you can use all-sections for the section path component in the URL above and 7 for period (available period values are 1, 7 and 30, which represents how far back, in days, the API returns results for).

[http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=sample-key](http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=sample-key)

![alt text](https://github.com/oudaykhaled/nyt-flutter-clean-architecture-unit-test/blob/master/readme_res/nyt-flutter-emulator.gif?raw=true)
## Requirements
- Android Studio
- Flutter SDK 2.8.1

## API Key

An API key is necessary to successfully connect to the [API](https://developer.nytimes.com/signup) that the app uses. Once an API key has been aquired, change the `API_KEY` property in `/nyt_flutter/lib/common/contant.dart` and run the app.

# App Architecture

This sample follows BLoC pattern + Clean Architecture.

## Model/Entities
The model is the domain object. It represents the actual data and/or information we are dealing with. An example of a model might be a contact (containing name, phone number, address, etc) or the characteristics of a live streaming publishing point.

The key to remember with the model is that it holds the information, but not behaviors or services that manipulate the information. It is not responsible for formatting text to look pretty on the screen, or fetching a list of items from a remote server (in fact, in that list, each item would most likely be a model of its own). Business logic is typically kept separate from the model, and encapsulated in other classes that act on the model.

## Data layer
Provides all required data to the repository in form of models/entities.
##### Remote data source
Manage all server/external API calls.
##### Local data source
Manage all local data storage: example SQLite implementation, Room, Realm...
##### Repository
The decision maker class when it comes to manage data CRUD operations. Operations can be done in this layer is caching mechanism, manage consecutive api calls etc...

## Usecases/Interactors
Represents concepts of the business, information about the current situation and business rules.

## BLoC
There are three primary gadgets in the BLoC library:
-   Bloc
-   BlocBuilder
-   BlocProvider
    You’ll require them to set up BLoCs, construct those BLoCs as indicated by the progressions in the app’s state, and set up conditions. How about we perceive how to execute every gadget and use it in your app’s business rationale.
##### Bloc
The Bloc gadget is the fundamental segment you’ll have to execute all business rationale. To utilize it, expand the Bloc class and supersede the mapEventToState and initialState techniques.
##### BlocBuilder
BlocBuilder is a gadget that reacts to new states by building BLoCs. This gadget can be called on numerous occasions and acts like a capacity that reacts to changes in the state by making gadgets that appear new UI components.
##### BlocProvider
This gadget fills in as a reliance infusion, which means it can give BLoCs to a few gadgets all at once that have a place with the equivalent subtree. BlocProvider is utilized to construct blocs that will be accessible for all gadgets in the subtree.

# Getting Started

This repository implements the following quality gates:

![Build Pipeline](/readme_res/bitrise.png "Build Pipeline")

- Static code checks: running [lint](https://pub.dev/packages/lint) to check the code for any issues.
- Unit testing: running the [unit tests](https://docs.flutter.dev/cookbook/testing/unit/introduction)
- Code coverage: generating code coverage reports using the [LCOV](https://github.com/linux-test-project/lcov)
- Integration testing: running the functional tests using [Flutter Integration Testing](https://docs.flutter.dev/cookbook/testing/integration/introduction)

These steps can be run manually or using a Continous Integration tool such as [Bitrise](https://app.bitrise.io/).

## Checkout the Code

Checkout and run the code
```bash
git clone https://github.com/oudaykhaled/nyt-flutter-clean-architecture-unit-test.git
```

## Major Libraries / Tools

| Category                        	| Library/Tool   	| Link                                                       	|
|---------------------------------	|----------------	|------------------------------------------------------------	|
| Development                     	| Flutter - Dart 	| https://flutter.dev/                       	|
| IDE 	| Android Studio         	| https://developer.android.com/studio               	|
| Unit Testing                    	| Flutter Unit Test          	| https://docs.flutter.dev/cookbook/testing/unit/introduction             	|
| Code Coverage                   	| LCOV         	| https://github.com/linux-test-project/lcov|
| Static Code Check               	| Lint for Dart/Flutter    	| https://pub.dev/packages/lint           	|
| Integration Testing              	| Flutter Integration Testing         	| https://docs.flutter.dev/cookbook/testing/integration/introduction                            	|
| CI/CD            	| Bitrise         | https://app.bitrise.io/                                          	|
| Dependency Injection  | injectable       | https://pub.dev/packages/injectable                                   	|
| Service Locator  | get_it       | https://pub.dev/packages/get_it                                   	|
| Presentation Layer Mangement  | flutter_bloc       | https://pub.dev/packages/flutter_bloc  |
| Network Layer Mangement  | retrofit       | https://pub.dev/packages/retrofit |
| Code Generator  | Freezed       | https://pub.dev/packages/freezed |
| HTTP Client  | Dio       | https://pub.dev/packages/dio|
| Image Caching  | cached_network_image       | https://pub.dev/packages/cached_network_image|
| Mock Library  | Mockito       | https://pub.dev/packages/mockito|

# Setting up Prerequisites
## Install LCOV
Run the following command in terminal `sudo apt-get install lcov`
## Install scrcpy
Run the following command in terminal `sudo apt install scrcpy`
## Generate files
Run the following command in terminal `flutter pub run build_runner watch --delete-conflicting-outputs`
# Running Quality Gates and Deployment Commands
## Linting

Run the following command in terminal `flutter analyze`
![alt text](https://github.com/oudaykhaled/nyt-flutter-clean-architecture-unit-test/blob/master/readme_res/lint.png?raw=true)
## Testing
Tests in Flutter are separated into 2 types:

##### Tests

Located at `/test` - These are tests that run on your machine. Use these tests to minimize execution time when your tests have no flutter framework dependencies or when you can mock the flutter framework dependencies.
![alt text](https://github.com/oudaykhaled/nyt-flutter-clean-architecture-unit-test/blob/master/readme_res/flutter_test.png?raw=true)
##### Integration tests

Located at `/integration_test` - These are tests that run on a hardware device or emulator. These tests have access to all flutter APIs, give you access to information such as the Context of the app you are testing, and let you control the app under test from your test code. Use these tests when writing integration and functional UI tests to automate user interaction, or when your tests have flutter dependencies that mock objects cannot satisfy.
![alt text](https://github.com/oudaykhaled/nyt-flutter-clean-architecture-unit-test/blob/master/readme_res/integration_test_article_list_screen.png?raw=true)
![alt text](https://github.com/oudaykhaled/nyt-flutter-clean-architecture-unit-test/blob/master/readme_res/integration_test_article_detail_screen.png?raw=true)
### Running the Unit Tests

Unit testing for Flutter applications is fully explained in the [Flutter documentation](https://docs.flutter.dev/cookbook/testing/unit/introduction). In this repository,
From Android Studio

* Right Clicking on the Class and select "Run <test class>
* To see the coverage we have t the select "Run <test class> with Coverage"

## Test Coverage

The test coverage uses the [LCOV](https://github.com/linux-test-project/lcov) library
In order to run both `test` and `integration_test` and generate a code coverage report, create a script file to do the job.
```
  
red=$(tput setaf 1)  
none=$(tput sgr0)  
filename=  
open_browser=  
  
show_help() {  
    printf "  
Script for running all unit and widget tests with code coverage.  
(run it from your root Flutter's project)  
*Important: requires lcov  
     Usage:   
 $0 [--help] [--open] [--filename <path>]where:  
 -o, --open Open the coverage in your browser, Default is google-chrome you can change this in the function open_cov(). -h, --help print this message -f <path>, --filename <path> Run a particular test file. For example:             -f test/a_particular_test.dart  
         Or you can run all tests in a directory  
 -f test/some_directory/"  
}  
  
run_tests() {  
    if [[ -f "pubspec.yaml" ]]; then  
  rm -f coverage/lcov.info  
        rm -f coverage/lcov-final.info  
        flutter test --coverage "$filename"  
  ch_dir  
  else  
  printf "\n${red}Error: this is not a Flutter project${none}\n"  
  exit 1  
  fi  
}  
  
run_report() {  
    if [[ -f "coverage/lcov.info" ]]; then  
  lcov -r coverage/lcov.info lib/resources/l10n/\* lib/\*/fake_\*.dart \  
             -o coverage/lcov-final.info  
        genhtml -o coverage coverage/lcov-final.info  
    else  
  printf "\n${red}Error: no coverage info was generated${none}\n"  
  exit 1  
  fi  
}  
  
ch_dir(){  
    dir=$(pwd)  
  input="$dir/coverage/lcov.info"  
  output="$dir/coverage/lcov_new.info"  
  echo "$input"  
  while read line  
    do  
  secondString="SF:$dir/"  
  echo "${line/SF:/$secondString}" >> $output  
    done < "$input"  
  
  mv $output $input  
}  
  
open_cov(){  
    # This depends on your system   
    # Google Chrome:  
 # google-chrome coverage/index-sort-l.html # Mozilla:  firefox coverage/index-sort-l.html  
}  
  
while [ "$1" != "" ]; do  
 case $1 in  
  -h|--help)  
            show_help  
 exit  ;;  
  -o|--open)  
            open_browser=1  
  ;;  
  -f|--filename)  
            shift  
  filename=$1  
            ;;  
  *)  
            show_help  
 exit  ;;  
 esac  shift  
done  
  
run_tests  
remove_from_coverage -f coverage/lcov.info -r '.g.dart$'  
remove_from_coverage -f coverage/lcov.info -r '.freezed.dart$'  
remove_from_coverage -f coverage/lcov.info -r '.config.dart$'  
run_report  
if [ "$open_browser" = "1" ]; then  
  open_cov  
fi
```
Below lines are added to ignore the generated files when generating the code coverage report:
```
remove_from_coverage -f coverage/lcov.info -r '.g.dart$'  
remove_from_coverage -f coverage/lcov.info -r '.freezed.dart$'  
remove_from_coverage -f coverage/lcov.info -r '.config.dart$' 
```
From the commandline

`sh test_with_coverage.sh`

Test coverage results are available at

`/coverage/index.html`
![alt text](https://github.com/oudaykhaled/nyt-flutter-clean-architecture-unit-test/blob/master/readme_res/code_coverage.png?raw=true)
# CI-CD - Build via Bitrise (yml file)

This repo contains a [bitrise](./bitrise.yml), which is used to define a Bitrise **declarative pipeline** for CI-CD to build the code, run the quality gates, code coverage, static analysis and deploy to Bitrise.

Here is the structure of the bitrise declarative pipeline:

```
---  
format_version: '11'  
default_step_lib_source: 'https://github.com/bitrise-io/bitrise-steplib.git'  
project_type: flutter  
trigger_map:  
- push_branch: '*'  
  workflow: primary  
- pull_request_source_branch: '*'  
  workflow: primary  
workflows:  
  deploy:  
    steps:  
    - activate-ssh-key@4:  
        run_if: '{{getenv "SSH_RSA_PRIVATE_KEY" | ne ""}}'  
  - git-clone@6: {}  
    - script@1:  
        title: Do anything with Script step  
    - certificate-and-profile-installer@1: {}  
    - flutter-installer@0:  
        inputs:  
        - is_update: 'false'  
  - cache-pull@2: {}  
    - flutter-analyze@0:  
        inputs:  
        - project_location: $BITRISE_FLUTTER_PROJECT_LOCATION  
    - flutter-test@1:  
        inputs:  
        - project_location: $BITRISE_FLUTTER_PROJECT_LOCATION  
    - flutter-build@0:  
        inputs:  
        - project_location: $BITRISE_FLUTTER_PROJECT_LOCATION  
        - platform: both  
    - xcode-archive@4:  
        inputs:  
        - project_path: $BITRISE_PROJECT_PATH  
        - scheme: $BITRISE_SCHEME  
        - distribution_method: $BITRISE_DISTRIBUTION_METHOD  
        - configuration: Release  
    - deploy-to-bitrise-io@2: {}  
    - cache-push@2: {}  
  primary:  
    steps:  
    - activate-ssh-key@4:  
        run_if: '{{getenv "SSH_RSA_PRIVATE_KEY" | ne ""}}'  
  - git-clone@6: {}  
    - script@1:  
        title: Do anything with Script step  
    - flutter-installer@0:  
        inputs:  
        - is_update: 'false'  
  - cache-pull@2: {}  
    - flutter-analyze@0.3:  
        inputs:  
        - project_location: $BITRISE_FLUTTER_PROJECT_LOCATION  
    - flutter-test@1:  
        inputs:  
        - project_location: $BITRISE_FLUTTER_PROJECT_LOCATION  
    - deploy-to-bitrise-io@2: {}  
    - cache-push@2: {}  
meta:  
  bitrise.io:  
    stack: linux-docker-android-20.04  
    machine_type_id: elite  
app:  
  envs:  
  - opts:  
      is_expand: false  
    BITRISE_FLUTTER_PROJECT_LOCATION: .  
  - opts:  
      is_expand: false  
    BITRISE_PROJECT_PATH: .  
  - opts:  
      is_expand: false  
    BITRISE_SCHEME: .  
  - opts:  
      is_expand: false  
    BITRISE_DISTRIBUTION_METHOD: development
```

Below is an illustration of the pipeline that Bitrise will execute

![alt text](https://github.com/oudaykhaled/nyt-flutter-clean-architecture-unit-test/blob/master/readme_res/bitrise-workflows.png?raw=true)
## Building the application using Bitrise

These steps should be followed to automated the app build using Bitrise:

- Create an account on Bitrise.
- Follow the wizard for creating a Flutter project on Bitrise.
- In `workflows` tab, and select `<>bitrise.yaml` tab.
- Choose `Store in app repository` to read the repository yaml file.

#### This repository already attached to a [public bitrise project](https://app.bitrise.io/app/1ba1887b850ddd8a#).

# License

Apache License, Version 2.0

http://www.apache.org/licenses/LICENSE-2.0
