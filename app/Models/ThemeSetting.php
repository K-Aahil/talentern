<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ThemeSetting extends Model
{
    //

    public function getBackgroundImageUrlAttribute(){
        if(is_null($this->home_background_image)){
        //     return asset('front/assets/img/header-bg.jpg');
        // }
        // if($this->home_background_image === ''){
            return asset('front/assets/img/header-bg.jpg');
        }

            return asset('user-uploads/background/'.$this->home_background_image);

        // return asset_url('user-uploads/background/'.$this->home_background_image);
        
        // return asset('front/assets/img/header-bg.jpg');
    }
}
