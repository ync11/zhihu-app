@extends('layouts.app')

@section('content')
    @include('vendor.ueditor.assets')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 offset-md-1">
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
                            <form action="/questions/{{ $question->id }}" method="POST" class="delete-form">
                                {{ method_field('DELETE') }}
                                {{ csrf_field() }}
                                <button class="button is-naked delete-button">删除</button>
                            </form>
                        @endif
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header question-follow">
                        <h2>{{ $question->followers_count }}</h2>
                        <span>关注者</span>
                    </div>
                    <div class="card-body">
                        {{--<a href="/questions/{{$question->id}}/follow"--}}
                           {{--class="btn {{ Auth::user()->followed($question->id) ? 'btn-success' : 'btn-light' }}">--}}
                            {{--{{ Auth::user()->followed($question->id) ? '已关注' : '关注该问题' }}--}}
                        {{--</a>--}}
                        <question-follow-button question="{{$question->id}}" user="{{Auth::id()}}"></question-follow-button>
                        <a href="#editor" class="btn btn-primary">撰写答案</a>
                    </div>
                </div>
            </div>
            <div class="col-md-8 offset-md-1">
                <div class="card">
                    <div class="card-header">
                        {{ $question->answers_count }} 个答案
                    </div>

                    <div class="card-body">
                        @foreach($question->answers as $answer)
                            <div class="media">
                                <div class="media-left">
                                    <a href="">
                                        <img width="36" src="{{ $answer->user->avatar }}"
                                             alt="{{ $answer->user->name }}">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <a href="/user/{{ $answer->user->name }}">
                                            {{ $answer->user->name }}
                                        </a>
                                    </h4>
                                    {!! $answer->body !!}
                                </div>
                            </div>
                        @endforeach

                        @if(Auth::check())
                        <form action="/questions/{{$question->id}}/answer" method="post">
                            {!! csrf_field() !!}
                            <div class="form-group{{ $errors->has('body') ? ' has-error' : '' }}">
                                <script id="container" name="body" style="height:120px;" type="text/plain">
                                    {!! old('body')  !!}
                                </script>
                                @if ($errors->has('body'))
                                    <span class="help-block" style="font-size:80%;color:#e3342f;">
                                        <strong>{{ $errors->first('body') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <button class="btn btn-success float-right" type="submit">提交答案</button>
                        </form>
                        @else
                        <a href="/login" class="btn btn-success btn-block">登录提交答案</a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
    @section('js')
        <!-- 实例化编辑器 -->
        <script type="text/javascript">
        var ue = UE.getEditor('container', {
            toolbars: [
                ['bold', 'italic', 'underline', 'strikethrough', 'blockquote', 'insertunorderedlist', 'insertorderedlist', 'justifyleft','justifycenter', 'justifyright',  'link', 'insertimage', 'fullscreen']
            ],
            elementPathEnabled: false,
            enableContextMenu: false,
            autoClearEmptyNode:true,
            wordCount:false,
            imagePopup:false,
            autotypeset:{ indent: true,imageBlockLine: 'center' }
        });
        ue.ready(function() {
            ue.execCommand('serverparam', '_token', '{{ csrf_token() }}'); // 设置 CSRF token.
        });
        </script>
    @endsection
@endsection
