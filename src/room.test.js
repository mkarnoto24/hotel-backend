const chai = require('chai');
const expect = chai.expect;

const room = require('../controllers/frontend/room')

describe('room test cases', () => {
    it('show test room', () => {
        room.index();
        room.showById();
        console.log('test')
    })
})