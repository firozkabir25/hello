@extends('backend.layouts.app')

@section('content')
		    <div class="card-header row gutters-5">
				<div class="col text-center text-md-left">
					<h5 class="mb-md-0 h6">{{ translate('Wallet') }}</h5>
				</div>
		    </div>
		    <div class="card-body">
		        <table class="table aiz-table mb-0">
		            <thead>
		                <tr>
		                    <th>#</th>
		                    <th>{{translate('Wallet Amount')}}</th>
		                    <th>Update</th>
		                </tr>
		            </thead>
                    <tbody>
                        @foreach($wallets as $wallte)
                            <tr>
                                <td>{{ $wallte->id }}</td>
                                <td>{{ $wallte->customer_wallet }}</td>
                                <td ><a href="{{route('cwallet.edit', $wallte->id)}}">Update</a></td>
                            </tr>
                        @endforeach                            
                    </tbody>
		        </table>
		    </div>
    @endsection
