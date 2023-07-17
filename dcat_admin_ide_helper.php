<?php

/**
 * A helper file for Dcat Admin, to provide autocomplete information to your IDE
 *
 * This file should not be included in your code, only analyzed by your IDE!
 *
 * @author jqh <841324345@qq.com>
 */
namespace Dcat\Admin {
    use Illuminate\Support\Collection;

    /**
     * @property Grid\Column|Collection id
     * @property Grid\Column|Collection name
     * @property Grid\Column|Collection norms
     * @property Grid\Column|Collection category
     * @property Grid\Column|Collection price
     * @property Grid\Column|Collection shop_name
     * @property Grid\Column|Collection brand
     * @property Grid\Column|Collection state
     * @property Grid\Column|Collection added_at
     * @property Grid\Column|Collection images
     * @property Grid\Column|Collection year
     * @property Grid\Column|Collection rating
     * @property Grid\Column|Collection directors
     * @property Grid\Column|Collection casts
     * @property Grid\Column|Collection genres
     * @property Grid\Column|Collection type
     * @property Grid\Column|Collection version
     * @property Grid\Column|Collection detail
     * @property Grid\Column|Collection created_at
     * @property Grid\Column|Collection updated_at
     * @property Grid\Column|Collection is_enabled
     * @property Grid\Column|Collection parent_id
     * @property Grid\Column|Collection order
     * @property Grid\Column|Collection icon
     * @property Grid\Column|Collection uri
     * @property Grid\Column|Collection extension
     * @property Grid\Column|Collection permission_id
     * @property Grid\Column|Collection menu_id
     * @property Grid\Column|Collection slug
     * @property Grid\Column|Collection http_method
     * @property Grid\Column|Collection http_path
     * @property Grid\Column|Collection role_id
     * @property Grid\Column|Collection user_id
     * @property Grid\Column|Collection value
     * @property Grid\Column|Collection test
     * @property Grid\Column|Collection username
     * @property Grid\Column|Collection password
     * @property Grid\Column|Collection avatar
     * @property Grid\Column|Collection remember_token
     * @property Grid\Column|Collection group_id
     * @property Grid\Column|Collection remark
     * @property Grid\Column|Collection status
     * @property Grid\Column|Collection service_url
     * @property Grid\Column|Collection recharge_url
     * @property Grid\Column|Collection channel_url
     * @property Grid\Column|Collection admin_id
     * @property Grid\Column|Collection uuid
     * @property Grid\Column|Collection connection
     * @property Grid\Column|Collection queue
     * @property Grid\Column|Collection payload
     * @property Grid\Column|Collection exception
     * @property Grid\Column|Collection failed_at
     * @property Grid\Column|Collection lucky_id
     * @property Grid\Column|Collection is_thunder
     * @property Grid\Column|Collection amount
     * @property Grid\Column|Collection lose_money
     * @property Grid\Column|Collection first_name
     * @property Grid\Column|Collection sender_id
     * @property Grid\Column|Collection received
     * @property Grid\Column|Collection lucky
     * @property Grid\Column|Collection thunder
     * @property Grid\Column|Collection chat_id
     * @property Grid\Column|Collection red_list
     * @property Grid\Column|Collection sender_name
     * @property Grid\Column|Collection lose_rate
     * @property Grid\Column|Collection email
     * @property Grid\Column|Collection token
     * @property Grid\Column|Collection tokenable_type
     * @property Grid\Column|Collection tokenable_id
     * @property Grid\Column|Collection abilities
     * @property Grid\Column|Collection last_used_at
     * @property Grid\Column|Collection expires_at
     * @property Grid\Column|Collection tg_id
     * @property Grid\Column|Collection balance
     * @property Grid\Column|Collection invite_user
     * @property Grid\Column|Collection email_verified_at
     *
     * @method Grid\Column|Collection id(string $label = null)
     * @method Grid\Column|Collection name(string $label = null)
     * @method Grid\Column|Collection norms(string $label = null)
     * @method Grid\Column|Collection category(string $label = null)
     * @method Grid\Column|Collection price(string $label = null)
     * @method Grid\Column|Collection shop_name(string $label = null)
     * @method Grid\Column|Collection brand(string $label = null)
     * @method Grid\Column|Collection state(string $label = null)
     * @method Grid\Column|Collection added_at(string $label = null)
     * @method Grid\Column|Collection images(string $label = null)
     * @method Grid\Column|Collection year(string $label = null)
     * @method Grid\Column|Collection rating(string $label = null)
     * @method Grid\Column|Collection directors(string $label = null)
     * @method Grid\Column|Collection casts(string $label = null)
     * @method Grid\Column|Collection genres(string $label = null)
     * @method Grid\Column|Collection type(string $label = null)
     * @method Grid\Column|Collection version(string $label = null)
     * @method Grid\Column|Collection detail(string $label = null)
     * @method Grid\Column|Collection created_at(string $label = null)
     * @method Grid\Column|Collection updated_at(string $label = null)
     * @method Grid\Column|Collection is_enabled(string $label = null)
     * @method Grid\Column|Collection parent_id(string $label = null)
     * @method Grid\Column|Collection order(string $label = null)
     * @method Grid\Column|Collection icon(string $label = null)
     * @method Grid\Column|Collection uri(string $label = null)
     * @method Grid\Column|Collection extension(string $label = null)
     * @method Grid\Column|Collection permission_id(string $label = null)
     * @method Grid\Column|Collection menu_id(string $label = null)
     * @method Grid\Column|Collection slug(string $label = null)
     * @method Grid\Column|Collection http_method(string $label = null)
     * @method Grid\Column|Collection http_path(string $label = null)
     * @method Grid\Column|Collection role_id(string $label = null)
     * @method Grid\Column|Collection user_id(string $label = null)
     * @method Grid\Column|Collection value(string $label = null)
     * @method Grid\Column|Collection test(string $label = null)
     * @method Grid\Column|Collection username(string $label = null)
     * @method Grid\Column|Collection password(string $label = null)
     * @method Grid\Column|Collection avatar(string $label = null)
     * @method Grid\Column|Collection remember_token(string $label = null)
     * @method Grid\Column|Collection group_id(string $label = null)
     * @method Grid\Column|Collection remark(string $label = null)
     * @method Grid\Column|Collection status(string $label = null)
     * @method Grid\Column|Collection service_url(string $label = null)
     * @method Grid\Column|Collection recharge_url(string $label = null)
     * @method Grid\Column|Collection channel_url(string $label = null)
     * @method Grid\Column|Collection admin_id(string $label = null)
     * @method Grid\Column|Collection uuid(string $label = null)
     * @method Grid\Column|Collection connection(string $label = null)
     * @method Grid\Column|Collection queue(string $label = null)
     * @method Grid\Column|Collection payload(string $label = null)
     * @method Grid\Column|Collection exception(string $label = null)
     * @method Grid\Column|Collection failed_at(string $label = null)
     * @method Grid\Column|Collection lucky_id(string $label = null)
     * @method Grid\Column|Collection is_thunder(string $label = null)
     * @method Grid\Column|Collection amount(string $label = null)
     * @method Grid\Column|Collection lose_money(string $label = null)
     * @method Grid\Column|Collection first_name(string $label = null)
     * @method Grid\Column|Collection sender_id(string $label = null)
     * @method Grid\Column|Collection received(string $label = null)
     * @method Grid\Column|Collection lucky(string $label = null)
     * @method Grid\Column|Collection thunder(string $label = null)
     * @method Grid\Column|Collection chat_id(string $label = null)
     * @method Grid\Column|Collection red_list(string $label = null)
     * @method Grid\Column|Collection sender_name(string $label = null)
     * @method Grid\Column|Collection lose_rate(string $label = null)
     * @method Grid\Column|Collection email(string $label = null)
     * @method Grid\Column|Collection token(string $label = null)
     * @method Grid\Column|Collection tokenable_type(string $label = null)
     * @method Grid\Column|Collection tokenable_id(string $label = null)
     * @method Grid\Column|Collection abilities(string $label = null)
     * @method Grid\Column|Collection last_used_at(string $label = null)
     * @method Grid\Column|Collection expires_at(string $label = null)
     * @method Grid\Column|Collection tg_id(string $label = null)
     * @method Grid\Column|Collection balance(string $label = null)
     * @method Grid\Column|Collection invite_user(string $label = null)
     * @method Grid\Column|Collection email_verified_at(string $label = null)
     */
    class Grid {}

    class MiniGrid extends Grid {}

    /**
     * @property Show\Field|Collection id
     * @property Show\Field|Collection name
     * @property Show\Field|Collection norms
     * @property Show\Field|Collection category
     * @property Show\Field|Collection price
     * @property Show\Field|Collection shop_name
     * @property Show\Field|Collection brand
     * @property Show\Field|Collection state
     * @property Show\Field|Collection added_at
     * @property Show\Field|Collection images
     * @property Show\Field|Collection year
     * @property Show\Field|Collection rating
     * @property Show\Field|Collection directors
     * @property Show\Field|Collection casts
     * @property Show\Field|Collection genres
     * @property Show\Field|Collection type
     * @property Show\Field|Collection version
     * @property Show\Field|Collection detail
     * @property Show\Field|Collection created_at
     * @property Show\Field|Collection updated_at
     * @property Show\Field|Collection is_enabled
     * @property Show\Field|Collection parent_id
     * @property Show\Field|Collection order
     * @property Show\Field|Collection icon
     * @property Show\Field|Collection uri
     * @property Show\Field|Collection extension
     * @property Show\Field|Collection permission_id
     * @property Show\Field|Collection menu_id
     * @property Show\Field|Collection slug
     * @property Show\Field|Collection http_method
     * @property Show\Field|Collection http_path
     * @property Show\Field|Collection role_id
     * @property Show\Field|Collection user_id
     * @property Show\Field|Collection value
     * @property Show\Field|Collection test
     * @property Show\Field|Collection username
     * @property Show\Field|Collection password
     * @property Show\Field|Collection avatar
     * @property Show\Field|Collection remember_token
     * @property Show\Field|Collection group_id
     * @property Show\Field|Collection remark
     * @property Show\Field|Collection status
     * @property Show\Field|Collection service_url
     * @property Show\Field|Collection recharge_url
     * @property Show\Field|Collection channel_url
     * @property Show\Field|Collection admin_id
     * @property Show\Field|Collection uuid
     * @property Show\Field|Collection connection
     * @property Show\Field|Collection queue
     * @property Show\Field|Collection payload
     * @property Show\Field|Collection exception
     * @property Show\Field|Collection failed_at
     * @property Show\Field|Collection lucky_id
     * @property Show\Field|Collection is_thunder
     * @property Show\Field|Collection amount
     * @property Show\Field|Collection lose_money
     * @property Show\Field|Collection first_name
     * @property Show\Field|Collection sender_id
     * @property Show\Field|Collection received
     * @property Show\Field|Collection lucky
     * @property Show\Field|Collection thunder
     * @property Show\Field|Collection chat_id
     * @property Show\Field|Collection red_list
     * @property Show\Field|Collection sender_name
     * @property Show\Field|Collection lose_rate
     * @property Show\Field|Collection email
     * @property Show\Field|Collection token
     * @property Show\Field|Collection tokenable_type
     * @property Show\Field|Collection tokenable_id
     * @property Show\Field|Collection abilities
     * @property Show\Field|Collection last_used_at
     * @property Show\Field|Collection expires_at
     * @property Show\Field|Collection tg_id
     * @property Show\Field|Collection balance
     * @property Show\Field|Collection invite_user
     * @property Show\Field|Collection email_verified_at
     *
     * @method Show\Field|Collection id(string $label = null)
     * @method Show\Field|Collection name(string $label = null)
     * @method Show\Field|Collection norms(string $label = null)
     * @method Show\Field|Collection category(string $label = null)
     * @method Show\Field|Collection price(string $label = null)
     * @method Show\Field|Collection shop_name(string $label = null)
     * @method Show\Field|Collection brand(string $label = null)
     * @method Show\Field|Collection state(string $label = null)
     * @method Show\Field|Collection added_at(string $label = null)
     * @method Show\Field|Collection images(string $label = null)
     * @method Show\Field|Collection year(string $label = null)
     * @method Show\Field|Collection rating(string $label = null)
     * @method Show\Field|Collection directors(string $label = null)
     * @method Show\Field|Collection casts(string $label = null)
     * @method Show\Field|Collection genres(string $label = null)
     * @method Show\Field|Collection type(string $label = null)
     * @method Show\Field|Collection version(string $label = null)
     * @method Show\Field|Collection detail(string $label = null)
     * @method Show\Field|Collection created_at(string $label = null)
     * @method Show\Field|Collection updated_at(string $label = null)
     * @method Show\Field|Collection is_enabled(string $label = null)
     * @method Show\Field|Collection parent_id(string $label = null)
     * @method Show\Field|Collection order(string $label = null)
     * @method Show\Field|Collection icon(string $label = null)
     * @method Show\Field|Collection uri(string $label = null)
     * @method Show\Field|Collection extension(string $label = null)
     * @method Show\Field|Collection permission_id(string $label = null)
     * @method Show\Field|Collection menu_id(string $label = null)
     * @method Show\Field|Collection slug(string $label = null)
     * @method Show\Field|Collection http_method(string $label = null)
     * @method Show\Field|Collection http_path(string $label = null)
     * @method Show\Field|Collection role_id(string $label = null)
     * @method Show\Field|Collection user_id(string $label = null)
     * @method Show\Field|Collection value(string $label = null)
     * @method Show\Field|Collection test(string $label = null)
     * @method Show\Field|Collection username(string $label = null)
     * @method Show\Field|Collection password(string $label = null)
     * @method Show\Field|Collection avatar(string $label = null)
     * @method Show\Field|Collection remember_token(string $label = null)
     * @method Show\Field|Collection group_id(string $label = null)
     * @method Show\Field|Collection remark(string $label = null)
     * @method Show\Field|Collection status(string $label = null)
     * @method Show\Field|Collection service_url(string $label = null)
     * @method Show\Field|Collection recharge_url(string $label = null)
     * @method Show\Field|Collection channel_url(string $label = null)
     * @method Show\Field|Collection admin_id(string $label = null)
     * @method Show\Field|Collection uuid(string $label = null)
     * @method Show\Field|Collection connection(string $label = null)
     * @method Show\Field|Collection queue(string $label = null)
     * @method Show\Field|Collection payload(string $label = null)
     * @method Show\Field|Collection exception(string $label = null)
     * @method Show\Field|Collection failed_at(string $label = null)
     * @method Show\Field|Collection lucky_id(string $label = null)
     * @method Show\Field|Collection is_thunder(string $label = null)
     * @method Show\Field|Collection amount(string $label = null)
     * @method Show\Field|Collection lose_money(string $label = null)
     * @method Show\Field|Collection first_name(string $label = null)
     * @method Show\Field|Collection sender_id(string $label = null)
     * @method Show\Field|Collection received(string $label = null)
     * @method Show\Field|Collection lucky(string $label = null)
     * @method Show\Field|Collection thunder(string $label = null)
     * @method Show\Field|Collection chat_id(string $label = null)
     * @method Show\Field|Collection red_list(string $label = null)
     * @method Show\Field|Collection sender_name(string $label = null)
     * @method Show\Field|Collection lose_rate(string $label = null)
     * @method Show\Field|Collection email(string $label = null)
     * @method Show\Field|Collection token(string $label = null)
     * @method Show\Field|Collection tokenable_type(string $label = null)
     * @method Show\Field|Collection tokenable_id(string $label = null)
     * @method Show\Field|Collection abilities(string $label = null)
     * @method Show\Field|Collection last_used_at(string $label = null)
     * @method Show\Field|Collection expires_at(string $label = null)
     * @method Show\Field|Collection tg_id(string $label = null)
     * @method Show\Field|Collection balance(string $label = null)
     * @method Show\Field|Collection invite_user(string $label = null)
     * @method Show\Field|Collection email_verified_at(string $label = null)
     */
    class Show {}

    /**
     
     */
    class Form {}

}

namespace Dcat\Admin\Grid {
    /**
     * @method $this code(...$params)
     */
    class Column {}

    /**
     
     */
    class Filter {}
}

namespace Dcat\Admin\Show {
    /**
     
     */
    class Field {}
}
