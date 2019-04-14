<?php
/**
 * Fills a template with data
 * @param   string          $name       template name
 * @param   array           $data       template data
 * @return  false|string    $result     html
 */
function include_template($name, $data) {
    $name = 'templates/' . $name;
    $result = '';
    if (!is_readable($name)) {
        return $result;
    }
    ob_start();
    extract($data);
    require $name;
    $result = ob_get_clean();
    return $result;
};


/**
* Rounds the price up and adds a currency symbol
* @param   integer|float    $price      price
* @param   string           $currency   currency symbol
* @return  string                       formatted price
*/
function format_price ($price, $currency)
{
    $price_ceil = ceil($price);
    if ($price_ceil < 1000) {
        return  $price_ceil . ' ' . $currency;
    }
    return number_format($price_ceil, 0, '.', ' ') . ' ' . $currency;
};

