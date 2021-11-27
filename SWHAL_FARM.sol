// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

interface IERC20 {

    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}
interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.
     *
     * The selector can be obtained in Solidity with `IERC721.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
    function _msgData() internal view virtual returns (bytes calldata) {
        this;
        return msg.data;
    }
}
abstract contract Ownable is Context {
    address private _owner;
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor () {
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), _owner);
    }
    function owner() public view virtual returns (address) {
        return _owner;
    }
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}


contract ERC20Farm is Context {
    
    struct User {
        uint256 staked;
        uint256 farmed;
        uint256 buffer;
        uint256 started;
        uint256 latest;
    }
    
    mapping(address => User) private _stakingData;
    
    IERC20 private _tokenA;
    IERC20 private _tokenB;
    IERC20 private _tokenC;
    
    uint256 private _feeA;
    uint256 private _reqC;
    
    uint256 private _rate;
    uint256 private _cooldown;
    
    uint256 private _totalStaking;
    uint256 private _totalRewards;

    uint256 private _fees;
    bool    private _reroutedFees;
    
    address private _platform;
    address private _owner;
    
    bool    private _emergency;
    
    uint256 private constant _GRANULARITY = 100; 
    uint256 private constant _DENOMINATOR = 100;
    
    uint256 private constant _DIY = 365;      //Conversion: days in a year
    uint256 private constant _DTS = 86400;    //Conversion: day to seconds
    
    event Staked(
        address indexed account, 
        uint256 amount);
        
    event Unstaked(
        address indexed account, 
        uint256 amount);
        
    event Paid(
        address indexed account,
        uint256 amount);
        
    event Seeded(
        address indexed account, 
        uint256 amount);
        
    event Withdrawn(
        address indexed account, 
        uint256 amount);
        
    event FeesRerouted(
        address indexed account,
        bool state);
    
    
    constructor(
        address tokenA,       //Defines the token being staked
        address tokenB,       //Defines the token being farmed
        address tokenC,       //Defines the token (utility) required to be able to enter the farm
        uint256 feeA,         //Defines the fee for leaving the farm
        uint256 reqC,         //Defines the required (utility) amount to be able to enter the farm
        uint256 rate,         //Defines the reward rate per day in % (argument must be multiplied with 100 for .00 granularity)
        address platform,     //Defines the platform that governs cooldowns
        address owner)        //Defines the owner of the farm
     {
         
         _tokenA = IERC20(tokenA);
         _tokenB = IERC20(tokenB);
         _tokenC = IERC20(tokenC);  
         
         _feeA = feeA;
         _reqC = reqC;
         
         _rate = rate;
         _platform = platform;
         _owner = owner;
         
     }   
    
    
    function stake(uint256 amount) external returns (bool) {
        
        address sender = _msgSender();
        address environment = address(this);
        uint256 time = block.timestamp;
        
        require(
            !_emergency, 
            "must not be in an emergency state");
        
        require(
            _totalRewards > 0, 
            "insufficient amount of rewards available");
            
        require(
            _tokenC.balanceOf(sender) >= _reqC, 
            "insufficient utility balance");            
        
        require(
            _tokenA.balanceOf(sender) >= amount, 
            "insufficient staking balance");

        require(
            _stakingData[sender].started == 0,
            "must not already be staking");
            
        require(
            _stakingData[sender].staked == 0, 
            "must unstake to stake again");
            
        uint256 snapshot01 = 
        _tokenA.balanceOf(environment);
        
        require(
            _tokenA.transferFrom(sender, environment, amount), 
            "staking failed during transfer");
            
        uint256 snapshot02 = 
        _tokenA.balanceOf(environment);
        
        uint256 staked;
        
        {
        if (snapshot01 < snapshot02) {
            staked = snapshot02 - snapshot01;
        } 
        if (snapshot01 > snapshot02) {
            staked = snapshot01 - snapshot02;
        }
        }
        
        uint256 fee = getUserFeeOfAmount(staked);
        uint256 processedStake = staked - fee;
        
        if (_reroutedFees) {
            //route fees back to farm
            _totalRewards += fee;
        } else {
            //collect fees for payout
            _fees += fee;
        }
        
        _stakingData[sender].started = time;
        _stakingData[sender].staked = processedStake;
        _stakingData[sender].latest = time;
        
        _totalStaking += processedStake;

        emit Staked(msg.sender, processedStake);
        return true;
    }
    
    function unstake() external returns (bool) {
        
        address sender = _msgSender();
        
        require(
            !_emergency, 
            "must not be in an emergency state");

        require(
            _stakingData[sender].started > 0,
            "must be already staking");

        require(
            _stakingData[sender].staked > 0, 
            "must be staking to unstake");
        
        uint256 latest = _stakingData[sender].latest;
        
        require(
            block.timestamp >= latest + _cooldown,
            "must wait for cooldown to unstake");
        
        uint256 staked = _stakingData[sender].staked;
        delete _stakingData[sender].started;
        delete _stakingData[sender].staked;
        
        require(
            staked > 0, 
            "must be staking to unstake");
            
        if (getUserRewardsAvailable(sender) > 0) payout();
            
        uint256 fee = getUserFeeOfAmount(staked);
        uint256 processedStake = staked - fee;
        
        if (_reroutedFees) {
            //route fees back to farm
            _totalRewards += fee;
        } else {
            //collect fees for payout
            _fees += fee;
        }
        
        require(
            _tokenA.transfer(sender, processedStake), 
            "unstaking failed during transfer");
        
        _totalStaking -= staked;

        emit Unstaked(sender, staked);
        return true;
    }
    
    function seed(uint256 amount) external returns (bool) {
        
        address sender = _msgSender();
        address environment = address(this);
        
        require(
            amount > 0, 
            "must be larger than zero");
        
        require(
            _tokenB.balanceOf(sender) >= amount, 
            "insufficient balance");
            
        require(
            _tokenB.transferFrom(sender, environment, amount), 
            "seed failed during transfer");
            
        _totalRewards += amount;
        
        emit Seeded(sender, amount);
        return true;
    }
    
    function withdraw() external returns (bool) {
        
        address sender = _msgSender();
        
        require(
            _fees > 0,
            "insufficient fees");
            
        require(
            sender == _owner, 
            "must be the owner");
            
        require(
            _tokenA.transfer(sender, _fees), 
            "withdrawal failed during transfer");
        
        delete _fees;
        
        emit Withdrawn(sender, _fees);
        return true;
    }
    
    function emergencySwitch(bool status) external returns (bool) {
        
        require(
            _emergency != status, 
            "must be in the correct state for emergency");
        
        require(
            _msgSender() == _owner, 
            "must be the owner");
            
        _emergency = status;
        return true;
    }
    
    function emergencyWithdraw() external returns (bool) {
        
        address sender = _msgSender();
        
        require(
            _emergency, 
            "must be in an emergency state");
        
        require(
            _totalRewards > 0,
            "insufficient amount of rewards available");
            
        require(
            sender == _owner, 
            "must be the owner");
            
        require(
            _tokenB.transfer(sender, _totalRewards), 
            "withdrawal failed during transfer");
        
        delete _totalRewards;
        
        emit Withdrawn(sender, _totalRewards);
        return true;
    }
    
    function emergencyUnstake() external returns (bool) {
        
        address sender = _msgSender();
        
        require(
            _emergency, 
            "must be in an emergency state");

        require(
            _stakingData[sender].started > 0,
            "must be already staking");

        require(
            _stakingData[sender].staked > 0, 
            "must be staking to unstake");
        
        uint256 staked = _stakingData[sender].staked;
        delete _stakingData[sender].started;
        delete _stakingData[sender].staked;
        
        require(
            staked > 0, 
            "must be staking to unstake");
        
        require(
            _tokenA.transfer(sender, staked), 
            "unstaking failed during transfer");
        
        _totalStaking -= staked;
        
        emit Unstaked(sender, staked);
        return true;
    }
    
    function routeFeesBackToFarm() external returns (bool) {
        
        require(
            !_emergency, 
            "must not be in an emergency state");
        
        require(_reroutedFees == false, 
        "must not already be routing fees back to the farm");
        
        address sender = _msgSender();
        
        require(
            sender == _owner, 
            "must be the owner");  
            
        _reroutedFees = true;
        emit FeesRerouted(sender, _reroutedFees);
        return true;
    }
    
    function setCooldown(uint256 cooldown) external returns (bool) {
        
        require(
            _msgSender() == _platform,
            "must be the platform");
            
        _cooldown = cooldown;
        return true;
    }

    function payoutFlex(uint256 amount) external returns (bool) {
        
        address sender = _msgSender();
        
        require(
            !_emergency, 
            "must not be in an emergency state");
        
        require(
            _totalRewards > 0, 
            "insufficient amount of rewards available");
            
        uint256 buffer = _stakingData[sender].buffer;
        uint256 available = getUserRewardsAvailable(sender);
        
        require(
            available >= buffer + amount,
            "insufficient amount of account rewards available");
            
        _stakingData[sender].farmed += amount;
        _stakingData[sender].buffer += amount;
        
        require(
            _tokenB.transfer(sender, amount), 
            "payout failed during transfer");
            
        _totalRewards -= amount;

        emit Paid(sender, amount);
        return true;
    }
    
    function getFees() 
        external 
        view 
        returns (uint256) {
            
        return _fees;
    }
    
    function getUtilityToken() 
        external 
        view 
        returns (address) {
            
        return address(_tokenC);
    }
    
    function getUtilityRequirement() 
        external 
        view 
        returns (uint256) {
            
        return _reqC;
    }
    
    function getStakedToken() 
        external 
        view 
        returns (address) {
            
        return address(_tokenA);
    }
    
    function getRewardToken() 
        external 
        view 
        returns (address) {
            
        return address(_tokenB);
    }
    
    function getFee() 
        external 
        view 
        returns (uint256) {
            
        return _feeA;
    }
    
    function getCooldown() 
        external 
        view 
        returns (uint256) {
            
        return _cooldown;
    }

    function getRewardRate() 
        external 
        view 
        returns (uint256) {
            
        return _rate;
    }
    
    function getRewardRateTokens() 
        public 
        view 
        returns (uint256) {
            
        return ((_totalRewards * _rate) / _DENOMINATOR) / _GRANULARITY;
    }
    
    function getRewardAPY() 
        external 
        view 
        returns (uint256) {
            
        return _rate * _DIY; 
    }
    
    function getRewardsTotal() 
        external 
        view 
        returns (uint256) {
            
        return _totalRewards;
    }

    function getUserStartedStaking(address user) 
        external
        view 
        returns (uint256) {
            
        return _stakingData[user].started;
    }
    
    function getUserFarmed(address user) 
        external 
        view 
        returns (uint256) {
            
        return _stakingData[user].farmed;
    }
    
    function payout() public returns (bool) {
        
        address sender = _msgSender();
        
        require(
            !_emergency, 
            "must not be in an emergency state");
        
        require(
            _totalRewards > 0, 
            "insufficient amount of rewards available");
            
        uint256 buffer = _stakingData[sender].buffer;
        uint256 available = getUserRewardsAvailable(sender);
        
        require(
            available > buffer,
            "insufficient amount of account rewards available");
            
        uint256 farmed = available - buffer;

        _stakingData[sender].latest = block.timestamp;
        _stakingData[sender].farmed += farmed;
        delete _stakingData[sender].buffer;
        
        require(
            _tokenB.transfer(sender, farmed), 
            "payout failed during transfer");
            
        _totalRewards -= farmed;

        emit Paid(sender, farmed);
        return true;
    }
    
    function getStakedTotal() 
        public 
        view 
        returns (uint256) {
            
        return _totalStaking;
    }
    
    function getUserStaked(address user) 
        public 
        view 
        returns (uint256) {
            
        return _stakingData[user].staked;
    }
    
    function getUserFeeOfAmount(uint256 amount) 
        public 
        view 
        returns (uint256) {
            
        return ((_feeA * amount) / _DENOMINATOR) / _GRANULARITY;
    }
    
    function getUserRewardsAvailable(address user) 
        public 
        view 
        returns (uint256) {
            
        uint256 rewards;
        uint256 buffer = _stakingData[user].buffer;
        
        { 
            if (_totalRewards > 0) { 
                uint256 start = _stakingData[user].latest;
                uint256 duration;
                
                if (block.timestamp - start >= _DTS) {
                    duration = (block.timestamp - start) / _DTS;
                    return getUserEstimatedRewardDaily(user) * duration;
                } else {
                    rewards = 0;
                }
            } else {
                rewards = 0;
            }
        }
        
        if (rewards > buffer) {
            return rewards - buffer;
            
        } else {
            return 0;
        }
    }
    
    function getUserEstimatedRewardDaily(address user) 
        public 
        view 
        returns (uint256) {
            
        uint256 share = ((getUserStaked(user) * _DENOMINATOR) * _GRANULARITY) / getStakedTotal();
        return ((getRewardRateTokens() * share) / _DENOMINATOR) / _GRANULARITY;
    }

}

contract ERC721Farm is IERC721Receiver, Context {
    
    struct User {
        uint256 staked;
        uint256 farmed;
        uint256 buffer;
        uint256 started;
        uint256 latest;
        uint256[] ids;
    }
    
    mapping(address => User) private _stakingData;
    
    IERC721 private _tokenA;
    IERC20  private _tokenB;
    
    address private _tokenC;
    bool    private _is721C;
    
    uint256 private _feeB;
    uint256 private _reqC;
    
    uint256 private _rate;
    uint256 private _cooldown;
    
    uint256 private _totalStaking;
    uint256 private _totalRewards;

    uint256 private _fees;
    bool    private _reroutedFees;
    
    address private _platform;
    address private _owner;
    
    bool    private _emergency;

    uint256 private constant _GRANULARITY = 100; 
    uint256 private constant _DENOMINATOR = 100;
    
    uint256 private constant _DIY = 365;      //Conversion: days in year
    uint256 private constant _DTS = 86400;    //Conversion: day to seconds
    
    event Staked(
        address indexed account, 
        uint256 id);
        
    event Unstaked(
        address indexed account, 
        uint256 id);
        
    event Paid(
        address indexed account,
        uint256 amount);
        
    event Seeded(
        address indexed account, 
        uint256 amount);
        
    event Withdrawn(
        address indexed account, 
        uint256 amount);
        
    event FeesRerouted(
        address indexed account,
        bool state);
    
    constructor(
        address tokenA,       //Defines the token being staked
        address tokenB,       //Defines the token being farmed
        address tokenC,       //Defines the token utility prerequisite to be able to stake
        bool    is721C,       //Defines the utility token; false = ERC20, true = ERC721
        uint256 feeB,         //Defines the fee for payouts from farm
        uint256 reqC,         //Defines the required prerequisite amount to be able to stake
        uint256 rate,         //Defines the reward rate per day in tokens
        address platform,     //Defines the platform that governs cooldowns
        address owner)        //Defines the owner of the farm
     {
         
         _tokenA = IERC721(tokenA);
         _tokenB = IERC20(tokenB);
         
         _tokenC = tokenC;  
         _is721C = is721C;
         
         _feeB = feeB;
         _reqC = reqC;
         
         _rate = rate;
         _platform = platform;
         _owner = owner;
         
     }   
    
    
    function stake(uint256[] calldata ids) external returns (bool) {
        
        address sender = _msgSender();
        address environment = address(this);
        uint256 time = block.timestamp;

        require(
            !_emergency, 
            "must not be in an emergency state");
        
        require(
            _totalRewards > 0, 
            "insufficient amount of rewards available");

        require(
            _stakingData[sender].started == 0,
            "must not already be staking");
        
        if (_is721C) {
            require(
                IERC721(_tokenC).balanceOf(sender) >= _reqC, 
                "insufficient utility balance"); 
        } else {
            require(
                IERC20(_tokenC).balanceOf(sender) >= _reqC, 
                "insufficient utility balance"); 
        }
        
        uint256 batch = ids.length;
        
        require(
            _tokenA.balanceOf(sender) >= batch, 
            "insufficient staking balance");
            
        require(
            _stakingData[sender].staked == 0, 
            "must unstake to stake again");
            
        for (uint256 i = 0; i < batch; i++) {
            
            require(
                _tokenA.ownerOf(ids[i]) == sender, 
                "must be the owner of the NFT");
                
            _tokenA.safeTransferFrom(sender, environment, ids[i]);
            _stakingData[sender].ids.push(ids[i]);
            emit Staked(sender, ids[i]);
        }
        
        _stakingData[sender].started = time;
        _stakingData[sender].staked += batch;
        _stakingData[sender].latest = time;
        
        _totalStaking += batch;   

        return true;
    }
    
    function unstake() external returns (bool) {
        
        address sender = _msgSender();
        address environment = address(this);
        
        require(
            !_emergency, 
            "must not be in an emergency state");

        require(
            _stakingData[sender].started > 0,
            "must be already staking");

        require(
            _stakingData[sender].staked > 0, 
            "must be staking to unstake");
        
        uint256 latest = _stakingData[sender].latest;
        
        require(
            block.timestamp >= latest + _cooldown,
            "must wait for cooldown to unstake");
        
        uint256 staked = _stakingData[sender].staked;
        uint256[] memory ids = _stakingData[sender].ids;
        
        require(
            staked > 0, 
            "must be staking to unstake");
            
        if (getUserRewardsAvailable(sender) > 0) payout();
        
        delete _stakingData[sender].started;
        delete _stakingData[sender].staked;
        delete _stakingData[sender].ids;
        
        for (uint256 i = 0; i < staked; i++) {
        _tokenA.safeTransferFrom(environment, sender, ids[i]);
        emit Unstaked(sender, ids[i]);
        }
        _totalStaking -= staked;

        return true;
    }
    
    function seed(uint256 amount) external returns (bool) {
        
        address sender = _msgSender();
        address environment = address(this);
        
        require(
            _tokenB.balanceOf(sender) >= amount, 
            "insufficient balance");
            
        require(
            _tokenB.transferFrom(sender, environment, amount), 
            "payout process failed during transfer");
            
        _totalRewards += amount;
        
        emit Seeded(sender, amount);
        return true;
    }
    
    function withdraw() external returns (bool) {
        
        address sender = _msgSender();
        
        require(
            _fees > 0,
            "insufficient amount of fees available");
            
        require(
            sender == _owner, 
            "must be the owner");
            
        require(
            _tokenB.transfer(sender, _fees), 
            "withdrawal failed during transfer");
        
        delete _fees;
        
        emit Withdrawn(sender, _fees);
        return true;
    }

    function emergencySwitch(bool status) external returns (bool) {
        
        require(
            _emergency != status, 
            "must be in the correct state for emergency");
        
        require(
            _msgSender() == _owner, 
            "must be the owner");
            
        _emergency = status;
        return true;
    }
    
    function emergencyWithdraw() external returns (bool) {
        
        address sender = _msgSender();
        
        require(
            _emergency, 
            "must be in an emergency state");
        
        require(
            _totalRewards > 0,
            "insufficient amount of rewards available");
            
        require(
            sender == _owner, 
            "must be the owner");
            
        require(
            _tokenB.transfer(sender, _totalRewards), 
            "withdrawal failed during transfer");
        
        delete _totalRewards;

        emit Withdrawn(sender, _totalRewards);
        return true;
    }
    
    function emergencyUnstake() external returns (bool) {
        
        address sender = _msgSender();
        address environment = address(this);
        
        require(
            _emergency, 
            "must be in an emergency state");

        require(
            _stakingData[sender].started > 0,
            "must be already staking");
        
        require(
            _stakingData[sender].staked > 0, 
            "must be staking to unstake");
        
        uint256 staked = _stakingData[sender].staked;
        uint256[] memory ids = _stakingData[sender].ids;
        
        require(
            staked > 0, 
            "must be staking to unstake");
        
        delete _stakingData[sender].started;
        delete _stakingData[sender].staked;
        delete _stakingData[sender].ids;
        
        for (uint256 i = 0; i < staked; i++) {
        _tokenA.safeTransferFrom(environment, sender, ids[i]);
        emit Unstaked(sender, ids[i]);
        }
        
        _totalStaking -= staked;
        return true;
    }
    
    function routeFeesBackToFarm() external returns (bool) {
        
        require(
            !_emergency, 
            "must not be in an emergency state");
        
        require(
            _reroutedFees == false, 
            "must not already be routing fees back to the farm");
        
        address sender = _msgSender();
        
        require(
            sender == _owner, 
            "must be the owner");  
            
        _reroutedFees = true;
        emit FeesRerouted(sender, _reroutedFees);
        return true;
    }
    
    function setCooldown(uint256 cooldown) external returns (bool) {
        
        require(
            _msgSender() == _platform,
            "must be the platform");
            
        _cooldown = cooldown;
        return true;
    }
    
    function payoutFlex(uint256 amount) external returns (bool) {
        
        address sender = _msgSender();
        
        require(
            !_emergency, 
            "must not be in an emergency state");
        
        require(
            _totalRewards > 0, 
            "insufficient amount of rewards available");
            
        uint256 buffer = _stakingData[sender].buffer;
        uint256 available = getUserRewardsAvailable(sender);
        
        require(
            available >= buffer + amount,
            "insufficient amount of account rewards available");
            
        uint256 farmed = amount;
        uint256 fee = getUserFeeOfAmount(farmed);
        uint256 processedPayout = farmed - fee;
            
        if (_reroutedFees) {
            //route fees back to farm
            _totalRewards += fee;
        } else {
            //collect fees for payout
            _fees += fee;
        }
        
        _stakingData[sender].farmed += processedPayout;
        _stakingData[sender].buffer += farmed;
        
        require(
            _tokenB.transfer(sender, processedPayout), 
            "payout failed during transfer");
            
        _totalRewards -= amount;

        emit Paid(sender, processedPayout);
        return true;
    }

    function getFees() 
        external 
        view 
        returns (uint256) {
            
        return _fees;
    }
    
    function getUtilityToken() 
        external 
        view 
        returns (address) {
            
        return address(_tokenC);
    }
    
    function getUtilityRequirement() 
        external 
        view 
        returns (uint256) {
            
        return _reqC;
    }
    
    function getStakedToken() 
        external 
        view 
        returns (address) {
            
        return address(_tokenA);
    }
    
    function getRewardToken() 
        external 
        view 
        returns (address) {
            
        return address(_tokenB);
    }
    
    function getFee() 
        external 
        view 
        returns (uint256) {
            
        return _feeB;
    }
    
    function getCooldown() 
        external 
        view 
        returns (uint256) {
            
        return _cooldown;
    }
    
    function getPlatform() 
        external 
        view 
        returns (address) {
            
        return _platform;
    }

    function getRewardAPY() 
        external 
        view 
        returns (uint256) {
            
        return _rate * _DIY; 
    }
    
    function getRewardsTotal() 
        external 
        view 
        returns (uint256) {
            
        return _totalRewards;
    }
    
    function getUserStartedStaking(address user) 
        external 
        view 
        returns (uint256) {
            
        return _stakingData[user].started;
    }
    
    function getUserFarmed(address user) 
        external 
        view 
        returns (uint256) {
            
        return _stakingData[user].farmed;
    }
    
    function getUserStakedIDs(address user) 
        external 
        view 
        returns (uint256[] memory) {
            
        return _stakingData[user].ids;
    }
    
    function getUserRewards(address user) 
        external 
        view 
        returns (uint256) {
            
        return _stakingData[user].farmed;
    }
    
    function payout() public returns (bool) {
        
        address sender = _msgSender();
        
        require(
            !_emergency, 
            "must not be in an emergency state");
        
        require(
            _totalRewards > 0, 
            "insufficient amount of rewards available");
            
        uint256 buffer = _stakingData[sender].buffer;
        uint256 available = getUserRewardsAvailable(sender);
        
        require(
            available > buffer,
            "insufficient amount of account rewards available");
            
        uint256 farmed = available - buffer;                   
        uint256 fee = getUserFeeOfAmount(farmed);
        uint256 processedPayout = farmed - fee;
        
        if (_reroutedFees) {
            //route fees back to farm
            _totalRewards += fee;
        } else {
            //collect fees for payout
            _fees += fee;
        }
        
        _stakingData[sender].latest = block.timestamp;
        _stakingData[sender].farmed += processedPayout;
        delete _stakingData[sender].buffer;
        
        require(
            _tokenB.transfer(sender, processedPayout), 
            "payout failed during transfer");
            
        _totalRewards -= farmed;

        emit Paid(sender, processedPayout);
        return true;
    }
    
    function getRewardRate() 
        public 
        view 
        returns (uint256) {
            
        return _rate;
    }
    
    function getStakedTotal() 
        public 
        view 
        returns (uint256) {
            
        return _totalStaking;
    }
    
    function getUserStaked(address user) 
        public 
        view 
        returns (uint256) {
            
        return _stakingData[user].staked;
    }
    
    function getUserFeeOfAmount(uint256 amount) 
        public 
        view 
        returns (uint256) {
            
        return ((_feeB * amount) / _DENOMINATOR) / _GRANULARITY;
    }

    function getUserRewardsAvailable(address user) 
        public 
        view 
        returns (uint256) {
            
        uint256 rewards;
        uint256 buffer = _stakingData[user].buffer;
        
        { 
            if (_totalRewards > 0) { 
                uint256 start = _stakingData[user].latest;
                uint256 duration;
                
                if (block.timestamp - start >= _DTS) {
                    duration = (block.timestamp - start) / _DTS;
                    return getUserEstimatedRewardDaily(user) * duration;
                } else {
                    rewards = 0;
                }
            } else {
                rewards = 0;
            }
        }
        
        if (rewards > buffer) {
            return rewards - buffer;
            
        } else {
            return 0;
        }
    }
    
    function getUserEstimatedRewardDaily(address user) 
        public 
        view 
        returns (uint256) {
            
        uint256 staked = getUserStaked(user);
        return getRewardRate() * staked;
    }
    
    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory) 
        public 
        virtual 
        override 
        returns (bytes4) {
            
        return this.onERC721Received.selector;
    }
    
}

contract FarmFactory is Ownable {
    
    uint256 private _fee;
    
    address[] private _ERC20Farms;
    address[] private _ERC721Farms;
    
    event Created(address account, address pool);
    event Withdrawn(address account, uint256 amount);
    
    constructor(uint256 fee) {
        _fee = fee;
    }
    
    receive () external payable {}
    
    function createERC20Farm(
        address tokenA,
        address tokenB,
        address tokenC,
        uint256 feeA,
        uint256 reqC,
        uint256 rate,
        address owner) 
        external 
        payable 
        returns (bool) {
            
            require(
                msg.value == _fee, 
                "insufficient BNB payment for creation");
            
            ERC20Farm pool = 
            new ERC20Farm(
                tokenA,
                tokenB,
                tokenC,
                feeA,
                reqC,
                rate,
                address(this),
                owner);
                
            _ERC20Farms.push(address(pool));
            emit Created(_msgSender(), address(pool));
            return true;
        }
    
    function createERC721Farm(
        address tokenA,
        address tokenB,
        address tokenC,
        bool    is721C,
        uint256 feeB,
        uint256 reqC,
        uint256 rate,
        address owner) 
        external 
        payable 
        returns (bool) {
            
        require(
            msg.value == _fee, 
            "insufficient BNB payment for creation");
        
            ERC721Farm pool = 
            new ERC721Farm(
                tokenA,
                tokenB,
                tokenC,
                is721C,
                feeB,
                reqC,
                rate,
                address(this),
                owner);
                
            _ERC721Farms.push(address(pool));
            emit Created(_msgSender(), address(pool));
            return true;    
    }
    
    function withdraw() 
        external 
        onlyOwner 
        returns (bool) {
            
        address sender = _msgSender();
        address environment = address(this);
        uint256 withdrawable = environment.balance;
        
        require(
            withdrawable > 0,
            "must be BNB to withdraw");

        payable(sender).transfer(withdrawable);
        emit Withdrawn(sender, withdrawable);
        return true;
    }
    
    function setFee(uint256 fee) 
        external 
        onlyOwner 
        returns (bool) {
            
        _fee = fee;
        return true;
    }
    
    function setCooldownFarm(
        address farm, 
        bool isERC721, 
        uint256 cooldown) 
        external 
        onlyOwner 
        returns (bool) {
        
        require(
            farm != address(0),
            "must not be the zero address");
        
        if (isERC721) {
            ERC721Farm(farm).setCooldown(cooldown);
        } else {
            ERC20Farm(farm).setCooldown(cooldown);
        }
        return true;
    }

    function getFee() 
        external 
        view 
        returns (uint256) {
            
        return _fee;
    }
    
    function getERC20Farms() 
        external 
        view 
        returns (address[] memory) {
            
        return _ERC20Farms;
    }
    
    function getERC721Farms() 
        external 
        view 
        returns (address[] memory) {
            
        return _ERC721Farms;
    }
    
    function getERC20FarmsLength() 
        external 
        view 
        returns (uint256) {
            
        return _ERC20Farms.length;
    }
    
    function getERC721StakingPoolsLength() 
        external 
        view 
        returns (uint256) {
            
        return _ERC721Farms.length;
    }
}





















