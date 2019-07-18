<p align="center"><img src="https://laravel.com/assets/img/components/logo-laravel.svg"></p>

# Laravel PHP Framework

[![Build Status](https://travis-ci.org/laravel/framework.svg)](https://travis-ci.org/laravel/framework)
[![Total Downloads](https://poser.pugx.org/laravel/framework/d/total.svg)](https://packagist.org/packages/laravel/framework)
[![Latest Stable Version](https://poser.pugx.org/laravel/framework/v/stable.svg)](https://packagist.org/packages/laravel/framework)
[![Latest Unstable Version](https://poser.pugx.org/laravel/framework/v/unstable.svg)](https://packagist.org/packages/laravel/framework)
[![License](https://poser.pugx.org/laravel/framework/license.svg)](https://packagist.org/packages/laravel/framework)

## I made a custom change on 
Illuminate\Database\Query\Builder.php to accept another param because the original was causing an error in mysql
### may not be necessary, it worked properly after upgrade from 5.2 -> 5.8
```php
 public function paginate($perPage = 15, $columns = ['*'], $pageName = 'page', $page = null, $table_to_count_from=null)
    {
        $page = $page ?: Paginator::resolveCurrentPage($pageName);
		// MY CHANGE!!! I CHANGED THE CODE BECAUSE IT CAUSES AN ERROR IN MYSQL ON MULTIPLE COLUMNS
	    $total = (is_null($table_to_count_from)) ? $this->getCountForPagination($columns) : $this->getCountForPagination([$table_to_count_from.'.id']);

        $results = $total ? $this->forPage($page, $perPage)->get($columns) : [];

        return new LengthAwarePaginator($results, $total, $perPage, $page, [
            'path' => Paginator::resolveCurrentPath(),
            'pageName' => $pageName,
        ]);
    }
```
