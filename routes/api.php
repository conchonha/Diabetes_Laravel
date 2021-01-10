<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::group(['prefix'=>'User'],function(){

	Route::post('register','UserController@register')->name('register');

	Route::post('login','UserController@login')->name('login');

	Route::post('updatePass','UserController@updatePass')->name('updatePass');
});

Route::group(['prefix'=>'Menu'],function(){

	Route::post('postFood','MenuController@postFood');

	Route::get("getListFood","MenuController@getListFood");

	Route::get("deleteFood","MenuController@deleteFood");

	Route::get("getDataFoodOffer","MenuController@getDataFoodOffer");
});

Route::group(['prefix' => 'HealthInformation'], function() {

    Route::post('insert', 'HealthInformationController@insert');

    Route::get('getAll', 'HealthInformationController@getAll');

    Route::get('getLastHealthInformation', 'HealthInformationController@getLastHealthInformation');

    Route::post('getObjectHealthInformation', 'HealthInformationController@getObjectHealthInformation');

    Route::post('deleteObject', 'HealthInformationController@deleteObject');

    Route::get('getBloodPressureChart', 'HealthInformationController@getBloodPressureChart');

});