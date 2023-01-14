package dev.mentoria.lojavirtual.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.mentoria.lojavirtual.model.Acesso;
import dev.mentoria.lojavirtual.repository.AcessoRepository;

@Service
public class AcessoService {
	
	@Autowired
	private AcessoRepository acessoRepository;
	
	public Acesso save(Acesso acesso) {
		
		return acessoRepository.save(acesso);
		
	}

}
