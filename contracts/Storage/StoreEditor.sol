
/*
* LibertyPie Project (https://libertypie.com)
* @author https://github.com/libertypie (hello@libertypie.com)
* @license SPDX-License-Identifier: MIT
*/

contract StoreEditor is PM {

     //permision role
     /// we allow only contracts to edit storage 
    string STORAGE_EDITOR_ROLE = "STORAGE_EDITOR";

    //permissions 
    modifier onlyStoreEditor() {
        require(PM.hasRole(STORAGE_EDITOR_ROLE,msg.sender),"ONLY_STORAGE_EDITORS_ALLOWED");
        _;
    }
    
}