# Pokedex Challenge

[Portuguese]: Desafio era implementar as telas propostas no figma e consumir a api pokemon. <br/>
[English]: The challenge was implements all proposed screens on figma, using pokemon api.

## Getting Started

- Figma:

![image](https://user-images.githubusercontent.com/105317301/211165034-33958918-7546-48c4-a040-900f113ace6b.png)
![image](https://user-images.githubusercontent.com/105317301/211165069-2ca6bd3e-4970-4753-b063-8156de22b21d.png)
![image](https://user-images.githubusercontent.com/105317301/211165083-5cbf2472-e70b-4095-b1b7-8735b3a88a69.png)


- Projeto Finalizado:

<img width="614" alt="image" src="https://user-images.githubusercontent.com/105317301/211165501-7245816d-e1ec-4b20-be70-77ac79321423.png">
<img width="1231" alt="image" src="https://user-images.githubusercontent.com/105317301/211165514-5c94c90a-9704-46f4-9252-085e5dbae3cd.png">
<img width="1226" alt="image" src="https://user-images.githubusercontent.com/105317301/211165540-3c4b0ac6-b35c-4e1f-ba8c-2a740088eade.png">


- Funcionalidades adicionais:  <br />

*Favoritar pokemon <br />
Icone Favorito ❤️  preenchido corresponde a favorito, enquanto não preenchido corresponde a não favorito: <br />
<img width="814" alt="image" src="https://user-images.githubusercontent.com/105317301/211165606-b17c6952-fee2-4577-b7d4-53e88b424962.png">

*Listar favoritos <br />
Como de se esperar, caso nenhum pokemon seja adicionado aos favoritos, a lista estara vazia, e caso tenha selecionado alguns, a lista estara carregada: <br />
<img width="822" alt="image" src="https://user-images.githubusercontent.com/105317301/211165667-03d2ddd1-f40a-4db8-903f-17a90a62f7cc.png">

*Abrir Pokemon favorito <br />
O pokemon que está na lista de favoritos é clicavel, e caso clique em seu 'card'o mesmo abrirá os detalhes do pokemon. <br />
<img width="408" alt="image" src="https://user-images.githubusercontent.com/105317301/211165705-8e399651-b463-4d15-bd66-3d02d2b843a6.png">

Voce pode remover o pokemon da lista de favoritos, clicando novamente no icone favorito ❤️  ou deletando na lixeira presente na lateral direita de seu 'card'. <br />
<img width="400" alt="image" src="https://user-images.githubusercontent.com/105317301/211165732-69509c8b-4ad1-4729-afcb-8919e15c5155.png">


### Informações do Projeto:

- Para gerenciamento de estado, por ser um desafio de baixa complexidade foi utilizado cubit.
- Para injeção de dependencia, foi utilizado GetIt.
- Para facilidade na comparação de objetos, sem a necessidade de sobrescrever o metodo equals manualmente, foi utilizado Equatable.
- Para consumo de requisições Http foi utilizado Dio.
- Para fazer as serializações de forma automatica, sem a necessidade de criar manualmente os metodos toMap ou toJson / fromMap ou fromJson, foi utilizado Json Serializable

#### Dependencias:

- [Build Runner](https://pub.dev/packages/build_runner)
- [Json Serializable](https://pub.dev/packages/json_serializable)
- [Bloc](https://pub.dev/packages/flutter_bloc)
- [GetIt](https://pub.dev/packages/get_it)
- [Equatable](https://pub.dev/packages/equatable)
