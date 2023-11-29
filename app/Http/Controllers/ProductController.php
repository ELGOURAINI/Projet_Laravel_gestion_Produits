<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Product_images;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;



use Illuminate\Support\Facades\Gate;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $products = Product::with('images')->get();

        return view('products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('products.create');
    }
    private function validateProduct(Request $request)
{
    return $this->validate($request, [
        'description' => 'required|string',
        'price' => 'required|numeric',
        'images.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
    ]);
}

protected function storeImages(Product $product, Request $request)
{
    // Store the associated images
    foreach ($request->file('images') as $image) {
        $imageName = $image->getClientOriginalName();

        // Store the image in the public/storage/product_images directory
        $image->storeAs('product_images', $imageName, 'public');

        $imagePath = 'product_images/' . $imageName;

$productImage = new Product_images([
    'image_path' => $imagePath,
]);
        $product->images()->save($productImage);
    }
}

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'description' => 'required|string',
            'price' => 'required|numeric',
            'images.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
    
        // Store the product information
        $product = new Product([
            'description' => $request->input('description'),
            'price' => $request->input('price'),
        ]);
    
        $product->save();
    
        // Call the storeImages method to handle image storage
        $this->storeImages($product, $request);
    
        return redirect()->route('products.index')
            ->with('success', 'Product created successfully');

    
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $product = Product::find($id);
        return view('products.show', compact('product'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $product = Product::find($id);
        $this->authorize('update', $product);
        $product = Product::with('images')->findOrFail($id);
    return view('products.edit', compact('product'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $id)
    {
        $product = Product::find($id);
        $this->authorize('update', $product);
        $this->validateProduct($request);

    $product = Product::findOrFail($id);
    $product->update([
        'description' => $request->input('description'),
        'price' => $request->input('price'),
    ]);

    $this->storeImages($product, $request);


    return redirect()->route('products.index')->with('success', 'Product updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy( $id)
    {
        $product = Product::with('images')->findOrFail($id);
        
        if ($this->authorize('delete', $product)) {
            $product->delete();
            return redirect()->route('products.index')->with('success', 'Product deleted successfully.');
        } else {
            return redirect()->route('products.index')->with('error', 'You do not have permission to delete this product.');
        }
    }
}