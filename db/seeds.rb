# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Needy.delete_all
Needy.create([
  {
    address: 'Rua João da Rocha - Vila Constancia, São Paulo - SP, Brasil',
    latitude: '-23.6703651',
    longitude: '-46.675999'
  },
  {
    address: 'Rua Guiomar Branco da Silva - Vila Marari, São Paulo - SP, Brasil',
    latitude: '-23.6682756',
    longitude: '-46.6615089'    
  },
  {
    address: 'Rua Saturnino Barbosa da Silva - Campo Grande, São Paulo - SP, Brasil',
    latitude: '-23.6737314',
    longitude: '-46.6794502' 
  },
  {
    address: 'Rua Jupi - Santo Amaro, São Paulo - SP, Brasil',
    latitude: '-23.6465722',
    longitude: '-46.7122612'
  },
  {
    address: 'Rua Donato - Vila Pirituba, São Paulo - SP, Brasil',
    latitude: '-23.4984514',
    longitude: '-46.7122326'
  },
  {
    address: 'Avenida Washington Luís - Campo Belo, São Paulo - SP, Brasil',
    latitude: '-23.6315305',
    longitude: '-46.6688851'
  },
  {
    address: 'Avenida Marari - Vila Marari, São Paulo - SP, Brasil',
    latitude: '-23.665824',
    longitude: '-46.664496'
  },
  {
    address: 'Travessa José Maria Chacon - Vila Constanca, São Paulo - SP, Brasil',
    latitude: '-23.6666364',
    longitude: '-46.6771369'
  },
  {
    address: 'Viela George de Mestral - Vila Constancia, São Paulo - SP, Brasil',
    latitude: '-23.6695166',
    longitude: '-46.6696085'
  },
  {
    address: 'Chácara Santo Antônio (Zona Sul), São Paulo - SP, Brasil',
    latitude: '-23.630928',
    longitude: '-46.7041338'
  },       
  {
    address: 'Rua dos Jequitibás - Jardim Oriental, São Paulo - SP, Brasil',
    latitude: '-23.6463255',
    longitude: '-46.643094'
  },       
  {
    address: 'Rua Amador Bueno - Santo Amaro, São Paulo - SP, Brasil',
    latitude: '-23.6527622',
    longitude: '-46.7124'
  },       
  {
    address: 'Rua Marcondésia - Chácara Monte Alegre, São Paulo - SP, Brasil',
    latitude: '-23.644964',
    longitude: '-46.6782235'
  },       
  {
    address: 'Rua Márcio Mazzei - Vila Nova Mazzei, São Paulo - SP, Brasil',
    latitude: '-23.4615544',
    longitude: '-46.5954711'
  },       
  {
    address: 'Rua Soares de Avellar - Vila Monte Alegre, São Paulo - SP, Brasil',
    latitude: '-23.6303201',
    longitude: '-46.6373525'
  },       
  {
    address: 'Rua Alves Guimarães - Pinheiros, São Paulo - SP, Brasil',
    latitude: '-23.5556837',
    longitude: '-46.6782927'
  },       
  {
    address: 'Rua Barreto Muniz - Vila Guarani (Zona Sul), São Paulo - SP, Brasil',
    latitude: '-23.6312471',
    longitude: '-46.6294115'
  },       
  {
    address: 'Rua Alves Barreto Visconde de Nova Granada, Castanheira de Pêra, Portugal',
    latitude: '40.00665',
    longitude: '-8.2117462'
  },       
  {
    address: 'Rua Santo Agostinho - Centro, Diadema - SP, Brasil',
    latitude: '-23.6834247',
    longitude: '-46.6313174'
  },       
  {
    address: 'Rua Jeremias Júnior - Vila Nair, São Paulo - SP, Brasil',
    latitude: '-23.6085251',
    longitude: '-46.610603'
  },       
  {
    address: 'Rua Geminiano Góis - Freguesia (Jacarepaguá), Rio de Janeiro - RJ, Brasil',
    latitude: '-22.9334986',
    longitude: '-43.3372047'
  },       
  {
    address: 'Rua Vanilda Machado Teixeira - Santana, Itaguaí - RJ, Brasil',
    latitude: '-22.8656598',
    longitude: '-43.7571653'
  },       
  {
    address: 'Rua Maria Lígia - Vila Moraes, São Paulo - SP, Brasil',
    latitude: '-23.6355395',
    longitude: '-46.6181563'
  },       
  {
    address: 'Rua Jovelina - Vila Domitila, São Paulo - SP, Brasil',
    latitude: '-23.5131225',
    longitude: '-46.5099517'
  },       
  {
    address: 'Rua Júnior Rocha - Parque Manibura, Fortaleza - CE, Brasil',
    latitude: '-3.7912908',
    longitude: '-38.4877338'
  },       
  {
    address: 'Rua Ceará - Consolação, São Paulo - SP, Brasil',
    latitude: '-23.5475333',
    longitude: '-46.6617843'
  },       
  {
    address: 'Rua Rio de Janeiro - Osvaldo Cruz, São Caetano do Sul - SP, Brasil',
      latitude: '-23.6229591',
      longitude: '-46.5638886'
  },       
  {
    address: 'Rua Minas Gerais - Higienópolis, São Paulo - SP, Brasil',
    latitude: '-23.5545204',
    longitude: '-46.6640652'
  },       
  {
    address: 'Rua Espírito Santo - Cerâmica, São Caetano do Sul - SP, Brasil',
      latitude: '-23.6255807',
      longitude: '-46.5733367'
  },       
  {
    address: 'Rua Pernambucana - Conceicao, Osasco - SP, Brasil',
    latitude: '-23.5725656',
    longitude: '-46.8056043'
  }

])
Category.delete_all
Category.create([
  {name: 'Vestuário'},
  {name: 'Calçados'},
  {name: 'Alimentação'},
  {name: 'Água'},
  {name: 'Educação'},
  {name: 'Trabalho'},
  {name: 'Higiene bucal'},
  {name: 'Moradia'},
  {name: 'Educação'},
  {name: 'Lazer'},
  {name: 'Higiene'},
  {name: 'Cobertores'},
  {name: 'Material didático'},
  {name: 'Material de limpeza'},
  {name: 'Higiene pessoal'},
  {name: 'Móveis'},

])