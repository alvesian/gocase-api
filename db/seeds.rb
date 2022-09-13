Order.destroy_all
Batch.destroy_all

order1 = Order.create(reference: 'BR102030',
                      purchase_channel: 'Site BR',
                      client_name: 'Rogerio Lima',
                      address: 'Rua Padre Valdevino, 2475 - Aldeota, Fortaleza - CE, 60135-041',
                      delivery_service: 'SEDEX',
                      total_value: '12330',
                      line_items: '[{sku: case-my-best-friend, model: iPhone X, case type: Rose Leather}, {sku: powebank-sunshine, capacity: 10000mah}, {sku: earphone-standard, color: white}] ',
                      status: 0)

order1 = Order.create(reference: 'BR102040',
                      purchase_channel: 'Site ES',
                      client_name: 'Rogerio Cópia',
                      address: 'Rua Vilarindo Lima, 2555 - Aldeota, Brasília - DF, 60135-041',
                      delivery_service: 'JADLOG',
                      total_value: '1230',
                      line_items: '[{sku: case-my-best-friend, model: iPhone X, case type: Rose Leather}, {sku: powebank-sunshine, capacity: 10000mah}, {sku: earphone-standard, color: white}] ',
                      status: 0)
