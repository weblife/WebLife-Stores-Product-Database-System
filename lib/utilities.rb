# To change this template, choose Tools | Templates
# and open the template in the editor.

class Utilities
  
  def max_from_array(array)

    mxm = array[0];
    i=0
    while (i<array.length)
      if (array[i]>mxm)
        mxm = array[i];
      end
      i+=1
    end
    return mxm;
  end
  
end
