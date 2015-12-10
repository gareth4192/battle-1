feature 'Switch turns' do

  before do
    allow(Kernel).to receive(:rand) {10}
  end

  scenario 'shows switch in players' do
    sign_in_and_play
    2.times {attack_and_ok}
    expect(page).not_to have_content 'Bruce Springsteen: 40HP'
  end

end
