import { Providers } from "./providers";
import "../css/globals.css";

export const metadata = {
  title: "wagmi",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="p-12">
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}
