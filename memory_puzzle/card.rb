


#Common problem: Having issues with #hide and #reveal? Try testing small. Accessing this on GitHub? Use this link.

class Card
    ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    attr_reader :face_value

  def initialize
    @face_value = ALPHABET.split("").sample
    @face_up = false
    @face_down = true
  end

  def display_card
    @face_value if @face_up
  end

  def hide
    @face_up = false
    @face_down = true
  end

  def reveal
    @face_up = true
    @face_down = false
  end

  def == (other_card)
    self.face_value == other_card.face_value
  end

end
