const mongoose = require('mongoose');

const messageScheam = new mongoose.Schema({
  message: {
    type: String,
    required: true,
  },
  // registered:{
  //   type:Boolean,
  //   default:false
  // },
  date: {
    type: Date,
    // required: true,
  },


  sourceId: {
    type: Number,
    required: true,
 
  },
  
  targetId: {
    type: Number,
    required: true,
 
  },


});



module.exports = mongoose.model('message', messageScheam);
