require 'rspec'
require_relative './garage_door_opener'

RSpec.describe GarageDoorOpener do
  # level 2
  it 'is a sidekiq job'

  describe '#perform_async' do
    it 'calls push_button'
    it 'waits 5 seconds to finish'
  end

  # level 3
  
  describe 'handling errors' do
    it 'fails gracefully when the file cannot be reached'
    it 'handles a file currently being written to'
    it 'will not retry if the perform fails'
  end

  # level 4

  describe 'multiple openers' do
    context 'when opener 1 has pushed the button & the door is opening' do
      it 'will cause the button to be pushed'
      it 'will cause the door to stop'
      it 'will not open the door'
    end
  end

end
