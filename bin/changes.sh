#!/bin/bash
numChanges=0

for configFile in .*
do
    if [ -f $configFile ]
    then
        if [ `find ~ -maxdepth 1 -name $configFile -type d | wc -l` -eq 0 ]
        then
            diff $configFile ~/$configFile &> /dev/null
            if [ $? -ne 0 ]
            then
                cp ~/$configFile $configFile
                echo "$configFile has been changed."
                numChanges=$(( $numChanges+1 ))
            else
                echo "$configFile is unchanged."
            fi
        fi
    fi
done

if [ $numChanges -ne 0 ]
then
    echo -n "Input Commit Message (or press Ctrl-C to cancel): "
    read commitmsg
    if [ $? -ne 0 ]
    then
        git commit -am "$commitmsg"
        git push origin master
    fi
fi
