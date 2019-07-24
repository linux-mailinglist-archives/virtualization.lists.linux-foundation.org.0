Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E6473780
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:10:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DB73D151E;
	Wed, 24 Jul 2019 18:59:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 41F6DDA7
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:34:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CA94B224
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:34:57 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5d37dfee0000>; Tue, 23 Jul 2019 21:34:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Tue, 23 Jul 2019 21:34:57 -0700
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Tue, 23 Jul 2019 21:34:57 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 24 Jul 2019 04:34:56 +0000
Subject: Re: [PATCH 07/12] vhost-scsi: convert put_page() to put_user_page*()
To: <john.hubbard@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
	<20190724042518.14363-8-jhubbard@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <de40950e-0801-b830-4c48-56e84de0c82b@nvidia.com>
Date: Tue, 23 Jul 2019 21:34:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724042518.14363-8-jhubbard@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1563942895; bh=5ycCVDmY+zemv5AT9YYK21afucrRr/p3DH8wHXRCnZg=;
	h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
	Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
	Content-Transfer-Encoding;
	b=Li1yuMA+fDKyuz/M4SCCN59d7ctSse1jfSTWQ3iZlTsXSlRURMkhcccjz+NjkScvQ
	OT79Q+110UzH6ATtOAZE9TFWQjw4BLnCG5aUr/CalDFE2cW6KgzaPkPaa2VXwXXnY7
	5/pADAmNdIG6y4v4o+nIoM+vpWxQn4IxAHbuuW5oIOtDNzIl/y2OpjmtWUHEk+W1aZ
	olqi7E7lxyXO7wuTmjE0Zl5xPzM6XAPVnnMYc1B16d5wLkxA+Bss3XKDZ67aQwvlKh
	DZPWPt41q1dZKdSXT2fR0lvzoisF0pX9tRbjvzPB2h5VmCo5KF3WlKIvbrQsfpbBjq
	ftxyscOjUOrMA==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: Boaz Harrosh <boaz@plexistor.com>, Jan Kara <jack@suse.cz>,
	kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, linux-cifs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Johannes Thumshirn <jthumshirn@suse.de>,
	v9fs-developer@lists.sourceforge.net,
	Eric Van Hensbergen <ericvh@gmail.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	=?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Hajnoczi <stefanha@redhat.com>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, samba-technical@lists.samba.org,
	LKML <linux-kernel@vger.kernel.org>,
	"David S . Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
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

T24gNy8yMy8xOSA5OjI1IFBNLCBqb2huLmh1YmJhcmRAZ21haWwuY29tIHdyb3RlOgo+IEZyb206
IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+IAo+IEZvciBwYWdlcyB0aGF0
IHdlcmUgcmV0YWluZWQgdmlhIGdldF91c2VyX3BhZ2VzKigpLCByZWxlYXNlIHRob3NlIHBhZ2Vz
Cj4gdmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEg
cHV0X3BhZ2UoKS4KPiAKPiBUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29udmVyc2lvbiwgYXMg
ZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKPiAoIm1tOiBpbnRyb2R1Y2UgcHV0X3Vz
ZXJfcGFnZSooKSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KPiAKPiBDaGFuZ2VzIGZyb20gSsOp
csO0bWUncyBvcmlnaW5hbCBwYXRjaDoKPiAKPiAqIENoYW5nZWQgYSBXQVJOX09OIHRvIGEgQlVH
X09OLgo+IAoKQ2xlYXJseSwgdGhlIGFib3ZlIGNvbW1pdCBsb2cgaGFzIGl0IGJhY2t3YXJkcyAo
dGhpcyBpcyBxdWl0ZSBteSBuaWdodApmb3IgdHlwb3MpLiAgUGxlYXNlIHJlYWQgdGhhdCBhcyAi
Y2hhbmdlZCBhIEJVR19PTiB0byBhIFdBUk5fT04iLgoKSSdsbCBjb3JyZWN0IHRoZSBjb21taXQg
ZGVzY3JpcHRpb24gaW4gbmV4dCBpdGVyYXRpb24gb2YgdGhpcyBwYXRjaHNldC4KCi4uLgoKPiAr
CS8qCj4gKwkgKiBIZXJlIGluIGFsbCBjYXNlcyB3ZSBzaG91bGQgaGF2ZSBhbiBJT1ZFQyB3aGlj
aCB1c2UgR1VQLiBJZiB0aGF0IGlzCj4gKwkgKiBub3QgdGhlIGNhc2UgdGhlbiB3ZSB3aWxsIHdy
b25nbHkgY2FsbCBwdXRfdXNlcl9wYWdlKCkgYW5kIHRoZSBwYWdlCj4gKwkgKiByZWZjb3VudCB3
aWxsIGdvIHdyb25nICh0aGlzIGlzIGluIHZob3N0X3Njc2lfcmVsZWFzZV9jbWQoKSkKPiArCSAq
Lwo+ICsJV0FSTl9PTighaW92X2l0ZXJfZ2V0X3BhZ2VzX3VzZV9ndXAoaXRlcikpOwo+ICsKLi4u
Cgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
