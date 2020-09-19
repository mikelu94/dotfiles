#!/bin/bash

git pull origin master
for configFile in .*; do
    if [ -f $configFile ]; then
        if [ `find ~ -maxdepth 1 -name $configFile -type d | wc -l` -eq 0 ]; then
            echo "$configFile exists in ~."
            diff $configFile ~/$configFile &> /dev/null
            if [ $? -ne 0 ]; then
                cp $configFile ~/$configFile
                echo "$configfile has been updated."
            else
                echo "$configFile is update-to-date."
            fi
        else
            echo "$configFile does not exist in ~."
            cp $configFile ~/$configFile
        fi
    fi
done
