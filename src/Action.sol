pragma solidity >=0.5.12;

import "lib/dss-exec-lib/src/DssAction.sol";
import "lib/dss-exec-lib/lib/dss-interfaces/src/dss/IlkRegistryAbstract.sol";

contract Action is DssAction { // This could be changed to a library if the lib is hardcoded and the constructor removed

    // This can be hardcoded away later or can use the chain-log
    constructor(address lib) DssAction(lib) public {}

    uint256 constant MILLION  = 10 ** 6;

    function execute() external {
        setIlkDebtCeiling("YFI-A", 20 * MILLION);
        setGlobalDebtCeiling(1_476_750_000);

        bytes32[] memory ilks = IlkRegistryAbstract(reg()).ilks();

        for(uint i = 0; i < ilks.length; i++) {
            setIlkMinVaultAmount(ilks[i], 1000);
        }
    }
}