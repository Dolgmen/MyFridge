hash = {"a" => "b", "c" => "d"}
p oppo = hash.transform_values(&:upcase)
# => {"a" => "B", "c" => "D"}