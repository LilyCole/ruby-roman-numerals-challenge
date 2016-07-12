
def to_roman(num)
  legend = [1000,900,500,400,100,90,50,40,10,9,5,4,1].zip(
           ['M','CM','D','CD','C','XC','L','XL','X','IX','V','IV','I'])
  # Your Code Here
end

def to_arabic(numeral_string)
  legend = ['M','D','C','L','X','V','I'].zip(
            [1000,500,100,50,10,5,4,1])
  legend_hash = Hash[legend]
  # Your Code Here
end
