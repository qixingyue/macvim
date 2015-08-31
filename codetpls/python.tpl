#!/usr/bin/env python
#coding=utf-8

import sys

def simpleTest():
  print "\033[5;32;40"
  print "Hello this is a simple test ."
  print "\033[0m"

if __name__ == "__main__":
  argc = len(sys.argv)
  simpleTest()
