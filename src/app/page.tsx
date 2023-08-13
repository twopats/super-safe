import { Account } from "../components/Account";
import { Connect } from "../components/Connect";
import { Connected } from "../components/Connected";
import { Counter } from "../components/Counter";
import { NetworkSwitcher } from "../components/NetworkSwitcher";

export function Page() {
  return (
    <>
      <Connected>
        <Account />
      </Connected>
    </>
  );
}

export default Page;
