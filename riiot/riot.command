#!/bin/bash
# Seed shell variables and resolve directory
cd "$(dirname "$0")"
SCRIPT_DIR="$(pwd)"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

clear
echo -e "${BLUE}════════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}             🌱 WELCOME TO RIIOT UNIFIED CLI 🌱               ${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════════${NC}"

# Function to check status
check_status() {
    echo -e "\n${BLUE}[System Status]${NC}"
    if lsof -Pi :8318 -sTCP:LISTEN -t >/dev/null 2>&1; then
        echo -e "  🛡️  AgentRouter Spoof Proxy : ${GREEN}RUNNING${NC} (on port 8318)"
        # Query health endpoint
        local health
        health=$(curl -s --max-time 2 http://localhost:8318/health || echo "error")
        if [ "$health" = "error" ]; then
            echo -e "     └─ Health Check: ${RED}FAILED${NC} (No response)"
        else
            local waf
            waf=$(echo "$health" | grep -o '"wafCookie":[a-z]*' | cut -d: -f2)
            local circuit
            circuit=$(echo "$health" | grep -o '"circuitOpen":[a-z]*' | cut -d: -f2)
            echo -e "     ├─ WAF Cookie Warmup   : $([ "$waf" = "true" ] && echo -e "${GREEN}ACTIVE${NC}" || echo -e "${RED}INACTIVE${NC}")"
            echo -e "     └─ Circuit Breaker     : $([ "$circuit" = "true" ] && echo -e "${RED}OPEN (Error)${NC}" || echo -e "${GREEN}CLOSED (Healthy)${NC}")"
        fi
    else
        echo -e "  🛡️  AgentRouter Spoof Proxy : ${RED}STOPPED${NC}"
    fi

    # Read .env of bercocok-tanam to show settings
    if [ -f "bercocok-tanam/.env" ]; then
        local router_url
        router_url=$(grep "ROUTER_URL=" bercocok-tanam/.env | cut -d= -f2-)
        local accounts
        accounts=$(wc -l bercocok-tanam/accounts.txt 2>/dev/null | awk '{print $1}' || echo "0")
        echo -e "  🌱 Harvester Target Router : ${BLUE}${router_url}${NC}"
        echo -e "  👤 Configured Accounts     : ${BLUE}${accounts}${NC}"
    fi
}

start_proxy() {
    if lsof -Pi :8318 -sTCP:LISTEN -t >/dev/null 2>&1; then
        echo -e "${GREEN}✓ AgentRouter Spoof Proxy is already running on port 8318.${NC}"
    else
        echo -e "${BLUE}Starting AgentRouter Spoof Proxy in background...${NC}"
        cd "$SCRIPT_DIR/agentrouter-spoof-proxy"
        node proxy.mjs > proxy.log 2>&1 &
        sleep 2
        if lsof -Pi :8318 -sTCP:LISTEN -t >/dev/null 2>&1; then
            echo -e "${GREEN}✓ Proxy started successfully!${NC}"
        else
            echo -e "${RED}✗ Failed to start proxy. Check agentrouter-spoof-proxy/proxy.log${NC}"
        fi
        cd "$SCRIPT_DIR"
    fi
}

stop_proxy() {
    if lsof -Pi :8318 -sTCP:LISTEN -t >/dev/null 2>&1; then
        echo -e "${BLUE}Stopping AgentRouter Spoof Proxy...${NC}"
        local pid
        pid=$(lsof -t -i:8318)
        kill "$pid" 2>/dev/null
        echo -e "${GREEN}✓ Proxy stopped successfully.${NC}"
    else
        echo -e "${GREEN}✓ Proxy is not running.${NC}"
    fi
}

run_harvester() {
    local type=$1
    echo -e "${BLUE}Starting $type harvester...${NC}"
    cd "$SCRIPT_DIR/bercocok-tanam"
    node cli.js "$type"
    cd "$SCRIPT_DIR"
}

# Main loop
while true; do
    check_status
    echo -e "\n${BLUE}Menu Options:${NC}"
    echo "  1. 🔑 Run Kiro Harvester"
    echo "  2. ☁️  Run Cloudflare Harvester"
    echo "  3. 🛡️  Start Spoof Proxy (Background)"
    echo "  4. 🛑 Stop Spoof Proxy"
    echo "  5. ⚙️  Open settings"
    echo "  6. 🚪 Exit"
    echo -n "Select option [1-6]: "
    read -r opt

    case $opt in
        1)
            run_harvester "kiro"
            echo -n "Press Enter to return to menu..."
            read -r
            clear
            ;;
        2)
            run_harvester "cloudflare"
            echo -n "Press Enter to return to menu..."
            read -r
            clear
            ;;
        3)
            start_proxy
            echo -n "Press Enter to return to menu..."
            read -r
            clear
            ;;
        4)
            stop_proxy
            echo -n "Press Enter to return to menu..."
            read -r
            clear
            ;;
        5)
            echo -e "\n${BLUE}[Settings Configuration]${NC}"
            echo -e "To change accounts, open: ${BLUE}bercocok-tanam/accounts.txt${NC}"
            echo -e "To edit harvester configs, open: ${BLUE}bercocok-tanam/.env${NC}"
            echo -e "To edit proxy configs, open: ${BLUE}agentrouter-spoof-proxy/.env${NC}"
            echo -n "Press Enter to return to menu..."
            read -r
            clear
            ;;
        6)
            echo -e "\n${GREEN}Thank you for using RIIOT CLI! Bye! 👋${NC}\n"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option!${NC}"
            sleep 1
            clear
            ;;
    esac
done
