# class Array 
#     def my_each(&prc)
#         i = 0
#         while i < self.length
#             prc.call(self[i])
#             i += 1
#         end
#         self
#     end
#     def my_select(&prc)
#         new_arr = []
#         self.my_each do |ele|
#             new_arr << ele if prc.call(ele)
#         end
#         new_arr 
#     end

#     def my_reject(&prc)
#         new_arr = []
#         self.my_each do |ele|
#             new_arr << ele if !prc.call(ele)
#         end
#         new_arr
#     end

#     def my_any?(&prc)
#         self.my_each do |ele|
#             if prc.call(ele)
#                 return true
#             end
#         end
#         false
#     end

#     def my_all?(&prc)
#         count = 0
#         self.my_each do |ele|
#             if prc.call(ele)
#                 count += 1
#             end
#         end
#         count == self.length
#     end

#     def my_flatten
#         if !self.is_a?(Array)
#             return [self]
#         end
#         flattened = []
#         self.each do |ele|
#             if ele.is_a?(Array)
#                 flattened.concat(ele.my_flatten)
#             else
#                 flattened << ele
#             end
#         end
#         flattened
#     end

#     def my_zip(*args)
#         zipped = []
#         zipped << self 
#         args.each do |ele|
#             zipped << ele
#         end

#         new_arr = []
#         self.length.times do |i| 
#             sub_arr = []
#             zipped.each do |zip|
#                 sub_arr << zip[i]
#             end
#             new_arr << sub_arr 
#         end
#         new_arr
#     end

#     def my_rotate(n=1)
#         new_arr = self.clone
#         if n < 0
#             #opposite direction
#             (n*-1).times do 
#                 back = new_arr.pop 
#                 new_arr.unshift(back)
#             end
#         else
#             n.times do
#                 front = new_arr.shift
#                 new_arr << front 
#             end
#         end
#         new_arr
#     end

#     def my_join(separator="")
#         str = ""
#         self.each_with_index do |ele, idx|
#             str += ele.to_s
#             str += separator if idx < self.length - 1
#         end
#         str
#     end

#     def my_reverse
#         new_arr = []
#         self.each do |ele|
#             new_arr.unshift(ele)
#         end
#         new_arr
#     end
# end

def factors(num)
    factors = []
    (1..num).each do |n|
        if num % n == 0
            factors << n
        end
    end
    factors
end

class Array 
    def bubble_sort!(&prc)
        prc ||= Proc.new {|ele1, ele2| ele1 <=> ele2}
        unsorted = true
        while unsorted
            unsorted = false 
            i = 0
            while i < self.length - 1
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self[i]
                    unsorted = true 
                end
                i += 1
            end
        end
        self 
    end
    
    def bubble_sort(&prc)
        new = self.map {|ele| ele }
        new.bubble_sort!(&prc)
    end
end

def substrings(string)
    sub = []
    string.split("").each_with_index do |char1, idx1|
        sub << char1
        string.split("").each_with_index do |char2, idx2|
            sub << string[idx1..idx2] if idx2 > idx1
        end
    end
    sub
end

def subwords(word, dictionary)
    subs = substrings(word)
    selected = subs.select {|sub| dictionary.include?(sub)}
    selected.uniq

end

# a = "delicious"
# p substrings(a)
# p substrings("cats")

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]