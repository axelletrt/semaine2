#write your code here
def time_string(string)
    Time.at(string).utc.strftime("%H:%M:%S")
end