feature 'Switch turns' do


  scenario 'shows switch in players' do
    sign_in_and_play
    click_link'Attack'
    click_link 'Ok'
    click_link 'Attack'
    click_link 'Ok'
    expect(page).not_to have_content 'Bruce Springsteen: 40HP'
  end

  # scenario 'shows attac confirmation with switched players' do
  #   sign_in_and_play
  #   click_link'Attack'
  #   click_link 'Ok'
  #   click_link 'Attack'
  #   expect(page).to have_content 'Bruce Springsteen: 40HP'
  # end


end
