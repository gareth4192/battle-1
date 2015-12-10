feature 'View hitpoints' do

  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points

  before do
    allow(Kernel).to receive(:rand) {10}
  end

  scenario 'viewing player 2\'s hitpoints' do
    sign_in_and_play
    expect(page).to have_content 'Computer: 60HP'
  end

  scenario 'viewing player 1\'s hitpoints' do
    sign_in_and_play
    expect(page).to have_content 'Johnny Cash: 60HP'
  end
end
