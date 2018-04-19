package org.desafio.validation;

import org.desafio.model.Registro;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class RegistroValidation implements Validator {
	

	@Override
	public boolean supports(Class<?> clazz) {
		return Registro.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "descricao", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "tipo", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "vencimento", "field.required");
		
		Registro registro = (Registro) target;
		
		if(registro.getValor() < 0) {
			errors.rejectValue("valor", "field.required");
		}
		
	}
}
