# In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:

#   High Card: Highest value card.
#   One Pair: Two cards of the same value.
#   Two Pairs: Two different pairs.
#   Three of a Kind: Three cards of the same value.
#   Straight: All cards are consecutive values.
#   Flush: All cards of the same suit.
#   Full House: Three of a kind and a pair.
#   Four of a Kind: Four cards of the same value.
#   Straight Flush: All cards are consecutive values of same suit.
#   Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

#   The cards are valued in the order:
#   2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

#   If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.

#    Consider the following five hands dealt to two players:
#    Hand		Player 1		Player 2		Winner
#    1  5H 5C 6S 7S KD   Pair of Fives      2C 3S 8S 8D TD  Pair of Eights       Player 2
#    2  5D 8C 9S JS AC   Highest card Ace   2C 5C 7D 8S QH  Highest card Queen   Player 1
#    3  2D 9C AS AH AC   Three Aces         3D 6D 7D TD QD  Flush with Diamonds  Player 2
#    4  4D 6S 9H QH QC   Pair of Queens  Highest card Nine  3D 6D 7H QD QS       Pair of Queens   Highest card Seven  Player 1
#    5  2H 2D 4C 4D 4S   Full House   With Three Fours      3C 3D 3S 9S 9D       Full House  with Three Threes Player 1

# The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.

# How many hands does Player 1 win?

HAND_ORDER = [:royal_flush, :straight_flush, :four_kind, :full_house, :flush, :straight, :three_kind, :two_pair, :one_pair, :high_card].freeze

class Card
  include Comparable
  VALUE_MAP = {
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    'T' => 10,
    'J' => 11,
    'Q' => 12,
    'K' => 13,
    'A' => 14
  }
  attr_accessor :value, :suit
  def initialize(str)
    self.suit = str[-1]
    self.value = VALUE_MAP[str[0..-2]]
  end

  def <=> (other) #1 if self>other; 0 if self==other; -1 if self<other
    self.value <=> other.value
  end

  def to_s
    "#{value}#{suit}"
  end
end

class Hand
  include Comparable
  attr_accessor :cards, :classification, :ranked_cards, :deciding_card

  def initialize(cards)
    self.classification = :unknown
    self.cards = cards
    self.cards.sort!{|a, b| a.value <=> b.value}
    classify!
  end

  def self.from_strings(card_strings)
    Hand.new(card_strings.map{|c| Card.new(c)})
  end

  def classify!
    Classifier.new.classify_hand!(self)
  end

  def <=> (other) #1 if self>other; 0 if self==other; -1 if self<other
    class_comparison = HAND_ORDER.index(other.classification) <=> HAND_ORDER.index(self.classification)
    return class_comparison unless class_comparison == 0
    deciding_card_comp = self.deciding_card <=> other.deciding_card
    return deciding_card_comp unless deciding_card_comp == 0
    # Recursively strips out highest pair and then down to highest cards....
    Hand.new(self.cards.reject{|c| c.value == deciding_card.value}) <=> Hand.new(other.cards.reject{|c| c.value == deciding_card.value})
  end

  def to_s
    "#{classification} - #{deciding_card}\n" +
      cards.join(" ")
  end
end

class Classifier

  # Cards in the hand are sorted in value order from lowest to higest
  def classify_hand!(hand)
    HAND_ORDER.any? do |hand_class|
      class_cards = send(hand_class, hand.cards)
      if class_cards
        hand.classification = hand_class
        unless hand_class == :full_house
          hand.deciding_card = class_cards[-1]
        else
          # Special case for full house.  Tie breaker will always be
          # on the Three of a kind set which may be less than the pair
          hand.deciding_card = three_kind(hand.cards)[0]
        end
      else
        false
      end
    end

  end

  private

  def royal_flush(cards)
    return cards if flush?(cards) && straight?(cards) && cards[0].value == 10
  end

  def straight_flush(cards)
    return cards if flush?(cards) && straight?(cards)
  end

  def full_house(cards)
    return cards if three_kind(cards) && one_pair(cards)
  end

  def flush(cards)
    flush?(cards) ? cards : nil
  end

  def straight(cards)
    straight?(cards) ? cards : nil
  end

  def straight?(cards)
    (0..cards.size-2).all?{ |n| cards[n].value+1 == cards[n+1].value }
  end

  def flush?(cards)
    suit = cards[0].suit
    cards.all?{|c| c.suit == suit}
  end

  def four_kind(cards)
    find_sets(cards, 1, 4)
  end

  def three_kind(cards)
    find_sets(cards, 1, 3)
  end

  def two_pair(cards)
    find_sets(cards,2)
  end

  def one_pair(cards)
    find_sets(cards,1)
  end

  def high_card(cards)
    [cards[-1]]
  end

  def find_sets(cards, set_count, set_size = 2)
    result = Hash.new(0)
    cards.each { |card| result[card.value] += 1 }
    result_value = result.select{|k,v| v ==  set_size}.keys
    return nil unless result_value.size == set_count
    cards.select{|c| result_value.include?(c.value)}
  end

end

# require 'pp'
# hands = [
#          ['5H','5C','6S','7S','KD','2C','3S','8S','8D','TD'],
#          ['5D','8C','9S','JS','AC','2C','5C','7D','8S','QH'],
#          ['2D','9C','AS','AH','AC','3D','6D','7D','TD','QD'],
#          ['4D','6S','9H','QH','QC','3D','6D','7H','QD','QS'],
#          ['2H','2D','4C','4D','4S','3C','3D','3S','9S','9D']
#         ]

hands = []
File.open("p054_poker.txt", "r").each_line { |line| hands << line.split(' ') }

p1_win_count = 0
hands.each do |cards|
  p1 = Hand.from_strings(cards[0..4])
  p2 = Hand.from_strings(cards[5..9])
  p1_win_count+=1 if p1 > p2
end

puts p1_win_count
