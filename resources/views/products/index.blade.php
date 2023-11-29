<head>
    <style>
    /* Ajoutez vos styles personnalisés ici */

    .container {
        margin-left: 50px;
        margin-right: 50px;
    }

    .product-list {
        display: flex;
        flex-wrap: wrap;
        margin: -15px;
    }

    .product-card {
        border: 1px solid #ddd;
        padding: 10px;
        width: 100%;
        height: 400px;
        max-width: 300px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease-in-out;
        flex: 0 0 calc(25% - 30px);
        margin: 15px;
    }

    .product-card:hover {
        transform: scale(1.05);
    }

    .product-card img {
        width: 100%;
        max-height: 200px;
        object-fit: cover;
        margin-bottom: 10px;
    }

    .product-info {
        text-align: center;
    }

    .actions {
        margin-top: 10px;
    }

    .btn {
        display: inline-block;
        padding: 5px 10px;
        margin-right: 5px;
        text-decoration: none;
        color: #fff;
        background-color: #007bff;
        border: 1px solid #007bff;
        border-radius: 3px;
        cursor: pointer;
        transition: background-color 0.3s ease-in-out;
    }

    .btn:hover {
        background-color: #0056b3;
    }
    </style>
</head><!-- resources/views/products/index.blade.php -->

@extends('layouts.app')

@section('content')
<div class="container">
    <div class="mt-4">
        <a href="{{ route('products.create') }}" class="btn btn-success">
            <i class="fas fa-plus"></i> Ajouter un produit
        </a>
    </div>
    <h1>Liste des Produits</h1>
    <br><br>
    <div class="product-list">
        @foreach ($products as $product)
        <div class="product-card">
            <img src="{{ asset('storage/' . $product->images->first()->image_path) }}" alt="Product Image">
            <div class="product-info">
                <h2>{{ $product->description }}</h2>
                <p>Prix: {{ $product->price }}</p>
                <div class="actions">
                    <a href="{{ route('products.show', $product) }}" class="btn btn-info">
                        <i class="fas fa-eye"></i>
                    </a>

                    @can('update', $product)
                    <a href="{{ route('products.edit', $product) }}" class="btn btn-warning">
                        <i class="fas fa-edit"></i>
                    </a>
                    @endcan
                    @can('delete', $product)
                    <form action="{{ route('products.destroy', $product) }}" method="POST" style="display:inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-warning"
                            onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce produit?')">
                            <i class="fas fa-trash"></i>
                        </button>
                    </form>
                    @endcan
                </div>
            </div>
        </div>
        @endforeach
    </div>


</div>

@endsection