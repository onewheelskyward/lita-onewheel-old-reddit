require 'spec_helper'

describe Lita::Handlers::OnewheelOldReddit, lita_handler: true do
  it 'will fix the uri' do
    send_message 'https://www.reddit.com/r/xyz'
    expect(replies.last).to eq('https://old.reddit.com/r/xyz')
  end

  it 'will fix the other uri' do
    send_message 'https://reddit.com/r/xyz'
    expect(replies.last).to eq('https://old.reddit.com/r/xyz')
  end
end
