Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF3A2D75
	for <lists.virtualization@lfdr.de>; Fri, 30 Aug 2019 05:40:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DA5005AB2;
	Fri, 30 Aug 2019 03:40:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 76E9C552D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 03:38:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 179D313A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 03:38:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9BEAB307D88C;
	Fri, 30 Aug 2019 03:38:22 +0000 (UTC)
Received: from [10.72.12.92] (ovpn-12-92.pek2.redhat.com [10.72.12.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A065A5C1D6;
	Fri, 30 Aug 2019 03:38:17 +0000 (UTC)
Subject: Re: [PATCH 2/2] vhost/test: fix build for vhost test
To: Tiwei Bie <tiwei.bie@intel.com>, mst@redhat.com
References: <20190828053700.26022-1-tiwei.bie@intel.com>
	<20190828053700.26022-2-tiwei.bie@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f74bb96c-b439-7272-bb2f-d2a842dc41a2@redhat.com>
Date: Fri, 30 Aug 2019 11:38:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828053700.26022-2-tiwei.bie@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 30 Aug 2019 03:38:22 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOC8yOCDkuIvljYgxOjM3LCBUaXdlaSBCaWUgd3JvdGU6Cj4gU2luY2Ugdmhvc3Rf
ZXhjZWVkc193ZWlnaHQoKSB3YXMgaW50cm9kdWNlZCwgY2FsbGVycyBuZWVkIHRvIHNwZWNpZnkK
PiB0aGUgcGFja2V0IHdlaWdodCBhbmQgYnl0ZSB3ZWlnaHQgaW4gdmhvc3RfZGV2X2luaXQoKS4g
Tm90ZSB0aGF0LCB0aGUKPiBwYWNrZXQgd2VpZ2h0IGlzbid0IGNvdW50ZWQgaW4gdGhpcyBwYXRj
aCB0byBrZWVwIHRoZSBvcmlnaW5hbCBiZWhhdmlvcgo+IHVuY2hhbmdlZC4KPgo+IEZpeGVzOiBl
ODJiOWIwNzI3ZmYgKCJ2aG9zdDogaW50cm9kdWNlIHZob3N0X2V4Y2VlZHNfd2VpZ2h0KCkiKQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogVGl3ZWkgQmllIDx0
aXdlaS5iaWVAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3Zob3N0L3Rlc3QuYyB8IDEzICsr
KysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Rlc3QuYyBiL2RyaXZlcnMvdmhv
c3QvdGVzdC5jCj4gaW5kZXggYWM0Zjc2MmM0ZjY1Li43ODA0ODY5YzZhMzEgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy92aG9zdC90ZXN0LmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+IEBA
IC0yMiw2ICsyMiwxMiBAQAo+ICAgKiBVc2luZyB0aGlzIGxpbWl0IHByZXZlbnRzIG9uZSB2aXJ0
cXVldWUgZnJvbSBzdGFydmluZyBvdGhlcnMuICovCj4gICNkZWZpbmUgVkhPU1RfVEVTVF9XRUlH
SFQgMHg4MDAwMAo+ICAKPiArLyogTWF4IG51bWJlciBvZiBwYWNrZXRzIHRyYW5zZmVycmVkIGJl
Zm9yZSByZXF1ZXVlaW5nIHRoZSBqb2IuCj4gKyAqIFVzaW5nIHRoaXMgbGltaXQgcHJldmVudHMg
b25lIHZpcnRxdWV1ZSBmcm9tIHN0YXJ2aW5nIG90aGVycyB3aXRoCj4gKyAqIHBrdHMuCj4gKyAq
Lwo+ICsjZGVmaW5lIFZIT1NUX1RFU1RfUEtUX1dFSUdIVCAyNTYKPiArCj4gIGVudW0gewo+ICAJ
VkhPU1RfVEVTVF9WUSA9IDAsCj4gIAlWSE9TVF9URVNUX1ZRX01BWCA9IDEsCj4gQEAgLTgwLDEw
ICs4Niw4IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV92cShzdHJ1Y3Qgdmhvc3RfdGVzdCAqbikKPiAg
CQl9Cj4gIAkJdmhvc3RfYWRkX3VzZWRfYW5kX3NpZ25hbCgmbi0+ZGV2LCB2cSwgaGVhZCwgMCk7
Cj4gIAkJdG90YWxfbGVuICs9IGxlbjsKPiAtCQlpZiAodW5saWtlbHkodG90YWxfbGVuID49IFZI
T1NUX1RFU1RfV0VJR0hUKSkgewo+IC0JCQl2aG9zdF9wb2xsX3F1ZXVlKCZ2cS0+cG9sbCk7Cj4g
KwkJaWYgKHVubGlrZWx5KHZob3N0X2V4Y2VlZHNfd2VpZ2h0KHZxLCAwLCB0b3RhbF9sZW4pKSkK
PiAgCQkJYnJlYWs7Cj4gLQkJfQo+ICAJfQo+ICAKPiAgCW11dGV4X3VubG9jaygmdnEtPm11dGV4
KTsKPiBAQCAtMTE1LDcgKzExOSw4IEBAIHN0YXRpYyBpbnQgdmhvc3RfdGVzdF9vcGVuKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmKQo+ICAJZGV2ID0gJm4tPmRldjsKPiAgCXZx
c1tWSE9TVF9URVNUX1ZRXSA9ICZuLT52cXNbVkhPU1RfVEVTVF9WUV07Cj4gIAluLT52cXNbVkhP
U1RfVEVTVF9WUV0uaGFuZGxlX2tpY2sgPSBoYW5kbGVfdnFfa2ljazsKPiAtCXZob3N0X2Rldl9p
bml0KGRldiwgdnFzLCBWSE9TVF9URVNUX1ZRX01BWCwgVUlPX01BWElPVik7Cj4gKwl2aG9zdF9k
ZXZfaW5pdChkZXYsIHZxcywgVkhPU1RfVEVTVF9WUV9NQVgsIFVJT19NQVhJT1YsCj4gKwkJICAg
ICAgIFZIT1NUX1RFU1RfUEtUX1dFSUdIVCwgVkhPU1RfVEVTVF9XRUlHSFQpOwo+ICAKPiAgCWYt
PnByaXZhdGVfZGF0YSA9IG47Cj4gIAoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
