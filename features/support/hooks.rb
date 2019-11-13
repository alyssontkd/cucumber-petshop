require "report_builder"

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

at_exit do

  @infos = {
      'Aplicação' => "Nome do Sistema",
      'Ambiente' =>  "#{AMBIENTE}",
      'Data e Hora' => DateTime.now
  }

  ReportBuilder.configure do |config|
    config.input_path = "log/report.json"
    config.report_path = "log/report"
    config.report_types = [:html]
    config.color = "indigo"
    config.report_title = "Nome do Sistema"
    config.additional_info = @infos
  end
  ReportBuilder.build_report
end

#After() do
  #@logoff = LogoffPage.new
  #@logoff.fazlogoff
#end
