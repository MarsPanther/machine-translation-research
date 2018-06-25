import codecs
import os
import sys
reload(sys)
sys.setdefaultencoding('utf8')

''' Run the programm from a command line using *** python amh_char_normalizor.py file_name
'''

maper_data = codecs.open('amh_norm_map','r','utf-8').read()

maper_dic = {}

def read_cont(file_name):
	cont = codecs.open(file_name,'r','utf-8').read()
	return cont

def write_to_file(cont,fname):
	outfile = codecs.open(fname, 'w', 'utf-8')
	outfile.write(cont)
   	outfile.close() 
   	print 'Normalized data written to %s ' % (fname)

def mapper(maper_data):
	for line in maper_data.split("\n"):
	    (i,j) = line.split()
	    maper_dic[i] = j    
	return maper_dic

def char_normalize(data):
	for k,v in maper_dic.items():
		data = data.replace(k,v)
	return data	

if __name__ == '__main__':
	file_name = sys.argv[1]
	maper_dic = mapper(maper_data)
	source_data = read_cont(file_name)
	print 'Source data read from %s for character normalization ' % (file_name)
	processed = char_normalize(source_data)
	print ' character normalization completed '
	write_to_file(processed,file_name)

