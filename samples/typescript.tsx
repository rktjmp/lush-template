import React from "react";

type Props = {
  id: string;
  name: boolean;
  list: null;
};

let item = new String("howdy");
Array.isArray([]);

export default function Component({ id, name, list }: Props) {
  const [first, second, third] = list;

  const a = null,
    be = undefined,
    c = true,
    de = Infinity;

  console.log(a, be, c, de);
  return (
    <div>
      <a href={"put me in brackets"}>texthere</a>
    </div>
  );
}

class DoOne {
  constructor() {}

  chippy() {}
}

const something = new DoOne();

const anItem = <Component id={"hello"} />;
