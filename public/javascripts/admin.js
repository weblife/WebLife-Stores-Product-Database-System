/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function toggle_store_fields(element){
    if(element.checked){
        Element.hide('store_url');
        Element.hide('store_type');
        Element.hide('store_status');
    }
    else
        {
         $('store_url').style.display='table-row';
         $('store_type').style.display='table-row';
         $('store_status').style.display='table-row';
        }
}