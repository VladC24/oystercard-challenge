require 'oystercard'

describe Oystercard do
subject(:card) {described_class.new}


  it "has a balance" do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it "allows customer to top up" do
      expect(subject).to respond_to(:top_up).with(1).argument
  end

    it "raise an error when limit reached" do
      subject.top_up(90)
      expect{ subject.top_up(1) }.to raise_error("top up (#{Oystercard::MAXIMUM_AMOUNT}) limit reached")
    end
  end

  describe "#deduct" do
    it "deducts from oyster card balance" do
    card = Oystercard.new(50)
    card.deduct(20)
    expect(card.balance).to eq(30)
    end
  end

  # describe "#in_journey?" do
  #   it "checks journey status" do
  #   expect(subject.in_journey?).to eq journey
  #   end
  # end

  describe "#touch_in" do
      it "start journey" do
      card = Oystercard.new(5)
      card.touch_in
      expect(card).to be_in_journey
      end

      it "raises an error if card balance too low" do
      expect { card.touch_in }.to raise_error("insufficient travel funds")
      end
    end

    describe "#touch_out" do
      it "ends journey" do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

end
