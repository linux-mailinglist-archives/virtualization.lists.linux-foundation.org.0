Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7A9896E9
	for <lists.virtualization@lfdr.de>; Mon, 12 Aug 2019 07:37:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E493DB9E;
	Mon, 12 Aug 2019 05:37:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 74FE8AF0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 05:37:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2F3FA2C6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 05:37:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD37230BCB81;
	Mon, 12 Aug 2019 05:37:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3AD97ED9C;
	Mon, 12 Aug 2019 05:37:26 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EF9A18005A0;
	Mon, 12 Aug 2019 05:37:26 +0000 (UTC)
Date: Mon, 12 Aug 2019 01:37:26 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Message-ID: <1187681083.7829340.1565588246611.JavaMail.zimbra@redhat.com>
In-Reply-To: <b1ab613d-55a4-fdb4-96b1-03bedbcc740b@redhat.com>
References: <20190809064847.28918-1-pagupta@redhat.com>
	<20190809064847.28918-3-pagupta@redhat.com>
	<b1ab613d-55a4-fdb4-96b1-03bedbcc740b@redhat.com>
Subject: Re: [PATCH v3 2/2] virtio: decrement avail idx with buffer detach
	for packed ring
MIME-Version: 1.0
X-Originating-IP: [10.67.116.104, 10.4.195.23]
Thread-Topic: virtio: decrement avail idx with buffer detach for packed ring
Thread-Index: hI5KLFlvFHS2BzTqtSMldQqHOlD+gw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 12 Aug 2019 05:37:26 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: arnd@arndb.de, mst@redhat.com, gregkh@linuxfoundation.org, amit@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, xiaohli@redhat.com
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

Cj4gCj4gT24gMjAxOS84Lzkg5LiL5Y2IMjo0OCwgUGFua2FqIEd1cHRhIHdyb3RlOgo+ID4gVGhp
cyBwYXRjaCBkZWNyZW1lbnRzICduZXh0X2F2YWlsX2lkeCcgY291bnQgd2hlbiBkZXRhY2hpbmcg
YSBidWZmZXIKPiA+IGZyb20gdnEgZm9yIHBhY2tlZCByaW5nIGNvZGUuIFNwbGl0IHJpbmcgY29k
ZSBhbHJlYWR5IGRvZXMgdGhpcyBpbgo+ID4gdmlydHF1ZXVlX2RldGFjaF91bnVzZWRfYnVmX3Nw
bGl0IGZ1bmN0aW9uLiBUaGlzIHVwZGF0ZXMgdGhlCj4gPiAnbmV4dF9hdmFpbF9pZHgnIHRvIHRo
ZSBwcmV2aW91cyBjb3JyZWN0IGluZGV4IGFmdGVyIGFuIHVudXNlZCBidWZmZXIKPiA+IGlzIGRl
dGF0Y2hlZCBmcm9tIHRoZSB2cS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYW5rYWogR3VwdGEg
PHBhZ3VwdGFAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9f
cmluZy5jIHwgNiArKysrKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVy
cy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ID4gaW5kZXggYzhiZTFjNGY1YjU1Li43YzY5MTgxMTEz
ZTIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiArKysg
Yi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiBAQCAtMTUzNyw2ICsxNTM3LDEyIEBA
IHN0YXRpYyB2b2lkCj4gPiAqdmlydHF1ZXVlX2RldGFjaF91bnVzZWRfYnVmX3BhY2tlZChzdHJ1
Y3QgdmlydHF1ZXVlICpfdnEpCj4gPiAgIAkJLyogZGV0YWNoX2J1ZiBjbGVhcnMgZGF0YSwgc28g
Z3JhYiBpdCBub3cuICovCj4gPiAgIAkJYnVmID0gdnEtPnBhY2tlZC5kZXNjX3N0YXRlW2ldLmRh
dGE7Cj4gPiAgIAkJZGV0YWNoX2J1Zl9wYWNrZWQodnEsIGksIE5VTEwpOwo+ID4gKwkJdnEtPnBh
Y2tlZC5uZXh0X2F2YWlsX2lkeC0tOwo+ID4gKwkJaWYgKHZxLT5wYWNrZWQubmV4dF9hdmFpbF9p
ZHggPCAwKSB7Cj4gPiArCQkJdnEtPnBhY2tlZC5uZXh0X2F2YWlsX2lkeCA9IHZxLT5wYWNrZWQu
dnJpbmcubnVtIC0gMTsKPiA+ICsJCQl2cS0+cGFja2VkLmF2YWlsX3dyYXBfY291bnRlciBePSAx
Owo+ID4gKwkJfQo+ID4gKwo+ID4gICAJCUVORF9VU0UodnEpOwo+ID4gICAJCXJldHVybiBidWY7
Cj4gPiAgIAl9Cj4gCj4gCj4gQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5j
b20+CgpUaGFuayB5b3UsIEphc29uLgoKQmVzdCByZWdhcmRzLApQYW5rYWoKCj4gCj4gCj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
