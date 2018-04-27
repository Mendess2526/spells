#!/bin/bash

tex="Report.tex"
time=30
skip=false
usage="Usage:\n    -h Displays this message\n    -f <file> Specify the .tex file (Default: Report.tex)\n    -t <number> Specify the delay between builds (Default: 30s)"
for op in "$@";
do
    if $skip; then skip=false;continue;fi
    case "$op" in
        -h|--help)
            echo -e $usage
            exit 0
            ;;
        -f|--file)
            shift
            if [[ "$1" != "" ]];
            then
                tex="$1"
                skip=true
            else
                echo "E: Arg missing for ""$op"" option"
                exit 1
            fi
            ;;
        -t|--time)
            shift
            if [[ "$1" != "" ]];
            then
                time="$1"
                skip=true
            else
                echo "E: Arg missing for ""$op"" option"
                exit 1
            fi
            ;;
        -*)
            echo -e $usage
            exit 1
            ;;
    esac
    shift
done

while true;
do
    rm -rf $(find ./* | grep -v '.tex')
    clear;
    buildStr="\033[34m Building "$tex"...\033[0m"
    echo -ne $buildStr
    pdflatex --halt-on-error --shell-escape $tex > /dev/null
    built=$?
    for (( i=${#buildStr}; i>0;i--)) do echo -ne "\b"; done;
    if [ $built -eq 0 ]
    then
        echo -e "\033[32m "$tex" built without errors!\033[0m"
    else
        echo -e "\033[31m Couldn't build "$tex". Check your tex!\033[0m"
    fi;
    echo -en "\033[33m Rebuilding in: \033[0m"
    for (( i=$time; i>0;i--))
    do
        if [ $i -lt 10 ]
        then
            echo -n "0"
        fi;
        echo -n $i"  "
        sleep 1s
        echo -en "\b\b\b\b"
    done;
done;
