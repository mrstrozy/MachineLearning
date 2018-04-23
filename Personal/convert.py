#!/usr/bin/env python3

import sys


class Entry:

    def __init__(self, month, presyear, spread, ans):
        #
        # For ANS:
        #   0 - BUY PUT
        #   1 - BUY CALL
        #
        #
        # For Month:
        #   0 - Jan
        #   11 - Dec
        #
        # For Year:
        #
        #   0 - Pres first year
        #   3 - Pres last year
        #
        #

        self.month = month
        self.presyear = presyear
        self.spread = spread
        self.ans = ans

    def get_entry(self):
        return(','.join([str(self.month), str(self.presyear), str(self.spread), str(self.ans)]))


def main():

    if len(sys.argv) != 3:
        print("Please check the format.")
        sys.exit()
    
    filename = sys.argv[1]
    save_name = 'sdata_%s.txt' % sys.argv[2]

    with open(filename, "r") as f:
        data = f.readlines()

    entries = []


    for line in  range(1, len(data)):

        d = (data[line][:len(data[line])-1]).split(',')

        presyear = int(d[0]) % 4

        spreads = d[1:]

        for i in range(len(spreads)):
            s = float(spreads[i])
            if s < 0:
                entries.append(Entry(i, presyear, s, 0))
            else:
                entries.append(Entry(i, presyear, s, 1))


    with open(save_name, "w") as f:
        for entry in entries:
            f.write(entry.get_entry())
            f.write('\n')            


            
            

                



if __name__ == "__main__":
    main()
    sys.exit()
