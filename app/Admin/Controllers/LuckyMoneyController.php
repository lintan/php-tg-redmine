<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\LuckyMoney;
use Dcat\Admin\Admin;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class LuckyMoneyController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new LuckyMoney(), function (Grid $grid) {
            $grid->setActionClass(Grid\Displayers\Actions::class);
            $grid->column('id')->sortable();
            $grid->column('sender_id');
            $grid->column('amount');
            $grid->column('received');
            $grid->column('number');
            $grid->column('lucky');
            $grid->column('thunder');
            $grid->column('chat_id');
//            $grid->column('red_list');
            $grid->column('sender_name');
            $grid->column('lose_rate');
            $grid->column('status')->using([1 => '正常', 2 => '已领完', 3=>'已过期'])->label([
                'default' => 'primary', // 设置默认颜色，不设置则默认为 default

                1 => 'primary',
                2 => 'success',
                3 => Admin::color()->gray(),
            ]);
            $grid->column('created_at')->sortable();
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->like('sender_name');
                $filter->between('created_at', '创建时间')->datetime();
            });
            $grid->actions(function (Grid\Displayers\Actions $actions) {
                $actions->disableDelete();
                $id = $actions->row->id;
                $actionStr = "<a href=\"/admin/luckhistory?lucky_id={$id}\"><i class=\"fa fa-eye\">领取记录</i></a>";
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
        return Show::make($id, new LuckyMoney(), function (Show $show) {
            $show->field('id');
            $show->field('sender_id');
            $show->field('amount');
            $show->field('received');
            $show->field('number');
            $show->field('lucky');
            $show->field('thunder');
            $show->field('chat_id');
            $show->field('red_list');
            $show->field('sender_name');
            $show->field('lose_rate');
            $show->field('status');
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
        return Form::make(new LuckyMoney(), function (Form $form) {
            $form->display('id');
            $form->text('sender_id');
            $form->text('amount');
            $form->text('received');
            $form->text('number');
            $form->text('lucky');
            $form->text('thunder');
            $form->text('chat_id');
            $form->text('red_list');
            $form->text('sender_name');
            $form->text('lose_rate');
            $form->text('status');

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
