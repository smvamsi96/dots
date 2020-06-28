import json                     # for loading the word_list
import re

file_name = "./words_dictionary.json"

words = []                      # a container for all the words

with open(file_name) as f:
    words = json.load(f)

num = str(input('Enter A Number:' ))                          # for containing the seed number for words

translation_map = {             # translates numbers to letters
    '0': ['r'],
    '1': ['t', 'd'],
    '2': ['n'],
    '3': ['m'],
    '4': ['q', 'c', 'k'],
    '5': ['l'],
    '6': ['s', 'z'],
    '7': ['f'],
    '8': ['g', 'j'],
    '9': ['b', 'p', 'v', 'w'],
}                               # x, y are wild characters...

conversion_list = []            # aids in creating the final_pattern

i = 0
while i < len(num):
    conversion_list.append('[')
    conversion_list[i] += ''.join(translation_map[str(num[i])])
    conversion_list[i] += ']'
    i += 1

pattern = '^'                   # holds the final pattern
for s in conversion_list:
    pattern += '[aeiouxy]*'
    pattern += s

pattern += '[aeiouxy]*$'

counter = 0

for word in words:
    isMatch = re.search(pattern, word)  # return a boolean if it's a match
    if isMatch:
        print(word)
        counter += 1

s = str(counter)
s += ' Matches Found'
print(s)
