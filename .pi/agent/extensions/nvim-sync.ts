import * as fs from "node:fs";
import * as path from "node:path";
import type { ExtensionAPI } from "@mariozechner/pi-coding-agent";

function getChannelId(): string | undefined {
	const value = process.env.PI_CHANNEL_ID?.trim();
	return value ? value : undefined;
}

function getEventFile(channelId: string): string {
	const dir = path.join(process.cwd(), ".pi");
	fs.mkdirSync(dir, { recursive: true });
	return path.join(dir, `.pi-changed-files.${channelId}.log`);
}

function appendChangedFile(eventFile: string, filePath: unknown): void {
	if (typeof filePath !== "string" || filePath.length === 0) return;

	const absolutePath = path.resolve(process.cwd(), filePath);
	const relativePath = path.relative(process.cwd(), absolutePath) || path.basename(absolutePath);
	fs.appendFileSync(eventFile, `${relativePath}\t${Date.now()}\n`, "utf8");
}

export default function (pi: ExtensionAPI) {
	const channelId = getChannelId();
	if (!channelId) return;

	const eventFile = getEventFile(channelId);

	pi.on("session_start", async () => {
		fs.writeFileSync(eventFile, "", "utf8");
	});

	pi.on("tool_result", async (event) => {
		if (event.isError) return;
		if (event.toolName !== "edit" && event.toolName !== "write") return;
		appendChangedFile(eventFile, event.input?.path);
	});
}
