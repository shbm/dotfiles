import subprocess

print """

A SHUBHAM SRIVASTAVA PRODUCTION
shbm09@gmail.com
MIT LICENSE

"""
print "git add -A"
subprocess.call(["git", "add", "-A"])
commit_message = raw_input("Enter the commit message\n")
commit_command = "git commit -m \"" + commit_message +"\"";
print commit_command
subprocess.call(["git", "commit", "-m", commit_message]);
