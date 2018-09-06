#!/bin/sh

input="";
while ! echo ${input} | egrep -qi "^(y|n|yes|no)$"; do
  echo -n "[y|n]: ";
  read input;
done

if echo ${input} | egrep -qi "y|yes"; then
  # return successfully
  exit 0;
fi

exit 1;
