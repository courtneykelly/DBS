import os

myresults = open('ns.csv','r')
answers = open('answers/db02/09.csv','r')

for line.rstrip() in myresults:
	if line not in answers:
		print line