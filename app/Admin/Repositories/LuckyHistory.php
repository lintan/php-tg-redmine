<?php

namespace App\Admin\Repositories;

use App\Models\LuckyHistory as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class LuckyHistory extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
