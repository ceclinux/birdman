# http://raganwald.com/2013/03/28/trampolines-in-javascript.html
fact_tail = lambda do |args|
    if args.first == 0
        args.last
    else
        lambda {fact_tail.([args.first - 1, args.first * args.last])}
    end
end

def trempolin(fun)
    p "her"
    lambda do |args|
        p "herer"
        p args
        tmp = fun.(args)
        while tmp.is_a?(Proc)
            tmp = tmp.()
        end
        tmp
    end
end

# p (fac = lambda{ |n| n==1 ? 1 : n*fac.call(n-1) }).call(5)
tre_tmp = trempolin(fact_tail)

p tre_tmp.([32768,1])

# p (fact_tail(32768, 1))
# p (fact(32768))
