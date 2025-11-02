<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>📈 实时金融数据仪表板</title>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Microsoft YaHei', Arial, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .header {
            text-align: center;
            color: white;
            margin-bottom: 30px;
            padding: 20px;
        }
        
        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        .controls {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            align-items: center;
            margin-bottom: 20px;
        }
        
        input, select, button {
            padding: 12px 15px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 16px;
        }
        
        input {
            flex: 1;
            min-width: 200px;
        }
        
        button {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: transform 0.2s;
        }
        
        button:hover {
            transform: translateY(-2px);
        }
        
        .stock-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 10px;
            margin: 20px 0;
        }
        
        .stock-btn {
            background: #f8f9fa;
            border: 2px solid #e9ecef;
            padding: 15px 10px;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .stock-btn:hover {
            background: #667eea;
            color: white;
            transform: translateY(-2px);
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin: 20px 0;
        }
        
        .stat-card {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
        
        .stat-value {
            font-size: 1.8rem;
            font-weight: bold;
            margin: 10px 0;
        }
        
        .chart-container {
            background: white;
            border-radius: 15px;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .loading {
            text-align: center;
            padding: 40px;
            color: #667eea;
            font-size: 1.2rem;
        }
        
        .error {
            background: #fee;
            color: #c33;
            padding: 15px;
            border-radius: 8px;
            margin: 10px 0;
            border-left: 4px solid #c33;
        }
        
        @media (max-width: 768px) {
            .controls {
                flex-direction: column;
            }
            
            input, select, button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📈 实时金融数据仪表板</h1>
            <p>股票数据 · 技术分析 · 实时更新</p>
        </div>
        
        <div class="card">
            <h2>🔍 股票查询</h2>
            <div class="controls">
                <input type="text" id="tickerInput" placeholder="输入股票代码，如：AAPL, TSLA, 000001.SS" value="AAPL">
                <select id="periodSelect">
                    <option value="1mo">1个月</option>
                    <option value="3mo">3个月</option>
                    <option value="6mo">6个月</option>
                    <option value="1y" selected>1年</option>
                    <option value="2y">2年</option>
                </select>
                <button onclick="loadStockData()">📊 查询数据</button>
            </div>
            
            <div class="stock-grid">
                <div class="stock-btn" onclick="quickSelect('AAPL')">🍎 苹果</div>
                <div class="stock-btn" onclick="quickSelect('TSLA')">🚗 特斯拉</d
