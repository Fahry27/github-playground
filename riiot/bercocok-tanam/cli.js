const { getConfig } = require("./src/config");
const { readAccounts, readProxyPool } = require("./src/utils");
const { runKiroAutomation } = require("./src/kiro");
const { runCloudflareAutomation } = require("./src/cloudflare");
const { runCodebuddyAutomation } = require("./src/codebuddy");

async function main() {
    const args = process.argv.slice(2);
    const action = args[0] ? args[0].toLowerCase() : null;

    if (!action || !["kiro", "cloudflare", "codebuddy", "all"].includes(action)) {
        console.error("Usage: node cli.js <kiro | cloudflare | codebuddy | all>");
        process.exit(1);
    }

    const config = getConfig();
    const accounts = readAccounts();
    const proxies = readProxyPool();

    console.log("════════════════════════════════════════════════════════════════");
    console.log("🌱 bercocok-tanam Non-Interactive CLI 🌱");
    console.log("════════════════════════════════════════════════════════════════");
    console.log(`Router URL    : ${config.routerUrl}`);
    console.log(`Headless      : ${config.headless}`);
    console.log(`Accounts Found: ${accounts.length}`);
    console.log(`Proxy Pool    : ${proxies.length > 0 ? `${proxies.length} proxies` : "none"}`);
    console.log("────────────────────────────────────────────────────────────────");

    if (accounts.length === 0) {
        console.error("❌ Error: No accounts found in accounts.txt! Please add accounts first.");
        process.exit(1);
    }

    try {
        if (action === "kiro") {
            console.log("Starting Kiro automation...");
            const res = await runKiroAutomation();
            printSummary("Kiro", res);
        } else if (action === "cloudflare") {
            console.log("Starting Cloudflare automation...");
            const res = await runCloudflareAutomation();
            printSummary("Cloudflare", res);
        } else if (action === "codebuddy") {
            console.log("Starting Codebuddy automation...");
            const res = await runCodebuddyAutomation();
            printSummary("Codebuddy", res);
        } else if (action === "all") {
            console.log("Starting All-in-One automation...");
            const [kiroRes, cfRes, cbRes] = await Promise.all([
                runKiroAutomation().catch((err) => ({ error: err.message })),
                runCloudflareAutomation().catch((err) => ({ error: err.message })),
                runCodebuddyAutomation().catch((err) => ({ error: err.message })),
            ]);
            printSummary("Kiro", kiroRes);
            printSummary("Cloudflare", cfRes);
            printSummary("Codebuddy", cbRes);
        }
    } catch (err) {
        console.error(`\n❌ Execution failed: ${err.message}`);
        process.exit(1);
    }
}

function printSummary(name, res) {
    console.log(`\n${"═".repeat(40)}`);
    console.log(`📊 ${name.toUpperCase()} SUMMARY`);
    console.log("═".repeat(40));
    if (!res) {
        console.log("  No results returned.");
    } else if (res.error) {
        console.log(`  ❌ Failed with error: ${res.error}`);
    } else {
        console.log(`  Success Rate: ${res.successRate || "0%"}`);
        console.log(`  Success     : ${res.successCount || 0} accounts`);
        console.log(`  Failed      : ${res.failedCount || 0} accounts`);
    }
    console.log("");
}

main().catch((err) => {
    console.error("Fatal error:", err);
    process.exit(1);
});
