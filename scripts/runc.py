import subprocess
import sys

print """
||==========================================================||
||                                                          ||
||                                                          ||
||    A SHUBHAM SRIVASTAVA<shbm09@gmail.com> PRODUCTION     ||
||                                                          ||
||==========================================================||
"""

file_name = sys.argv[1]

command = "gcc " + file_name + " -o " + file_name + ".out";
subprocess.call(["gcc", file_name, "-o", file_name+".out"]);
print "------------------------------"
print "------------------------------"
print ""
subprocess.call(["./"+file_name+".out"]);
print """
------------------------------
"""
