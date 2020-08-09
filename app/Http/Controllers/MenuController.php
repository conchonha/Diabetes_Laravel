<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Menu;
use Illuminate\Support\Str;

class MenuController extends Controller
{
	public function deleteFood(Request $request){
		$id = $request->id_Menu;
		
		$table = Menu::where('id','=',$id)->delete();
		if($table){
			echo "Sussces";
		}else{
			echo "Fail";
		}
		

	}
	public function getDataFoodOffer(){
		$count = Menu::count();
		if($count >8){
			$table = Menu::all()->random(6);
			echo json_encode($table);
		}else{
			$table = Menu::all();
			echo json_encode($table);
		}
	}
	public function getListFood(Request $request){
		$id_mold = $request->id_mold;
		$id_user = $request->id_user;
		if($id_mold != null && $id_user != null){
			$table = Menu::select('menu.id','menu.id_mold','menu.id_user','menu.namefood','menu.image','menu.day','menu.status')->join('mold','menu.id_mold','=','mold.id')->where([['menu.id_mold','=',$id_mold],['menu.id_user','=',$id_user]])->get();
			echo json_encode($table);
		}else{
			echo "err data null";
		}
	}

    public function postFood(Request $request){
    	$id_mold = $request->id_mold;
    	$id_user = $request->id_user;
    	$namefood = $request->namefood;
    	$image = $request->image;
    	$day = $request->day;
    	$dataImage = "";
    	$check = $request->check;
    	$id_menu = $request->id_menu;

    	if($image != null){
    		$dataImage = $image;
    		$nameNew = Str::Random(15);
    		$foder = "img/$nameNew.jpg";
    		$push_Picture=file_put_contents($foder, base64_decode($dataImage));
    		$image = $foder;
    	}

    	if(empty($id_mold) || empty($id_user) || empty($namefood) || empty($day)){
    		echo "Null";
    	}else{
    		if($check == 0){
	    		$table = new Menu();
	    		$table ->id_mold = $id_mold;
	    		$table ->id_user = $id_user;
	    		$table ->namefood = $namefood;
	    		$table ->image = $image;
	    		$table ->day = $day;
	    		$table->save();
	    		echo "Sussces";
    		}else{
    			$table = Menu::where('id',$id_menu)->update(['namefood'=>$namefood,'image'=>$image,'day'=>$day,'id_mold'=>$id_mold]);
    			echo "Sussces";
    		}
    		
    	}
    	
    }
}
