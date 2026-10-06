SET NAMES utf8mb4;
USE api_filmes;

-- Usuarios (o primeiro e o original do grupo; Ana e Bruno sao usuarios de exemplo)
INSERT INTO usuarios (nome, email, senha) VALUES
('user', 'usuario@sistema.com', 'user123'),
('Ana', 'ana@sistema.com', 'ana123'),
('Bruno', 'bruno@sistema.com', 'bruno123');

-- Filmes
INSERT INTO filmes (titulo, ano, duracao, classificacao, sinopse, poster)
VALUES

('Interestelar',
 2014,
 169,
 '10',
 'Um grupo de astronautas viaja pelo espaço em busca de um novo planeta habitável para a humanidade.',
 'https://i.pinimg.com/736x/3f/09/dd/3f09ddcc1d3c3740f6a74e63d57fba61.jpg'),

('Matrix',
 1999,
 136,
 '14',
 'Um programador descobre que a realidade em que vive é uma simulação criada por máquinas.',
 'https://i.pinimg.com/736x/df/65/5a/df655af73430f49a9ae803414589bc8d.jpg'),

('O Senhor dos Anéis: A Sociedade do Anel',
 2001,
 178,
 '12',
 'Um jovem hobbit recebe a missão de destruir um poderoso anel antes que ele caia nas mãos do inimigo.',
 'https://i.pinimg.com/1200x/cd/f6/b1/cdf6b1cea40f0f6b97dd75673a9dc3f2.jpg'),

('Homem-Aranha: No Aranhaverso',
 2018,
 117,
 '10',
 'Um jovem assume o papel de Homem-Aranha e conhece diferentes versões do herói vindas de outros universos.',
 'https://i.pinimg.com/1200x/77/c8/29/77c829db031c1e20b3741bde421a5b09.jpg'),

('O Poderoso Chefão',
 1972,
 175,
 '16',
 'A história de uma poderosa família envolvida com o crime organizado e seus conflitos internos.',
 'https://i.pinimg.com/1200x/48/9c/5a/489c5a5e102c89d21d20912ce81233d3.jpg'),

('A Origem',
 2010,
 148,
 '14',
 'Um especialista em invadir sonhos recebe a missão de implantar uma ideia na mente de um empresário.',
 'https://i.pinimg.com/736x/96/62/11/9662116e8979b2b0c08c7b54f19c98bb.jpg'),

('Toy Story',
 1995,
 81,
 'Livre',
 'Brinquedos ganham vida quando os humanos não estão por perto e enfrentam aventuras inesperadas.',
 'https://i.pinimg.com/736x/ff/ba/c3/ffbac3218ac7704e2d8eb5b63380d485.jpg'),

('Parasita',
 2019,
 132,
 '16',
 'Uma família de baixa renda começa a trabalhar para uma família rica e acaba envolvida em uma situação inesperada.',
 'https://i.pinimg.com/1200x/99/a1/d4/99a1d44a9e7f8200a89020b86e2ab7b6.jpg'),

('Jurassic Park',
 1993,
 127,
 '10',
 'Um parque temático com dinossauros recriados geneticamente entra em colapso após uma falha de segurança.',
 'https://i.pinimg.com/736x/eb/71/fa/eb71fa4f5980f97ae56c705686db850e.jpg'),

('Divertida Mente',
 2015,
 95,
 'Livre',
 'As emoções de uma garota precisam lidar com grandes mudanças em sua vida.',
 'https://i.pinimg.com/1200x/b5/e6/20/b5e6203a8c0a4e52f95eb338eea27652.jpg'),

('Duna',
 2021,
 155,
 '14',
 'Um jovem nobre precisa enfrentar conflitos políticos e uma jornada em um planeta desértico.',
 'https://i.pinimg.com/1200x/1b/df/91/1bdf9124924ac715926c8267b21da14f.jpg'),

('De Volta para o Futuro',
 1985,
 116,
 'Livre',
 'Um adolescente viaja acidentalmente ao passado utilizando uma máquina do tempo construída por um cientista.',
 'https://i.pinimg.com/1200x/44/be/5d/44be5d16369a149f96d707e4e8083efb.jpg'),

('Os Vingadores',
 2012,
 143,
 '12',
 'Um grupo de super-heróis se reúne para impedir uma ameaça que pode destruir a humanidade.',
 'https://i.pinimg.com/1200x/5f/53/b7/5f53b72afed403571e67ba002a67e7e3.jpg'),

('O Castelo Animado',
 2004,
 119,
 'Livre',
 'Uma jovem amaldiçoada encontra um misterioso castelo mágico e seu excêntrico proprietário.',
 'https://i.pinimg.com/736x/ec/f5/96/ecf596b4b836dba11873a07b12381088.jpg');

-- Generos
INSERT INTO generos (nome) VALUES
('Ficção Científica'),  -- 1
('Ação'),               -- 2
('Aventura'),           -- 3
('Drama'),              -- 4
('Animação'),           -- 5
('Fantasia'),           -- 6
('Crime'),              -- 7
('Comédia'),            -- 8
('Suspense'),           -- 9
('Família');            -- 10

-- Generos de cada filme (id_filme, id_genero)
INSERT INTO genero_filme (id_filme, id_genero) VALUES
(1, 1), (1, 4), (1, 3),     -- Interestelar
(2, 1), (2, 2),             -- Matrix
(3, 6), (3, 3),             -- O Senhor dos Aneis
(4, 5), (4, 2), (4, 3),     -- Homem-Aranha: No Aranhaverso
(5, 7), (5, 4),             -- O Poderoso Chefao
(6, 1), (6, 2), (6, 9),     -- A Origem
(7, 5), (7, 8), (7, 10),    -- Toy Story
(8, 4), (8, 9),             -- Parasita
(9, 3), (9, 1),             -- Jurassic Park
(10, 5), (10, 8), (10, 10), -- Divertida Mente
(11, 1), (11, 3), (11, 4),  -- Duna
(12, 1), (12, 8), (12, 3),  -- De Volta para o Futuro
(13, 2), (13, 1), (13, 3),  -- Os Vingadores
(14, 5), (14, 6), (14, 3);  -- O Castelo Animado

-- Favoritos (id_filme, id_usuario)
INSERT INTO favoritos (id_filme, id_usuario) VALUES
(2, 1), (6, 1), (11, 1), (14, 1),
(1, 2), (2, 2), (4, 2), (10, 2),
(1, 3), (2, 3), (5, 3), (12, 3);
