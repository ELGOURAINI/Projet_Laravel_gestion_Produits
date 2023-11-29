<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Product;
use Illuminate\Auth\Access\Response;
use Illuminate\Auth\Access\HandlesAuthorization;

class ProductPolicy
{
    

    use HandlesAuthorization;

    public function view(User $user, Product $product)
    {
        // Tous les utilisateurs peuvent voir les produits
        return $user->hasRole('admin') || $user->hasRole('manager');
    }

    public function create(User $user)
    {
        // Tous les utilisateurs peuvent créer des produits
        return $user->hasRole('admin') || $user->hasRole('manager');
    }

    public function update(User $user)
    {
        // Seuls les administrateurs peuvent mettre à jour des produits
        return $user->hasRole('admin') || $user->hasRole('manager');
        
    }

    public function delete(User $user)
    {
        // Seuls les administrateurs peuvent supprimer des produits
        return $user->hasRole('admin');
    }
    
}