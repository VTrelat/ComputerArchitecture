def makeList(filename):
    lines = []

    with open(filename, "r") as f:
        lines = f.read().split("\n")[1:-1]
        f.close()

    for i in range(len(lines)):
        lines[i] = int(lines[i].split(" ")[1])
    return lines

times1 = makeList("ex7a")
times2 = makeList("ex7b")
times3 = makeList("ex7c")

print(sum(times1)/len(times1))
print(sum(times2)/len(times2))
print(sum(times3)/len(times3))