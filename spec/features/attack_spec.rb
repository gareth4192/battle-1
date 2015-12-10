feature 'Attack' do

  # As Player 1,
  # So I can win a game of Battle,
  # I want to attack Player 2, and I want to get a confirmation

  scenario 'Attacking player 2' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Johnny Cash attacked Bruce Springsteen'
  end

  scenario 'reduce Player 2 HP by 10' do
     sign_in_and_play
     click_link'Attack'
     click_link 'Ok'
     expect(page).not_to have_content 'Bruce Springsteen: 60HP'
     expect(page).to have_content 'Bruce Springsteen: 50HP'
   end

   scenario 'reduce Player 1 HP by 10' do
     sign_in_and_play
     click_link'Attack'
     click_link 'Ok'
     click_link'Attack'
     click_link 'Ok'
     expect(page).to have_content 'Johnny Cash: 50HP'
   end

  #  As a Player,
  #  So I can Lose a game of Battle,
  #  I want to see a 'Lose' message if I reach 0HP first
   scenario '' do
     sign_in_and_play
     10.times { attack_and_ok }
     click_link'Attack'
     expect(page).to have_content 'Game Over! Johnny Cash wins'
   end
end
