<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreQuestionRequest;
use App\Question;
use App\Repositories\QuestionRepository;
use App\Topic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

/**
 * Class QuestionsController
 * @package App\Http\Controllers
 */
class QuestionsController extends Controller
{
    /**
     * @var QuestionRepository
     */
    protected $questionRepository;

    /**
     * QuestionsController constructor.
     * @param QuestionRepository $questionRepository
     */
    public function __construct(QuestionRepository $questionRepository)
    {
        $this->middleware('auth')->except(['index', 'show']);
        $this->questionRepository = $questionRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $questions = $this->questionRepository->getQuestionFeed();

        return view('questions.index', compact('questions'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('questions.make');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreQuestionRequest $request)
    {
        $topics = $this->questionRepository->normalizeTopic($request->get('topics'));

        $data = [
            'title' => $request->get('title'),
            'body' => $request->get('body'),
            'user_id' => Auth::id()
        ];

        $question = $this->questionRepository->create($data);

        $question->topics()->attach($topics);

        return redirect()->route('question.show', [$question->id]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $question = $this->questionRepository->byIdWithTopicsAndAnswers($id);

        return view('questions.show', compact('question'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $question = $this->questionRepository->byId($id);

        if (Auth::user()->owns($question)) {
            return view('questions.edit', compact('question'));
        }

        return back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreQuestionRequest $request, $id)
    {
        $question = $this->questionRepository->byId($id);
        $topics = $this->questionRepository->normalizeTopic($request->get('topics'));

        $question->update([
            'title' => $request->get('title'),
            'body' => $request->get('body')
        ]);

        $question->topics()->sync($topics);

        return redirect()->route('question.show', [$question->id]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $question = $this->questionRepository->byId($id);

        if (Auth::user()->owns($question)) {
            $question->delete();

            return redirect('/');
        }

        abort('403', 'Forbidden');
    }
}
