#write your code here
def echo(word)
	word
end

def shout(word)
	word.upcase
end

def repeat(c,n=2)
  ("#{c} "*n).strip
end

def start_of_word(word,n)
	word[0..(n-1)]
end

def first_word(string)
	string.split.first
end

def titleize(string)
  nocaps = %w(and the)
  string.split(" ").map { |word| nocaps.include?(word) ? word : word.capitalize }.join(" ")
end