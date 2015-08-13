#! /usr/bin/env python
#coding=utf-8

import os,sys,re,traceback,json
from string import Template

tplDir = "/Users/xingyue/.vim/codetpls/"

def readFile(fname):
	fp = open(fname,"r")
	str = fp.read()
	fp.close()
	return str

def jsonObj(jsonFile):
	jsonContent = readFile(jsonFile)
	try:
		robj = json.loads(jsonContent,strict = False)
		return robj
	except:
		return {} 

def renderJson(tplContent,jsonObj):
	return tplContent % jsonObj

def simpleReplace(content):
	m = re.compile("\$([a-zA-Z]+)(\s?)")
	return re.sub(m,"%(\\1)s\\2",content)

def isFileEmpty(fileName):
	f = open(fileName,"r")
	c = f.read()
	return "" == c.strip()

def bornOneCodeFile(tplName,jsonFileName,aimFile):
	configFile = tplDir + sys.argv[1] + "_config.tpl"
	if isFileEmpty(jsonFileName) and os.path.exists(configFile):
		configContent = readFile(configFile)
		f = open(aimFile,"w")
		f.writelines(configContent)
		f.close()
	else :
		tplContent = readFile(tplName)
		robj = jsonObj(jsonFileName)
		tplPre = simpleReplace(tplContent)
		realContent = renderJson(tplPre,robj)
		f = open(aimFile,"w")
		f.writelines(realContent)
		f.close()

def bornTest():
	bornOneCodeFile('class.tpl','replace.json',"class.c")

if(__name__ == "__main__"):
	print sys.argv
	tplName = sys.argv[1]
	tplFilePath = tplDir + tplName + ".tpl"
	jsonFileName = sys.argv[2]
	aimFile = sys.argv[2]
	bornOneCodeFile(tplFilePath,jsonFileName,jsonFileName)

