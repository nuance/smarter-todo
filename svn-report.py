#!/usr/bin/python

import time
import os
import re
import todo

def findCurrentRevision():
    revision = 0
    
    info = os.popen("svn info")
    
    revisionre = re.compile("Revision: ([0-9]+)")
    for line in info:
        line.rstrip()
        match = revisionre.match (line)
        print line
        
        if match:
#            print "Line: %s Revision: %d" % (line, int(match.group(1)))
            revision = int(match.group(1))
    
    info.close()    
    
    return revision
    
def updateToRevision(revision):
    print "svn up -r %d" % revision
    os.popen("svn up -r %d" % revision)
        
def getDate():
#    print "revision: %d" % findCurrentRevision()
    datere = re.compile(".*Date[^0-9]*([0-9]{4}.*) -[0-9]*.*")
    date = None
    
    info = os.popen("svn info")
    for line in info:
        line.rstrip()
        match = datere.match(line)
        if match:
#            print "Date: \"%s\"" % match.group(1)
            date = time.strptime(match.group(1), "%Y-%m-%d %H:%M:%S")
#            print "Date: %s" % time.strftime("%Y-%m-%d", date)
#            print "Time: %s" % time.strftime("%H:%M:%S", date)
    
    info.close()
    
    return date

if __name__ == "__main__":
    # find the current revision
    head = findCurrentRevision()
    
    todo.setDirs("/Users/matt/todo/")
    todo.REPORT_FILE = "/Users/matt/todo/report-generated.txt"
    
    # start at revision 0, work your way up
    for revision in xrange(239, head):
        updateToRevision(revision)
        date = getDate()
        todo.report(time.strftime("%Y-%m-%d-%T", date))