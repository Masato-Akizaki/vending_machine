require "poker/player.rb"
require "poker/deck.rb"

class Game
  HANDS = %i{ high_card flush straight pair straight_flush }
  attr_reader :players, :deck
  
  def initialize
    @players = [Player.new(name: "P1"), Player.new(name: "P2")]
    @deck = Deck.new
  end

  def next
    @deck = Deck.new
    @players.each{ |p| p.next_game }
  end

  def join(name)
    players << Player.new(name: name)
    players.last
  end

  def deal_2cards
    2.times { players.each{ |p| p.cards << @deck.deck.pop } }
    sort_card
    players.map{ |p| [p.name, p.cards.map { |c| c.notation }] }
  end

  def sort_card
    players.each{ |p| 
      p.cards.sort_by!{ |c| Card::RANKS.index(c.rank) } 
      p.cards.reverse! if twoA?( Card::RANKS.index(p.cards[0].rank), Card::RANKS.index(p.cards[1].rank) )
     }
  end

  def twoA?(a, b)
    (a-b).abs == 12
  end

  def player(name)
    players.detect { |p| p.name == name }
  end

  def judge_hands
    players.each{ |p| p.judge_hand }
    players.map{ |p| [p.name, p.hand] }
  end

  def compare
    judge_hands
    compare_hands
    compare_ranks if @result == "same the hand"
    compare_other_ranks if @result == "same the most rank"
    @result
  end

  def compare_hands
    strength = players.map{ |p| HANDS.index(p.hand) }
    if strength[0] > strength[1]
      @result = "WINNER: #{players[0].name}, #{players[0].hand}, #{players[0].cards.map{ |c| c.notation }}"
    elsif strength[0] < strength[1]
      @result = "WINNER: #{players[1].name}, #{players[1].hand}, #{players[1].cards.map{ |c| c.notation }}"
    else
      @result = "same the hand"
    end
  end

  def compare_ranks
    rank_strength = players.map{ |p| p.cards.map{ |c| Card::RANKS.index(c.rank) } }
    if rank_strength[0][1] > rank_strength[1][1]
      @result = "WINNER: #{players[0].name}, #{players[0].hand}, #{players[0].cards.map{ |c| c.notation }}"
    elsif rank_strength[0][1] < rank_strength[1][1]
      @result = "WINNER: #{players[1].name}, #{players[1].hand}, #{players[1].cards.map{ |c| c.notation }}"
    else
      @result = "same the most rank"
    end
  end

  def compare_other_ranks
    rank_strength = players.map{ |p| p.cards.map{ |c| Card::RANKS.index(c.rank) } }
    if rank_strength[0][0] > rank_strength[1][0]
      @result = "WINNER: #{players[0].name}, #{players[0].hand}, #{players[0].cards.map{ |c| c.notation }}"
    elsif rank_strength[0][0] < rank_strength[1][0]
      @result = "WINNER: #{players[1].name}, #{players[1].hand}, #{players[1].cards.map{ |c| c.notation }}"
    else
      @result = "It is a draw"
    end
  end

end