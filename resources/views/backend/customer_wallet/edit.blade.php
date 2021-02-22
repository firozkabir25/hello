@extends('backend.layouts.app')
@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
    <h3 class="mb-0 h3">{{translate('Update Customer wallet')}}</h3>
</div>
    <div>
        <form method="POST" action="{{route('cwallet.update', $wallets->id)}}"> 
            @csrf
            @method('PUT')
                <div class="col-md-3">
                    <label>Customer Wallet :</label>
                </div>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="customer_wallet" value="{{$wallets->customer_wallet}}"></br>
                    <button type="submit" class=" btn btn-primary">Update</button>
                </div>
        </form>
    </div>
   

@endsection