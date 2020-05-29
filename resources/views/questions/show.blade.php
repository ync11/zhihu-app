@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        {{ $question->title }}
                        @foreach($question->topics as $topic)
                            <a class="topic float-right" href="/topic/{{ $topic->id }}">{{ $topic->name }}</a>
                        @endforeach
                    </div>

                    <div class="card-body">
                        {!! $question->body !!}
                    </div>
                    <div class="actions">
                        @if(Auth::check() && Auth::user()->owns($question))
                            <span class="edit"><a href="/questions/{{ $question->id }}/edit">编辑</a></span>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        .card-body img {
            width: 100%;
        }
    </style>
@endsection
