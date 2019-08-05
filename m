Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 19636827BE
	for <lists.virtualization@lfdr.de>; Tue,  6 Aug 2019 00:54:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B24E5CF3;
	Mon,  5 Aug 2019 22:54:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3E93ECDD
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 22:54:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 37C875E4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 22:54:37 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5d48b3b50000>; Mon, 05 Aug 2019 15:54:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Mon, 05 Aug 2019 15:54:36 -0700
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Mon, 05 Aug 2019 15:54:36 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 5 Aug 2019 22:54:35 +0000
Subject: Re: [PATCH 00/12] block/bio, fs: convert put_page() to
	put_user_page*()
To: Christoph Hellwig <hch@infradead.org>, <john.hubbard@gmail.com>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
	<20190724061750.GA19397@infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <c35aa2bf-c830-9e57-78ca-9ce6fb6cb53b@nvidia.com>
Date: Mon, 5 Aug 2019 15:54:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724061750.GA19397@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1565045686; bh=su7Un7Lsr0IB37YVHfSyk5WWru26t8lLPZpTgkOrxAY=;
	h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
	Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
	Content-Transfer-Encoding;
	b=MABsVuv2G9BzGpy+DkzIhxi90zmgNTMYOagd/ashPLcDOi2sWU6YznkbyPDv/xcq/
	O5RFeXAwmCAh/JO0LO+ze2NEhPe2n+psweVYXa8pjERXCCCfGYTxQ9SDkc4s4KNR59
	NLyb52q+/1fN+RE5h7a69JZCsNpaL7gcHJobrCC7E9UqWrmG9ACN7VwIX7DKaTA/Rb
	eRaFep1AoazjTxyXxT6Tx1JQhDVjP38m4xzwGlHYvs4ZQCYA68yceeG7xda5nxeUcP
	Q7wlfmFbcUA/T+jBVHNbqmQyCuHaQMhgKiqtQK78vKYLrwPUcmbghr4B0X7IdrZjfb
	e4QZrUIdtNMcg==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, linux-cifs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	v9fs-developer@lists.sourceforge.net,
	Eric Van Hensbergen <ericvh@gmail.com>, linux-block@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, samba-technical@lists.samba.org,
	LKML <linux-kernel@vger.kernel.org>, "David
	S . Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gNy8yMy8xOSAxMToxNyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gVHVlLCBK
dWwgMjMsIDIwMTkgYXQgMDk6MjU6MDZQTSAtMDcwMCwgam9obi5odWJiYXJkQGdtYWlsLmNvbSB3
cm90ZToKPj4gKiBTdG9yZSwgaW4gdGhlIGlvdl9pdGVyLCBhICJjYW1lIGZyb20gZ3VwIChnZXRf
dXNlcl9wYWdlcykiIHBhcmFtZXRlci4KPj4gICBUaGVuLCB1c2UgdGhlIG5ldyBpb3ZfaXRlcl9n
ZXRfcGFnZXNfdXNlX2d1cCgpIHRvIHJldHJpZXZlIGl0IHdoZW4KPj4gICBpdCBpcyB0aW1lIHRv
IHJlbGVhc2UgdGhlIHBhZ2VzLiBUaGF0IGFsbG93cyBjaG9vc2luZyBiZXR3ZWVuIHB1dF9wYWdl
KCkKPj4gICBhbmQgcHV0X3VzZXJfcGFnZSooKS4KPj4KPj4gKiBQYXNzIGluIG9uZSBtb3JlIHBp
ZWNlIG9mIGluZm9ybWF0aW9uIHRvIGJpb19yZWxlYXNlX3BhZ2VzOiBhICJmcm9tX2d1cCIKPj4g
ICBwYXJhbWV0ZXIuIFNpbWlsYXIgdXNlIGFzIGFib3ZlLgo+Pgo+PiAqIENoYW5nZSB0aGUgYmxv
Y2sgbGF5ZXIsIGFuZCBzZXZlcmFsIGZpbGUgc3lzdGVtcywgdG8gdXNlCj4+ICAgcHV0X3VzZXJf
cGFnZSooKS4KPiAKPiBJIHRoaW5rIHdlIGNhbiBkbyB0aGlzIGluIGEgc2ltcGxlIGFuZCBiZXR0
ZXIgd2F5LiAgV2UgaGF2ZSA1IElURVJfKgo+IHR5cGVzLiAgT2YgdGhvc2UgSVRFUl9ESVNDQVJE
IGFzIHRoZSBuYW1lIHN1Z2dlc3RzIG5ldmVyIHVzZXMgcGFnZXMsIHNvCj4gd2UgY2FuIHNraXAg
aGFuZGxpbmcgaXQuICBJVEVSX1BJUEUgaXMgcmVqZWN0ZWQg0ZZuIHRoZSBkaXJlY3QgSS9PIHBh
dGgsCj4gd2hpY2ggbGVhdmVzIHVzIHdpdGggdGhyZWUuCj4gCgpIaSBDaHJpc3RvcGgsCgpBcmUg
eW91IHdvcmtpbmcgb24gYW55dGhpbmcgbGlrZSB0aGlzPyBPciBvbiB0aGUgcHV0X3VzZXJfYnZl
YygpIGlkZWE/ClBsZWFzZSBsZXQgbWUga25vdywgb3RoZXJ3aXNlIEknbGwgZ28gaW4gYW5kIGlt
cGxlbWVudCBzb21ldGhpbmcgaGVyZS4KCgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElB
Cgo+IE91dCBvZiB0aG9zZSBJVEVSX0JWRUMgbmVlZHMgYSB1c2VyIHBhZ2UgcmVmZXJlbmNlLCBz
byB3ZSB3YW50IHRvIGNhbGwKPiBwdXRfdXNlcl9wYWdlKiBvbiBpdC4gIElURVJfQlZFQyBhbHdh
eXMgYWxyZWFkeSBoYXMgcGFnZSByZWZlcmVuY2UsCj4gd2hpY2ggbWVhbnMgaW4gdGhlIGJsb2Nr
IGRpcmVjdCBJL08gcGF0aCBwYXRoIHdlIGFscmVhZCBkb24ndCB0YWtlCj4gYSBwYWdlIHJlZmVy
ZW5jZS4gIFdlIHNob3VsZCBleHRlbnQgdGhhdCBoYW5kbGluZyB0byBhbGwgb3RoZXIgY2FsbHMK
PiBvZiBpb3ZfaXRlcl9nZXRfcGFnZXMgLyBpb3ZfaXRlcl9nZXRfcGFnZXNfYWxsb2MuICBJIHRo
aW5rIHdlIHNob3VsZAo+IGp1c3QgcmVqZWN0IElURVJfS1ZFQyBmb3IgZGlyZWN0IEkvTyBhcyB3
ZWxsIGFzIHdlIGhhdmUgbm8gdXNlcnMgYW5kCj4gaXQgaXMgcmF0aGVyIHBvaW50bGVzcy4gIEFs
dGVybmF0aXZlbHkgaWYgd2Ugc2VlIGEgdXNlIGZvciBpdCB0aGUKPiBjYWxsZXJzIHNob3VsZCBh
bHdheXMgaGF2ZSBhIGxpZmUgcGFnZSByZWZlcmVuY2UgYW55d2F5IChvciBtaWdodAo+IGJlIG9u
IGttYWxsb2MgbWVtb3J5KSwgc28gd2UgcmVhbGx5IHNob3VsZCBub3QgdGFrZSBhIHJlZmVyZW5j
ZSBlaXRoZXIuCj4gCj4gSW4gb3RoZXIgd29yZHM6ICB0aGUgb25seSB0aW1lIHdlIHNob3VsZCBl
dmVyIGhhdmUgdG8gcHV0IGEgcGFnZSBpbgo+IHRoaXMgcGF0Y2ggaXMgd2hlbiB0aGV5IGFyZSB1
c2VyIHBhZ2VzLiAgV2UnbGwgbmVlZCB0byBjbGVhbiB1cAo+IHZhcmlvdXMgYml0cyBvZiBjb2Rl
IGZvciB0aGF0LCBidXQgdGhhdCBjYW4gYmUgZG9uZSBncmFkdWFsbHkgYmVmb3JlCj4gZXZlbiBn
ZXR0aW5nIHRvIHRoZSBhY3R1YWwgcHV0X3VzZXJfcGFnZXMgY29udmVyc2lvbi4KPiAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
