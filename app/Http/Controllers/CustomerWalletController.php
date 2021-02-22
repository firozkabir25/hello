<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CustomerWallet;
use Twilio\Rest\Monitor\V1\AlertList;

class CustomerWalletController extends Controller
{
    public function index(){
        $wallets = CustomerWallet::all();
        return view('backend.customer_wallet.index', compact('wallets'));
    }
    public function edit($id){
        $wallets = CustomerWallet::find($id);
        return view('backend.customer_wallet.edit', compact('wallets'));
    }
    public function update($id)
    {
        $wallets = new CustomerWallet();
        $wallets = CustomerWallet::find($id);
        $wallets->customer_wallet = request('customer_wallet');

        $wallets->save();

        return redirect()->route('cwallet.index');
    }
}
