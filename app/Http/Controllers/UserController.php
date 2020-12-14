<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Acount;

class UserController extends Controller
{
    public function respondWithJson($data,$message,$statuscode)
    {
        return response()->json([
            'message' => $message,
            'statuscode' => $statuscode,
            'data' => $data,
        ]);
    }
    
	  public function login(Request $request){
        if($request->has('email') && $request->has('password')){
            $email = $request->email;
            $password = $request->password;

             $count = Acount::where([['email','=',$email],['password','=',md5($password)]])->count();
             $table = Acount::where([['email','=',$email],['password','=',md5($password)]])->get();
             if($count>0){
                 return $this->respondWithJson($table,"Susscess",200);
             }else{
                 return $this->respondWithJson($table,"account incorrect",300);
             }
        }else{
            return $this->respondWithJson($table,"No send data",300);
        }
    }

     public function updatePass(Request $request){
            if($request->has('email') && $request->has('password')){
                $email = $request->email;
                $password = $request->password;

                    $table = Acount::where('email','=',$email)->update(["password"=>md5($password)]);
                    if($table){
                        echo md5($password);
                    }else{
                        echo "Update Err";
                    }

            }else{
                echo "No send data";
            }
        }



     public function register(Request $request)
    {
    	if($request->has('fullname') && $request->has('email') && $request->has('password') && $request->has('age') && $request->has('dayofbirth') && $request->has('sex') && $request->has('check')){

            $fullname = $request->fullname;
            $email = $request->email;
            $password = $request->password;
            $age = $request->age;
            $dayofbirth = $request->dayofbirth;
            $sex = $request->sex;

            $check = $request->check;
            if($check == 0){
                $count = Acount::where('email',$email)->count();
                $table = Acount::where('email',$email)->get();
                if($count>0){
                    return $this->respondWithJson($table,"Email already exists",300); 
                }else{
                    $table = new Acount();
                    $table->fullname = $fullname;
                    $table->email = $email;
                    $table->age = $age;
                    $table->dayofbirth = $dayofbirth;
                    $table->sex = $sex;
                    $table->password = md5($password);
                    $table->status = 0;
                    $table->save();
                    $data= [$table];
                    return $this->respondWithJson($data,"Register Susscess",200); 
                }
                
            }else{

                $table = Acount::where("email",'=',$email)->update(['fullname'=>$fullname,'age'=>$age,'dayofbirth'=>$dayofbirth, 'sex'=>$sex]);
                $table = Acount::where('email','=',$email)->get();
                return $this->respondWithJson($table,"Update Susscess",200);  
            }		
        
    			
    	}else{
    		echo "null";
    	}
    }
}
