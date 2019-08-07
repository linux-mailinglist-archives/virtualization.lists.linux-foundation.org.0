Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2C8448D
	for <lists.virtualization@lfdr.de>; Wed,  7 Aug 2019 08:35:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CF445DDF;
	Wed,  7 Aug 2019 06:35:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2FABEDDF
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 06:35:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D0282823
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 06:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h/YO9E7Kk2GlCfqzWsOaLMxcaYYFJaO+2uQZpeggUB0=;
	b=otE89qYM9WmETe4AtaYSwZhaVp
	x2hWnzTkK/+H6YrywBw2CCvGkAGS0+cMqYBTGZ1bytkCsNKOywsxuaErRoaQPCJFZ74nyD+BaWD0D
	Fqio4bMq3iSkQd4EZDyn1AS+qiOZ+zvMv6fNRqFHw53t3ciAgH4Z1x8wvN/D7EYKreU7FK2EDXOVj
	PtXuttuf2InvZsTot7swxCxX4U2Gh/2vRud2yGtuCEvw7oeWsTGK9Fxhm2aMTINFjUbhDSIHyQW9d
	1InA9ls8uWP73McSrAt6icdTTX2iY22SDv4qsGs3F3dJNdqSF3NdiMXvEekNoqV5nkE99PNfKXpGY
	TVYojzfw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hvFX6-0004to-Ui; Wed, 07 Aug 2019 06:34:48 +0000
Date: Tue, 6 Aug 2019 23:34:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 00/12] block/bio, fs: convert put_page() to
	put_user_page*()
Message-ID: <20190807063448.GA6002@infradead.org>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
	<20190724061750.GA19397@infradead.org>
	<c35aa2bf-c830-9e57-78ca-9ce6fb6cb53b@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c35aa2bf-c830-9e57-78ca-9ce6fb6cb53b@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, linux-cifs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	v9fs-developer@lists.sourceforge.net,
	Eric Van Hensbergen <ericvh@gmail.com>, john.hubbard@gmail.com,
	linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, samba-technical@lists.samba.org,
	LKML <linux-kernel@vger.kernel.org>,
	"David S . Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
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

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDM6NTQ6MzVQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDcvMjMvMTkgMTE6MTcgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4g
T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDk6MjU6MDZQTSAtMDcwMCwgam9obi5odWJiYXJkQGdt
YWlsLmNvbSB3cm90ZToKPiA+PiAqIFN0b3JlLCBpbiB0aGUgaW92X2l0ZXIsIGEgImNhbWUgZnJv
bSBndXAgKGdldF91c2VyX3BhZ2VzKSIgcGFyYW1ldGVyLgo+ID4+ICAgVGhlbiwgdXNlIHRoZSBu
ZXcgaW92X2l0ZXJfZ2V0X3BhZ2VzX3VzZV9ndXAoKSB0byByZXRyaWV2ZSBpdCB3aGVuCj4gPj4g
ICBpdCBpcyB0aW1lIHRvIHJlbGVhc2UgdGhlIHBhZ2VzLiBUaGF0IGFsbG93cyBjaG9vc2luZyBi
ZXR3ZWVuIHB1dF9wYWdlKCkKPiA+PiAgIGFuZCBwdXRfdXNlcl9wYWdlKigpLgo+ID4+Cj4gPj4g
KiBQYXNzIGluIG9uZSBtb3JlIHBpZWNlIG9mIGluZm9ybWF0aW9uIHRvIGJpb19yZWxlYXNlX3Bh
Z2VzOiBhICJmcm9tX2d1cCIKPiA+PiAgIHBhcmFtZXRlci4gU2ltaWxhciB1c2UgYXMgYWJvdmUu
Cj4gPj4KPiA+PiAqIENoYW5nZSB0aGUgYmxvY2sgbGF5ZXIsIGFuZCBzZXZlcmFsIGZpbGUgc3lz
dGVtcywgdG8gdXNlCj4gPj4gICBwdXRfdXNlcl9wYWdlKigpLgo+ID4gCj4gPiBJIHRoaW5rIHdl
IGNhbiBkbyB0aGlzIGluIGEgc2ltcGxlIGFuZCBiZXR0ZXIgd2F5LiAgV2UgaGF2ZSA1IElURVJf
Kgo+ID4gdHlwZXMuICBPZiB0aG9zZSBJVEVSX0RJU0NBUkQgYXMgdGhlIG5hbWUgc3VnZ2VzdHMg
bmV2ZXIgdXNlcyBwYWdlcywgc28KPiA+IHdlIGNhbiBza2lwIGhhbmRsaW5nIGl0LiAgSVRFUl9Q
SVBFIGlzIHJlamVjdGVkINGWbiB0aGUgZGlyZWN0IEkvTyBwYXRoLAo+ID4gd2hpY2ggbGVhdmVz
IHVzIHdpdGggdGhyZWUuCj4gPiAKPiAKPiBIaSBDaHJpc3RvcGgsCj4gCj4gQXJlIHlvdSB3b3Jr
aW5nIG9uIGFueXRoaW5nIGxpa2UgdGhpcz8KCkkgd2FzIGhvcGluZyBJIGNvdWxkIHN0ZWVyIHlv
dSB0b3dhcmRzIGl0LiAgQnV0IGlmIHlvdSBkb24ndCB3YW50IHRvIGRvCml0IHlvdXJzZWxmIEkn
bGwgYWRkIGl0IHRvIG15IGV2ZXIgZ3Jvd2luZyB0b2RvIGxpc3QuCgo+IE9yIG9uIHRoZSBwdXRf
dXNlcl9idmVjKCkgaWRlYT8KCkkgaGF2ZSBhIHByb3RvdHlwZSBmcm9tIHR3byBtb250aCBhZ286
CgpodHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0L3Nob3J0bG9nL3Jl
ZnMvaGVhZHMvZ3VwLWJ2ZWMKCmJ1dCB0aGF0IG9ubHkgc3Vydml2ZWQgdGhlIG1vc3QgYmFzaWMg
dGVzdGluZywgc28gaXQnbGwgbmVlZCBtb3JlIHdvcmssCndoaWNoIEknbSBub3Qgc3VyZSB3aGVu
IEknbGwgZmluZCB0aW1lIGZvci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
