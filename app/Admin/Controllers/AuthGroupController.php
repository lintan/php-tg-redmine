<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\AuthGroup;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class AuthGroupController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new AuthGroup(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('group_id');
            $grid->column('remark');
            $grid->column('status')->switch('', true);
            $grid->column('service_url');
            $grid->column('recharge_url');
            $grid->column('channel_url');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');

            });
        });
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        return Show::make($id, new AuthGroup(), function (Show $show) {
            $show->field('id');
            $show->field('group_id');
            $show->field('remark');
            $show->field('status');
            $show->field('service_url');
            $show->field('recharge_url');
            $show->field('channel_url');
            $show->field('created_at');
            $show->field('updated_at');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new AuthGroup(), function (Form $form) {
            $form->display('id');
            $form->text('group_id');
            $form->text('remark');
            $form->text('status');
            $form->text('service_url');
            $form->text('recharge_url');
            $form->text('channel_url');

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
