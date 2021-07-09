class BlackJack

  def initialize
    @card = []
    @sum = 0
    1.upto(2){ @card = output(@card) }
    check
  end

  def distribute_card
    (Random.rand * 13 + 1).to_i
  end

  def bj(card_num)
    count_point(card_num.to_i)
    return "J" if card_num == 11
    return "Q" if card_num == 12
    return "K" if card_num == 13
    return "A" if card_num == 1
    return  card_num.to_s
  end

  def count_point(num)
    num >= 10 ? @sum += 10 : @sum += num
  end

  def output(card)
    card.push bj(distribute_card)
    puts "引いたカードは#{card[-1]}です。"
    card
  end

  def end_game 
    @card.each {|c| @sum += 10 if (c == "A" && @sum <= 11) }
    puts "得点は#{@sum}点です。"
    puts win if @sum == 21
    puts lose if @sum > 21
    exit
  end

  def win
    puts "あなたの勝利です！"
  end

  def lose
    puts "あなたの敗北です・・・。"
  end

  def check
    puts "追加のカードを引きますか？ \n 手札 ： #{@card.join' , '}\n ※nilで1枚引きます。  nil以外で終了します。"
    end_game if gets.chomp != "" # nil以外ならプレーヤー判断でゲーム終了
    @card = output(@card)
    end_game if @sum >= 21 # 21以上なら、強制的にゲーム終了
    check
  end

end


bj = BlackJack.new

