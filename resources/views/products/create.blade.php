<!-- resources/views/products/create.blade.php -->

<head>
    <style>
    .container {
        margin-left: 200px;
        margin-right: 200px;
    }
    </style>
</head>

@extends('layouts.app')

@section('content')

<div class="container mt-4">
    <div class="card">
        </br></br>
        <h1 class="titre"><strong>Ajouter un produit</strong></h1>
        </br>

        <div class="card-body">
            <form method="POST" action="{{ route('products.store') }}" enctype="multipart/form-data">
                @csrf

                <!-- Description du produit -->
                <label for="description" class="block font-medium text-sm text-gray-700">Description du produit</label>
                <textarea id="description" name="description" rows="4"
                    class="form-input rounded-md shadow-sm mt-1 block w-full"
                    required>{{ old('description') }}</textarea>

                <!-- Prix du produit -->
                <label for="price" class="block font-medium text-sm text-gray-700">Prix du produit</label>
                <input id="price" type="text" class="form-input rounded-md shadow-sm mt-1 block w-full" name="price"
                    value="{{ old('price') }}" required />

                <!-- Images du produit -->
                <label for="images" class="block font-medium text-sm text-gray-700">Images du produit</label>
                <input id="images" type="file" class="form-input rounded-md shadow-sm mt-1 block w-full" name="images[]"
                    multiple accept="image/*" />

                <div class="flex items-center justify-end mt-4">

                    <x-primary-button class="ms-3">
                        Ajouter le produit
                    </x-primary-button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection