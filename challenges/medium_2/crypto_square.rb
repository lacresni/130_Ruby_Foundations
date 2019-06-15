class Crypto
  def initialize(text)
    @text = text
    @square_size = 0
  end

  def normalize_plaintext
    @text.downcase.gsub(/[^0-9a-z]/, '')
  end

  def size
    @text = normalize_plaintext()
    text_len = @text.length
    sqrt = Math.sqrt(text_len).floor # keep rounded integer value
    square_size = sqrt
    square_size += 1 unless sqrt * sqrt == text_len
    square_size
  end

  def plaintext_segments
    @square_size = size()
    normalize(@text, @square_size)
  end

  def ciphertext
    cipher_text = ''
    segments = plaintext_segments()
    0.upto(@square_size) do |index|
      segments.each do |segment|
        letter = segment[index]
        cipher_text << letter unless letter.nil?
      end
    end
    cipher_text
  end

  def normalize_ciphertext
    cipher_text = ciphertext()
    normalize(cipher_text, @square_size).join(' ')
  end

  private

  def normalize(raw_text, square_size)
    segments = []
    index = 0
    while index + square_size < raw_text.length
      segments << raw_text[index, square_size]
      index += square_size
    end
    segments << raw_text[index..-1] if index < raw_text.length
    segments
  end
end
