# @param {String} s
# @return {String}
def longest_palindrome(s)
    len = s.length
    max_palinedrone = ""
    0.upto(len - 2).each do | i|
         max_palinedrone =  get_max_len( max_palinedrone, single_parlinedrone(i, s))
        if s[i] == s[i + 1]
            p "here"
             max_palinedrone =  get_max_len( max_palinedrone, double_parlinedrone(i, s))
        end
    end
    p get_max_len( max_palinedrone, single_parlinedrone(len - 1, s))
end

def get_max_len(str1, str2)
    p str1
    p str2
    [str1, str2].max_by(&:length)
end

def single_parlinedrone(i, s)
    k = 1
    ret = s[i]
    while i - k >= 0 && i + k < s.length && s[i - k] == s[i + k]
        ret = s[i - k] + ret + s[i + k]
        k += 1
    end
    p ret
    ret 
end

def double_parlinedrone(i, s)
    k = 1
    ret = s[i] * 2
    while i - k >= 0 && i + k + 1< s.length && s[i - k] == s[i + k + 1]
        ret = s[i - k] + ret + s[i + k + 1]
        k += 1
    end
    p ret
    ret 
end

longest_palindrome("aaaa")
