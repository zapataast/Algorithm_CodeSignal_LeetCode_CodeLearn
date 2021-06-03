def wordsRecognition(word1, word2):
    def getIdentifier(w1, w2):
        return ''.join(map(str,(sorted(list((set(w1).intersection(set(w2))).symmetric_difference(set(w1)))))))
        #sorted(a_list, key=str.lower) -  lexicographically sort
        #''.join(map(str,s)) - list to string
    return [getIdentifier(word1, word2), getIdentifier(word2, word1)]
