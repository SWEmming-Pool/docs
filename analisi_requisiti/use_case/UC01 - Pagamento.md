# UC01 - Pagamento

## Attore primario
Utente Registrato

## Pre condizioni
- Utente non ha ancora pagato

## Post condizioni
- Utente ha completato il pagamento

## Scenario Principale
1. Utente accede al sistema
2. Utente si autentica
3. Utente conferma pagamento

## Estensioni
1. Utente non è autenticato e non ha un account
    - Viene visualizzato un errore
    - Viene proposto di crearlo

2. Utente non è autenticato e ha un account
    - Viene visualizzato un errore
    - Viene proposto il login

3. Utente non ha fondi
    - Il pagamento fallisce
    - Viene visualizzato un errore
