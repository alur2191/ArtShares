// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ArtShares is ERC1155 {
    address public manager;

    struct Unit {
        uint256[] pieces;
        bool minted;
    }

    mapping(string => Unit) public unit;

    constructor() ERC1155("https://arsduuurmars.github.io/sample/{id}.json") {
        manager = msg.sender;
    }

    function mint(
        uint256[] memory _ids,
        uint256[] memory _amounts,
        string memory unitId
    ) public {
        require(!unit[unitId].minted);
        _mintBatch(msg.sender, _ids, _amounts, "");
        unit[unitId] = Unit(_ids, true);
    }

    function getUnit(string memory _unitId)
        public
        view
        returns (uint256[] memory)
    {
        Unit storage _unit = unit[_unitId];
        return (_unit.pieces);
    }

    function transferPiece(address to, uint256 id) public {
        safeTransferFrom(msg.sender, to, id, 1, "");
    }
}
