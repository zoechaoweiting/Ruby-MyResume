module HelloKitty
  module Encoder
    def self.encode_password(password)
        Digest::SHA1.hexdigest(salted_string(password))
    end
    def self.salted_string(str)
      c = ["a", "b", "c", "d", "e", "f"]
      part_a = str.chars[0..5].map.with_index { |v, i|
        v + c[i]
      }.join
      part_b = str.chars[6..].join
      "z#{part_a}#{part_b}y"
    end
  end
end