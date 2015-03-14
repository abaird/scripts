#1/bin/bash

SESSIONNAME='';
if [ -z "$1" ]; 
  then 
    echo "session name is unset" ;
    SESSIONNAME=$0 
  else 
    echo "session name is '$1'";
    SESSIONNAME=$1 
fi


