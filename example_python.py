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

print(get_lemma_of_word('ያብቃህ'))