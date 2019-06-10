#/bin/bash -x
LOGFILE=`date +%Y-%m-%d-%H-%M`_verify.log
ROOT_DIR=`pwd`
rm -f $LOGFILE
touch $LOGFILE

for FILE in $(seq 1 $1); do
  if [ -f "$FILE.f95" ]; then
    echo "$FILE.f95" | tee -a $LOGFILE
    bash $ROOT_DIR/verifySingpleFile.sh $FILE.f95 2>&1 | tee -a $LOGFILE
    echo "*******************" >> $LOGFILE
  fi
done
