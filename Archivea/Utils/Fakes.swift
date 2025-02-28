import Foundation

// Nomes dos botões falsos
let profileButtons = ["Alterar Senha", "Encerrar Sessão"]
let notificationButtons = ["Gerenciar Notificações"]
let accountButtons = ["Conectar Conta", "Desconectar Conta"]
let appearanceButtons = ["Ativar/Desativar Modo Noturno"]
let privacyButtons = ["Configurações de Privacidade", "Configurações de Segurança"]
let storageButtons = ["Sincronizar Dados", "Limpar Cache"]
let updateButtons = ["Atualizar Aplicativo", "Verificar Atualizações"]
let supportButtons = ["Feedback", "Ajuda e Suporte", "Sobre o Aplicativo"]

var fakeUser: [User] = [
    User(name: "Ana Beatriz Carvalho de Meneses", handle: "lirio", bio: "Do Ps2 ao Ps4, colecionadora fervorosa.", isWhatsappPublic: true, createdAt: .now, avatar: "user1", phone: "85997684672"),
    User(name: "João Gabriel Aguiar de Senna", handle: "jotagezim", bio: "Oiii, meu nome João Gabriel.\nAmo Jesus Cristo ✝️\nGosto de programar 👨‍💻\nColeciono algumas coisas!", isWhatsappPublic: false, createdAt: .now, avatar: "user2", phone: "85991422296"),
    User(name: "Ana Paula Sena Silva", handle: "ana.sena", bio: "Olá, espero que goste das minhas câmeras, um bom apreciador de câmera sabe o amor por elas. Espero que divirta-se vendo as variedades de lentes e acessorios, me chame se quiser trocar algumas.", isWhatsappPublic: true, createdAt: .now, avatar: "user3", phone: "85994247927"),
    User(name: "Ismael Lira Nascimento", handle: "maelkk", bio: "Olá, amo colecionar itens clássicos, espero que goste desses itens, pode chamar a qualquer momento se tiver interesse!", isWhatsappPublic: true, createdAt: .now, avatar: "user4", phone: "85991651334")
]

var fakeCollections: [FakeCollection] = [
    FakeCollection(id: 1, name: "Jogos e Consoles", isPrivate: false, image: "gameboy", author: fakeUser[3]),
    FakeCollection(id: 2, name: "Música e Áudio", isPrivate: false, image: "walkman", author: fakeUser[1]),
    FakeCollection(id: 3, name: "Fotografia", isPrivate: false, image: "cybershot", author: fakeUser[2]),
    FakeCollection(id: 4, name: "Computadores e Gadgets", isPrivate: false, image: "ibm5150", author: fakeUser[0]),
    FakeCollection(id: 5, name: "Brinquedos", isPrivate: false, image: "tamagotchi", author: fakeUser[0]),
    FakeCollection(id: 6, name: "Mídia e Entretenimento", isPrivate: false, image: "et_vhs", author: fakeUser[1]),
    FakeCollection(id: 7, name: "Pokémon TCG", isPrivate: false, image: "carta", author: fakeUser[3])
]

var previewMyProfile = MyProfile(name: "João Gabriel", handle: "jotagezim", isWhatsappPublic: true, createdAt: .now, phone: "123", password: "jotage123", email: "jotage@gmail.com", isLogged: true)

// Coleção 0 - User 0
// Coleção 1 - User 1
// Coleção 2 - User 2
// Coleção 3 - User 3
// Coleção 4 - User 0
// Coleção 5 - User 1


var fakePosts: [Post] {
    return [
        .init(
            id: 1,
            name: "Câmera Cybershot DSC-W620",
            desc: "Eu ganhei essa câmera de aniversário de 17 anos da minha tia Cláudia. Amei!",
            photo: "cybershot",
            preservation: 5,
            fields: [
                .init(fieldName: "Ano", fieldValue: "2012"),
                .init(fieldName: "Marca", fieldValue: "Sony")
            ],
            collection: fakeCollections[2]
        ),
        .init(
            id: 2,
            name: "Disco de Vinil - Beatles Abbey Road",
            desc: "Disco original de 1969, encontrado em um sebo em Londres. Estado de conservação excepcional.",
            photo: "disco",
            preservation: 5,
            fields: [
                .init(fieldName: "Local", fieldValue: "Londres"),
                .init(fieldName: "Ano", fieldValue: "1969")
            ],
            collection: fakeCollections[1]
        ),
        .init(
            id: 3,
            name: "Mangá Haikyuu!! Volume 01",
            desc: "Primeira edição japonesa do mangá Haikyuu!!, comprada em Akihabara durante minha viagem ao Japão.",
            photo: "manga",
            preservation: 4,
            fields: [
                .init(fieldName: "Idioma", fieldValue: "Japonês"),
                .init(fieldName: "Ano", fieldValue: "2012")
            ],
            collection: fakeCollections[5]
        ),
        .init(
            id: 4,
            name: "Álbum de Figurinhas Copa 1994 Completo",
            desc: "Álbum da Copa do Mundo de 1994 completamente preenchido, incluindo figurinhas raras.",
            photo: "album_copa",
            preservation: 4,
            fields: [
                .init(fieldName: "Estado", fieldValue: "Completo"),
                .init(fieldName: "Editora", fieldValue: "Panini")
            ],
            collection: fakeCollections[5]
        ),
        .init(
            id: 5,
            name: "Console Nintendo 64 Pikachu Edition",
            desc: "Edição especial do N64 em perfeito estado. Veio com caixa original e todos os cabos.",
            photo: "n64_pikachu",
            preservation: 5,
            fields: [
                .init(fieldName: "Ano", fieldValue: "1999"),
                .init(fieldName: "Região", fieldValue: "Japonesa")
            ],
            collection: fakeCollections[0]
        ),
        .init(
            id: 6,
            name: "Walkman Sony WM-F2015",
            desc: "Walkman azul em ótimo estado. Funciona perfeitamente e vem com fones originais.",
            photo: "walkman",
            preservation: 4,
            fields: [
                .init(fieldName: "Década", fieldValue: "1980"),
                .init(fieldName: "Cor", fieldValue: "Azul")
            ],
            collection: fakeCollections[1]
        ),
        .init(
            id: 7,
            name: "Tamagotchi Original 1996",
            desc: "Primeiro modelo de Tamagotchi lançado. Ainda funciona com a bateria original!",
            photo: "tamagotchi",
            preservation: 3,
            fields: [
                .init(fieldName: "Versão", fieldValue: "P1"),
                .init(fieldName: "Cor", fieldValue: "Rosa")
            ],
            collection: fakeCollections[4]
        ),
        .init(
            id: 8,
            name: "Carta Mewtwo EX 058/182 Pokémon TCG",
            desc: "Mewtwo EX Tera 058/182\nCarta ultra rara da coleção Fenda Paradoxal, comprada direto dos Estados Unidos, em perfeito estado. Guardada em sleeve (plástico protetor) desde a compra.",
            photo: "carta",
            preservation: 5,
            fields: [
                .init(fieldName: "Idioma", fieldValue: "Inglês"),
                .init(fieldName: "Coleção", fieldValue: "Fenda Paradoxal"),
                .init(fieldName: "Ano", fieldValue: "2023")
            ],
            collection: fakeCollections[6]
        ),
        .init(
            id: 9,
            name: "Game Boy Color Transparente",
            desc: "Console portátil em edição transparente, com todos os botões originais funcionando.",
            photo: "gameboy",
            preservation: 4,
            fields: [
                .init(fieldName: "Modelo", fieldValue: "CGB-001"),
                .init(fieldName: "Ano", fieldValue: "1998")
            ],
            collection: fakeCollections[0]
        ),
        .init(
            id: 10,
            name: "Bichinho Virtual Gigapets",
            desc: "Versão dinossauro do Gigapets, popular nos anos 90. Com embalagem original.",
            photo: "gigapet",
            preservation: 5,
            fields: [
                .init(fieldName: "Tipo", fieldValue: "Dinossauro"),
                .init(fieldName: "Fabricante", fieldValue: "Tiger Electronics")
            ],
            collection: fakeCollections[4]
        ),
        .init(
            id: 11,
            name: "Discman Sony D-EJ01",
            desc: "Discman anti-shock com design slim. Acompanha case original e fones.",
            photo: "discman",
            preservation: 4,
            fields: [
                .init(fieldName: "Ano", fieldValue: "2001"),
                .init(fieldName: "Cor", fieldValue: "Prata")
            ],
            collection: fakeCollections[1]
        ),
        .init(
            id: 12,
            name: "Cartucho Street Fighter II SNES",
            desc: "Cartucho original japonês, funcionando perfeitamente. Label em ótimo estado.",
            photo: "streetfighter",
            preservation: 4,
            fields: [
                .init(fieldName: "Região", fieldValue: "NTSC-J"),
                .init(fieldName: "Ano", fieldValue: "1992")
            ],
            collection: fakeCollections[0]
        ),
        .init(
            id: 13,
            name: "Furby Original 1998",
            desc: "Furby da primeira geração, ainda falando e respondendo normalmente.",
            photo: "furby",
            preservation: 3,
            fields: [
                .init(fieldName: "Geração", fieldValue: "Primeira"),
                .init(fieldName: "Cor", fieldValue: "Marrom/Branco")
            ],
            collection: fakeCollections[4]
        ),
        .init(
            id: 14,
            name: "Mini Game Brick Game 9999 in 1",
            desc: "Console portátil com jogos básicos como Tetris e Snake. Funciona com pilhas.",
            photo: "brickgame",
            preservation: 4,
            fields: [
                .init(fieldName: "Jogos", fieldValue: "9999"),
                .init(fieldName: "Cor", fieldValue: "Amarelo")
            ],
            collection: fakeCollections[0]
        ),
        .init(
            id: 15,
            name: "Pager Motorola Advisor",
            desc: "Bip em perfeito estado de conservação, com clip e display funcionando.",
            photo: "pager",
            preservation: 5,
            fields: [
                .init(fieldName: "Modelo", fieldValue: "Advisor"),
                .init(fieldName: "Ano", fieldValue: "1995")
            ],
            collection: fakeCollections[3]
        ),
        .init(
            id: 16,
            name: "Máquina Fotográfica Polaroid OneStep",
            desc: "Câmera instantânea vintage, testada e funcionando. Inclui manual original.",
            photo: "polaroid",
            preservation: 4,
            fields: [
                .init(fieldName: "Modelo", fieldValue: "OneStep"),
                .init(fieldName: "Década", fieldValue: "1970")
            ],
            collection: fakeCollections[2]
        ),
        .init(
            id: 17,
            name: "Genius Paint Pad",
            desc: "Mesa digitalizadora antiga da Genius, com caneta original e software.",
            photo: "paintpad",
            preservation: 3,
            fields: [
                .init(fieldName: "Conexão", fieldValue: "Serial"),
                .init(fieldName: "Ano", fieldValue: "1998")
            ],
            collection: fakeCollections[3]
        ),
        .init(
            id: 18,
            name: "Fita VHS E.T. O Extraterrestre",
            desc: "Filme em VHS original, primeira edição brasileira. Capa em ótimo estado.",
            photo: "et_vhs",
            preservation: 4,
            fields: [
                .init(fieldName: "Ano", fieldValue: "1983"),
                .init(fieldName: "Dublagem", fieldValue: "Português")
            ],
            collection: fakeCollections[1]
        ),
        .init(
            id: 19,
            name: "Palm Pilot Professional",
            desc: "PDA clássico em excelente estado. Com dock de sincronização original.",
            photo: "palm",
            preservation: 5,
            fields: [
                .init(fieldName: "Modelo", fieldValue: "Professional"),
                .init(fieldName: "Ano", fieldValue: "1997")
            ],
            collection: fakeCollections[3]
        ),
        .init(
            id: 20,
            name: "Boneco Action Man Extremo",
            desc: "Boneco articulado com todos acessórios originais e roupas da época.",
            photo: "actionman",
            preservation: 4,
            fields: [
                .init(fieldName: "Linha", fieldValue: "Extremo"),
                .init(fieldName: "Ano", fieldValue: "1999")
            ],
            collection: fakeCollections[4]
        ),
        .init(
            id: 21,
            name: "PC IBM 5150",
            desc: "Primeiro PC IBM lançado, funcionando perfeitamente. Com monitor original.",
            photo: "ibm5150",
            preservation: 4,
            fields: [
                .init(fieldName: "Processador", fieldValue: "8088"),
                .init(fieldName: "Ano", fieldValue: "1981")
            ],
            collection: fakeCollections[3]
        ),
        .init(
            id: 22,
            name: "Tazos Coleção Completa Looney Tunes",
            desc: "Coleção completa de tazos dos Looney Tunes, incluindo os holográficos.",
            photo: "tazos",
            preservation: 5,
            fields: [
                .init(fieldName: "Quantidade", fieldValue: "50"),
                .init(fieldName: "Ano", fieldValue: "1996")
            ],
            collection: fakeCollections[5]
        ),
        .init(
            id: 23,
            name: "Agenda Eletrônica Sharp Zaurus",
            desc: "Agenda eletrônica japonesa com teclado QWERTY e tela touch.",
            photo: "zaurus",
            preservation: 4,
            fields: [
                .init(fieldName: "Modelo", fieldValue: "ZR-5800"),
                .init(fieldName: "Ano", fieldValue: "1996")
            ],
            collection: fakeCollections[3]
        ),
        .init(
            id: 24,
            name: "Carta Absol 113/182 Pokémon TCG",
            desc: "Absol 113/182\nCarta da coleção Fenda Paradoxal, comprada na Dominaria C&G, em perfeito estado. Guardada em sleeve (plástico protetor) desde a compra.",
            photo: "carta2",
            preservation: 5,
            fields: [
                .init(fieldName: "Idioma", fieldValue: "Português"),
                .init(fieldName: "Coleção", fieldValue: "Fenda Paradoxal"),
                .init(fieldName: "Ano", fieldValue: "2023")
            ],
            collection: fakeCollections[6]
        ),
        .init(
            id: 25,
            name: "Atari 2600 Jr.",
            desc: "Console em perfeito estado com dois controles e cinco cartuchos originais.",
            photo: "atari",
            preservation: 4,
            fields: [
                .init(fieldName: "Modelo", fieldValue: "2600 Jr"),
                .init(fieldName: "Ano", fieldValue: "1986")
            ],
            collection: fakeCollections[0]
        ),
        .init(
            id: 26,
            name: "Relógio Calculator Casio",
            desc: "Relógio calculadora vintage, todas funções funcionando perfeitamente.",
            photo: "casio",
            preservation: 4,
            fields: [
                .init(fieldName: "Modelo", fieldValue: "CA-53W"),
                .init(fieldName: "Ano", fieldValue: "1984")
            ],
            collection: fakeCollections[3]
        ),
        .init(
            id: 27,
            name: "Mini TV Seiko TV Watch",
            desc: "Relógio com TV em miniatura, peça raríssima dos anos 80.",
            photo: "tvwatch",
            preservation: 3,
            fields: [
                .init(fieldName: "Modelo", fieldValue: "T001"),
                .init(fieldName: "Ano", fieldValue: "1982")
            ],
            collection: fakeCollections[3]
        ),
        .init(
            id: 28,
            name: "Master System III Compact",
            desc: "Console com 40 jogos na memória, em perfeito estado de conservação.",
            photo: "mastersystem",
            preservation: 5,
            fields: [
                .init(fieldName: "Modelo", fieldValue: "III Compact"),
                .init(fieldName: "Ano", fieldValue: "1995")
            ],
            collection: fakeCollections[0]
        ),
        .init(
            id: 29,
            name: "Nokia 5110",
            desc: "Celular clássico funcionando, com jogo da cobrinha e toques polifônicos.",
            photo: "nokia",
            preservation: 4,
            fields: [
                .init(fieldName: "Modelo", fieldValue: "5110"),
                .init(fieldName: "Ano", fieldValue: "1998")
            ],
            collection: fakeCollections[3]
        ),
        .init(
            id: 30,
            name: "Brinquedo Simon",
            desc: "Jogo eletrônico de memória Simon, todas as luzes e sons funcionando.",
            photo: "simon",
            preservation: 4,
            fields: [
                .init(fieldName: "Fabricante", fieldValue: "Milton Bradley"),
                .init(fieldName: "Ano", fieldValue: "1978")
            ],
            collection: fakeCollections[4]
        ),
        .init(
            id: 31,
            name: "Micro System CCE",
            desc: "Som portátil com rádio AM/FM, toca-fitas e CD player funcionando.",
            photo: "microsystem",
            preservation: 3,
            fields: [
                .init(fieldName: "Modelo", fieldValue: "AS-5000"),
                .init(fieldName: "Ano", fieldValue: "1995")
            ],
            collection: fakeCollections[1]
        ),
        .init(
            id: 32,
            name: "Álbum Candy Cards She-Ra",
            desc: "Álbum completo de cards da She-Ra, com todos os 180 cards originais.",
            photo: "shera",
            preservation: 4,
            fields: [
                .init(fieldName: "Quantidade", fieldValue: "180"),
                .init(fieldName: "Ano", fieldValue: "1985")
            ],
            collection: fakeCollections[5]
        ),
        .init(
            id: 33,
            name: "Carta Asa Rasteira 107/182 Pokémon TCG",
            desc: "Asa Rasteira Ancestral 107/182\nCarta da coleção Fenda Paradoxal, comprada na Dominaria C&G, em perfeito estado. Guardada em sleeve (plástico protetor) desde a compra.",
            photo: "carta3",
            preservation: 5,
            fields: [
                .init(fieldName: "Idioma", fieldValue: "Português"),
                .init(fieldName: "Coleção", fieldValue: "Fenda Paradoxal"),
                .init(fieldName: "Ano", fieldValue: "2023")
            ],
            collection: fakeCollections[6]
        ),
    ]
}
