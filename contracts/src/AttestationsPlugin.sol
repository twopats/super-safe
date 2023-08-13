pragma solidity ^0.8.13;
import {IEAS, AttestationRequest, AttestationRequestData} from "../lib/eas-contracts/contracts/IEAS.sol";


contract AttestationsPlugin {

    error UntrustedOrigin(address origin);
    bytes32 constant schema = 0x129ab3a6d7e761dc646902840f1be65ff84c5d634c8a2e630e2024b839e9cff8;
    IEAS public immutable eas;
    address public immutable safe;

    constructor(address _eas, address _safe) {
        eas = IEAS(_eas);
        safe = _safe;
    }

    function attestWithExecuction(string calldata _txDescription) external {
        if (msg.sender != safe ) {
            revert UntrustedOrigin(msg.sender);
        }
        
        address recipient = address(0); // The recipient of the attestation.
        uint64 expirationTime = 0; // The time when the attestation expires (Unix timestamp).
        bool revocable = false; // Whether the attestation is revocable.
        bytes32 refUID =  bytes32(0); // The UID of the related attestation.

        //build schema data
        address  moduleAddress = address(this);
        address  safeAddress = address(safe);
        string memory txDescription = _txDescription; 
        bytes memory schemaData = abi.encode(moduleAddress,safeAddress,txDescription); // Custom attestation data.

        uint256 value; // An explicit ETH amount to send to the resolver. This is important to prevent accidental user errors.

        //build attestation data
        eas.attest(AttestationRequest(schema, AttestationRequestData(recipient, expirationTime, revocable, refUID, schemaData, value)));

        

    }

    function makeAttestation() internal {
        
        // eas.attest();
    }
}