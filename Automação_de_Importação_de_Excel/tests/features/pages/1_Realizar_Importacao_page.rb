class User < SitePrism::Page
  
  # Elementos login
  set_url 'login/new'
  element :nome, '#email'
  element :senha, '#senha'
  element :entrar, 'button[class="btn submit btn-success"]'
  
  # Elementos criar orçamento
  element :criar_versao_new, '#orc_orcamento_version_2023_true'
  element :criar_versao_old, '#version_2023_old'
  element :orc_cod, '#orc_orcamento_codigo'
  element :orc_desc,'#orc_orcamento_descricao'
  element :botao_1, '#check-btn'
  element :botao_2, 'input[class="btn btn-primary rounded pb-2 pt-2 pr-5 pl-5"]'
  

  # Seleção de Bases
  element :sbc, '#SBC_exibir_relatorio'
  element :sicro,'#SICRO3_exibir_relatorio'
  element :siurb,'#SIURB_exibir_relatorio'
  element :fde,'#FDE_exibir_relatorio'
  element :siurb,'#SIURB_INFRA_exibir_relatorio'
  element :cpos,'#CPOS_exibir_relatorio'
  element :emop,'#EMOP_exibir_relatorio'
  element :sco,'#SCO_exibir_relatorio'
  element :setop,'#SETOP_exibir_relatorio'
  element :sudecap,'#SUDECAP_exibir_relatorio'
  element :iopes,'#IOPES_exibir_relatorio'
  element :orse,'#ORSE_exibir_relatorio'
  element :seinfra,'#SEINFRA_exibir_relatorio'
  element :caema,'#CAEMA_exibir_relatorio'
  element :embasa,'#EMBASA_exibir_relatorio'
  element :caern,'#CAERN_exibir_relatorio'
  element :compesa,'#COMPESA_exibir_relatorio'
  element :agesul,'#AGESUL_exibir_relatorio'
  element :agetop_civil,'#AGETOP_CIVIL_exibir_relatorio'
  element :agetop_rodo,'#AGETOP_RODOVIARIA_exibir_relatorio'
  element :sedop,'#SEDOP_exibir_relatorio'
  element :derpr,'#DERPR_exibir_relatorio'
  

  #Importar excel
  element :upload, '#arquivo'
  element :linha_inicial, '#linha_inicio'
  element :linha_final,'#linha_fim'
  element :botao_proximo, 'a.buttonNext'
  element :botao_concluir, 'a.buttonFinish'
  element :ir_para_orcamento, 'a.btn.btn-primary'


  # Método de login
  def logar_usuario
    nome.set 'haianvbsantos@gmail.com'
    senha.set ''
    entrar.click
  end

  # Método de criação de orçamento
  def criar_orcamento
    visit '/orc/orcamentos/new'
  end

  # Método de clicar no botão salvar
  def clica_botao_salvar
    page.execute_script("document.querySelector('input[name=\"commit\"][value=\"Salvar\"]').click();")
  end

  # Método para preencher as informações do orçamento
  def info_orcamento
    criar_versao_new.click
    orc_desc.set 'Teste Automatizado new 1'
    botao_1.click
    botao_2.click
    sbc.click
    clica_botao_salvar
  end
  
  # Método de upload do arquivo
  def upload_arquivo(caminho_arquivo)
    attach_file('arquivo', caminho_arquivo)
  end

  #Metodo upload excel
  def upload
    visit current_url + '/excel_imports/new'
   
    caminho_arquivo = File.expand_path('features/sintetico.xlsx') 
    
    # Realiza o upload
    upload_arquivo(caminho_arquivo)
  end

  def prencher_info_import
    linha_inicial.set '5'
    linha_final.set '130'
    botao_proximo.click
    sleep(2)
    botao_proximo.click
    sleep(2)
    botao_concluir.click
    sleep(60)
    ir_para_orcamento.click
    sleep(10)
  end
end
