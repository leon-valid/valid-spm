# IDDigitalSDK

SDK iOS para autenticação e reconhecimento facial via Swift Package Manager (SPM).

## 📋 Sumário

- [Permissões](#-permissões)
- [Funções Públicas](#-funções-públicas)
  - [startAccessFlow](#1-startaccessflow)
  - [startCredentialsFlow](#2-startcredentialsflow)
- [Modelo de Erro Padronizado](#-modelo-de-erro-padronizado)

---

## 🔐 Permissões

### Câmera

Para o funcionamento do fluxo de reconhecimento facial, adicione a seguinte chave ao seu `Info.plist`:

| Chave | Descrição (exemplo) |
|-------|---------------------|
| `NSCameraUsageDescription` | "Precisamos da câmera para validar sua identidade." |

---

## ⚙️ Funções Públicas

### 1) `startAccessFlow`

```swift
startAccessFlow(from controller: UIViewController, bundleID: String, completion: @escaping (String) -> Void)
```

Apresenta a UIViewController do fluxo de autenticação. É necessário passar o bundleID do aplicativo que está utilizando o SDK e tratar os casos de sucesso e erro na completion.

Em caso de falha, será retornada uma String no formato JSON conforme o Modelo de Erro Padronizado.
Em caso de sucesso, será retornada uma String no formato JSON conforme exemplo abaixo:

✅ JSON retornado em caso de sucesso

```json
{
  "type": "success"
}
```

💡 Exemplo de integração

```swift
import IDDigitalSDK

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IDDigitalSDK.startAccessFlow(bundleID: "bundleID", from: self) { result in
            print("Realizar o tratamento do resultado: \(result)")
        }
    }
}
```

### 2) startCredentialsFlow

```swift
startCredentialsFlow(from controller: UIViewController, completion: @escaping (String) -> Void)
```

Apresenta a UIViewController do fluxo de reconhecimento facial e retorna as informações do documento requisitado. É necessário tratar o retorno na completion.

Em caso de falha, será retornada uma String no formato JSON conforme o Modelo de Erro Padronizado.
Em caso de sucesso, será retornada uma String no formato JSON conforme exemplo abaixo:

✅ JSON retornado em caso de sucesso

```json
{
  "Credentials": [
    {
      "credentialUuid": "uuid",
      "frontImage": "frontImageBase64",
      "backImage": "backImageBase64",
      "data": {
        "name": "Nome exemplo",
        "cpfNumber": "123.456.789-00",
        "registerNumber": "123456",
        "registerUf": "SP",
        "documentDescription": "Descrição",
        "expirationDate": "2025-12-31"
      },
      "type": "success"
    }
  ]
}
```

💡 Exemplo de integração

```swift
import IDDigitalSDK

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IDDigitalSDK.startCredentialsFlow(from: self) { result in
            print("Realizar o tratamento do resultado: \(result)")
        }
    }
}
```

❌ Modelo de Erro Padronizado

Em ambas as funcionalidades, em caso de erro é retornada uma String contendo um JSON conforme o exemplo abaixo:

```json
{
  "code": 404,
  "title": "Não encontrado",
  "message": "Recurso não pode ser encontrado.",
  "type": "error"
}
```

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `code` | `Int` | Código do erro |
| `title` | `String` | Título do erro |
| `message` | `String` | Mensagem detalhada do erro |
| `type` | `String` | Tipo do retorno (`error`, `success`) |
