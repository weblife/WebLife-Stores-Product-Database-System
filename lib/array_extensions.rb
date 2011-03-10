module ArrayExtensions
  def dup_hash
    inject(Hash.new(0)) { |h,e| h[e] += 1; h }.select {
      |k,v| v >= 1 }.inject({}) { |r, e| r[e.first] = e.last; r }
  end
end

# TODO: We should uncomment the following line after adding the implementation of above functions

Array.send(:include, ArrayExtensions)