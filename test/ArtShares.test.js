const { assert } = require('chai')

const ArtShares = artifacts.require('./ArtShares.sol')

require('chai')
  .use(require('chai-as-promised'))
  .should()

contract('ArtShares', (accounts) => {
  let contract

  before(async()=>{
    contract = await ArtShares.deployed()
  })

  describe('deployment', async () => {
    it('deploys successfully', async () =>{
      contract = await ArtShares.deployed()
      const address = contract.address
      console.log(address)
      assert.notEqual(address,'')
      assert.notEqual(address, '')
      assert.notEqual(address,null)
      assert.notEqual(address,undefined)
    })
    
  })
})