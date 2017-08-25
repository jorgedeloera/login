const webpack = require('webpack')
const path = require('path')
const baseDir = './'

module.exports = {
    entry: `${path.resolve(baseDir)}/app.coffee`,
    output: {
        path: path.resolve(baseDir),
        filename: 'app.js'
    },
    module: {
        loaders: [
            { test: /\.coffee$/, loader: 'coffee-loader' }
        ]
    }
}