
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
    $0 [--help] [--open] [--filename <path>]
where:
    -o, --open
        Open the coverage in your browser,
        Default is google-chrome you can change this in the function open_cov().
    -h, --help
        print this message
    -f <path>, --filename <path>
        Run a particular test file. For example:
            
            -f test/a_particular_test.dart
            
        Or you can run all tests in a directory
            -f test/some_directory/
"
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
    # google-chrome coverage/index-sort-l.html
    # Mozilla:
    firefox coverage/index-sort-l.html
}

while [ "$1" != "" ]; do
    case $1 in
        -h|--help)
            show_help
            exit
            ;;
        -o|--open)
            open_browser=1
            ;;
        -f|--filename)
            shift
            filename=$1
            ;;
        *)
            show_help
            exit
            ;;
    esac
    shift
done

run_tests
remove_from_coverage -f coverage/lcov.info -r '.g.dart$'
remove_from_coverage -f coverage/lcov.info -r '.freezed.dart$'
remove_from_coverage -f coverage/lcov.info -r '.config.dart$'
run_report
if [ "$open_browser" = "1" ]; then
    open_cov
fi