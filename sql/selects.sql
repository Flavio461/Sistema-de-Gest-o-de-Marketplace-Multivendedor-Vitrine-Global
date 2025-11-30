-- Lista anúncios ATIVOS (com categoria e cidade), ordenado pelos mais recentes
SELECT
	a.id,
	a.titulo,
	a.preco,
	cat.nome AS categoria,
	cid.nome AS cidade,
	cid.uf,
	a.data_publicacao
FROM anuncios a
JOIN categorias cat ON cat.id = a.categoria_id
JOIN cidades cid ON cid.id = a.cidade_id
WHERE a.status = 'ATIVO'
ORDER BY a.data_publicacao DESC
LIMIT 10;

-- Busca anúncios por termo no título/descrição (simula busca por nome)
SELECT
	a.id,
	a.titulo,
	a.preco,
	a.status
FROM anuncios a
WHERE LOWER(a.titulo) LIKE '%notebook%'
	OR LOWER(a.descricao) LIKE '%notebook%'
ORDER BY a.preco ASC
LIMIT 20;

-- Exibe detalhes do anúncio com contato do vendedor (página do produto)
SELECT
	a.id AS anuncio_id,
	a.titulo,
	a.descricao,
	a.preco,
	a.condicao,
	a.status,
	u.nome AS vendedor,
	u.email,
	u.whatsapp,
	u.link_whatsapp
FROM anuncios a
JOIN usuarios u ON u.id = a.usuario_id
WHERE a.id = 101;

-- Conta anúncios ATIVOS por categoria (relatório simples)
SELECT
	cat.nome AS categoria,
	COUNT(*) AS total_ativos
FROM anuncios a
JOIN categorias cat ON cat.id = a.categoria_id
WHERE a.status = 'ATIVO'
GROUP BY cat.nome
ORDER BY total_ativos DESC, categoria ASC;

-- Lista anúncios de um vendedor e quantidade de fotos de cada anúncio
SELECT
	u.id AS usuario_id,
	u.nome AS vendedor,
	a.id AS anuncio_id,
	a.titulo,
	a.status,
	COUNT(f.id) AS qtd_fotos
FROM usuarios u
JOIN anuncios a ON a.usuario_id = u.id
LEFT JOIN anuncio_fotos f ON f.anuncio_id = a.id
WHERE u.id = 1
GROUP BY u.id, u.nome, a.id, a.titulo, a.status
ORDER BY a.data_publicacao DESC;
