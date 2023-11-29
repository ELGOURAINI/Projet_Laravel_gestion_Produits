<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        for ($i = 0; $i < 10; $i++) { // Créez 10 produits (ajustez le nombre selon vos besoins)
            $product = DB::table('products')->insertGetId([
                'description' => $faker->sentence,
                'price' => $faker->randomFloat(2, 10, 100),
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            for ($j = 0; $j < rand(2, 5); $j++) { // Chaque produit peut avoir entre 2 et 5 images
                DB::table('product_images')->insert([
                    'product_id' => $product,
                    'image_path' => 'product_images/' . $faker->image('public/storage/product_images', 400, 300, null, false),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}