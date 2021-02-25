/*
* LibertyPie Project (https://libertypie.com)
* @author https://github.com/libertypie (hello@libertypie.com)
* @license SPDX-License-Identifier: MIT
*/
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;
import "./StoreEditor.sol";
import "../Commons/PaymentMethodsStructImpl.sol";


contract PaymentMethodsStore is StoreEditor,  PaymentMethodsStructImpl  {

    uint256  totalPaymentMethodsCategories;
    uint256  totalPaymentMethods;

    //paymentTypes categories
    // format mapping(index => name)
    // NOTE  That the index always starts with 1 and not 0
    mapping(uint256 => CategoryStruct) private  PaymentMethodsCategories;


    // paymentTypes 
    // format mapping(index => name)
    // NOTE  That the index always starts with 1 and not 0
    mapping(uint256 => PaymentMethodStruct) private PaymentMethodsData;


     /**
     * @dev generate or get next catId
     */
    function getNextPaymentMethodCategoryId() external onlyStoreEditor returns(uint256) {
        return (++totalPaymentMethodsCategories);
    }

    /**
     * @dev get total payment methods
     */
     function getTotalPaymentMethods() public view  returns (uint256) {
        return totalPaymentMethodsCategories;
     }

       /**
     * @dev get total categories
     */
     function getTotalPaymentMethodsCategories() public view  returns (uint256) {
        return totalCategories;
     }

    /**
     * getNextPaymentMethodId
     */
    function getNextPaymentMethodId() external onlyStoreEditor returns(uint256) {
        return (++totalPaymentMethods);
    }

    /**
     * addPaymentMethod
     */
    function savePaymentMethodData(
        uint256 _id,
        PaymentMethodStruct memory _data
    ) external onlyStoreEditor {
        PaymentMethodsData[_id] = _data;
    }


    /**
     * @dev save category data
     */
    function savePaymentMethodsCategoryData(
        uint256 _id,
        CategoryStruct memory _data
    ) external onlyStoreEditor { 
        PaymentMethodsCategories[_id] = _data;
    }

    /**
     * deleteCategoryData
     * @param _id category id
     */
    function deletePaymentMethodsCategoryData(uint256 _id) external  onlyStoreEditor {
        delete PaymentMethodsCategories[_id];
    }

    /**
     * deleteCategoryData
     * @param _id category id
     */
    function deletePaymentMethodData(uint256 _id) external  onlyStoreEditor {
        delete PaymentMethodsData[_id];
    }
    

    /**
     * get payment method category
     */
     function getPaymentMethodsCategory(uint256 _id) external view returns (CategoryStruct) {
         return PaymentMethodsCategories[id];
     } //end fun 
}