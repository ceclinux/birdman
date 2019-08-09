require 'set'
class MagicDictionary

        def initialize()
            @set = Set.new
        end
    

        def build_dict(dict)
            @max = 26 ** (dict.max {|t| t.length}).length
            dict.each do |word|
                num = 0
                word.chars.each do |c|
                    num += (c.ord - 'a'.ord)
                    num = num * 26
                end
                @set << num
            end
        end
    
    
  
        def search(word)
            num = 0
            word.chars.each do |c|
                    num += (c.ord - 'a'.ord)
                    num = num * 26
            end
            @set.each do |set_num|
                if set_num != num && (@max % (set_num - num).abs)
                    return true
                end
            end
            false
        end
        
    end
m = MagicDictionary.new
m.build_dict(["hello"])
p m.search("hello")
p m.search("hhllo")
# Your MagicDictionary object will be instantiated and called as such:
# obj = MagicDictionary.new()
# obj.build_dict(dict)
# param_2 = obj.search(word)