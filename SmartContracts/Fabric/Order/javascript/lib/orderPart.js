/*
 * SPDX-License-Identifier: Apache-2.0
 */

'use strict';

const { Contract } = require('fabric-contract-api');

class Order extends Contract{

    async initLedger(ctx){
        const state = {
       amount : '0'     
        };
        await ctx.stub.putState('state', Buffer.from(JSON.stringify(state)));
    }
    
    async showMyOrders(ctx){
        const stateAsBytes = await ctx.stub.getState('state');
        const state =  JSON.parse(stateAsBytes.toString());
        return state.amount;
    }
    
    async order(ctx, amount){
        
        const stateAsBytes = await ctx.stub.getState('state');
        state =  JSON.parse(stateAsBytes.toString());
        oldAmount = parseInt(state.amount)
        newAmount = oldAmount + parseInt(amount)
        state.amount = newAmount;
        
        await ctx.stub.putState('state', Buffer.from(JSON.stringify(state)))
    }
    
    async cancelOrder(ctx, amount){
        const stateAsBytes = await ctx.stub.getState('state');
        state =  JSON.parse(stateAsBytes.toString());
        oldAmount = parseInt(state.amount)
        newAmount = oldAmount - parseInt(amount)
        state.amount = newAmount;
        
        await ctx.stub.putState('state', Buffer.from(JSON.stringify(state)))
    }
}

module.exports = Order
