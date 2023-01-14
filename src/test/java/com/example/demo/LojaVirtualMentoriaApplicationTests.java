package com.example.demo;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import dev.mentoria.lojavirtual.LojaVirtualMentoriaApplication;
import dev.mentoria.lojavirtual.controller.AcessoController;
import dev.mentoria.lojavirtual.model.Acesso;



@SpringBootTest(classes = LojaVirtualMentoriaApplication.class)
public class LojaVirtualMentoriaApplicationTests {
		
	@Autowired
	private AcessoController acessoController;
	
	@Test
	public void testarCadastraAcesso() {		
		Acesso acesso = new Acesso();		
		acesso.setDescricao("ROLE_ADMIN");		
		acessoController.salvarAcesso(acesso);		
	}

}
