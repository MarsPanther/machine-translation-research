import codecs
import os
import sys

''' Run the programm from a command line using *** python amh_char_remover.py file_name
'''

symbol = codecs.open('remove_symbols','r','utf-8').read()


def write_to_file(cont,fname):
	outfile = codecs.open(fname, 'w', 'utf-8')
	outfile.write(cont)
   	outfile.close() 
   	print 'Cleaned data written to %s ' % (fname)

def read_cont(file_name):
	cont = codecs.open(file_name,'r','utf-8').read()
	return cont

def remove(data):
	cont = ''
	for line in data.splitlines():
		for symb in symbol.splitlines():
			if symb in line:
				line = line.replace(symb,' ')
		cont += line + '\n'
	return cont	

if __name__ == '__main__':
	file_name = sys.argv[1]
	source_data = read_cont(file_name)
	print 'Source data read from %s to remove characters ' % (file_name)
	processed = remove(source_data)
	print 'data cleaned '
	write_to_file(processed,file_name)
