import sys
from nltk.corpus.reader import TaggedCorpusReader
from nltk.tokenize import LineTokenizer
filename  = sys.argv[1]
without_extension = filename.split('.')
file_address = filename.split('/')
directory = file_address[:-1]
directory_address = '/'.join('{}'.format(x) for x in directory) + '/'
corpus_reader = TaggedCorpusReader(directory_address,[filename], sent_tokenizer=LineTokenizer(), sep='|')
corpus = corpus_reader.tagged_sents()
new_words_only = open(without_extension[0] + '_surface.' + without_extension[2],'a+')
count = 1
for each_list in corpus:
    print(count)
    for a in each_list:
        print(a[0].split('|')[0])
        new_words_only.write(a[0].split('|')[0] + " ")
    new_words_only.write('\n')
    count += 1
print(without_extension[1] + "Tag extracting finished")
new_words_only.close()