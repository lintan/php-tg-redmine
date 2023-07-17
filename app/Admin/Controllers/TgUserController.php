<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\TgUser;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class TgUserController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new TgUser(), function (Grid $grid) {
            $grid->setActionClass(Grid\Displayers\Actions::class);
            $grid->model()->orderBy('id','desc');
            $grid->column('id')->sortable();
            $grid->column('username');
            $grid->column('first_name');
            $grid->column('tg_id');
            $grid->column('balance');
            $grid->column('status')->switch('', true);
            $grid->column('invite_user');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('TG用户id');

            });
            $grid->actions(function (Grid\Displayers\Actions $actions) {
                $actions->disableDelete();
                $id = $actions->row->tg_id;
                $actionStr = "<a href=\"/admin/luckhistory?user_id={$id}\"><i class=\"fa fa-eye\">领取记录</i></a>";
                // append一个操作
                $actions->append($actionStr);

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
        return Show::make($id, new TgUser(), function (Show $show) {
            $show->field('id');
            $show->field('username');
            $show->field('first_name');
            $show->field('tg_id');
            $show->field('balance');
            $show->field('status');
            $show->field('invite_user');
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
        return Form::make(new TgUser(), function (Form $form) {
            $form->display('id');
            $form->text('username');
            $form->text('first_name');
            $form->text('tg_id');
            $form->text('balance');
            $form->text('status');
            $form->text('invite_user');

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
