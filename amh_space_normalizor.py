import codecs
import os
import sys

''' Run the programm from a command line using *** python amh_space_normalizor.py file_name
'''

symbol = codecs.open('symbols','r','utf-8').read()




def write_to_file(cont,fname):
	outfile = codecs.open(fname, 'w', 'utf-8')
	outfile.write(cont)
   	outfile.close() 
   	print 'Normalized data written to %s ' % (fname)

def replace_sent_end(source_data):
	new_symb = symbol.splitlines()[1]
	source_data = source_data.replace(symbol.splitlines()[4],new_symb)
	source_data = source_data.replace(symbol.splitlines()[5],new_symb)
	return source_data

def read_cont(file_name):
	cont = codecs.open(file_name,'r','utf-8').read()
	return cont

def normalize(data):
	cont = ''

	for line in data.splitlines():
		for symb in symbol.splitlines():
			if symb in line:
				spaced = ' ' + symb + ' '
				line = line.replace(symb,spaced)
		cont += line + '\n'

	return cont	

if __name__ == '__main__':
	file_name = sys.argv[1]
	source_data = read_cont(file_name)
	print 'Source data read from %s for space normalization ' % (file_name)
	source_data = replace_sent_end(source_data)
	processed = normalize(source_data)
	print 'Space normalization completed '
	write_to_file(processed,file_name)
