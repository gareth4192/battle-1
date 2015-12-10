feature 'Attack' do

  # As Player 1,
  # So I can win a game of Battle,
  # I want to attack Player 2, and I want to get a confirmation
before do
  allow(Kernel).to receive(:rand) {10}
end
  scenario 'Attacking player 2' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Johnny Cash attacked Computer'
  end

  scenario 'reduce Player 2 HP by 10' do
     sign_in_and_play
     attack_and_ok
     expect(page).not_to have_content 'Computer: 60HP'
     expect(page).to have_content 'Computer: 50HP'
   end

   scenario 'reduce Player 1 HP by 10' do
     sign_in_and_play
     attack_and_ok
     click_link'Ok'
     expect(page).to have_content 'Johnny Cash: 50HP'
   end

  #  As a Player,
  #  So I can Lose a game of Battle,
  #  I want to see a 'Lose' message if I reach 0HP first
   scenario 'Game over message' do
     sign_in_and_play
     5.times { attack_and_ok_twice }
     click_link'Attack'
     expect(page).to have_content 'Game Over! Johnny Cash wins'
   end

   scenario 'Heals the current player' do
     sign_in_and_play
     click_link'Heal'
     expect(page).to have_content 'Johnny Cash: 70HP'
     expect(page).to have_content 'Johnny Cash you are healed'
   end
end
