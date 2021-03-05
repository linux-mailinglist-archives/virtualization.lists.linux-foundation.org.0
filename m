Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C6132E045
	for <lists.virtualization@lfdr.de>; Fri,  5 Mar 2021 04:45:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F05F384417;
	Fri,  5 Mar 2021 03:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRPJbH6BSi5D; Fri,  5 Mar 2021 03:45:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76C7983FB4;
	Fri,  5 Mar 2021 03:45:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1476FC0001;
	Fri,  5 Mar 2021 03:45:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C46AFC0001
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 03:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5DF983FB4
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 03:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JcT1xjZxlrXo
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 03:44:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF91C83D17
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 03:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614915897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4I5kef0XmfQCBgsttFhP8wyT8eOUwk5Gs3XFVSY0zw=;
 b=DjyWNBHIOhXHH/JnemjH8HnzPEOX/6IIwyopP+SjWWW4IwAKnvKKvMJgcVM7HgyxKT7K31
 aXOhgQTF9R/6vZ7GTcwkWCpCD0+WnbCeL3pQBcj6G+CWNS5yY6wRy1ixidjRCB800JzIgp
 EBmfnhHwr0uMJdBhVvPUhKSmsySwQj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-no1UHjtgMt6ILm_NLFuyrw-1; Thu, 04 Mar 2021 22:44:54 -0500
X-MC-Unique: no1UHjtgMt6ILm_NLFuyrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCD6D80006E;
 Fri,  5 Mar 2021 03:44:51 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-196.pek2.redhat.com
 [10.72.13.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 425DC6060F;
 Fri,  5 Mar 2021 03:44:39 +0000 (UTC)
Subject: Re: [RFC v4 11/11] vduse: Support binding irq to the specified cpu
To: Yongji Xie <xieyongji@bytedance.com>
References: <20210223115048.435-1-xieyongji@bytedance.com>
 <20210223115048.435-12-xieyongji@bytedance.com>
 <d104a518-799d-c13f-311c-f7a673f9241b@redhat.com>
 <CACycT3uaOU5ybwojfiSL0kSpW9GUnh82ZeDH7drdkfK72iP8bg@mail.gmail.com>
 <86af7b84-23f0-dca7-183b-e4d586cbcea6@redhat.com>
 <CACycT3s+eO7Qi8aPayLbfNnLqOK_q1oB6+d+51hudd-zZf7n8w@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <845bfa68-2ece-81a2-317f-3e0cf4f72cf1@redhat.com>
Date: Fri, 5 Mar 2021 11:44:38 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACycT3s+eO7Qi8aPayLbfNnLqOK_q1oB6+d+51hudd-zZf7n8w@mail.gmail.com>
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-aio@kvack.org, netdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Matthew Wilcox <willy@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, Bob Liu <bob.liu@oracle.com>,
 bcrl@kvack.org, viro@zeniv.linux.org.uk, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjEvMy81IDExOjM3IOS4iuWNiCwgWW9uZ2ppIFhpZSB3cm90ZToKPiBPbiBGcmksIE1h
ciA1LCAyMDIxIGF0IDExOjExIEFNIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdy
b3RlOgo+Pgo+PiBPbiAyMDIxLzMvNCA0OjE5IOS4i+WNiCwgWW9uZ2ppIFhpZSB3cm90ZToKPj4+
IE9uIFRodSwgTWFyIDQsIDIwMjEgYXQgMzozMCBQTSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPiB3cm90ZToKPj4+PiBPbiAyMDIxLzIvMjMgNzo1MCDkuIvljYgsIFhpZSBZb25namkg
d3JvdGU6Cj4+Pj4+IEFkZCBhIHBhcmFtZXRlciBmb3IgdGhlIGlvY3RsIFZEVVNFX0lOSkVDVF9W
UV9JUlEgdG8gc3VwcG9ydAo+Pj4+PiBpbmplY3RpbmcgdmlydHF1ZXVlJ3MgaW50ZXJydXB0IHRv
IHRoZSBzcGVjaWZpZWQgY3B1Lgo+Pj4+IEhvdyB1c2Vyc3BhY2Uga25vdyB3aGljaCBDUFUgaXMg
dGhpcyBpcnEgZm9yPyBJdCBsb29rcyB0byBtZSB3ZSBuZWVkIHRvCj4+Pj4gZG8gaXQgYXQgZGlm
ZmVyZW50IGxldmVsLgo+Pj4+Cj4+Pj4gRS5nIGludHJvZHVjZSBzb21lIEFQSSBpbiBzeXMgdG8g
YWxsb3cgYWRtaW4gdG8gdHVuZSBmb3IgdGhhdC4KPj4+Pgo+Pj4+IEJ1dCBJIHRoaW5rIHdlIGNh
biBkbyB0aGF0IGluIGFudG9oZXIgcGF0Y2ggb24gdG9wIG9mIHRoaXMgc2VyaWVzLgo+Pj4+Cj4+
PiBPSy4gSSB3aWxsIHRoaW5rIG1vcmUgYWJvdXQgaXQuCj4+Cj4+IEl0IHNob3VsZCBiZSBzb2Vt
dGhpbmcgbGlrZQo+PiAvc3lzL2NsYXNzL3ZkdXNlLyRkZXZfbmFtZS92cS8wL2lycV9hZmZpbml0
eS4gQWxzbyBuZWVkIHRvIG1ha2Ugc3VyZQo+PiBldmVudGZkIGNvdWxkIG5vdCBiZSByZXVzZWQu
Cj4+Cj4gTG9va3MgbGlrZSB3ZSBkb2Vzbid0IHVzZSBldmVudGZkIG5vdy4gRG8geW91IG1lYW4g
d2UgbmVlZCB0byB1c2UKPiBldmVudGZkIGluIHRoaXMgY2FzZT8KCgpObywgSSBtZWFudCBpZiB3
ZSdyZSB1c2luZyBldmVudGZkLCBkbyB3ZSBhbGxvdyBhIHNpbmdsZSBldmVudGZkIHRvIGJlIAp1
c2VkIGZvciBpbmplY3RpbmcgaXJxIGZvciBtb3JlIHRoYW4gb25lIHZpcnRxdWV1ZT8gKElmIG5v
dCwgSSBndWVzcyBpdCAKc2hvdWxkIGJlIG9rKS4KClRoYW5rcwoKCj4KPiBUaGFua3MsCj4gWW9u
Z2ppCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
