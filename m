Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9D9844A5
	for <lists.virtualization@lfdr.de>; Wed,  7 Aug 2019 08:40:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8B4C8E33;
	Wed,  7 Aug 2019 06:40:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 57AD8941
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 06:40:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8F4F282D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 06:40:35 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5d4a726c0000>; Tue, 06 Aug 2019 23:40:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Tue, 06 Aug 2019 23:40:34 -0700
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Tue, 06 Aug 2019 23:40:34 -0700
Received: from [10.2.165.207] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 7 Aug 2019 06:40:34 +0000
Subject: Re: [PATCH 00/12] block/bio, fs: convert put_page() to
	put_user_page*()
To: Christoph Hellwig <hch@infradead.org>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
	<20190724061750.GA19397@infradead.org>
	<c35aa2bf-c830-9e57-78ca-9ce6fb6cb53b@nvidia.com>
	<20190807063448.GA6002@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <3ab1e69f-88c6-3e16-444d-cab78c3bf1d1@nvidia.com>
Date: Tue, 6 Aug 2019 23:38:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807063448.GA6002@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1565160044; bh=jn0FnBY7ADCh0laBLX/xGqPiB9Jg8oG9YEaLS2KH1Js=;
	h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
	Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
	Content-Transfer-Encoding;
	b=cZhyddtfeWnuDzmY91G/o97CceVB5RM0qm7xIS+BT+DJS1yACOaMbPnxtDPonJo3O
	Ckk802AdQClg27dtVTwqZlP1rJ45uR/xJxU2tj1bAWtx6wGx8MnDwDr9/hAcMofdtY
	YSzbF7dvdBOxPO1CMgg0kHDyQnZ9XI/sZkIaiXVixuZIn5BzSqRh7aOyfPS3OIiva2
	EdoAoTR8kqTmNnuIpmqz0Mts9lp7nFil4TrfQHcFTrur14aYk9UOgpcZdRREzoyCup
	0KYEKb/ZJNSFduxPI76a4ilG78VxY7/mJHog1LdnWqMnq4OYf6DhFN3qt02E1MzswR
	TFH77+TyL//6w==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gOC82LzE5IDExOjM0IFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBNb24sIEF1
ZyAwNSwgMjAxOSBhdCAwMzo1NDozNVBNIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IE9u
IDcvMjMvMTkgMTE6MTcgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgouLi4KPj4+IEkgdGhp
bmsgd2UgY2FuIGRvIHRoaXMgaW4gYSBzaW1wbGUgYW5kIGJldHRlciB3YXkuICBXZSBoYXZlIDUg
SVRFUl8qCj4+PiB0eXBlcy4gIE9mIHRob3NlIElURVJfRElTQ0FSRCBhcyB0aGUgbmFtZSBzdWdn
ZXN0cyBuZXZlciB1c2VzIHBhZ2VzLCBzbwo+Pj4gd2UgY2FuIHNraXAgaGFuZGxpbmcgaXQuICBJ
VEVSX1BJUEUgaXMgcmVqZWN0ZWQg0ZZuIHRoZSBkaXJlY3QgSS9PIHBhdGgsCj4+PiB3aGljaCBs
ZWF2ZXMgdXMgd2l0aCB0aHJlZS4KPj4+Cj4+Cj4+IEhpIENocmlzdG9waCwKPj4KPj4gQXJlIHlv
dSB3b3JraW5nIG9uIGFueXRoaW5nIGxpa2UgdGhpcz8KPiAKPiBJIHdhcyBob3BpbmcgSSBjb3Vs
ZCBzdGVlciB5b3UgdG93YXJkcyBpdC4gIEJ1dCBpZiB5b3UgZG9uJ3Qgd2FudCB0byBkbwo+IGl0
IHlvdXJzZWxmIEknbGwgYWRkIGl0IHRvIG15IGV2ZXIgZ3Jvd2luZyB0b2RvIGxpc3QuCj4gCgpT
dXJlLCBJJ20gdXAgZm9yIHRoaXMuIFRoZSBidmVjLXJlbGF0ZWQgaXRlbXMgYXJlIHRoZSBuZXh0
IGxvZ2ljYWwgcGFydApvZiB0aGUgZ3VwL2RtYSBjb252ZXJzaW9ucyB0byB3b3JrIG9uLCBhbmQg
SSBqdXN0IHdhbnRlZCB0byBhdm9pZCBzb2x2aW5nIHRoZQpzYW1lIHByb2JsZW0gaWYgeW91IHdl
cmUgYWxyZWFkeSBpbiB0aGUgY29kZS4KCgo+PiBPciBvbiB0aGUgcHV0X3VzZXJfYnZlYygpIGlk
ZWE/Cj4gCj4gSSBoYXZlIGEgcHJvdG90eXBlIGZyb20gdHdvIG1vbnRoIGFnbzoKPiAKPiBodHRw
Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0L3Nob3J0bG9nL3JlZnMvaGVh
ZHMvZ3VwLWJ2ZWMKPiAKPiBidXQgdGhhdCBvbmx5IHN1cnZpdmVkIHRoZSBtb3N0IGJhc2ljIHRl
c3RpbmcsIHNvIGl0J2xsIG5lZWQgbW9yZSB3b3JrLAo+IHdoaWNoIEknbSBub3Qgc3VyZSB3aGVu
IEknbGwgZmluZCB0aW1lIGZvci4KPiAKCkknbGwgdGFrZSBhIHBlZWssIGFuZCBwcm9iYWJseSBw
ZXN0ZXIgeW91IHdpdGggYSBmZXcgcXVlc3Rpb25zIGlmIEkgZ2V0CmNvbmZ1c2VkLiA6KQoKdGhh
bmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
