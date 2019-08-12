Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A972E89660
	for <lists.virtualization@lfdr.de>; Mon, 12 Aug 2019 06:47:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C4627AD7;
	Mon, 12 Aug 2019 04:47:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C5773AC7
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 04:47:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AE9A487B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 04:46:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0188CC059B6F;
	Mon, 12 Aug 2019 04:46:59 +0000 (UTC)
Received: from [10.72.12.51] (ovpn-12-51.pek2.redhat.com [10.72.12.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57E3F5D6D0;
	Mon, 12 Aug 2019 04:46:54 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] virtio: decrement avail idx with buffer detach for
	packed ring
To: Pankaj Gupta <pagupta@redhat.com>, amit@kernel.org, mst@redhat.com
References: <20190809064847.28918-1-pagupta@redhat.com>
	<20190809064847.28918-3-pagupta@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b1ab613d-55a4-fdb4-96b1-03bedbcc740b@redhat.com>
Date: Mon, 12 Aug 2019 12:46:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809064847.28918-3-pagupta@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 12 Aug 2019 04:46:59 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: gregkh@linuxfoundation.org, xiaohli@redhat.com,
	linux-kernel@vger.kernel.org, arnd@arndb.de,
	virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvOC85IOS4i+WNiDI6NDgsIFBhbmthaiBHdXB0YSB3cm90ZToKPiBUaGlzIHBhdGNo
IGRlY3JlbWVudHMgJ25leHRfYXZhaWxfaWR4JyBjb3VudCB3aGVuIGRldGFjaGluZyBhIGJ1ZmZl
cgo+IGZyb20gdnEgZm9yIHBhY2tlZCByaW5nIGNvZGUuIFNwbGl0IHJpbmcgY29kZSBhbHJlYWR5
IGRvZXMgdGhpcyBpbgo+IHZpcnRxdWV1ZV9kZXRhY2hfdW51c2VkX2J1Zl9zcGxpdCBmdW5jdGlv
bi4gVGhpcyB1cGRhdGVzIHRoZQo+ICduZXh0X2F2YWlsX2lkeCcgdG8gdGhlIHByZXZpb3VzIGNv
cnJlY3QgaW5kZXggYWZ0ZXIgYW4gdW51c2VkIGJ1ZmZlcgo+IGlzIGRldGF0Y2hlZCBmcm9tIHRo
ZSB2cS4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhbmthaiBHdXB0YSA8cGFndXB0YUByZWRoYXQuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyB8IDYgKysrKysrCj4gICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aXJ0aW8vdmlydGlvX3JpbmcuYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiBpbmRl
eCBjOGJlMWM0ZjViNTUuLjdjNjkxODExMTNlMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnRp
by92aXJ0aW9fcmluZy5jCj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+IEBA
IC0xNTM3LDYgKzE1MzcsMTIgQEAgc3RhdGljIHZvaWQgKnZpcnRxdWV1ZV9kZXRhY2hfdW51c2Vk
X2J1Zl9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxKQo+ICAgCQkvKiBkZXRhY2hfYnVmIGNs
ZWFycyBkYXRhLCBzbyBncmFiIGl0IG5vdy4gKi8KPiAgIAkJYnVmID0gdnEtPnBhY2tlZC5kZXNj
X3N0YXRlW2ldLmRhdGE7Cj4gICAJCWRldGFjaF9idWZfcGFja2VkKHZxLCBpLCBOVUxMKTsKPiAr
CQl2cS0+cGFja2VkLm5leHRfYXZhaWxfaWR4LS07Cj4gKwkJaWYgKHZxLT5wYWNrZWQubmV4dF9h
dmFpbF9pZHggPCAwKSB7Cj4gKwkJCXZxLT5wYWNrZWQubmV4dF9hdmFpbF9pZHggPSB2cS0+cGFj
a2VkLnZyaW5nLm51bSAtIDE7Cj4gKwkJCXZxLT5wYWNrZWQuYXZhaWxfd3JhcF9jb3VudGVyIF49
IDE7Cj4gKwkJfQo+ICsKPiAgIAkJRU5EX1VTRSh2cSk7Cj4gICAJCXJldHVybiBidWY7Cj4gICAJ
fQoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
