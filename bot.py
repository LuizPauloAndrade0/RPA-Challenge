import time
import webbrowser
from selenium import webdriver
from selenium.webdriver.common.keys import Keys


class bot():
    def __init__(self):
        self.Nome = input('Digite o nome: ')
        self.Email = input('Digite o email: ')
        self.Cep = input('Digite o Cep: ')
        self.Estado = input('Digite o estado: ')
        self.Cidade = input('Digite o cidade: ')
        self.Assunto = input('Digite o assunto: ')
        self.Telefone = input('Digite o telefone: ')
        self.Mensagem = input('Digite o Mensagem: ')

        self.drive = webdriver.Chrome(executable_path=r'C:\Users\Win-Pc\Desktop\RPA\chromedriver.exe')
    def preencherForms(self): 
         drive = self.drive
         drive.get('https://seguralta.com.br/site/contato')
         
         time.sleep(3)

         Nome = drive.find_element_by_xpath('//*[@id="name"]')
         
         Email = drive.find_element_by_xpath('//*[@id="email"]')

         Cep = drive.find_element_by_xpath('//*[@id="cep"]')

         Estado = drive.find_element_by_xpath('//*[@id="estado"]')

         Cidade = drive.find_element_by_xpath('//*[@id="cidade"]')

         Assunto = drive.find_element_by_xpath('//*[@id="assunto"]')

         Telefone = drive.find_element_by_xpath('//*[@id="telefone"]')

         Mensagem = drive.find_element_by_xpath('//*[@id="mensagem"]')

         Botão = drive.find_element_by_xpath('//*[@id="formcontato"]/div[4]/div[2]/input')

         Nome.send_keys(self.Nome)
         Email.send_keys(self.Email)
         Cep.send_keys(self.Cep)
         Estado.send_keys(self.Estado)
         Cidade.send_keys(self.Cidade)
         Assunto.send_keys(self.Assunto)
         Telefone.send_keys(self.Telefone)
         Mensagem.send_keys(self.Mensagem)

         Botão.click()



      
bot = bot() 
bot.preencherForms()



