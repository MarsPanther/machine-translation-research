import sys
filename  = sys.argv[1]
feature  = sys.argv[2]
if feature == 'surface':
    get_feature = 0
elif feature == 'lemma':
    get_feature = 1
else:
    get_feature = 2

without_extension = filename.split('.')
file_address = filename.split('/')
directory = file_address[:-1]
directory_address = '/'.join('{}'.format(x) for x in directory) + '/'
corpus = [line.rstrip('\n') for line in open(filename)]
new_tags_only = open(without_extension[0] + '_' + feature + '.' + without_extension[1], 'a+')
count = 1
for each in corpus:
    print(each)
    new_tags_only.write(' '.join('{}'.format(x.split('|')[get_feature]) for x in each.split()))
    new_tags_only.write('\n')
    print(count)
    count += 1
print(without_extension[1] + feature +  " extracting finished")
new_tags_only.close()
