Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF8741F5
	for <lists.virtualization@lfdr.de>; Thu, 25 Jul 2019 01:23:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EDB43166A;
	Wed, 24 Jul 2019 23:23:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A00F814AC
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 23:23:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 37250224
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 23:23:25 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5d38e8730000>; Wed, 24 Jul 2019 16:23:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate102.nvidia.com (PGP Universal service);
	Wed, 24 Jul 2019 16:23:23 -0700
X-PGP-Universal: processed;
	by hqpgpgate102.nvidia.com on Wed, 24 Jul 2019 16:23:23 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 24 Jul 2019 23:23:22 +0000
Subject: Re: [PATCH 00/12] block/bio, fs: convert put_page() to
	put_user_page*()
To: Christoph Hellwig <hch@infradead.org>, <john.hubbard@gmail.com>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
	<20190724061750.GA19397@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <17f12f3d-981e-a717-c8e5-bfbbfb7ec1a3@nvidia.com>
Date: Wed, 24 Jul 2019 16:23:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724061750.GA19397@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1564010611; bh=U/byz8o3kezigETW8hWUjg+JqkNm/y0Q4UHjAnDVaRI=;
	h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
	Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
	Content-Transfer-Encoding;
	b=POKycPna3sFHaptSpPG8JFNhdv+KWPJt4Fqq7qra/U5uujHxVhga0mA2hyYe3oLWO
	rvMjdBQgQaYdhe3tYVq3xzWzC7PXLH9gVg6v6GfrdnHKhzPSXOdrUzDa4Sfy+FpWme
	AYx8XN4QHijtxUQThz9jDsFglp/BwmD6wmVyo2Ou4HoX36ySg8r0DnnWDfRMrkzmXC
	XvSXsG7L9llJHump4bjV4yoH02Li7EYgdYhEFhGR3d1oO3a9DGx7nb70VEc+guaDrP
	BAn4DIKE83X0lqImHCnmIIbgjVMdzz9Q4ePUhHR77cnRWD+JGehn4V8I2IYZgTvKbn
	0ENu9Hbk0xmXw==
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
dGgsCj4gd2hpY2ggbGVhdmVzIHVzIHdpdGggdGhyZWUuCj4gCj4gT3V0IG9mIHRob3NlIElURVJf
QlZFQyBuZWVkcyBhIHVzZXIgcGFnZSByZWZlcmVuY2UsIHNvIHdlIHdhbnQgdG8gY2FsbAoKICAg
ICAgICAgICAgICAgXiBJVEVSX0lPVkVDLCBJIGhvcGUuIE90aGVyd2lzZSBJJ20gaG9wZWxlc3Mg
bG9zdC4gOikKCj4gcHV0X3VzZXJfcGFnZSogb24gaXQuICBJVEVSX0JWRUMgYWx3YXlzIGFscmVh
ZHkgaGFzIHBhZ2UgcmVmZXJlbmNlLAo+IHdoaWNoIG1lYW5zIGluIHRoZSBibG9jayBkaXJlY3Qg
SS9PIHBhdGggcGF0aCB3ZSBhbHJlYWQgZG9uJ3QgdGFrZQo+IGEgcGFnZSByZWZlcmVuY2UuICBX
ZSBzaG91bGQgZXh0ZW50IHRoYXQgaGFuZGxpbmcgdG8gYWxsIG90aGVyIGNhbGxzCj4gb2YgaW92
X2l0ZXJfZ2V0X3BhZ2VzIC8gaW92X2l0ZXJfZ2V0X3BhZ2VzX2FsbG9jLiAgSSB0aGluayB3ZSBz
aG91bGQKPiBqdXN0IHJlamVjdCBJVEVSX0tWRUMgZm9yIGRpcmVjdCBJL08gYXMgd2VsbCBhcyB3
ZSBoYXZlIG5vIHVzZXJzIGFuZAo+IGl0IGlzIHJhdGhlciBwb2ludGxlc3MuICBBbHRlcm5hdGl2
ZWx5IGlmIHdlIHNlZSBhIHVzZSBmb3IgaXQgdGhlCj4gY2FsbGVycyBzaG91bGQgYWx3YXlzIGhh
dmUgYSBsaWZlIHBhZ2UgcmVmZXJlbmNlIGFueXdheSAob3IgbWlnaHQKPiBiZSBvbiBrbWFsbG9j
IG1lbW9yeSksIHNvIHdlIHJlYWxseSBzaG91bGQgbm90IHRha2UgYSByZWZlcmVuY2UgZWl0aGVy
Lgo+IAo+IEluIG90aGVyIHdvcmRzOiAgdGhlIG9ubHkgdGltZSB3ZSBzaG91bGQgZXZlciBoYXZl
IHRvIHB1dCBhIHBhZ2UgaW4KPiB0aGlzIHBhdGNoIGlzIHdoZW4gdGhleSBhcmUgdXNlciBwYWdl
cy4gIFdlJ2xsIG5lZWQgdG8gY2xlYW4gdXAKPiB2YXJpb3VzIGJpdHMgb2YgY29kZSBmb3IgdGhh
dCwgYnV0IHRoYXQgY2FuIGJlIGRvbmUgZ3JhZHVhbGx5IGJlZm9yZQo+IGV2ZW4gZ2V0dGluZyB0
byB0aGUgYWN0dWFsIHB1dF91c2VyX3BhZ2VzIGNvbnZlcnNpb24uCj4gCgpTb3VuZHMgZ3JlYXQu
IEknbSBwYXJ0IHdheSBpbnRvIGl0IGFuZCBpdCBkb2Vzbid0IGxvb2sgdG9vIGJhZC4gVGhlIG1h
aW4KcXVlc3Rpb24gaXMgd2hlcmUgdG8gc2NhdHRlciB2YXJpb3VzIGNoZWNrcyBhbmQgYXNzZXJ0
aW9ucywgdG8ga2VlcAp0aGUga3ZlY3Mgb3V0IG9mIGRpcmVjdCBJLzAuIE9yIGF0IGxlYXN0IGtl
ZXAgdGhlIGd1cHMgYXdheSBmcm9tIApkaXJlY3QgSS8wLgoKCnRoYW5rcywKLS0gCkpvaG4gSHVi
YmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
