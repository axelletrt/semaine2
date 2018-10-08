# write your code here
def who_is_bigger(a,b,c)
	if a == nil || b == nil || c == nil
		"nil detected"
	elsif b>a && b>c
		"b is bigger"
	elsif c>a && c>b
		"c is bigger"
	elsif a>b && a>c
		"a is bigger"
	end
end

def reverse_upcase_noLTA(string)
	string.reverse.upcase.delete "LTA"
end

def array_42(array)
	array.include?(42)
end

def magic_array(array)
	array.flatten.sort.map{|a|a*2}.reject!{|a|a%3==0}.uniq
end
			
		