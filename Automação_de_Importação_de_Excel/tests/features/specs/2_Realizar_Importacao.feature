#language: pt



Funcionalidade: Criar um Orçamento e Importar um excel
-Eu como usuario 
-Quero me logar com sucesso
-Quero realizar a criação de um Orçamento com sucesso
-Quero realizar a importaçao de um orçamento de 2100 linhas com sucesso


@Importação_2


Cenario: logar com sucesso, realizar a criação do orçamento, realizar a importação do excel

Dado que irei realizado meu login na plataforma 
Quando eu realizo o login com meu usuario 
Entao eu verifico se o usuario foi logado 


Quando clico em criar orçamento 
Então preecho todas as informações necessarias para a criação do orçamento 
E verifico se o orçamento foi criado 

Quando clico em importar do excel 
Então preecho as informações corretas 
Então verifico se o excel é importado 

