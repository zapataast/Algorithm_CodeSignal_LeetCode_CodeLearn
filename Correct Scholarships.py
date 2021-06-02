def correctScholarships(bestStudents, scholarships, allStudents):
    return (len(set(scholarships) & set(allStudents)) is len(scholarships)) &\
    (len(set(scholarships) & set(bestStudents)) is len(bestStudents)) &\
    (len(bestStudents)!=len(allStudents)) &\
    (len(scholarships)!=len(allStudents)
     #bestStudents < scholarships < allStudents
