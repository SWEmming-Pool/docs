import random

# List of group members
members = [
    "Enrico Bacci Bonivento",
    "Ennio Italiano",
    "Fabio Pantaleo",
    "Elia Pasquali",
    "Sebastiano Sanson",
    "Nicolò Trinca"
    ]

shuffle = random.sample(members, 5)

approvers = "\\renewcommand\{\\documentApprovers\}\{%s \\smallskip\}" % (shuffle[0])
editors = "\\renewcommand\{\\documentEditors\}{%s \\\\ & %s \\smallskip\}" % (shuffle[1], shuffle[2])
verifiers = "\\renewcommand\{\\documentVerifiers\}{%s \\\\ & %s \\smallskip\}" % (shuffle[3], shuffle[4])

print(approvers)
print(editors)
print(verifiers)