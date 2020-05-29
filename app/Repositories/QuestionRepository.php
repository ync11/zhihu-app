<?php
/**
 * Created by PhpStorm.
 * User: EDZ
 * Date: 2020/5/28
 * Time: 15:12
 */

namespace App\Repositories;

use App\Question;
use App\Topic;

/**
 * Class QuestionRepository
 * @package App\Repositories
 */
class QuestionRepository
{
    /**
     * @param $id
     * @return mixed
     */
    public function byIdWithTopics($id)
    {
        return Question::where('id', $id)->with('topics')->first();
    }

    public function byId($id)
    {
        return Question::find($id);
    }

    /**
     * @param array $attributes
     * @return mixed
     */
    public function create(array $attributes)
    {
        return Question::create($attributes);
    }

    /**
     * @param array $topics
     * @return array
     */
    public function normalizeTopic(array $topics)
    {
        return collect($topics)->map(function ($topic){
            if (is_numeric($topic)) {
                Topic::find($topic)->increment('questions_count');
                return (int)$topic;
            }
            $newTopic = Topic::create(['name' => $topic, 'questions_count' => 1]);
            return $newTopic->id;
        })->toArray();
    }
}
