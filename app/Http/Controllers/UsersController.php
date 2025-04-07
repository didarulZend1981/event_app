<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    public function getUsers(){
        $users = User::all();
        return response()->json($users);
    }

    public function getUser(Request $request, $id){
        $users = User::findOrFail($id);
        return response()->json($users);
    }

    public function createUser(Request $request){
        $request->validate([
            'role' => 'required',
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:5',
        ]);

        $user = User::create($request->all());
        return response()->json(['message' => 'insert success', 'data' => $user]);

    }

    public function updateUser(Request $request, $id){

        // dd($request->all());

        // print_r($request->all());exit;
        // print_r($request->id);exit;
        $request->validate([
            'role' => 'required',
            'name' => 'required',
            'email' => 'required|email|unique:users,email,'.$id,
        ]);

        $user = User::findOrFail($id);

        $user->update($request->all());

        return response()->json(['message' => 'update success', 'data' => $user]);
    }

    public function deleteUser($id){
        User::destroy($id);

        return response()->json(['message' => 'delete success', 'data' => '']);
    }






}
