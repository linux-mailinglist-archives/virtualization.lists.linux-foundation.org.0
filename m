Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 111FE2E0A00
	for <lists.virtualization@lfdr.de>; Tue, 22 Dec 2020 13:23:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C609D867DE;
	Tue, 22 Dec 2020 12:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82fWho2wjxjJ; Tue, 22 Dec 2020 12:23:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D2D19867D3;
	Tue, 22 Dec 2020 12:23:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8FFDC0893;
	Tue, 22 Dec 2020 12:23:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8BFAC0893
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Dec 2020 12:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A4CF587238
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Dec 2020 12:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fTVkyzDzN-sO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Dec 2020 12:23:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 56E5587234
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Dec 2020 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=Osd9g2TNV5QvdwHKZvb3omjfetHJzVWlGemenPIEwH4=; b=gqW4nps1XLdJsgPKF5WzJ7KVqt
 9iMHScrzgpCF3rdWxXCCC2XRkMT5vxYMkfK0OpqvmTBst7MS5GZVtY0Lv+akjSGUWQqPQ+SyJ42ct
 3iHv53xIpSUpOE8AIbePdekzSJ02yvo6gw6urNLCRah1b7iMr0dfqFJVqKk3ner7+gmZmLRijTCH2
 G0+u5GyVEnmZu6TWn0j4Qa3PTytk3lJcrkoAxtkeHFLnrdd9nmAQTpMwPJqoaQNDkQwpTSlFfp502
 ezJzwmLTSgWXDlk5MEOnhWWn6zjmBhTvTzTjs10WUHUdQ+sjQ7+6atEnqz5VEI+nebWmnUd5t0YxT
 OAcHsVEA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1krgh6-0005Uy-E9; Tue, 22 Dec 2020 12:23:12 +0000
Date: Tue, 22 Dec 2020 12:23:12 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@intel.com>, Michal Hocko <mhocko@suse.com>,
 Liang Li <liliangleo@didiglobal.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Subject: Re: [RFC v2 PATCH 0/4] speed up page allocation for __GFP_ZERO
Message-ID: <20201222122312.GH874@casper.infradead.org>
References: <20201221162519.GA22504@open-light-1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201221162519.GA22504@open-light-1.localdomain>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gTW9uLCBEZWMgMjEsIDIwMjAgYXQgMTE6MjU6MjJBTSAtMDUwMCwgTGlhbmcgTGkgd3JvdGU6
Cj4gQ3JlYXRpbmcgYSBWTSBbNjRHIFJBTSwgMzIgQ1BVc10gd2l0aCBHUFUgcGFzc3Rocm91Z2gK
PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+
IFFFTVUgdXNlIDRLIHBhZ2VzLCBUSFAgaXMgb2ZmCj4gICAgICAgICAgICAgICAgICAgcm91bmQx
ICAgICAgcm91bmQyICAgICAgcm91bmQzCj4gdy9vIHRoaXMgcGF0Y2g6ICAgIDIzLjVzICAgICAg
IDI0LjdzICAgICAgIDI0LjZzCj4gdy8gdGhpcyBwYXRjaDogICAgIDEwLjJzICAgICAgIDEwLjNz
ICAgICAgIDExLjJzCj4gCj4gUUVNVSB1c2UgNEsgcGFnZXMsIFRIUCBpcyBvbgo+ICAgICAgICAg
ICAgICAgICAgIHJvdW5kMSAgICAgIHJvdW5kMiAgICAgIHJvdW5kMwo+IHcvbyB0aGlzIHBhdGNo
OiAgICAxNy45cyAgICAgICAxNC44cyAgICAgICAxNC45cwo+IHcvIHRoaXMgcGF0Y2g6ICAgICAx
LjlzICAgICAgICAxLjhzICAgICAgICAxLjlzCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KClRoZSBjb3N0IG9mIHplcm9pbmcgcGFnZXMgaGFz
IHRvIGJlIHBhaWQgc29tZXdoZXJlLiAgWW91J3ZlIHN1Y2Nlc3NmdWxseQptb3ZlZCBpdCBvdXQg
b2YgdGhpcyBwYXRoIHRoYXQgeW91IGNhbiBtZWFzdXJlLiAgU28gbm93IHlvdSd2ZSBwdXQgaXQK
c29tZXdoZXJlIHRoYXQgeW91J3JlIG5vdCBtZWFzdXJpbmcuICBXaHkgaXMgdGhpcyBhIHdpbj8K
Cj4gU3BlZWQgdXAga2VybmVsIHJvdXRpbmUKPiA9PT09PT09PT09PT09PT09PT09PT09PQo+IFRo
aXMgY2Fu4oCZdCBiZSBndWFyYW50ZWVkIGJlY2F1c2Ugd2UgZG9u4oCZdCBwcmUgemVybyBvdXQg
YWxsIHRoZSBmcmVlIHBhZ2VzLAo+IGJ1dCBpcyB0cnVlIGZvciBtb3N0IGNhc2UuIEl0IGNhbiBo
ZWxwIHRvIHNwZWVkIHVwIHNvbWUgaW1wb3J0YW50IHN5c3RlbQo+IGNhbGwganVzdCBsaWtlIGZv
cmssIHdoaWNoIHdpbGwgYWxsb2NhdGUgemVybyBwYWdlcyBmb3IgYnVpbGRpbmcgcGFnZQo+IHRh
YmxlLiBBbmQgc3BlZWQgdXAgdGhlIHByb2Nlc3Mgb2YgcGFnZSBmYXVsdCwgZXNwZWNpYWxseSBm
b3IgaHVnZSBwYWdlCj4gZmF1bHQuIFRoZSBQT0Mgb2YgSHVnZXRsYiBmcmVlIHBhZ2UgcHJlIHpl
cm8gb3V0IGhhcyBiZWVuIGRvbmUuCgpUcnkga2VybmJlbmNoIHdpdGggYW5kIHdpdGhvdXQgeW91
ciBwYXRjaC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
