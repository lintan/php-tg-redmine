<?php

namespace App\Admin\Repositories;

use App\Models\Config as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Config extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
