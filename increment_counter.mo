import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";

actor Counter {
  stable var currentValue : Nat = 0;

  // Increment the counter with the increment function.
  public func increment() : async () {
    currentValue += 1;
  };

  // Read the counter value with a get function.
  public query func get() : async Nat {
    currentValue
  };

  // Write an arbitrary value with a set function.
  public func set(n: Nat) : async () {
    currentValue := n;
  };

  type HttpRequest = {
    body: Blob;
    headers: [HeaderField];
    method: Text;
    url: Text;
  };

  type HttpResponse = {
    body: Blob;
    headers: [HeaderField];
    status_code: Nat16 ;
  };

  type HeaderField = (Text, Text);

  public query func http_request(arg:HttpRequest) : async HttpResponse {
      //获取currentValue的值
      let counter = Nat.toText(currentValue);
      Debug.print(counter);
      {
        body= Text.encodeUtf8("counter:" # counter# ",bye");
        headers= [];
        status_code= 200;
      }
  }

}