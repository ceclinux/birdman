# @param {String[]} dict
# @param {String} sentence
# @return {String}
def replace_words(dict, sentence)
    trie = Trie.new("")
    head = trie
    dict.each do |t|
        t.chars.each do |c|
           if head.children[c.ord - 'a'.ord].nil?
              head.children[c.ord - 'a'.ord] = Trie.new(c)
           end
           head = head.children[c.ord - 'a'.ord]
        end
        head.flag = true
        head = trie
    end

    sentence.split(" ").map do |word|
        dict_word = ""
        word_flag = false
        word.chars.each do |c|
            # p word
            # p c
            if head.children[c.ord - 'a'.ord] != nil
                dict_word += c
                if head.children[c.ord - 'a'.ord].flag
                    word_flag = true
                    break
                end
                head = head.children[c.ord - 'a'.ord]
            else
                break
            end
        end
        head = trie
        if word_flag
            dict_word
        else
            word
        end
    end.join(" ")
end

class Trie
    attr_accessor :children, :flag
    def initialize(c)
        @flag = false
        @c = c
        @children = Array.new(26)
    end
end

# p replace_words(["cat", "bat", "rat"], "the cattle was rattled by the battery")
p replace_words(["a", "aa", "aaa", "aaaa"],"a aa a aaaa aaa aaa aaa aaaaaa bbb baba ababa")