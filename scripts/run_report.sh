#!/usr/bin/env bash

# WIP Run this script to generate cves and sbom reports

# Parse cmd arguments

CONTEXT="./docker/code-server-base/"
SRC_BRANCH="master"
DEPLOY_BRANCH="reports"

USAGE_MSG="usage: deploy [-h|--help] [-c|--context CONTEXT] [-s|--src SRC_BRANCH] [-d|--deploy DEPLOY_BRANCH] [--verbose] [--no-push]"

while [[ $# > 0 ]]; do
    key="$1"

    case $key in
        -h|--help)
        echo $USAGE_MSG
        exit 0
        ;;
        -u|--user)
        SRC_BRANCH="source"
        DEPLOY_BRANCH="master"
        ;;
        -s|--src)
        SRC_BRANCH="$2"
        shift
        ;;
        -d|--deploy)
        DEPLOY_BRANCH="$2"
        shift
        ;;
        --verbose)
        set -x
        ;;
        --no-push)
        NO_PUSH="--no-push"
        ;;
        *)
        echo "Option $1 is unknown." >&2
        echo $USAGE_MSG >&2
        exit 1
        ;;
    esac
    shift
done

# grab src branch
# do I need to check if docker is installed?
# cd to context directory
# run build 
# make sure docker scout is isntalled
# docker scout cves --output ./reports/
# docker scout sbom --list --output ./reports/
