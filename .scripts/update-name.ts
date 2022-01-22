import fs from "fs";
import path from "path";
import plist from "plist";
import jsonxml from "xml2js";
import appjson from "../app.json";

const INFO_PLIST_PATH = path.resolve(process.cwd(), "./ios/rn_test/Info.plist");
const STRINGS_XML_PATH = path.resolve(
  process.cwd(),
  "./android/app/src/main/res/values/strings.xml",
);

async function updateName() {
  const infoPlistFile = fs.readFileSync(INFO_PLIST_PATH, { encoding: "utf-8" });
  const stringsXmlFile = fs.readFileSync(STRINGS_XML_PATH, {
    encoding: "utf-8",
  });

  const infoPlistData = plist.parse(infoPlistFile) as any;
  const stringsXmlData = await jsonxml.parseStringPromise(stringsXmlFile);

  //  UPDATE APP NAME
  (() => {
    infoPlistData["CFBundleDisplayName"] = appjson.displayName;
  })();

  //  UPDATE STRINGS XML DATA
  (() => {
    const appNameIndex = stringsXmlData.resources.string.findIndex(
      (item: any) => item["$"]["name"] === "app_name",
    );

    stringsXmlData.resources.string[appNameIndex]["_"] = appjson.displayName;
  })();

  //   WRITE BACK UPDATED VALUES
  await (async () => {
    const newInfoPlistXml = plist.build(infoPlistData);

    fs.writeFileSync(INFO_PLIST_PATH, newInfoPlistXml);
  })();

  await (async () => {
    const builder = new jsonxml.Builder();
    const newStringsXml = builder.buildObject(stringsXmlData);

    fs.writeFileSync(STRINGS_XML_PATH, newStringsXml);
  })();

  console.log("APP NAME UPDATED", appjson);
}

updateName();
