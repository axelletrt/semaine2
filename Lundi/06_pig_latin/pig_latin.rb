
def translate(word)

vowels = ['a','e','i','o','u']
consonants = ['b','c','d','f','g', 'h', 'k', 'l', 'm', 'n', 'p', 'q','r','s','t','v','w','x','y','z']






if vowels.include?(word[0])

"#{word}ay"


elsif consonants.include?(word[0]) && consonants.include?(word[1])

word3 = word[2..-1]	
"#{word3}#{word[0]}#{word[1]}ay"
  

else word2 = word[1..-1]

"#{word2}#{word[0]}ay"

end

end

