require 'rspec'
require_relative './garage_door'

describe Door do
  describe 'writing to a file' do
    #level 1
    it 'saves state in a file'
    it 'reads state from a file'
  end

  let(:door) { described_class.new }
  describe '#push_button' do
    it 'changes to closing when open' do
      door.open
      door.push_button
      expect(door.state).to eq 'closing'
    end

    it 'when closing, it changes to stopped_while_closing' do
      door.closing
      door.push_button
      expect(door.state).to eq 'stopped_while_closing'
    end

    it 'when pushed while stopped, it opens' do
      door.cstopped
      door.push_button
      expect(door.state).to eq 'opening'
    end

    it 'changes to opening when closed' do
      door.closed
      door.push_button
      expect(door.state).to eq 'opening'
    end

    it 'when opening, it changes to stopped_while_opening' do
      door.opening
      door.push_button
      expect(door.state).to eq 'stopped_while_opening'
    end

    it 'when pushed while stopped_while_opening, it closes' do
      door.ostopped
      door.push_button
      expect(door.state).to eq 'closing'
    end
  end

  describe '#finish' do
    it 'eventually it should be closed' do
      door.push_button
      door.finish
      expect(door.state).to eq 'closed'
    end

    it 'opens when opening' do
      door.opening
      door.finish
      expect(door.state).to eq 'open'
    end

    it 'returns nil if not closing or opening' do
      door.cstopped
      door.finish
      expect(door.state).to eq 'stopped_while_closing'
    end
  end

  context 'when new' do
    it 'state will be open' do
      expect(door.state).to eq 'open'
    end
  end

  context 'when closed' do
    before { door.closed }
    it 'state will be closed' do
      expect(door.state).to eq 'closed'
    end
  end
end
