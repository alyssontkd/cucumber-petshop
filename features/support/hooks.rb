Before() do
  visit ''
end

After do |scenario|
  nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
  nome_cenario = nome_cenario.gsub(' ', '_').downcase!
  screenshot = "log/screenshots/#{nome_cenario}.png"
  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'Confira a evidência')
end

#After() do
  #@logoff = LogoffPage.new
  #@logoff.fazlogoff
#end
