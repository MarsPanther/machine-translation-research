import codecs
import sys


def write_to_file(cont, fname):
    outfile = codecs.open(fname, 'w', 'utf-8')
    outfile.write(cont)
    outfile.close()
    print('Combined data written to %s ' % (fname))


def merge(file1, file2):
    mer_cont = ''
    for line in file1.splitlines():
        if line != '':
            mer_cont += line + '\n'
    for line in file2.splitlines():
        if line != '':
            mer_cont += line + '\n'
    return mer_cont


if __name__ == '__main__':
    file1 = sys.argv[1]
    file2 = sys.argv[2]
    file_combined = sys.argv[3]
    file1_cont = codecs.open(file1, 'r', 'utf-8').read()
    file2_cont = codecs.open(file2, 'r', 'utf-8').read()
    mer_cont = merge(file1_cont, file2_cont)
    write_to_file(mer_cont, file_combined)
