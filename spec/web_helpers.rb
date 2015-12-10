def sign_in_and_play
  visit '/'
  fill_in(:player_1_name, with: 'Johnny Cash')
#  fill_in(:player_2_name, with: 'Bruce Springsteen')
  click_button('Submit')
end

def attack_and_ok
  click_link'Attack'
  click_link('Ok')
end

def attack_and_ok_twice
  click_link'Attack'
  click_link('Ok')
  click_link('Ok')
end
