-- Remove uma foto específica (ex.: duplicada ou incorreta)
DELETE FROM anuncio_fotos
WHERE id = 1002
	AND anuncio_id = 101;

-- Remove anúncios expirados antes de uma data (limpeza)
-- As fotos vinculadas são removidas automaticamente (ON DELETE CASCADE)
DELETE FROM anuncios
WHERE status = 'EXPIRADO'
	AND data_publicacao < '2025-01-01 00:00:00';

-- Remove categorias que não possuem anúncios vinculados
DELETE FROM categorias
WHERE NOT EXISTS (
	SELECT 1
	FROM anuncios
	WHERE anuncios.categoria_id = categorias.id
);

-- Remove usuários desativados que não possuem anúncios
DELETE FROM usuarios
WHERE ativo = FALSE
	AND NOT EXISTS (
		SELECT 1
		FROM anuncios
		WHERE anuncios.usuario_id = usuarios.id
	);
