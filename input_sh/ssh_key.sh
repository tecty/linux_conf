#!/bin/sh

if ! ls ~/.ssh/id_rsa.pub 1>&2 2>/dev/null ; then
  # user doesn't have ssh key
  echo "We detect you doesn't have a ssh key,";
  echo "A SSH key can protect your password when you login via SSH or sftp";
  echo "";
  echo -n "Do you want to have a SSH Key? ";
  if ./input_sh/yes_or_no.sh ; then
    # gennerate ssh key for customer
    ssh-keygen -q
  fi

fi
