#Acessar o sistema

Dado('que irei realizado meu login na plataforma') do
  
end

Quando('eu realizo o login com meu usuario') do
 user.load
 page.driver.browser.manage.window.maximize
 user.logar_usuario
 
end

Entao('eu verifico se o usuario foi logado') do
  expect(page).to have_current_path('/v2023/home')
end

#Cria um orçamento

Quando('clico em criar orçamento') do
  user.criar_orcamento
end

Então('preecho todas as informações necessarias para a criação do orçamento') do
 user.info_orcamento
end

Então('verifico se o orçamento foi criado') do
  expect(page).to have_content('Orçamento')
end

#Importar Excel
Quando('clico em importar do excel') do
 user.upload
end

Então('preecho as informações corretas') do
 user.prencher_info_import
end

Então('verifico se o excel é importado') do
 expect(page).to have_content('R$ 283.008,18')
end
