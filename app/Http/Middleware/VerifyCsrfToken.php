<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
         'http://localhost/diabetes_laravel/public/*',
         'http://192.168.2.111/diabetes_laravel/public/*'
    ];
}
