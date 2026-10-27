module Enumerable
  # Your code goes here

   def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    index = 0

    self.my_each { |item| yield(item, index); index += 1}

    # my original solution is below, but it does not work with my_each because
    # my_each only works in Arrays, not Ranges.

    # last_index = self.length - 1

    # (0..last_index).each { |index| yield(self[index], index) }
    # self
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    

    arr = []

    self.my_each do |elem|
      arr.push(elem) if yield(elem)
    end
    arr
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    self.my_each { |elem| return false unless yield(elem)}
    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    self.my_each { |elem| return true if yield(elem)}
    false
  end

  def my_none?
    return to_enum(:my_all?) unless block_given?

    self.my_each { |elem| return false if yield(elem)}
    true
  end

  def my_count
    return self.length unless block_given?
    count = 0

    self.each { |elem| count += 1 if yield(elem) }
    count

  end

  def my_map
    return to_enum(:my_map) unless block_given?
    arr = []

    self.my_each { |elem| arr << yield(elem) }
    arr
  end

  def my_inject(initial = self.first)

    aggregate = initial

    self.each do |elem|
      aggregate = yield(aggregate, elem)
    end
    aggregate
  end 

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method

 


class Array
  # Define my_each here

  def my_each
    return to_enum(:my_each) unless block_given?

    for item in self
      yield(item)
    end

    self
  end
end
