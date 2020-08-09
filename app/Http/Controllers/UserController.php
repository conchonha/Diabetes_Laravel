<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Acount;

class UserController extends Controller
{
	  public function login(Request $request){
        if($request->has('email') && $request->has('password')){
            $email = $request->email;
            $password = $request->password;

            if($email != null && $password != null){
                $table = Acount::where([['email','=',$email],['password','=',md5($password)]])->get();
                echo json_encode($table[0]);
                
            }else{
                echo "Data not null";
            }

        }else{
            echo "No send data";
        }
    }

     public function updatePass(Request $request){
            if($request->has('email') && $request->has('password')){
                $email = $request->email;
                $password = $request->password;

                if($email != null && $password != null){
                    $table = Acount::where('email','=',$email)->update(["password"=>md5($password)]);
                    echo md5($password);
                    
                }else{
                    echo "Data not null";
                }

            }else{
                echo "No send data";
            }
        }



     public function register(Request $request)
    {
    	if($request->has('fullname') && $request->has('email') && $request->has('password') && $request->has('heights') && $request->has('weights') && $request->has('age') && $request->has('dayofbirth') && $request->has('sex') && $request->has('check')){

            $fullname = $request->fullname;
            $email = $request->email;
            $password = $request->password;
            $heights = $request->heights;
            $weights = $request->weights;
            $age = $request->age;
            $dayofbirth = $request->dayofbirth;
            $sex = $request->sex;

            $check = $request->check;
            if($check == 0){
                $table = new Acount();
                $table->fullname = $fullname;
                $table->email = $email;
                $table->heights = $heights;
                $table->weights= $weights;
                $table->age = $age;
                $table->dayofbirth = $dayofbirth;
                $table->sex = $sex;
                $table->password = md5($password);
                $table->status = 0;
                $table->save();
                
                echo json_encode($table); 
            }else{
                $table = Acount::where("email",'=',$email)->update(['fullname'=>$fullname,'email'=>$email,'heights'=>$heights, 'weights'=>$weights, 'age'=>$age, 'dayofbirth'=>$dayofbirth, 'sex'=>$sex]);
                $table = Acount::where('email','=',$email)->get();
                echo json_encode($table[0]); 
            
            }		
    			
    	}else{
    		echo "null";
    	}
    }
}
