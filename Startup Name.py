def startupName(companies):
    cmp1 = set(companies[0])
    cmp2 = set(companies[1])
    cmp3 = set(companies[2])
    res = cmp3.difference(cmp1.intersection(cmp2).intersection(cmp3)) & cmp1.difference(cmp1.intersection(cmp2).intersection(cmp3)) | \
    cmp3.difference(cmp1.intersection(cmp2).intersection(cmp3)) & cmp2.difference(cmp1.intersection(cmp2).intersection(cmp3)) | \
    cmp1.difference(cmp1.intersection(cmp2).intersection(cmp3)) & cmp2.difference(cmp1.intersection(cmp2).intersection(cmp3))
    return sorted(list(res))
    #intersection - аль алинд нь байгаа утгуудыг ялгаж харуулна
    #difference - cmp1 - cmp2-ыг харьцуулаад cmp1-ын утгуудтай cmp2 таарч байвал хадгалж авна
