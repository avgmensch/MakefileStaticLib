#!/bin/bash
MKFILEPATH="Makefile"
LOGPILEPATH="Makefile.log"
echo "[ $(date) ] make $@" >> $LOGPILEPATH;
make -f $MKFILEPATH $@ | tee -a $LOGPILEPATH;
echo "" >> $LOGPILEPATH;
if [ $? -eq 0 ]; then
    echo "Build succeeded. Log saved to $LOGPILEPATH"
else
    echo "Build failed. Check $LOGPILEPATH for details."
fi