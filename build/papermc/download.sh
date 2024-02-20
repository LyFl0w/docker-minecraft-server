#!/bin/bash

LATEST_VERSION=$(curl -s https://api.papermc.io/v2/projects/paper | \
    jq -r '.versions[-1]')

LATEST_BUILD=$(curl -s https://api.papermc.io/v2/projects/paper/versions/${LATEST_VERSION}/builds | \
    jq -r '.builds | map(select(.channel == "default") | .build) | .[-1]')

JAR_NAME=paper-${LATEST_VERSION}-${LATEST_BUILD}.jar

PAPERMC_URL="https://api.papermc.io/v2/projects/paper/versions/${LATEST_VERSION}/builds/${LATEST_BUILD}/downloads/${JAR_NAME}"

# Remove oldest version of PaperMC
if ls *.jar 1> /dev/null 2>&1; then
    rm *.jar
fi


# Download the latest PaperMC version
curl -o paper-${LATEST_VERSION}.jar $PAPERMC_URL