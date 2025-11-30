-- Marca anúncio como VENDIDO e registra a data de encerramento
-- A condição usuario_id representa a regra de que apenas o dono pode alterar o anúncio
UPDATE anuncios
SET status = 'VENDIDO',
	data_encerramento = CURRENT_TIMESTAMP
WHERE id = 101
	AND usuario_id = 1
	AND status = 'ATIVO';

-- Aplica desconto em anúncios ATIVOS da categoria Eletrônicos (categoria_id = 1)
UPDATE anuncios
SET preco = ROUND(preco * 0.95, 2)
WHERE status = 'ATIVO'
	AND categoria_id = 1
	AND preco >= 200.00;

-- Desativa um usuário mantendo o histórico (não remove registros)
UPDATE usuarios
SET ativo = FALSE
WHERE id = 3
	AND email = 'carla@vitrine.com'
	AND ativo = TRUE;

-- Remove marcação de foto principal do anúncio 103 (prepara troca da principal)
UPDATE anuncio_fotos
SET principal = FALSE
WHERE anuncio_id = 103
	AND principal = TRUE;

-- Define a foto 1005 como principal do anúncio 103
UPDATE anuncio_fotos
SET principal = TRUE
WHERE id = 1005
	AND anuncio_id = 103;
