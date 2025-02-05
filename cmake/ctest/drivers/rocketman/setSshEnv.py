#!/usr/bin/env python
from __future__ import print_function
import os
import pwd
import sys
# support major versions 2 and 3
if sys.version_info < (3,0):
  import commands as subp
else:
  import subprocess as subp
import re

#
# Utility to find out if you have an ssh-agent running that is holding your
# private key.  To use this in bash:
#
#     eval $(python ./setSetSshEnv.python)
#
# It assumes that ssh creates files of the form /tmp/ssh-Abcdefg12345/agent.12345 .
#
# Fingerprint of the ssh keypair that you will use.  This is the only line of this script that you need to modify.
# You can find the fingerprint with the command "ssh-keygen -lf /path/to/your/private/key/file".
# Important: You must delete the string after the fingerprint itself that contains the key filename and type.
keyFingerprint = "2048 SHA256:uYqtrZm1O3AaKp/+n9PNIvCAcn7No2RtuVZpchJT8nw .ssh/id_rsa_geminga (RSA)"

# socket query tool
socketCommand="/usr/sbin/ss"

shell = os.environ["SHELL"]
if shell == "/bin/bash" or shell == "/bin/sh":
   envCmd="export SSH_AUTH_SOCK="
elif shell == "/bin/tcsh" or shell == "/bin/csh":
   envCmd="setenv SSH_AUTH_SOCK "
else:
  print ("Only bash, csh, and tcsh are supported.")
  quit()

# Your username.
userid = pwd.getpwuid(os.getuid())[0]
[status,charlist]=subp.getstatusoutput(socketCommand + " -xl | grep -o '/tmp/ssh-[[:alnum:]]*/agent.[[:digit:]]*'")
# convert raw characters into list
agentList=[s.strip() for s in charlist.splitlines()]
agentFound=0
keyFound=0
myagent = ""
for agent in agentList:
  # See if this is your agent by checking ownership of root of lock directory
  # Check only the root, because if it's not yours, you can't see down into it.
  pieces=agent.split("/")
  rootDir = "/" + pieces[1] + "/" + pieces[2]
  # JJH: On redsky, the socket command returned nonexistent directories
  #      So I check for existence first to avoid an exception when calling os.stat
  #      on a nonexistent directory.
  if os.path.isdir(rootDir):
    st = os.stat(rootDir)
    dirOwner = pwd.getpwuid(st.st_uid).pw_name
    if dirOwner == userid:
      agentFound=1
      myagent = agent
      # Your ssh agent has been found
      sshAgentCmd="SSH_AUTH_SOCK=" + agent + " ssh-add -l"
      [status,result]=subp.getstatusoutput(sshAgentCmd)
      keyList=[s.strip() for s in result.splitlines()]

      # Check whether this key's fingerprint matches the desired key's
      for key in keyList:
        if keyFingerprint in key:
          keyFound=1
          print (envCmd + myagent)
          break

# If no key matches, just use the last owned agent found
if keyFound == 0 and agentFound == 1:
  #print ("export SSH_AUTH_SOCK=" + myagent)
  print (envCmd + myagent)
