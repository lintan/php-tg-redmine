<?php

namespace App\Admin\Repositories;

use App\Models\TgUser as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class TgUser extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
