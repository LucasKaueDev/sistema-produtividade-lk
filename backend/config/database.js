const { Pool } = require("pg")
require("dotenv").config()

// Configuração do pool de conexões
const pool = new Pool({
  host: process.env.DB_HOST,
  port: Number(process.env.DB_PORT),
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,

  max: 20, // máximo de conexões
  idleTimeoutMillis: 30000, // tempo de conexão ociosa
  connectionTimeoutMillis: 2000 // timeout de conexão
})

/*
========================================
TESTE DE CONEXÃO COM BANCO
========================================
*/

async function connectDatabase() {
  try {
    const client = await pool.connect()

    console.log("====================================")
    console.log("🚀 PostgreSQL conectado com sucesso")
    console.log("📦 Banco:", process.env.DB_NAME)
    console.log("🌐 Host:", process.env.DB_HOST)
    console.log("🔌 Porta:", process.env.DB_PORT)
    console.log("====================================")

    client.release()
  } catch (error) {
    console.error("====================================")
    console.error("❌ ERRO AO CONECTAR NO POSTGRESQL")
    console.error(error.message)
    console.error("====================================")

    process.exit(1)
  }
}

connectDatabase()

/*
========================================
EXPORTAÇÃO DO POOL
========================================
*/

module.exports = pool