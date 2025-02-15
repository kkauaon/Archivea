import Foundation

var fakeUser: [User] = [
    User(name: "Kauã Sousa", handle: "kkauabr", bio: "entusiasta", isWhatsappPublic: true, createdAt: .now, avatar: "user1"),
    User(name: "João Gabriel", handle: "jotagezim", bio: "meu nome  joao grabiel tenho 17 anos e amo Jesus", isWhatsappPublic: false, createdAt: .now, avatar: "user2"),
    User(name: "Ana Paula Sena", handle: "anacena", bio: "oii, sou a ana paula e gosto de psicologar", isWhatsappPublic: false, createdAt: .now, avatar: "user3"),
    User(name: "Ismael Lira Nascimento", handle: "maelkk", bio: "oie, sou o mael developer", isWhatsappPublic: false, createdAt: .now, avatar: "user4")
]

var fakeCollections: [FakeCollection] = [
    FakeCollection(name: "Jogos e Consoles", isPrivate: false, image: "gameboy"),
    FakeCollection(name: "Música e Áudio", isPrivate: false, image: "walkman"),
    FakeCollection(name: "Fotografia", isPrivate: true, image: "cybershot"),
    FakeCollection(name: "Computadores e Gadgets", isPrivate: false, image: "ibm5150"),
    FakeCollection(name: "Brinquedos", isPrivate: false, image: "tamagotchi"),
    FakeCollection(name: "Mídia e Entretenimento", isPrivate: true, image: "et_vhs")
]


var fakePosts: [Post] {
    return [
        // Corrected existing posts
        .init(
            author: fakeUser[1],
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
            author: fakeUser[0],
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
            author: fakeUser[1],
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
            author: fakeUser[0],
            name: "Carta Pokémon Mewtwo EX #282 Genetic Apex",
            desc: "Carta ultra rara da coleção Breakthrough, em perfeito estado. Guardada em sleeve desde a compra.",
            photo: "carta",
            preservation: 5,
            fields: [
                .init(fieldName: "Raridade", fieldValue: "Ultra Rara"),
                .init(fieldName: "Ano", fieldValue: "2015")
            ],
            collection: fakeCollections[0]
        ),
        
        // New posts
        .init(
            author: fakeUser[2],
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
            author: fakeUser[3],
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
            author: fakeUser[1],
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
            author: fakeUser[2],
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
            author: fakeUser[0],
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
            author: fakeUser[3],
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
            author: fakeUser[1],
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
            author: fakeUser[2],
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
            author: fakeUser[0],
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
            author: fakeUser[3],
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
            author: fakeUser[1],
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
            author: fakeUser[0],
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
            author: fakeUser[3],
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
            author: fakeUser[1],
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
            author: fakeUser[2],
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
            author: fakeUser[0],
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
            author: fakeUser[3],
            name: "PC IBM 5150",
            desc: "Primeiro PC IBM lançado, funcionando perfeitamente. Com monitor original.",
            photo: "ibm5150",
            preservation: 4,
            fields: [
                .init(fieldName: "Processador", fieldValue: "8088"),
                .init(fieldName: "Ano", fieldValue: "1981")
            ],
            collection: fakeCollections[3]
        )//,
//        .init(
//            author: fakeUser[1],
//            name: "Tazos Coleção Completa Looney Tunes",
//            desc: "Coleção completa de tazos dos Looney Tunes, incluindo os holográficos.",
//            photo: "tazos",
//            preservation: 5,
//            fields: [
//                .init(fieldName: "quantidade", fieldValue: "50"),
//                .init(fieldName: "ano", fieldValue: "1996")
//            ]
//        ),
//        .init(
//            author: fakeUser[2],
//            name: "Agenda Eletrônica Sharp Zaurus",
//            desc: "Agenda eletrônica japonesa com teclado QWERTY e tela touch.",
//            photo: "zaurus",
//            preservation: 4,
//            fields: [
//                .init(fieldName: "modelo", fieldValue: "ZR-5800"),
//                .init(fieldName: "ano", fieldValue: "1996")
//            ]
//        ),
//        .init(
//            author: fakeUser[0],
//            name: "Atari 2600 Jr.",
//            desc: "Console em perfeito estado com dois controles e cinco cartuchos originais.",
//            photo: "atari",
//            preservation: 4,
//            fields: [
//                .init(fieldName: "modelo", fieldValue: "2600 Jr"),
//                .init(fieldName: "ano", fieldValue: "1986")
//            ]
//        ),
//        .init(
//            author: fakeUser[3],
//            name: "Relógio Calculator Casio",
//            desc: "Relógio calculadora vintage, todas funções funcionando perfeitamente.",
//            photo: "casio",
//            preservation: 4,
//            fields: [
//                .init(fieldName: "modelo", fieldValue: "CA-53W"),
//                .init(fieldName: "ano", fieldValue: "1984")
//            ]
//        ),
//        .init(
//            author: fakeUser[1],
//            name: "Mini TV Seiko TV Watch",
//            desc: "Relógio com TV em miniatura, peça raríssima dos anos 80.",
//            photo: "tvwatch",
//            preservation: 3,
//            fields: [
//                .init(fieldName: "modelo", fieldValue: "T001"),
//                .init(fieldName: "ano", fieldValue: "1982")
//            ]
//        ),
//        .init(
//            author: fakeUser[2],
//            name: "Master System III Compact",
//            desc: "Console com 40 jogos na memória, em perfeito estado de conservação.",
//            photo: "mastersystem",
//            preservation: 5,
//            fields: [
//                .init(fieldName: "modelo", fieldValue: "III Compact"),
//                .init(fieldName: "ano", fieldValue: "1995")
//            ]
//        ),
//        .init(
//            author: fakeUser[0],
//            name: "Nokia 5110",
//            desc: "Celular clássico funcionando, com jogo da cobrinha e toques polifônicos.",
//            photo: "nokia",
//            preservation: 4,
//            fields: [
//                .init(fieldName: "modelo", fieldValue: "5110"),
//                .init(fieldName: "ano", fieldValue: "1998")
//            ]
//        ),
//        .init(
//            author: fakeUser[3],
//            name: "Brinquedo Simon",
//            desc: "Jogo eletrônico de memória Simon, todas as luzes e sons funcionando.",
//            photo: "simon",
//            preservation: 4,
//            fields: [
//                .init(fieldName: "fabricante", fieldValue: "Milton Bradley"),
//                .init(fieldName: "ano", fieldValue: "1978")
//            ]
//        ),
//        .init(
//            author: fakeUser[1],
//            name: "Micro System CCE",
//            desc: "Som portátil com rádio AM/FM, toca-fitas e CD player funcionando.",
//            photo: "microsystem",
//            preservation: 3,
//            fields: [
//                .init(fieldName: "modelo", fieldValue: "AS-5000"),
//                .init(fieldName: "ano", fieldValue: "1995")
//            ]
//        ),
//        .init(
//            author: fakeUser[2],
//            name: "Álbum Candy Cards She-Ra",
//            desc: "Álbum completo de cards da She-Ra, com todos os 180 cards originais.",
//            photo: "shera",
//            preservation: 4,
//            fields: [
//                .init(fieldName: "quantidade", fieldValue: "180"),
//                .init(fieldName: "ano", fieldValue: "1985")
//            ]
//        )
    ]
}
