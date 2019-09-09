Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A42AD39D
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 09:20:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 43CF9D9D;
	Mon,  9 Sep 2019 07:20:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9568749F
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 07:20:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 49FADEC
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 07:20:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC5CC6907A;
	Mon,  9 Sep 2019 07:20:17 +0000 (UTC)
Received: from [10.72.12.61] (ovpn-12-61.pek2.redhat.com [10.72.12.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1925A5D6A7;
	Mon,  9 Sep 2019 07:20:06 +0000 (UTC)
Subject: Re: [RFC PATCH untested] vhost: block speculation of translated
	descriptors
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20190908110521.4031-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <db4d77d7-c467-935d-b4ae-1da7635e9b6b@redhat.com>
Date: Mon, 9 Sep 2019 15:19:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190908110521.4031-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 09 Sep 2019 07:20:17 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMTkvOS84IOS4i+WNiDc6MDUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBpb3Zl
YyBhZGRyZXNzZXMgY29taW5nIGZyb20gdmhvc3QgYXJlIGFzc3VtZWQgdG8gYmUKPiBwcmUtdmFs
aWRhdGVkLCBidXQgaW4gZmFjdCBjYW4gYmUgc3BlY3VsYXRlZCB0byBhIHZhbHVlCj4gb3V0IG9m
IHJhbmdlLgo+Cj4gVXNlcnNwYWNlIGFkZHJlc3MgYXJlIGxhdGVyIHZhbGlkYXRlZCB3aXRoIGFy
cmF5X2luZGV4X25vc3BlYyBzbyB3ZSBjYW4KPiBiZSBzdXJlIGtlcm5lbCBpbmZvIGRvZXMgbm90
IGxlYWsgdGhyb3VnaCB0aGVzZSBhZGRyZXNzZXMsIGJ1dCB2aG9zdAo+IG11c3QgYWxzbyBub3Qg
bGVhayB1c2Vyc3BhY2UgaW5mbyBvdXRzaWRlIHRoZSBhbGxvd2VkIG1lbW9yeSB0YWJsZSB0bwo+
IGd1ZXN0cy4KPgo+IEZvbGxvd2luZyB0aGUgZGVmZW5jZSBpbiBkZXB0aCBwcmluY2lwbGUsIG1h
a2Ugc3VyZQo+IHRoZSBhZGRyZXNzIGlzIG5vdCB2YWxpZGF0ZWQgb3V0IG9mIG5vZGUgcmFuZ2Uu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgo+
IC0tLQo+ICAgZHJpdmVycy92aG9zdC92aG9zdC5jIHwgNCArKystCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aG9zdC92aG9zdC5jIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gaW5kZXggNWRjMTc0YWM4
Y2FjLi4wZWUzNzVmYjcxNDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4g
KysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gQEAgLTIwNzIsNyArMjA3Miw5IEBAIHN0YXRp
YyBpbnQgdHJhbnNsYXRlX2Rlc2Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsIHU2NCBhZGRy
LCB1MzIgbGVuLAo+ICAgCQlzaXplID0gbm9kZS0+c2l6ZSAtIGFkZHIgKyBub2RlLT5zdGFydDsK
PiAgIAkJX2lvdi0+aW92X2xlbiA9IG1pbigodTY0KWxlbiAtIHMsIHNpemUpOwo+ICAgCQlfaW92
LT5pb3ZfYmFzZSA9ICh2b2lkIF9fdXNlciAqKSh1bnNpZ25lZCBsb25nKQo+IC0JCQkobm9kZS0+
dXNlcnNwYWNlX2FkZHIgKyBhZGRyIC0gbm9kZS0+c3RhcnQpOwo+ICsJCQkobm9kZS0+dXNlcnNw
YWNlX2FkZHIgKwo+ICsJCQkgYXJyYXlfaW5kZXhfbm9zcGVjKGFkZHIgLSBub2RlLT5zdGFydCwK
PiArCQkJCQkgICAgbm9kZS0+c2l6ZSkpOwo+ICAgCQlzICs9IHNpemU7Cj4gICAJCWFkZHIgKz0g
c2l6ZTsKPiAgIAkJKytyZXQ7CgoKSSd2ZSB0cmllZCB0aGlzIG9uIEthYnkgTGFrZSBzbWFwIG9m
ZiBtZXRhZGF0YSBhY2NlbGVyYXRpb24gb2ZmIHVzaW5nIAp0ZXN0cG1kICh2aXJ0aW8tdXNlcikg
KyB2aG9zdF9uZXQuIEkgZG9uJ3Qgc2VlIG9idmlvdXMgcGVyZm9ybWFuY2UgCmRpZmZlcmVuY2Ug
d2l0aCBUWCBQUFMuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
