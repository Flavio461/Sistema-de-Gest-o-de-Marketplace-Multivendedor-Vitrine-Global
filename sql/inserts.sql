-- Inserção de cidades (base para relacionar usuários e anúncios por localização)
INSERT INTO cidades (id, nome, uf) VALUES
(1, 'São Paulo', 'SP'),
(2, 'Campinas', 'SP'),
(3, 'Rio de Janeiro', 'RJ'),
(4, 'Belo Horizonte', 'MG'),
(5, 'Curitiba', 'PR');

-- Inserção de categorias (categorias únicas conforme constraint)
INSERT INTO categorias (id, nome, descricao) VALUES
(1, 'Eletrônicos', 'Equipamentos eletrônicos e acessórios'),
(2, 'Móveis', 'Móveis para casa e escritório'),
(3, 'Roupas', 'Vestuário em geral'),
(4, 'Livros', 'Livros novos e usados'),
(5, 'Esportes', 'Itens esportivos e lazer');

-- Inserção de usuários (anunciantes)
-- A senha é armazenada como hash (password_hash), e o email deve ser único
INSERT INTO usuarios (
	id, nome, email, password_hash, telefone, whatsapp, link_whatsapp, tipo, data_cadastro, ativo, cidade_id
) VALUES
(1, 'Ana Vendedora', 'ana@vitrine.com', '$2b$10$hash_exemplo_ana', '11999990001', '11999990001', 'https://wa.me/5511999990001', 'ANUNCIANTE', '2025-11-01 10:00:00', TRUE, 1),
(2, 'Bruno Loja', 'bruno@vitrine.com', '$2b$10$hash_exemplo_bruno', '21999990002', '21999990002', 'https://wa.me/5521999990002', 'ANUNCIANTE', '2025-11-02 11:00:00', TRUE, 3),
(3, 'Carla Outlet', 'carla@vitrine.com', '$2b$10$hash_exemplo_carla', '31999990003', '31999990003', 'https://wa.me/5531999990003', 'ANUNCIANTE', '2025-11-03 09:30:00', TRUE, 4);

-- Inserção de anúncios
-- Define os vínculos com usuário/categoria/cidade por chaves estrangeiras
INSERT INTO anuncios (
	id, usuario_id, categoria_id, cidade_id, titulo, descricao, preco, condicao, status, data_publicacao, data_encerramento
) VALUES
(101, 1, 1, 1, 'Fone Bluetooth XYZ', 'Fone com cancelamento de ruído, ótimo estado.', 199.90, 'USADO', 'ATIVO', '2025-11-10 12:00:00', NULL),
(102, 1, 2, 2, 'Mesa Escrivaninha 120cm', 'Mesa resistente, ideal para home office.', 350.00, 'USADO', 'ATIVO', '2025-11-12 15:20:00', NULL),
(103, 2, 1, 3, 'Notebook i5 8GB', 'Notebook para estudos e trabalho. Bateria OK.', 1800.00, 'USADO', 'ATIVO', '2025-11-15 08:00:00', NULL),
(104, 2, 5, 3, 'Bicicleta Urbana', 'Bicicleta revisada, pronta para uso.', 900.00, 'USADO', 'ATIVO', '2025-11-18 19:10:00', NULL),
(105, 3, 3, 4, 'Jaqueta Jeans', 'Jaqueta tamanho M, pouco uso.', 120.00, 'USADO', 'ATIVO', '2025-11-20 10:45:00', NULL),
(106, 3, 4, 4, 'Livro - Banco de Dados', 'Livro didático, ótimo para estudos.', 70.00, 'USADO', 'ATIVO', '2025-11-22 14:00:00', NULL);

-- Inserção de fotos dos anúncios
-- As fotos dependem do anúncio (anuncio_id) e são removidas junto com o anúncio (ON DELETE CASCADE)
INSERT INTO anuncio_fotos (id, anuncio_id, url, legenda, ordem, principal) VALUES
(1001, 101, 'https://img.exemplo.com/101_1.jpg', 'Foto frontal', 1, TRUE),
(1002, 101, 'https://img.exemplo.com/101_2.jpg', 'Detalhe do fone', 2, FALSE),
(1003, 102, 'https://img.exemplo.com/102_1.jpg', 'Visão geral', 1, TRUE),
(1004, 103, 'https://img.exemplo.com/103_1.jpg', 'Tampa', 1, TRUE),
(1005, 103, 'https://img.exemplo.com/103_2.jpg', 'Teclado', 2, FALSE),
(1006, 104, 'https://img.exemplo.com/104_1.jpg', 'Lado direito', 1, TRUE),
(1007, 105, 'https://img.exemplo.com/105_1.jpg', 'Jaqueta na frente', 1, TRUE),
(1008, 105, 'https://img.exemplo.com/105_2.jpg', 'Costas', 2, FALSE),
(1009, 106, 'https://img.exemplo.com/106_1.jpg', 'Capa', 1, TRUE);
