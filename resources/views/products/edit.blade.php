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
        <h1 class="titre"><strong>Modifier le produit</strong></h1>
        </br>

        <div class="card-body">
            <form action="{{ route('products.update', $product->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')


                <!-- Description du produit -->
                <label for="description" class="block font-medium text-sm text-gray-700">Description du produit</label>
                <textarea id="description" name="description" rows="4"
                    class="form-input rounded-md shadow-sm mt-1 block w-full"
                    required>{{ $product->description ?? old('description') }}</textarea></br>


                <!-- Prix du produit -->
                <label for="price" class="block font-medium text-sm text-gray-700">Prix du produit</label>
                <input id="price" type="text" class="form-input rounded-md shadow-sm mt-1 block w-full" name="price"
                    value="{{ $product->price ?? old('price') }}" required /></br>

                <!-- Images du produit -->
                <!-- Existing images preview or links -->
                @if ($product->images->isNotEmpty())
                <label class="block font-medium text-sm text-gray-700">Product Images</label>

                @foreach ($product->images as $index => $image)
                <div class="mb-2">
                    <input type="text" name="modified_image_paths[{{ $index }}]" value="{{ $image->image_path }}"
                        class="form-input block w-full">
                    </br>

                </div>
                @endforeach
                @endif

                <p class="mt-2 text-sm text-gray-500">Upload new images or leave it empty to keep the current ones.</p>


                <div class="flex items-center justify-end mt-4">

                    <x-primary-button class="ms-3">
                        Modifier le produit
                    </x-primary-button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection