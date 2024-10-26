uSecurityEvent
| where Account contains "marcoso" or SubjectUserName contains "marcoso" or TargetUserName contains "marcoso"
| project TimeGenerated, 
          Account, 
          EventID, 
          EventDescription = case(
              EventID == "4624", "Logon bem-sucedido",
              EventID == "4625", "Falha de logon (Senha errada)", // Evento de senha incorreta
              EventID == "4634", "Logoff",
              EventID == "4672", "Privilégios especiais atribuídos",
              EventID == "4723", "Senha alterada pelo usuário",
              EventID == "4724", "Senha alterada pelo administrador",
              EventID == "4767", "Usuário desbloqueado",
              EventID == "4740", "Conta bloqueada",
              EventID == "24408", "Falha de autenticação no AD (Cisco - senha errada)",
              "Outro Evento"), 
          Computer, 
          IpAddress, 
          LogonType, 
          Status, 
          AdditionalInfo, 
          SubjectUserName, 
          TargetUserName, 
          TargetDomainName
| order by TimeGenerated desc