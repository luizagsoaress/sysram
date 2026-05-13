# Sysram

![C](https://img.shields.io/badge/C-03599C?style=for-the-badge&logo=c&logoColor=white)
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

## Sobre

sysram é uma ferramenta para monitorar a quantidade de memória RAM utilizada pela máquina, criada pensando nos usuários Linux. Ao atingir os picos de memória definidos, uma notificação aparece na tela do usuário. As metas podem ser configuradas no monitor visual.

## Tecnologias

| Tecnologias | Uso |
|---|---|
| Shell Script | Monitoramento da RAM, lógica de alertas e notificações |
| C | Decodificação e leitura dos dados de memória |
| Makefile | Automação da instalação e execução do serviço |

## Como usar? 

> Primeiro, instale as dependências necessárias (se a sua distro for diferente das abaixo, procure na respectiva wiki/foruns) :

```bash
# Ubuntu/Debian
sudo apt install zenity dunst gcc bc

# Arch
sudo pacman -S zenity dunst gcc bc

# Fedora
sudo dnf install zenity dunst gcc bc
```

> No terminal, rode os seguintes comandos:

```bash
 git clone https://github.com/luizagsoaress/sysram.git

 cd sysram

 # No próximo passo, uma pequena janela vai se abrir e pedir por uma meta inicial, junto de um multiplicador
 # Meta: qualquer valor entre 0 e a RAM total da máquina
 # Multiplicador: qualquer valor maior que 1
 make install
```

## Run

> Depois da instalação, rode com: 

```bash
 make run
```

