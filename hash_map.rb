

 # input = {   'a': 1,   'b': {   'd': 3,   'c': 2,   },   'e': {   'f': {   'g': 4   }   } }

 # Desired Output: {"a"=>1,  "b.d"=>3, "b.c"=>2, "e.f.g"=>4}

require 'pry'


def get_all_keys(hsh, aa, prev_key=nil)
  hsh.map do |hkey, hval|
    if hval.is_a?(Hash)
      hkey = prev_key.dup << hkey if prev_key
      get_all_keys(hval, aa, hkey)
    else
      unless prev_key.nil?
        prev_key = prev_key.split(//).join('.')
        aa.merge!(Hash["#{prev_key}.#{hkey}", hval])
      else
        aa.merge!(Hash[hkey, hval])
      end
    end
  end

  puts aa
end
aa = []
input = {"a" => 1, "b" => {"d" => 3, "c" => 2},"e" => {"f" => {"g" => {"h" => 4 }}}, "rahul" => {"gudi" => {'s' => {'o' => {'z' => "metla"}}}} }

get_all_keys(input, {})


### Just fo reference on how to use each_eith_object


# def get_em(h)
#   h.each_with_object([]) do |(k,v),keys|
#     # byebug
#     keys << k
#     keys.concat(get_em(v)) if v.is_a? Hash
#   end
# end

# hash = {"a" => 1, "b" => {"c" => {"d" => 3}}}
# print get_em(hash) #  => ["a", "b", "c", "d"]

