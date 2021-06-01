def chessTeams(smarties, cleveries):
    return [ (smarties[i]+' '+cleveries[i]).split(' ') for i in range(0,len(cleveries))]
