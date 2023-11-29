<head>
    <style>
    .container {
        margin-left: 100px;
        margin-right: 100px;
        background-color: white;
        border-radius: 50px;
    }

    .center-content {
        display: flex;
        justify-content: center;
    }

    .product-details {
        width: 50%;
    }

    /* Style for images grid */
    .image-grid {
        background-color: white;
        /* Light gray background */
        padding: 20px;
        text-align: center;

    }

    .image-grid img {
        width: 200px;
        height: auto;
        margin-bottom: 20px;
        margin-left: 100px;
        margin-right: 100px;
    }

    h1 {

        text-decoration: blink;

    }
    </style>
</head>
@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <div class="card">


        <div class="card-body center-content">
            <!-- Display product details in the center -->
            <div class="product-details">

                </br></br>
                <h1 class="titre"><strong>Product Details</strong></h1>
                </br>
                <p>Description: {{ $product->description }}</p>
                <p>Price: {{ $product->price }}</p>
                </br></br>
                <p class="text-lg font-semibold mb-4">Product Images</p>
            </div>
        </div>
    </div>
    <div class="mt-8 image-grid">
        <div class="flex flex-wrap">
            @foreach ($product->images as $image)
            <div class="w-1/3 px-2 mb-4">
                <img src="{{ asset('storage/' . $image->image_path) }}" alt="Product Image">
            </div>
            @endforeach
        </div>
    </div>
</div>


@endsection