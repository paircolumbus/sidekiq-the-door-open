class Door
  attr_reader :file, :state
  STATES = {
    open: 'open',
    closed: 'closed',
    opening: 'opening',
    closing: 'closing',
    ostopped: 'stopped_while_opening',
    cstopped: 'stopped_while_closing'
  }

  def initialize(file: 'door.txt', new_state: STATES[:open])
    @file = file
    @state = new_state
  end

  def push_button
    case state
    when STATES[:open] then closing
    when STATES[:closed] then opening
    when STATES[:opening] then ostopped
    when STATES[:closing] then cstopped
    when STATES[:ostopped] then closing
    when STATES[:cstopped] then opening
    end
  end

  def finish
    return if state != STATES[:closing] && state != STATES[:opening]
    state == STATES[:closing] ? closed : open
  end

  STATES.each_key do |k|
    define_method(k) { @state = STATES[k] }
  end
end
