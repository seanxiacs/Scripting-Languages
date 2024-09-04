
# CSE/ISE 337
# Sprint 2023
# Assignment 01
# Test Cases

# All test cases are structured as tuples of n elements, where the first n-1
# elements are the inputs to the function, and the n_th element is the expected
# output for that input.

# You can import this file as a Python module and access the test cases and
# misc functions by name.
# e.g.,
# import cseise337_a01_testcases as tst
# tst.even()
# tst.to_string()
# tst.p1_cases
# tst.p2_01

# Misc definitions
def even(n):
    return n % 2 == 0
# end def even()

def odd(n):
    return n % 2 == 1
# end def odd()

def prime(n):
    if n < 2:
        return False
    result = True
    for i in range(2, (n // 2) + 1):
        if n % i == 0:
            result = False
    return result
# end def prime()

def not_prime(n):
    return not prime(n)
# end def not_prime()

def vowel(c):
    vowels = {'a', 'e', 'i', 'o', 'u'}
    return c in vowels
# end def vowel()

def not_vowel(c):
    return not vowel(c)
# end def not_vowel()

def to_string(fs_item, tab_level = 1):
    if isinstance(fs_item, a1.File):
        return ("\t" + "  " * tab_level) + "FILE: " + fs_item.name + ", " + str(fs_item.size) + "\n"
    else:
        temp = ("\t" + "  " * tab_level) + "FOLDER: " + fs_item.name + "\n"
        for item in fs_item.items:
            temp += to_string(item, tab_level + 1)
        return temp


# Problem 01 - is_chaotic(s)
# 1 point per case
p1_01 = ("", "ELMA")
p1_02 = ("a", "TOHRU")
p1_03 = ("abcacbbcabaccabcba", "ELMA")
p1_04 = ("aabbbbbccc", "TOHRU")
p1_05 = ("aacaacaacbbbcbbbcc", "ELMA")
p1_06 = ("aaabcc", "TOHRU")
p1_07 = ("abb", "TOHRU")
p1_08 = ("abbcddeffghhijjkllmnnoppqrrsttuvvwxxyzz", "ELMA")
p1_09 = ("fffffgggggguuuuuuu", "TOHRU")
p1_10 = ("".join([chr(x) * (x-96) for x in range(97, 123)]), "TOHRU")
p1_cases = [p1_01, p1_02, p1_03, p1_04, p1_05,
            p1_06, p1_07, p1_08, p1_09, p1_10]


# Problem 02 - is_balanced(s)
# 1 point per case
p2_01 = ("", True)
p2_02 = ("()", True)
p2_03 = ("(){}[]", True)
p2_04 = ("({[{([])}]})", True)
p2_05 = ("{[()]([])}", True)
p2_06 = ("(", False)
p2_07 = ("{]}", False)
p2_08 = ("()[{}", False)
p2_09 = ("[{({[(]})}]", False)
p2_10 = ("{[(]([])}", False)
p2_cases = [p2_01, p2_02, p2_03, p2_04, p2_05,
            p2_06, p2_07, p2_08, p2_09, p2_10]


# Problem 03 - winning_function(alist, function1, function2)
# 1 point per case

list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
list2 = ['b', 'c', 'd', 'f', 'g', 'a', 'e', 'i', 'o', 'u']
list3 = [9, 15, 21, 25, 27, 11, 13, 17, 19, 23]


p3_01 = (([], even, odd), 'TIE')
p3_02 = ((list1[:-1], even, odd), odd.__name__)
p3_03 = ((list1[1:], even, odd), even.__name__)
p3_04 = ((list1, even, odd), 'TIE')
p3_05 = ((list2[:-1], vowel, not_vowel), not_vowel.__name__)
p3_06 = ((list2[1:], not_vowel, vowel), vowel.__name__)
p3_07 = ((list2, vowel, not_vowel), 'TIE')
p3_08 = ((list3[:-1], prime, not_prime), not_prime.__name__)
p3_09 = ((list3[1:], prime, not_prime), prime.__name__)
p3_10 = ((list3, prime, not_prime), 'TIE')
p3_cases = [p3_01, p3_02, p3_03, p3_04, p3_05,
            p3_06, p3_07, p3_08, p3_09, p3_10]


# Problem 04 - load_fs(ls_output)
# Testing for P04 is different. Use the included files and pass these filenames
# into your load_fs() function. Then pass the return value to the to_string()
# defined above. Compare the result to the test directories I've included.
# 5 points per case
p4_01 = "p4_case01.txt"
p4_02 = "p4_case02.txt"


# Problem 5 - decoder(ct)
# 1 pt. per case
p5_01 = ("", "")
p5_02 = ("sidnkw", "secret")
p5_03 = ("i uz zwgd jqf.", "i am here now.")
p5_04 = ("tmny zk d pmxj.", "this is a test.")
p5_05 = ("cvsnq xkw bs w33i twxbfx.", "check out my l33t skillz.")
p5_06 = ("i qxdzwg hf g fmy wjnr mwtpqc ahr ddep ylitfgnt.", "i wonder if i got full credit for this question.")
p5_07 = ("i'g hn zzw bcyuyv ca lsxu pimnhrkwxekv.", "i'm in the middle of some calibrations.")
p5_08 = ("ar ccjtf ms qaxii xqczj", "af short on fresh water")
p5_09 = ("bnilatdzk wxcz lvoczd ibxu rkvm", "backwards time travel made easy")
p5_10 = ('"i wdquq qjxu olgnsp i ngrc hueaxheo hfroy z zsnqnj of elzwgmtd iplycz, tgs eebh i spimnfcy z uboso hcxufq ccz ubgabhea yvso vt qwifpbuvbgdjv qqjpvswh cvfpqnj qw iif ahmuntk voaxbfgspa. bn ngc wtqw limq xlis 35000 szmwh oy jq bcida mmjp, efrr coptx dkw bojj oblheopvu, obn vfmgztxo, p lsy\'k ntap, i mnzlpm zfbyi 35000 ipcmx ec hocdal, wtdexbm, gnuxi, qunep, iok pcnoj elrcpurn. gr k khakwaxit wxbfgml qjeefli, j yrc v heoyztxu slmqdnk." --pcmifpjqc', '"i could have become a mass murderer after i hacked my governor module, but then i realized i could access the combined feed of entertainment channels carried on the company satellites. it had been well over 35000 hours or so since then, with still not much murdering, but probably, i don\'t know, a little under 35000 hours of movies, serials, books, plays, and music consumed. as a heartless killing machine, i was a terrible failure." --murderbot')
p5_cases = [p5_01, p5_02, p5_03, p5_04, p5_05, p5_06, p5_07, p5_08, p5_09, p5_10]
