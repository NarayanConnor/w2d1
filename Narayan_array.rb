# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min 
    end
    def average
        return nil if self.empty?
         self.sum.to_f / self.length.to_f
    end

    def median
        star=self.sort
        return nil if self.empty?
        if star.length % 2 != 0
            return star[(star.length/2)]
        else
            mid=star.length/2
            return ((star[mid].to_f+star[mid-1].to_f)/2)
        end
    end
    def counts
        hash=Hash.new(0)
        self.each { |ele| hash[ele]+=1}
        hash
    end

    def my_count(val)    
        self.select { |ele| ele == val}.length
    end
    def my_index(val)
        i=0
        self.each do |ele| 
            if ele == val
                return i
            elsif i == self.length-1
                return nil
            end
            i+=1
        end
    end
    def my_uniq
        hash=Hash.new(0)
        self.each { |ele| hash[ele]+=1}
        hash.keys
    end
    def my_transpose
        hash=Hash.new(){ |h,k| h[k]=[]}
        self.each do |arr|
            arr.each.with_index { |ele,i| hash[i]<<ele}
        end
        hash.values
    end
end
