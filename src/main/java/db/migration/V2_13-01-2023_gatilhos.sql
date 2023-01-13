CREATE OR REPLACE FUNCTION validaChavePessoaJuridica()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
AS $$
declare existe integer;

BEGIN
	existe = (select count(1) from pessoa_fisica where id = NEW.pessoa_fornec_id);
	if (existe <= 0) then
		existe = (select count(1) from pessoa_juridica where id = NEW.pessoa_fornec_id);
	if (existe <= 0) then
		RAISE EXCEPTION 'Não foi encontrado o ID e PK da pessoa para realizar a associação do cadastro';
	end if;
	end if;
	return new;
END;
$$

CREATE TRIGGER validaChavePessoaJuridicaContaPagar
	BEFORE update 
	ON conta_pagar
	FOR EACH ROW
	EXECUTE PROCEDURE validaChavePessoaJuridica();

CREATE TRIGGER validaChavePessoaJuridicaContaPagar2
	BEFORE INSERT
	ON conta_pagar
	FOR EACH ROW
	EXECUTE PROCEDURE validaChavePessoaJuridica();
	
	/*fim*/
	
	CREATE OR REPLACE FUNCTION validaChavePessoa()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
AS $$
declare existe integer;

BEGIN
	existe = (select count(1) from pessoa_fisica where id = NEW.pessoa_id);
	if (existe <= 0) then
		existe = (select count(1) from pessoa_juridica where id = NEW.pessoa_id);
	if (existe <= 0) then
		RAISE EXCEPTION 'Não foi encontrado o ID e PK da pessoa para realizar a associação do cadastro';
	end if;
	end if;
	return new;
END;
$$

CREATE TRIGGER validaChavePessoaVendaCompraLojaVirtual
	BEFORE update 
	ON vd_cp_loja_virt
	FOR EACH ROW
	EXECUTE PROCEDURE validaChavePessoa();

CREATE TRIGGER validaChavePessoaVendaCompraLojaVirtual2
	BEFORE INSERT
	ON vd_cp_loja_virt
	FOR EACH ROW
	EXECUTE PROCEDURE validaChavePessoa();
	
	/*fim*/