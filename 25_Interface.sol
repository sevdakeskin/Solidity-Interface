// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Counter{
    uint public count;

    function increment()external{
        count +=1;
    }

}
//Bir interface ,diğer sözleşmeler tarafından çağrılabilecek fonksiyon adlarını
// ve genel türlerini içerir
//interface -> blueprint -> taslak

interface ICounter {
    function count() external view returns(uint);

    function increment() external ;
}


contract ExampleCounter{
    ICounter public counter;

    constructor(address _counterContractAddress){
        counter = ICounter(_counterContractAddress);
    }

    function incrementFunc() external  returns(uint){
        counter.increment();
        uint currentCount = counter.count();

        return currentCount;
    }


}