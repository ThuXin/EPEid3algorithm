package action;

import id3algorithm.Id3;

public class ID3Action {
	public String ManagerEvaluate() {
		Id3.main(null);
		return "success";
	}

}
