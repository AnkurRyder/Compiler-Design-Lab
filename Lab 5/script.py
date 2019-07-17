# Read terminal symbols in a list
multi_char_terminal = []
with open("output.txt") as file:
    for line in file: 
        line = line.strip().split()
        multi_char_terminal.extend(line)
multi_char_terminal = list(dict.fromkeys(multi_char_terminal))

# Read Input Grammar from STDIN and convert it to LL(1)
inp = {}
production = input('')
src = production.split('->')[0]
dest = production.split('->')[1]
dest = dest.split('|')
inp[src] = dest

while production != "":
    production = input('')
    if production != "":
        src = production.split('->')[0]
        dest = production.split('->')[1]
        dest = dest.split('|')
        inp[src] = dest


n = len(inp)

for i in inp.keys():
    for j in inp.keys():
        if i == j:
            break
        new_prods = []
        for prod in inp[i]:
            if prod[0] == j:
                for prodj in inp[j]:
                    new_prods.append('{}{}'.format(prodj, prod[1:]))
            else: 
                new_prods.append(prod)
        
        inp[i] = new_prods

result = {}
parser_inp = {}
left = list()

for source in inp:
    for dest in inp[source]:
        if (dest[0] == source[0]):
            left.append(source[0])
            if not "{}'".format(source) in result.keys():
                result["{}'".format(source)] = list()
                parser_inp["{}'".format(source)] = list()
            result["{}'".format(source)].append("{}{}'".format(dest[1:], source))
            temp_list = list(dest[1:])
            temp_list.append(source + "'")
            parser_inp["{}'".format(source)].append(temp_list)
            result["{}'".format(source)].append("∈")
            if [""] not in parser_inp["{}'".format(source)]:
                parser_inp["{}'".format(source)].append([""])
        else:
            if not source in result.keys():
                result[source] = list()
                parser_inp[source] = list()

            if source[0] in left:
                result[source].append("{}{}'".format(dest, source))
                if dest not in multi_char_terminal:
                    temp_list = list(dest)
                else:
                    temp_list = [dest]
                temp_list.append(source + "'")
                parser_inp[source].append(temp_list)
            else:
                result[source].append(dest)
                if dest not in multi_char_terminal:
                    parser_inp[source].append(list(dest))
                else:
                    parser_inp[source].append([dest])


prarr = list()
iu = 0
for k, r in result.items():
    r = list(dict.fromkeys(r) )
    prarr.append("")
    prarr[iu] += "{}->".format(k)
    for i in r:
        prarr[iu] += "{}".format(i)
        prarr[iu] += "|"
    iu = iu + 1

# Write LL(1) grammar to grammarLL.txt
open("grammarLL.txt", "w").close()
f = open("grammarLL.txt", "a")

for pr in prarr:
    # print(pr[:-1])
    f.write(pr[:-1])
    f.write('\n')

f.close()

from predictive import PredictiveParser
parser = PredictiveParser("E", parser_inp)

f = open("first-follow.txt", "w")
f.write("First\n")
for nonterminal in parser.nonterminals:
    f.write(nonterminal + ": " + str(parser.first_dict[nonterminal]))
    f.write('\n')

f.write("\nFollow\n")
for nonterminal, symbols in parser.follow_dict.items():
    f.write(nonterminal  + ": " + str(symbols))
    f.write('\n')

f.close()

match_input = []
with open("output.txt") as file:
    for line in file: 
        line = line.strip().split()
        match_input.extend(line)

# Read token stream to be matched from tokens.txt
if parser.match(match_input):
    print("Given token stream ACCEPTED by grammar")
else:
    print("Given token stream REJECTED by grammar")