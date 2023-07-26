// SPDX-License-Identifier: Apache-2.0


// Copyright 2023 Stichting Block Foundation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


pragma solidity ^0.8.19;


// ============================================================================
// Contracts
// ============================================================================

/**
 * Neighborhood Participation Contract
 * @dev 
 */
contract NeighborhoodParticipation {


    // Parameters
    // ========================================================================

    address public manager;
    mapping(address => bool) public participants;
    mapping(address => bool) private invitations;
    uint256 public quorum;
    uint256 public initiativeCount = 0;

    enum InitiativeState {
        Proposed,
        Approved,
        Rejected
    }

    // Structs
    // ========================================================================

    struct Initiative {
        string description;
        address initiator;
        uint256 yesVotes;
        uint256 noVotes;
        InitiativeState state;
        mapping(address => bool) voted;
    }

    // Constructor
    // ========================================================================

    constructor(uint256 _quorum) {
        manager = msg.sender;
        quorum = _quorum;
    }

    // Mappings
    // ========================================================================

    mapping(uint256 => Initiative) public initiatives;


    // Modifiers
    // ========================================================================

    modifier onlyManager() {
        require(msg.sender == manager, "Only the manager can perform this action");
        _;
    }

    modifier onlyParticipant() {
        require(participants[msg.sender] == true, "Only a participant can perform this action");
        _;
    }


    // Methods
    // ========================================================================

    function inviteParticipant(address _participant) public onlyManager {
        invitations[_participant] = true;
    }

    function joinNeighborhood() public {
        require(invitations[msg.sender] == true, "You must be invited to join the neighborhood");
        participants[msg.sender] = true;
        invitations[msg.sender] = false;
    }

    function proposeInitiative(string memory description) public onlyParticipant {
        Initiative memory newInitiative = Initiative({
            description: description,
            initiator: msg.sender,
            yesVotes: 0,
            noVotes: 0,
            state: InitiativeState.Proposed
        });

        initiatives[initiativeCount] = newInitiative;
        initiativeCount++;
    }

    function vote(uint initiativeIndex, bool vote) public onlyParticipant {
        Initiative storage initiative = initiatives[initiativeIndex];

        require(initiative.state == InitiativeState.Proposed, "Can only vote on proposed initiatives");
        require(!initiative.voted[msg.sender], "Already voted on this initiative");

        if (vote) {
            initiative.yesVotes++;
        } else {
            initiative.noVotes++;
        }

        initiative.voted[msg.sender] = true;

        if (initiative.yesVotes > quorum) {
            initiative.state = InitiativeState.Approved;
        } else if (initiative.noVotes > quorum) {
            initiative.state = InitiativeState.Rejected;
        }
    }

    function getInitiative(uint initiativeIndex) public view returns (string memory description, address initiator, uint256 yesVotes, uint256 noVotes, InitiativeState state) {
        Initiative storage initiative = initiatives[initiativeIndex];

        return (initiative.description, initiative.initiator, initiative.yesVotes, initiative.noVotes, initiative.state);
    }

}
