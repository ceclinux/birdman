# @param {String} s
# @return {Boolean}
def is_valid(s)
    s = s.gsub("abc", "")
    if s == ""
        return true
    end
    if s.start_with? "ab"
        if !s.end_with? "c"
            return false
        end
        return is_valid(s[2..-2])
    elsif s.start_with? "a"
        if !s.end_with? "bc"
            return false
        end
        return is_valid(s[1..-3])
    end
    false
end

p is_valid("abccba")
p is_valid("abc")
p is_valid("aabcbc")
p is_valid("aabcbcabc")