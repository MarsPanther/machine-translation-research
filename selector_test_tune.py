"""randomly select taring , test and tuning data
"""

import codecs 
import random
import sys


k=0.2 #sample value 10%
lg1 = '.'+sys.argv[1] # language 1 extension
lg2 = '.'+sys.argv[2] # language 2 extension

# function to count the total line and compute number of required sample
def line_count(lang1,lang2):
    print('counting total line...')
    with open(lang1, 'r') as f:
            lc = sum(1 for line in f)
            print('computing number of sample')
            key = lc * k
            key = int(key)
            print("total sentence =" + str(lc))
            print(str(k) + "%  of sample=" + str(key))
    rand_generate(lc,key,lang1,lang2)

# function to generate random numbers in a range of accepted val
def rand_generate(lc,key,lang1,lang2):
    print('selecting'+str(key)+'number of random lines')
    my_rand = []
    for k in range(0,key):
        while len(my_rand) != key:
            ind = random.randint(0, lc)
            if ind not in my_rand:
                my_rand.append(ind)
    spliter(my_rand,lang1,lang2)

# function to devide the random generated val to two ( test and tune)
def spliter(my_rand,lang1,lang2):
    print('split roundom selected lines for test and tuning')
    test = []
    tune = []
    val = len(my_rand) / 2
    val = int(val)
    for v in my_rand:
        if len(test) !=val:
            test.append(v)
        else:
            tune.append(v)
    test_selector_lang1(test,lang1)
    test_selector_lang2(test, lang2)
    tune_selector_lang1(tune,lang1)
    tune_selector_lang2(tune, lang2)
    train_selector_lang1(my_rand,lang1)
    train_selector_lang2(my_rand,lang2)
    # lang1_reptition_checker()
    # lang2_reptition_checker()

# select test for language 1 data
def test_selector_lang1(test,lang1):
    print('writing'+lg1+' test sentences')
    testd  = open('test'+lg1, 'a', encoding='utf8')
    with open(lang1, 'r') as f:
            for n, line in enumerate(f):
                for c in test:
                    if n == c :
                        testd.writelines(line)

# select test for language 2 data
def test_selector_lang2(test, lang2):
    print('writing'+lg2+' test sentences')
    testd  = open('test'+lg2, 'a', encoding='utf8')
    with open(lang2, 'r') as f:
            for n, line in enumerate(f):
                for c in test:
                    if n == c :
                        testd.writelines(line)

# select tune for language 1 data
def tune_selector_lang1(tune,lang1):
    print('writing'+lg1+' tune sentences')
    tuned = open('tune'+lg1, 'a', encoding='utf8')
    with open(lang1, 'r') as f:
        for n, line in enumerate(f):
            for c in tune:
                if n == c:
                    tuned.writelines(line)

# select tune for language 2 data
def tune_selector_lang2(tune, lang2):
    print('writing'+lg2+' tune sentences')
    tuned = open('tune'+lg2, 'a', encoding='utf8')
    with open(lang2, 'r') as f:
        for n, line in enumerate(f):
            for c in tune:
                if n == c:
                    tuned.writelines(line)

# select train for language 1 data
def train_selector_lang1(my_rand,lang1):
    print('writing'+lg1+' train sentences')
    traind = open('train'+lg1, 'a', encoding='utf8')
    with open(lang1, 'r') as f:
        for n, line in enumerate(f):
            if n not in my_rand:
                traind.writelines(line)

# select train for language 2 data
def train_selector_lang2(my_rand,lang2):
    print('writing'+lg2+' train sentences')
    traind = open('train'+lg2, 'a', encoding='utf8')
    with open(lang2, 'r') as f:
        for n, line in enumerate(f):
            if n not in my_rand:
                traind.writelines(line)

def lang1_reptition_checker():
    print('================'+lg1+'===================')
    print('check for repted sentence .... ')
    cc = []
    train_lg1 = codecs.open('train'+lg1,'r','utf-8').read()
    test_lg1 = codecs.open('test'+lg1,'r','utf-8').read()
    tune_lg1 = codecs.open('tune'+lg1,'r','utf-8').read()
    
    lg_overlap_count = 0
    for line in train_lg1.splitlines():
        if line in test_lg1.splitlines() or line in tune_lg1.splitlines():
            lg_overlap_count += 1
    print('overlap count for lang 1 is '+str(lg_overlap_count))

def lang2_reptition_checker():
    print('================'+lg2+'===================')
    print('check for repted sentence .... ')
    train_lg2 = codecs.open('train'+lg2,'r','utf-8').read()
    test_lg2 = codecs.open('test'+lg2,'r','utf-8').read()
    tune_lg2 = codecs.open('tune'+lg2,'r','utf-8').read()
    
    lg_overlap_count = 0
    for line in train_lg2.splitlines():
        if line in test_lg2.splitlines() or line in tune_lg2.splitlines():
            lg_overlap_count += 1
    print('overlap count for lang 2 is '+str(lg_overlap_count))




if __name__ == '__main__':

    lang1 = sys.argv[1]+ '.txt'
    lang2 = sys.argv[2]+ '.txt'
    line_count(lang1,lang2)

# file_name = sys.argv[1] import sys
