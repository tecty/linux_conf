#!/bin/sh
# the promt for checking whether you are student in cse
echo "";
echo -n "Are you CSE student in UNSW? ";
if ./input_sh/yes_or_no.sh ; then
  # grap the zid from user
  echo -n "What's your zid? : ";
  read zid;

  # append the cse alias
  echo "alias cse=\"ssh ${zid}@cse.unsw.edu.au\"" >> conf/linux_conf.zsh
  echo "alias cseFtp=\"sftp ${zid}@cse.unsw.edu.au\"" >> conf/linux_conf.zsh

  # promt the user to with some help info
  echo "You can access the cse with \"$ cse\" "\
    "and \"$ cseFtp\" to cse's ftp server"

  if ls ~/.ssh/id_rsa.pub >/dev/null 2>/dev/null ; then
    # user has already agree to have ssh key, then copy ssh key to cse
    echo ""
    echo "Login To CSE Here, then you will be authenticate by SSH key"
    ssh-copy-id ${zid}@cse.unsw.edu.au ;
  fi;

fi
