def is_legal_region(kmap_function, term):
    Kmap_function = []
    for u in range(len(kmap_function)):
        Kmap_function += kmap_function[u]
    list_2 = {(0, 0): 0, (0, 1): 1, (1, 0): 2, (1, 1): 3}
    list_3 = {(0, 0): 0, (0, 1): 1, (0, 2): 2, (0, 3): 3, (1, 0): 4, (1, 1): 5, (1, 2): 6, (1, 3): 7}
    list_4 = {(0, 0): 0, (0, 1): 1, (0, 2): 2, (0, 3): 3, (1, 0): 4, (1, 1): 5, (1, 2): 6, (1, 3): 7, (2, 0): 8,
              (2, 1): 9, (2, 2): 10, (2, 3): 11, (3, 0): 12, (3, 1): 13, (3, 2): 14, (3, 3): 15}
    # Case 1 when there are 2 variables
    region1 = []
    region2 = []
    region3 = []
    region4 = []
    if len(term) == 2:

        if term[1] == 0:
            region1 = region1 + [(0, 0), (0, 1)]
        elif term[1] == 1:
            region1 = region1 + [(1, 0), (1, 1)]
        elif term[1] is None:
            region1 = region1 + [(0, 0), (0, 1), (1, 0), (1, 1)]

        if term[0] == 0:
            region2 = region2 + [(0, 0), (1, 0)]
        elif term[0] == 1:
            region2 = region2 + [(0, 1), (1, 1)]
        elif term[0] is None:
            region2 = region2 + [(0, 0), (0, 1), (1, 0), (1, 1)]

        fin = list(set(region1).intersection(set(region2)))
        p = []
        for j in range(0, len(fin)):
            p.append(Kmap_function[list_2[fin[j]]])
        fin.sort()
        if len(fin) == 1:
            finn = [fin[0], fin[0]]
        else:
            finn = [fin[0], fin[-1]]
        if 0 in p:
            return (finn[0], finn[1], False)
        else:
            return (finn[0], finn[1], True)
    # Case 2
    elif len(term) == 3:
        if term[2] == 0:
            region1 = region1 + [(0, 0), (0, 1), (0, 2), (0, 3)]
        elif term[2] == 1:
            region1 = region1 + [(1, 0), (1, 1), (1, 2), (1, 3)]
        elif term[2] is None:
            region1 = region1 + [(0, 0), (0, 1), (0, 2), (0, 3), (1, 0), (1, 1), (1, 2), (1, 3)]

        if term[0] == 0:
            region2 = region2 + [(0, 0), (0, 1), (1, 0), (1, 1)]
        elif term[0] == 1:
            region2 = region2 + [(0, 2), (0, 3), (1, 2), (1, 3)]
        elif term[0] is None:
            region2 = region2 + [(0, 0), (0, 1), (1, 0), (1, 1), (0, 2), (0, 3), (1, 2), (1, 3)]

        if term[1] == 0:
            region3 = region3 + [(0, 0), (0, 3), (1, 0), (1, 3)]
        elif term[1] == 1:
            region3 = region3 + [(0, 1), (0, 2), (1, 1), (1, 2)]
        elif term[1] is None:
            region3 = region3 + [(0, 0), (0, 3), (1, 0), (1, 3), (0, 1), (0, 2), (1, 1), (1, 2)]

        fin11 = list(set(region1).intersection(set(region2)))
        fin1 = list(set(fin11).intersection(set(region3)))
        p1 = []
        for k in range(len(fin1)):
            p1.append(Kmap_function[list_3[fin1[k]]])
        fin1.sort()
        x1 = fin1[0][1] + 1
        x2 = fin1[0][1] + 3
        # NOW ADDED
        if len(fin1) == 1:
            ans1 = [fin1[0], fin1[0]]
        # NOW ENDED
        elif (0, x1) in fin1 or (1, x1) in fin1:
            ans1 = [fin1[0], fin1[len(fin1) - 1]]
        else:
            if (0, x2) in fin1 or (1, x2) in fin1:
                if len(fin1) == 2:
                    ans1 = [fin1[1], fin1[0]]
                else:
                    ans1 = [fin1[1], fin1[-2]]
        if 0 in p1:
            return (ans1[0], ans1[1], False)
        else:
            return (ans1[0], ans1[1], True)


    # Case 3
    else:
        if term[0] == 0:
            region1 = region1 + [(0, 0), (0, 1), (1, 0), (1, 1), (2, 0), (2, 1), (3, 0), (3, 1)]
        elif term[0] == 1:
            region1 = region1 + [(0, 2), (0, 3), (1, 2), (1, 3), (2, 2), (2, 3), (3, 2), (3, 3)]
        elif term[0] is None:
            region1 = region1 + [(0, 0), (0, 1), (1, 0), (1, 1), (2, 0), (2, 1), (3, 0), (3, 1), (0, 2), (0, 3), (1, 2),
                                 (1, 3), (2, 2), (2, 3), (3, 2), (3, 3)]

        if term[1] == 0:
            region2 = region2 + [(0, 0), (0, 3), (1, 0), (1, 3), (2, 0), (2, 3), (3, 0), (3, 3)]
        elif term[1] == 1:
            region2 = region2 + [(0, 1), (0, 2), (1, 1), (1, 2), (2, 1), (2, 2), (3, 1), (3, 2)]
        elif term[1] is None:
            region2 = region2 + [(0, 0), (0, 3), (1, 0), (1, 3), (2, 0), (2, 3), (3, 0), (3, 3), (0, 1), (0, 2), (1, 1),
                                 (1, 2), (2, 1), (2, 2), (3, 1), (3, 2)]

        if term[2] == 0:
            region3 = region3 + [(0, 0), (0, 1), (0, 2), (0, 3), (1, 0), (1, 1), (1, 2), (1, 3)]
        elif term[2] == 1:
            region3 = region3 + [(2, 0), (2, 1), (2, 2), (2, 3), (3, 0), (3, 1), (3, 2), (3, 3)]
        elif term[2] is None:
            region3 = region3 + [(0, 0), (0, 1), (0, 2), (0, 3), (1, 0), (1, 1), (1, 2), (1, 3), (2, 0), (2, 1), (2, 2),
                                 (2, 3), (3, 0), (3, 1), (3, 2), (3, 3)]

        if term[3] == 0:
            region4 = region4 + [(0, 0), (0, 1), (0, 2), (0, 3), (3, 0), (3, 1), (3, 2), (3, 3)]
        elif term[3] == 1:
            region4 = region4 + [(1, 0), (1, 1), (1, 2), (1, 3), (2, 0), (2, 1), (2, 2), (2, 3)]
        elif term[3] is None:
            region4 = region4 + [(0, 0), (0, 1), (0, 2), (0, 3), (3, 0), (3, 1), (3, 2), (3, 3), (1, 0), (1, 1), (1, 2),
                                 (1, 3), (2, 0), (2, 1), (2, 2), (2, 3)]

        fin111 = list(set(region1).intersection(set(region2)))
        fin122 = list(set(fin111).intersection(set(region3)))
        fin3 = list(set(fin122).intersection(set(region4)))
        fin4 = list(set(fin122).intersection(set(region4)))
        f1 = []
        for v in range(len(fin3)):
            f1.append(Kmap_function[list_4[fin3[v]]])
        fin3.sort()
        fin4.sort()
        fin4.sort(key=lambda a: a[1])
        col1 = fin3[0][1] + 1
        col2 = fin3[0][1] + 3
        row1 = fin3[0][0] + 1
        row2 = fin3[0][0] + 3
        set1 = {(0, 0), (0, 3), (3, 0), (3, 3)}
        # COLUMN WRAPPING
        # NOW ADDED
        if len(fin3) == 1:
            ans2 = [fin3[0], fin3[0]]
        # NOW ENDED
        elif set1 == set(fin3):
            ans2 = [(0, 0), (3, 3)]
        elif fin3[1][1] != col1 and fin3[-1][1] == col2:
            zer1 = max([v[0] for v in fin3])
            zer2 = min([v[0] for v in fin3])
            ans2 = [(zer1, 0), (zer2, 3)]
        # ROW WRAPPINGs
        elif fin4[1][0] != row1 and fin4[-1][0] == row2:
            obv1 = min([w[1] for w in fin4])
            obv2 = max([w[1] for w in fin4])
            ans2 = [(0, obv2), (3, obv1)]

        else:
            ans2 = [fin3[-1], fin3[0]]
        if 0 in f1:
            return (ans2[1], ans2[0], False)
        else:
            return (ans2[1], ans2[0], True)

# TEST_CASES

"""
# For 2 variable k map
k1 = [[1, 'x'], [0, 1]]
t1 = is_legal_region(k1, [None, None])
t2 = is_legal_region(k1, [1, 1])
t3 = is_legal_region(k1, [0, None])

# For 3 variable kmap
k2 = [[1, 'x', 0, 1], ['x', 1, 0, 'x']]

t4 = is_legal_region(k2, [None, 0, None])
t5 = is_legal_region(k2, [None, None, None])
t6 = is_legal_region(k2, [0, 1, 0])

# For 4 variable kmap
k3 = [[1, 0, 'x', 0], [1, 1, 1, 0], [1, 'x', 'x', 0], [1, 0, 1, 0]]

t7 = is_legal_region(k3, [None, 0, None, 0])
t8 = is_legal_region(k3, [None, None, None, 0])
t9 = is_legal_region(k3, [1, 1, 0, 0])
t10 = is_legal_region(k3, [None, None, None, None])

print(t1)
print(t2)
print(t3)
print(t4)
print(t5)
print(t6)
print(t7)
print(t8)
print(t9)
print(t10)"""