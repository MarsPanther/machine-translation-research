import pickle
import sys
from nltk.tokenize import LineTokenizer

def read_data(file_name):
    word_lists = []
    with open(file_name, 'r') as f:
        for line in f:
            word_lists.append(line.strip())
    return word_lists
    
def word_lemma_list():
    word_list = read_data('/home/tsegaye/Desktop/data/scripts/word_stem_list.txt')
    word_lema_list = {}
    for each_word in word_list:
        word = each_word.split('\t')[0].split(': ')[1]
        citation_or_steam = each_word.split('\t')[1].split(': ')[1]
        word_lema_list[word] = citation_or_steam
    return word_lema_list


def get_lemma_of_word(word):
    dic = word_lemma_list()
    if word in dic:
        return dic[word]
    else:
        return word

file_name = sys.argv[1]
filename_and_extension = file_name.split('.')
without_extension = filename_and_extension[0]+"."+filename_and_extension[1]+"_tagged."+filename_and_extension[2]
count = 1
data = open(file_name, 'r').read()
list_of_data = LineTokenizer(blanklines='keep').tokenize(data)
sample_sentences = list_of_data[:]
tagged_corpus = open(without_extension, "a+")
tagger = pickle.load(open('/home/tsegaye/PycharmProjects/POS 2018/models/naive-cutoff.pkl', 'rb'))
for each_item in sample_sentences:
    tagged_sentence = tagger.tag(each_item.split())
    tagged_corpus.write(' '.join('{}|{}|{}'.format(x[0],get_lemma_of_word(x[0]), x[1]) for x in tagged_sentence))
    tagged_corpus.write('\n')
    print(count)
    count += 1
print('tagging words finished')
tagged_corpus.close()