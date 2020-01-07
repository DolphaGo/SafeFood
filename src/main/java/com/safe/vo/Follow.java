package com.safe.vo;

public class Follow {
	String fid,follow,follower;

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getFollow() {
		return follow;
	}

	public Follow(String fid, String follow, String follower) {
		this.fid = fid;
		this.follow = follow;
		this.follower = follower;
	}

	@Override
	public String toString() {
		return "Follow [fid=" + fid + ", follow=" + follow + ", follower=" + follower + "]";
	}

	public void setFollow(String follow) {
		this.follow = follow;
	}

	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}
	
}
