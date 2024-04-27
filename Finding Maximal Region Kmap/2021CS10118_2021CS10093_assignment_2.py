import copy


def comb_function_expansion(l1, l2):
    # CONVERTS THE UPPERCASE LETTERS TO DASHED LITERALS
    def conversion(string):
        x1 = ''
        for g in range(0, len(string)):
            if string[g].isupper():
                x1 += string[g].lower() + "'"
            else:
                x1 += string[g]
        return x1

    # DELETES HASH FROM A GIVEN STRING
    def del_hash(s):
        l = ''
        n1 = len(s)
        for i in range(0, n1):
            if s[i] != '#':
                l += s[i]
        return l

    # PREPARES THE STRING TO PERFORM XOR OPERATION
    def str_to_num(a):
        l = ''
        i = 0
        while i < len(a):
            if a[i].isupper():
                l += '0'
                i += 1
            elif a[i] == '#':
                l += '2'
                i += 1
            else:
                l += '1'
                i += 1
        return (l)

    # CONVERTS THE DASHED LITERALS TO CORRESPONDING UPPERCASE LETTERS
    def reverse_conversion(a):
        i = 0
        l = ''
        while i < len(a):
            if i != len(a) - 1:
                if a[i + 1] == "'":
                    l += a[i].upper()
                    i += 2
                else:
                    l += a[i]
                    i += 1
            else:
                l += a[i]
                i += 1
        return l

    # GIVES THE XOR OF TWO BINARY STRINGS
    def xor(a, b):
        n = len(a)
        ans = ""
        for i in range(n):
            if (a[i] == b[i]):
                ans += "0"
            else:
                ans += "1"
        return ans

    # SIMPLFIES THE ONE XOR LIST TILL MINIMUM SIMPLIFICATION
    val = []  # val IS THE SIMPLIFIED LIST AT EACH ITERATION
    xor_list = []
    yet_another = []

    def simplify(lis):
        yet_another.append(lis)
        n1 = len(lis)
        before_list = lis
        for i in range(0, n1):
            len1 = copy.deepcopy(val)
            if '#' in lis[i]:
                i1 = str(lis[i]).index('#')
                for j in range(i + 1, n1):
                    if '#' in lis[j]:
                        i2 = str(lis[j]).index('#')
                        if i1 == i2 and len(lis[i]) == len(lis[j]):
                            answer = xor(str_to_num(lis[i]), str_to_num(lis[j]))
                            answer = str(answer)
                            if answer.count('1') == 1:
                                xor_list.append(lis[i])
                                xor_list.append(lis[j])
                                q = answer.index('1')
                                a1 = str(lis[i]).replace(lis[i][q], '#')
                                val.append(a1)
                if val == len1:
                    if lis[i] not in xor_list and lis[i] not in val:
                        val.append(lis[i])
            else:
                val.append(lis[i])
        # print(val)

        if val != before_list:
            return simplify(val)
        else:

            return (val)

    def f(fun_True, fun_DC):
        xor_list_sec = []
        for I in range(0, len(fun_True)):
            fun_True[I] = reverse_conversion(fun_True[I])
        for J in range(0, len(fun_DC)):
            fun_DC[J] = reverse_conversion(fun_DC[J])
        list1 = fun_True + fun_DC
        x = []  # THIS IS A LIST WHICH CONTAINS EVERY INPUT IN THE BINARY STRING FORMAT
        n1 = len(list1)
        for t in range(0, n1):
            x.append(str_to_num(list1[t]))
        n2 = len(x)
        fin = []
        for i in range(0, len(fun_True)):
            init = copy.deepcopy(fin)  # INITIALISES THE fin list IN ORDER TO COMPARE IT WITH THE NEW ONE
            for j in range(i + 1, n2):
                ans = xor(x[i], x[j])
                ans = str(ans)
                if ans.count('1') == 1:
                    q = ans.index('1')
                    a1 = str(list1[i]).replace(list1[i][q], '#')
                    fin.append(a1)
                    xor_list_sec.append(list1[i])
                    xor_list_sec.append(list1[j])
                    j = 0
            if fin == init:
                if list1[i] not in xor_list_sec:
                    fin.append(list1[i])
        # print(fin)
        fin = simplify(fin)

        def intermediate2(fin):
            n32 = len(fin)
            del_hash_list = []
            for bb in range(0, n32):
                del_hash_list.append(del_hash(fin[bb]))
            answer_list = []
            for m1 in range(0, len(fun_True)):
                to_check = []
                for m2 in range(0, len(del_hash_list)):
                    if set(del_hash_list[m2]).intersection(reverse_conversion(fun_True[m1])) == set(del_hash_list[m2]):
                        to_check.append(del_hash_list[m2])
                min_i = 0
                for m3 in range(0, len(to_check)):
                    if len(to_check[m3]) < len(to_check[min_i]):
                        min_i = m3
                answer_list.append(to_check[min_i])
            FINAL = []
            for o in range(0, len(answer_list)):
                FINAL.append(conversion(answer_list[o]))
                # print(FINAL)
            if '' in FINAL:
                FINAL = [None] * len(FINAL)
            return FINAL

        def demo_a2(yet_another):
            extra = []
            for e in range(len(yet_another)):
                extra.append(intermediate2(yet_another[e]))
            return extra

        print(demo_a2(yet_another))
        return intermediate2(fin)

    return f(l1, l2)

# # TEST CASES
#
# print(comb_function_expansion(['abcde', "ab'c'de", "ab'cde"], ["ab'c'de'"]))
# print(comb_function_expansion(["a'b'c'","a'b'c","a'bc'","a'bc"],["ab'c'","abc'","ab'c","abc"]))
# print(comb_function_expansion(["a'b'c'd'e'", "a'b'cd'e", "a'b'cde'", "a'bc'd'e'","a'bc'd'e", "a'bc'de", "a'bc'de'", "ab'c'd'e'", "ab'cd'e'"],["abc'd'e'", "abc'd'e", "abc'de", "abc'de'"]))
# print(comb_function_expansion(["a'bc'defgh" , "a'bc'd'efgh" , "abc'd'efgh" , "abc'defgh" , "a'bc'def'gh" ,"a'bc'd'ef'gh" , "abc'd'ef'gh" , "abc'def'gh"],[]))
#
# print(comb_function_expansion(["a'b","a'b'"],[]))
# print(comb_function_expansion(["a'b'c'd'e'", "a'b'cd'e", "a'b'cde'", "a'bc'd'e'","a'bc'd'e", "a'bc'de", "a'bc'de'", "ab'c'd'e'", "ab'cd'e'"],["abc'd'e'", "abc'd'e", "abc'de", "abc'de'"]))
# # ------------------------------------------TEST CASES FOR 2 VARIABLES-----------------------------------------------------
# print(comb_function_expansion(["a'b'"],[]))
# print(comb_function_expansion(["a'b'"],["a'b"]))
# print(comb_function_expansion(["a'b'","ab'"],["a'b"]))
# # ALL ARE ONE
# print(comb_function_expansion(["a'b'","a'b","ab'","ab"],[]))
# # -----------------------------------------TEST CASES FOR 3 VARIABLES-----------------------------------------------------------
# print(comb_function_expansion(["a'b'c'","a'b'c","a'bc","a'bc'"],["ab'c'","ab'c"]))
# print(comb_function_expansion(["a'b'c'","a'b'c"],["ab'c'","ab'c"]))
# print(comb_function_expansion(["a'b'c'd'e'", "a'b'cd'e", "a'b'cde'", "a'bc'd'e'","a'bc'd'e", "a'bc'de", "a'bc'de'", "ab'c'd'e'", "ab'cd'e'"],["abc'd'e'", "abc'd'e", "abc'de", "abc'de'"]))
# print(comb_function_expansion(["a'b'c'd'e'f'","a'b'c'd'e'f","a'b'cd'e'f'","a'b'cd'e'f","a'bc'd'e'f'","a'bcd'e'f'","ab'c'd'ef","abc'de'f'","abc'de'f","abc'def'","abc'def"],["abcde'f'","abcde'f","abcdef'","abcdef"]))
# print(comb_function_expansion(["a'b'c'd'e'f'","a'b'c'd'e'f","a'b'cd'e'f'","a'b'cd'e'f","a'b'cd'ef'","a'b'cd'ef","a'b'cde'f'","a'b'cde'f","a'b'cdef'","a'b'cdef","a'bc'd'e'f'","a'bcd'e'f'","ab'c'd'ef","abc'de'f'","abc'de'f","abc'def'","abc'def"],["abcde'f'","abcde'f","abcdef'","abcdef"]))
# print(comb_function_expansion(['abcd', "ab'c'd", "ab'cd"], ["abcd'"]))
# print(comb_function_expansion(["a'bc'de", "a'bcde"], ["a'b'cde", "a'b'cde'"]))
# print(comb_function_expansion(["a'bcdef", "a'b'c'def", "a'b'c'd'e'f'", "a'b'c'd'ef", "a'b'c'd'e'f", "a'b'cdef"], ["ab'cd'ef", 'abcdef', "ab'cdef", "ab'cd'e'f"]))
# # ["a'bde", "a'bde"]]
# print(comb_function_expansion(['abcde', "ab'c'de", "ab'cde"], ["ab'c'de'"]))