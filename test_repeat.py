import codecs
import sys

file_ = 'u_p_eng_ea.txt'

def check_repeate(data):
	repeated = 0
	# for line in data.splitlines():
	# 	if (data.splitlines()).count(line) > 1:
	# 		print 'Repeatiton '
	# 		print line
	# 		repeated += 1
	print '%d sentence repeated ' % (len(data.splitlines()) - len(set(data.splitlines())))
	
if __name__ == '__main__':
	data = codecs.open(file_,'r','utf-8').read()
	check_repeate(data)
