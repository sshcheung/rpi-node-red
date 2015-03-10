#!/bin/bash

cd ${NODERED_USERDIR}

if [ -f "package.json" ]
then
    npm install
fi

node-red-pi -u ${NODERED_USERDIR} --max-old-space-size=128
