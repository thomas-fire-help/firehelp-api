const merge = require('webpack-merge')
const environment = require('./environment')

const customConfig = {
  output: {
    publicPath: 'http://localhost:3035/packs/'
  },
  devServer: {
    publicPath: 'http://localhost:3035/packs/'
  }
}
console.log(merge(environment.toWebpackConfig(), customConfig))
module.exports = merge(environment.toWebpackConfig(), customConfig)
