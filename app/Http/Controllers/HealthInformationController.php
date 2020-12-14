<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\HealthInformation;

class HealthInformationController extends Controller
{
	 public function insert(Request $request){
	 	$id = $request->id;
	 	$heights = $request->heights;
		 $weights = $request->weights;
		 $bloodPressure = $request->bloodPressure;
		 $bloodSugar = $request->bloodSugar;
		 $CPR = $request->CPR;
		 $HDL_C = $request->HDL_C;
		 $LDL_C = $request->LDL_C;
		 $time = $request->time;
		 $id_user = $request->id_user;

	 	if($id == 0){
		 	$table = new HealthInformation();
		 	$table->heights=$heights;
		 	$table->weights=$weights;
		 	$table->bloodPressure=$bloodPressure;
		 	$table->bloodSugar=$bloodSugar;
		 	$table->CPR=$CPR;
		 	$table->HDL_C=$HDL_C;
		 	$table->LDL_C=$LDL_C;
		 	$table->time=$time;
		 	$table->id_user=$id_user;
		 	$table->save();
		 	$data = HealthInformation::where('id','=',$table->id)->get()[0];
		 	return $data;
	 	}

	 	$table = HealthInformation::where("id",'=',$id)->update(['heights'=>$heights,'weights'=>$weights,'bloodPressure'=>$bloodPressure,'bloodSugar'=>$bloodSugar,'CPR'=>$CPR,'HDL_C'=>$HDL_C,'LDL_C'=>$LDL_C,'time'=>$time]);
	 		
	 	return HealthInformation::where('id','=',$id)->get()[0];
	 }

	 public function getLastHealthInformation(){
	 	return HealthInformation::orderBy('health_information.id','desc')->take(1)->get()[0];
	 }

	 public function getObjectHealthInformation(Request $request){
	 	return HealthInformation::where('time','=',$request->time)->orderBy('health_information.id','desc')->take(1)->get()[0];
	 }

	 public function getAll(){
	 	echo json_encode(HealthInformation::all());
	 }

	 public function deleteObject(Request $request){
	 	$table = HealthInformation::where('time','=',$request->date)->delete();
	 	if($table){
	 		echo "Success";
	 	}else{
	 		echo "Faild";
	 	}
	 }

	 public function respondWithJson($data,$message,$statuscode)
    {
        return response()->json([
            'message' => $message,
            'statuscode' => $statuscode,
            'data' => $data,
        ]);
    }   
}
