import codecs
import sys
''' Run the programm from a command line using *** python stat_f.py file_name
'''

def longer_than(data):
	longer_counter = 0
	for line in data.splitlines():
		if len(line.split()) > 80:
			longer_counter += 1
	return longer_counter

def count_sent(data):
	if data.splitlines()[len(data.splitlines())-1] == '':
		return len(data.splitlines())-1
	else :
		return len(data.splitlines())

def count_token(data):
	return len(data.split()) 


def count_word_type(data):
	return len(set(data.split()))


def get_longest_sent(data):
	largest = 0
	for line in data.splitlines():
		if len(line.split()) > largest:
			largest = len(line.split())
	return largest


def get_shortest_sent(data):
	shortest = 100
	for line in data.splitlines():
		if len(line.split()) < shortest:
			shortest = len(line.split())
	return shortest

def get_average(cont):
	avg = 0
	total_length = len(cont.splitlines())
	for line in cont.splitlines():
		avg += len(line.split())
	return int((avg/total_length))


def write_log(fname,cont):
	print cont
	outfile = codecs.open(fname, 'w', 'utf-8')
	outfile.write(cont)
   	outfile.close() 
   	print '	Data written to %s ' % (fname)


if __name__ == '__main__':
	file_name = sys.argv[1]
	fdata = codecs.open(file_name,'r','utf-8')
   	cont = fdata.read()
	fdata.close()
	log_data = '***Processed file ' + file_name + '\n'
	sent_count = count_sent(cont)
	log_data += '	*** Number of Sentence *** ' + str(sent_count) + '\n'
	token_count = count_token(cont)
	log_data += '	*** Number of Token *** ' + str(token_count) + '\n'
	word_type_count = count_word_type(cont)
	log_data += '	*** Number of word type ' + str(word_type_count) + '\n'
	longest = get_longest_sent(cont)
	log_data += '	*** Length of longest Sentence *** ' + str(longest) + '\n'
	shortest = get_shortest_sent(cont)
	log_data += '	*** Length of shortest Sentence *** ' + str(shortest) + '\n'
	average_length = get_average(cont)
	log_data += '	*** Average Sentence length *** ' + str(average_length) + '\n'
	longer_sent = longer_than(cont)
	log_data += '	*** Sentence longer than 80 *** ' + str(longer_sent) + '\n'
	log_file_name = 'stat_log_' + file_name
	write_log(log_file_name,log_data)
