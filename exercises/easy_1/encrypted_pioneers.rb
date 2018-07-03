ENCRYPTED_NAMES = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"
]

def rot13(char)
  case char
  when ('a'..'m'), ('A'..'M') then (char.ord + 13).chr
  when ('n'..'z'), ('N'..'Z') then (char.ord - 13).chr
  else                              char
  end
end

def decipher_name(name)
  name.each_char.map { |char| rot13(char) }.join('')
end

ENCRYPTED_NAMES.each do |encrypted_name|
  puts decipher_name(encrypted_name)
end
