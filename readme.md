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
###Setup for pulling git hub repository
```text
Github >> Settings (right side of screen) >>> SSH & GPG Keys
add new key from server see below


--> check version first to see if it's installed
git --version
--> if not install 
apt install git
--> add key from server to github??? 
--- instructions from github https://help.github.com/en/github/authenticating-to-github/error-permission-denied-publickey
 
--> ssh-keygen
--- This will start the process of generating key
--- copy the contents 
vi id_rsa.pub
```

###Update server from GIT
```text
git pull git@github.com:climbican/fitnessfeed_serv.git
---> password for id_rsa.pub key --->d1g3M()pSlut<---

```