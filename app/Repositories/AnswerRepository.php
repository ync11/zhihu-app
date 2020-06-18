<?php
/**
 * Created by PhpStorm.
 * User: ync
 * Date: 2020/6/18
 * Time: 15:34
 */

namespace App\Repositories;

use App\Answer;

class AnswerRepository
{
    /**
     * @param array $attributes
     * @return mixed
     */
    public function create(array $attributes)
    {
        return Answer::create($attributes);
    }
}
