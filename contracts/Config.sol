/*
* LibertyPie Project (https://libertypie.com)
* @author https://github.com/libertypie (hello@libertypie.com)
* @license SPDX-License-Identifier: MIT
*/
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import "./PermissionManager/PM.sol";
import "./Storage/StoreProxy.sol";
import "./Commons/ConfigsStructs.sol";
import "./Utils.sol";

contract Config is PM, Utils {
    
    IStorage _configDataStore  = StoreProxy(address(this)).getIStorage();

    /**
     * add default config
     */
     constructor() public {
         _setConfig("MIN_PAYMENT_WINDOW", toBytes32(15));
         _setConfig("MAX_SECURITY_DEPOSIT", toBytes32(10));
         _setConfig("MAX_REPUTATION", toBytes32(10));
     }

    /**
     * get config
     * @param _key config key 
     */ 
    function getConfig(string memory _key) public view returns(bytes32) {
        return _configDataStore.getConfigData(toBytes32(_key));
    }

    /**
     * set config internally
     * @param _key config key
     * @param _value cofig data
     */
    function _setConfig(string memory _key, bytes32 _value) private  {
        _configDataStore.addConfigData(toBytes32(_key), _value);
    }

    /**
     * setConfig
     * @param _key config key
     * @param _value cofig data
     */
    function setConfig(string memory _key, bytes32 _value) external onlyAdmin() {
        _setConfig(_key,_value);
    }

    /**
     * get all config data
     */
    function getAllConfigs() external view returns(ConfigsStructs.ConfigItem[] memory) {
        return  _configDataStore.getAllConfigData();
    }

}