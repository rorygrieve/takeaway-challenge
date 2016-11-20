require 'order'

describe Order do

  context '#initialize' do

    it "current_order_price should return 0 at start" do
      expect(subject.current_order_price).to eq 0
    end

    it { is_expected.to respond_to :menu }

    it { is_expected.to respond_to :message }

  end

  context 'tests #order is working' do

    it 'should return the pizza and the amount ordered when 1 pizza is ordered' do
      expect(subject.order("margherita", 1)).to eq "You have ordered 1 margherita(s)."
    end

  end

    context "eliminating edge case orders" do

      it "should return an error when less than 1 item is ordered" do
        expect{subject.order("margherita", 0)}.to raise_error "Cannot add item(s): quantity is less than one."
      end

      it "should return an error when item is not entered correctly" do
        expect{subject.order("marg", 9)}.to raise_error "Cannot store order: no such item exists."
      end

    end

  context "tests #bill is working" do

    before do
      subject.order("margherita", 1)
    end

    it "should return 9 when 1 margherita is ordered" do
      expect(subject.current_order_price).to eq 9
    end

    it "should return 19 when 1 pizza and 1 pepperoni are ordered" do
      subject.order("pepperoni", 1)
      expect(subject.current_order_price).to eq 19
    end

    it "should work when more than 1 item is ordered" do
      subject.order("pepperoni", 2)
      expect(subject.current_order_price).to eq 29
    end

  end

  context "#expected_total" do

    it "Should return message when order is finished" do
      subject.order("margherita", 1)
      expect(subject.expected_total(9)).to eq "Thank you for your order. A text message confirming the order is on its way."
    end

    it "should show other message if total is incorrect" do
      subject.order("margherita", 1)
      expect(subject.expected_total(10)).to eq "Your total is wrong: please enter the correct total."
    end

  end


end
