import {test} from 'node:test';
import assert from 'node:assert/strict';
import baseline from './baseline.json' with {type:'json'};
import {validState} from '../server/validation.mjs';
import {logicalToTime,timeToLogical} from '../src/coordinates.mjs';
test('state rejects malformed nested imports before persistence',()=>{assert.equal(validState(baseline),true);for(const invalid of [null,{}, {...baseline,lists:[]},{...baseline,studies:[{kind:'unknown'}]},{...baseline,drawings:[{type:'line',anchors:[]}]},{...baseline,symbol:'PRIVATE-API'},{...baseline,lists:[{id:'main',name:'x',symbols:['BTC-USD','BTC-USD']}]}])assert.equal(validState(invalid),false);});
test('drawing coordinates roundtrip across missing bars and outside current range',()=>{const bars=[{time:100},{time:160},{time:340},{time:400}];for(const logical of [-3,0,.25,1,1.5,2.7,3,4.5])assert.ok(Math.abs(timeToLogical(bars,logicalToTime(bars,logical,60),60)-logical)<1e-10);assert.equal(logicalToTime(bars,1.5,60),250);});
