const fs = require('fs')
const srcDataset = require('./.tmp/qp-converted.json')

const result =
  srcDataset.features.map(f => ({
    nom: f.properties.NOM_QP,
    code: f.properties.CODE_QP,
    communes: f.properties.COMMUNE_QP.split(',').map(c => c.trim()),
    contour: f.geometry,
  }))

fs.writeFileSync(__dirname + '/.tmp/qp-transformed.json', JSON.stringify(result))
