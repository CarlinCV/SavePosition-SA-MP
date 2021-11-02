This is one of the first contributions of my 'Carlos Victor' to the SA-MP community, it's a totally useful contribution in the lives of Mobile programmers that doesn't have the native /save function that saves coordinates and some extra information...

Essa é minha primeira contribuição para comunidade SA-MP, é algo que visa ajudar os jogadores mobile que não tem acesso ao comando /save e precisa de um comando para programar seus servidores.

Tutorial:
Clique em 'CODE' e selecione a opção 'Dowload ZIP' e aguarde o dowload finalizar.
![image](https://user-images.githubusercontent.com/91024125/139879753-a0cdc351-82d8-438f-afa7-6ba2b7bee4c2.png)


Após o dowload, abra o arquivo.zip e mova(extrai) o arquivo 'filterscript' para sua gamemode.
![image](https://user-images.githubusercontent.com/91024125/139879870-6a4a8da9-4126-490e-9b22-3f200df91834.png)


Inclua o nome do arquivo 'saveposition' na linha 'filterscripts' do arquivo server.cfg da sua gamemode.
![image](https://user-images.githubusercontent.com/91024125/139880015-dbfb5aba-2f06-4b5e-9781-831bb6f1ec6f.png)

E pronto, ao ser instalado verifica no 'server-log.txt' se foi iniciado com sucesso e use! 

### Comando para salvar posições: /savepos [Comentário (Opcional)]
Exemplo: /savepos Checkpoint 1 | /savepos

### Syntax de salvamento é simples.
SkinID, PosX, PosY, PosZ, Angle, InteriorID, VirtualWorldID //Comentário

VehicleID, PosX, PosY, PosZ, Angle, InteriorID, VirtualWorldID //Comentário
![image](https://user-images.githubusercontent.com/91024125/139883387-33e97f63-63cc-4c99-8ac0-a5a1054fc219.png)
