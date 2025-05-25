# Configuração do Mercado Pago

1. Adicione no seu Gemfile:
   ```ruby
   gem 'mercadopago-sdk'
   ```

2. Rode:
   ```bash
   bundle install
   ```

3. Crie o arquivo `config/initializers/mercadopago.rb` com o conteúdo deste diretório.

4. Configure sua variável de ambiente `MP_ACCESS_TOKEN` no seu `.env`:
   ```
   MP_ACCESS_TOKEN=SEU_TOKEN_DO_MERCADOPAGO
   ```

5. Reinicie seu servidor Rails (`spring stop` se usar Spring) e utilize `MERCADO_PAGO_SDK` nos seus controllers/services.
