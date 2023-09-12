// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ERC4907.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Book is ERC4907 {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC4907("Book", "BK") {}

  function mint(string memory _tokenURI, string[] memory _metadata) public {
    _tokenIds.increment();
    uint256 newTokenId = _tokenIds.current();
    _safeMint(msg.sender, newTokenId);
    _setTokenURI(newTokenId, _tokenURI);
    _setTokenMetadata(_metadata);
  }

  function burn(uint256 tokenId) public {
    _burn(tokenId);
  }
}