Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3388BDFC00
	for <lists.virtualization@lfdr.de>; Tue, 22 Oct 2019 04:45:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A2D59E93;
	Tue, 22 Oct 2019 02:45:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 894E3E8D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 02:45:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 19B8914D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 02:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571712307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=QnupSMudaGBW9gKYPKBmZZML/VAK0F92UDCJPohYAvU=;
	b=EGADcPP5J0/+KWtYyCUIiKyh2WJk6AuSGOQrD+D0wgP7VozKePyD7JM05HqqeGhUUUfDM+
	tybUw2g27LZ3a/Xp/hc19+izu8pR0n+kkqVtzfNmXyG1DdEbE7+HMmf4PNLXJNHoocfFYR
	6oDh7kSOvG3Wbsq+dzLV3XUSebBwIWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-332-Rtz4FGRNNkmClqv4ssaGxw-1; Mon, 21 Oct 2019 22:45:04 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CEFE1005500;
	Tue, 22 Oct 2019 02:45:03 +0000 (UTC)
Received: from [10.72.12.133] (ovpn-12-133.pek2.redhat.com [10.72.12.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AB0F60BF7;
	Tue, 22 Oct 2019 02:44:59 +0000 (UTC)
Subject: Re: [PATCH] virtio_ring: fix packed ring event may missing
To: Marvin Liu <yong.liu@intel.com>, mst@redhat.com, tiwei.bie@intel.com
References: <20191021171004.18729-1-yong.liu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <78d15397-984d-8679-383d-fb20dc63b449@redhat.com>
Date: Tue, 22 Oct 2019 10:44:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191021171004.18729-1-yong.liu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Rtz4FGRNNkmClqv4ssaGxw-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvMTAvMjIg5LiK5Y2IMToxMCwgTWFydmluIExpdSB3cm90ZToKPiBXaGVuIGNhbGxi
YWNrIGlzIGRlbGF5ZWQsIHZpcnRpbyBleHBlY3QgdGhhdCB2aG9zdCB3aWxsIGtpY2sgd2hlbgo+
IHJvbGxpbmcgb3ZlciBldmVudCBvZmZzZXQuIFJlY2hlY2sgc2hvdWxkIGJlIHRha2VuIGFzIHVz
ZWQgaW5kZXggbWF5Cj4gZXhjZWVkIGV2ZW50IG9mZnNldCBiZXR3ZWVuIHN0YXR1cyBjaGVjayBh
bmQgZHJpdmVyIGV2ZW50IHVwZGF0ZS4KPgo+IEhvd2V2ZXIsIGl0IGlzIHBvc3NpYmxlIHRoYXQg
ZmxhZ3Mgd2FzIG5vdCBtb2RpZmllZCBpZiBkZXNjcmlwdG9ycyBhcmUKPiBjaGFpbmVkIG9yIGlu
X29yZGVyIGZlYXR1cmUgd2FzIG5lZ290aWF0ZWQuIFNvIGZsYWdzIGF0IGV2ZW50IG9mZnNldAo+
IG1heSBub3QgYmUgdmFsaWQgZm9yIGRlc2NyaXB0b3IncyBzdGF0dXMgY2hlY2tpbmcuIEZpeCBp
dCBieSB1c2luZyBsYXN0Cj4gdXNlZCBpbmRleCBhcyByZXBsYWNlbWVudC4gVHggcXVldWUgd2ls
bCBiZSBzdG9wcGVkIGlmIHRoZXJlJ3Mgbm90Cj4gZW5vdWdoIGZyZWVkIGJ1ZmZlcnMgYWZ0ZXIg
cmVjaGVjay4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcnZpbiBMaXUgPHlvbmcubGl1QGludGVsLmNv
bT4KPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVy
cy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+IGluZGV4IGJkYzA4MjQ0YTY0OC4uYTgwNDFlNDUxZTll
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiArKysgYi9kcml2
ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gQEAgLTE0OTksOSArMTQ5OSw2IEBAIHN0YXRpYyBi
b29sIHZpcnRxdWV1ZV9lbmFibGVfY2JfZGVsYXllZF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAq
X3ZxKQo+ICAgCQkgKiBjb3VudGVyIGZpcnN0IGJlZm9yZSB1cGRhdGluZyBldmVudCBmbGFncy4K
PiAgIAkJICovCj4gICAJCXZpcnRpb193bWIodnEtPndlYWtfYmFycmllcnMpOwo+IC0JfSBlbHNl
IHsKPiAtCQl1c2VkX2lkeCA9IHZxLT5sYXN0X3VzZWRfaWR4Owo+IC0JCXdyYXBfY291bnRlciA9
IHZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXI7Cj4gICAJfQo+ICAgCj4gICAJaWYgKHZxLT5w
YWNrZWQuZXZlbnRfZmxhZ3Nfc2hhZG93ID09IFZSSU5HX1BBQ0tFRF9FVkVOVF9GTEFHX0RJU0FC
TEUpIHsKPiBAQCAtMTUxOCw3ICsxNTE1LDkgQEAgc3RhdGljIGJvb2wgdmlydHF1ZXVlX2VuYWJs
ZV9jYl9kZWxheWVkX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4gICAJICovCj4gICAJ
dmlydGlvX21iKHZxLT53ZWFrX2JhcnJpZXJzKTsKPiAgIAo+IC0JaWYgKGlzX3VzZWRfZGVzY19w
YWNrZWQodnEsIHVzZWRfaWR4LCB3cmFwX2NvdW50ZXIpKSB7Cj4gKwlpZiAoaXNfdXNlZF9kZXNj
X3BhY2tlZCh2cSwKPiArCQkJCXZxLT5sYXN0X3VzZWRfaWR4LAo+ICsJCQkJdnEtPnBhY2tlZC51
c2VkX3dyYXBfY291bnRlcikpIHsKPiAgIAkJRU5EX1VTRSh2cSk7Cj4gICAJCXJldHVybiBmYWxz
ZTsKPiAgIAl9CgoKSGkgTWFydmluOgoKVHdvIHF1ZXN0aW9uczoKCjEpIERvIHdlIHN1cHBvcnQg
SU5fT1JERVIgaW4ga2VybmVsIGRyaXZlcj8KCjIpIFNob3VsZCB3ZSBjaGVjayBJTl9PUkRFUiBp
biB0aGlzIGNhc2Ugb3RoZXJ3aXNlIHdlIG1heSBlbmQgdXAgd2l0aCAKaW50ZXJydXB0IHN0b3Jt
IHdoZW4gSU5fT1JERVIgaXMgbm90IG5lZ290aWF0ZWQ/CgpUaGFua3MKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
