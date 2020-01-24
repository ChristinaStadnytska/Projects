export default function convertToArray(realmObjectsArray) {
    let copyOfJsonArray = Array.from(realmObjectsArray);
    return JSON.parse(JSON.stringify(copyOfJsonArray));
  }
  