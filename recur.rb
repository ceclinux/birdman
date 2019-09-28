# http://raganwald.com/2018/08/30/to-grok-a-mockingbird.html#fnref:aha

def expt(x, n)
    p "I am called with",x,n
    if n == 0
        1
    elsif n % 2 == 1
        x * expt(x * x, n / 2)
    else
        expt( x * x, n / 2)
    end
end

def momo(fn, fun_name = :to_s)
    table = Hash.new

    lambda do |*args|
        key = args.send(fun_name)
        table[key] || (table[key] = fn.call(*args))
    end
end

newmomo = momo(lambda {|x, n|
    p "newmomo: I am called with",x,n
    if n == 0
        1
    elsif n % 2 == 1
        x * newmomo.call(x * x, n / 2)
    else
        newmomo.call(x * x, n / 2)
    end
})
mexpt = momo(method(:expt))
mexpt.call(2, 8)

newmomo.call(2, 8)
newmomo.call(2, 9)

my_exponent = lambda do |myself, x, n|
    p "my_exponent: I am called with", x, n
    if n == 0
        1
    elsif n % 2 == 1
        x * myself.(myself,x * x, n / 2)
    else
        myself.(myself,x * x, n / 2)
    end
end

def mocking_bird(fn)
    lambda do |*args|
        fn.(fn, *args)
    end
end

# p mocking_bird(my_exponent).(2, 10)

my_memo_Exponent = mocking_bird(momo(my_exponent));

p my_memo_Exponent.(2, 8)
p my_memo_Exponent.(2, 9)