<?php

namespace App\Admin\Repositories;

use App\Models\AuthGroup as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class AuthGroup extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
