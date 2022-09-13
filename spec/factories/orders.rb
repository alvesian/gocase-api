FactoryBot.define do
  factory :order do
    reference { 'BR102030' }
    purchase_channel { 'Site BR' }
    client_name { 'Rogerio Lima' }
    address { 'Rua Padre Valdevino, 247 - Aldeota, Fortaleza - CE, 60135-041' }
    delivery_service { 'SEDEX' }
    total_value { 123_30 }
    line_items { '[{ sku: case-my-best-friend, model: iPhone X, case type: Rose Leather }, { sku: powebank-sunshine, capacity: 10000mah }, { sku: earphone-standard, color: white }]' }
  end
end
