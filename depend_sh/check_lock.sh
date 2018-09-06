#!/bin/sh

while ls *.lock >/dev/null 2>/dev/null; do
  # sleep till all the lock is release
  sleep 1;

done;
