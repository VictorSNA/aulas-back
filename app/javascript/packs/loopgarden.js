$(document).ready(function() {
  $('#botao').click(function() {
    let searchInput = $('#searchField');

    if(searchInput.val() == "") {
      searchInput.focus();
      alert("Campo de busca não deve ficar vazio");
      return false;
    }
  });

  // Login Page
  $('#loginButton').click(function() {
    let email = $('#inputEmailLogin');
    let password = $('#inputSenhaLogin');

    if(email.val() == "" || password.val() == "") {
      alert("Verifique as digitações dos campos, e-mail e senha não devem ficar vazio.");
      return false;
    }

    if(password.val().length < 6) {
      alert("Senha deve ter no mínimo seis caracteres.");
      return false;
    }
  });

  // Signup package
  $('#cadastroButton').click(function() {
    let nome = $('#account_name');
    let email = $('#account_email');
    let senha = $('#account_password');
    let confirmacaoSenha = $('#account_password_confirmation');
    let cpf = $('#account_cpf');
    let tel = $('#account_telephone');
    let cep = $('#account_cep');
    let public_place = $('#account_public_place');
    let address = $('#account_address');
    let address_number = $('#account_address_number');
    let complement = $('#account_complement');

    let required_fields = [
      nome, email, senha, confirmacaoSenha, cpf, tel, cep, public_place, address, address_number, complement
    ]

    if(nome.val() == "" ||
        email.val() == "" ||
        senha.val() == "" ||
        confirmacaoSenha.val() == "" ||
        cpf.val() == "" ||
        tel.val() == "") {
      alert("Verifique as digitações dos campos, todos são obrigatórios e devem ser preenchidos.");
      required_fields.forEach(function (field) {
        field.css("border-color", "red");
      });
      return false;
    }

    if(!erNome.test(nome.val())){
      alert("Informe o nome completo");

      return false;
    }

    if(senha.val().length < 6) {
      alert("Senha deve ter no mínimo seis caracteres.");
      return false;
    }

    if(!erSenhaForte.test(senha.val())) {
      alert("A senha digita é muito fraca, deve conter 6 caracteres com número, letras maisculas e minusculas e um caracter especial ($*&@#).")
    }

    if(senha.val() != confirmacaoSenha.val()) {
      alert("A confirmação de senha está diferente da senha");
    }

    if(!erCpf.test(cpf.val())) {
      alert("CPF não tem um formato válido.");
      return false;
    }

    if(!erTelefone.test(tel.val())) {
      alert("Telefone no formato inválido, deve ser no modelo +00 (00) 0000-0000 ou +00 (00) 00000-0000.")
      return false;
    }
  });

});


