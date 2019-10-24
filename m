Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C10E2921
	for <lists.virtualization@lfdr.de>; Thu, 24 Oct 2019 05:51:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BD394ACD;
	Thu, 24 Oct 2019 03:51:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1E0C59D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 03:51:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 663B0831
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 03:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571889064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=OAH1sKx/pn0aYGzTMENchUZ2YNiKLL9wnK/wjpGzSiw=;
	b=X//HU7Ahi4iZGyDqJ9RYGamp8SH2SYuKxRuCoE9eUjcLmeJqIAYyvTaFioFarUTHAwvHGu
	r1Xl2AeXVryt3/By4rKyU3QaPzJIYSDZQrTZAyaQsTJHK3he+rCpPxGs0dQ+xWAzt0N6LJ
	5vL/HXIv2K7Mfqm/AICOn4qEBzZ9PgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-356-oFlT1BVNPISvE4FdV2qr1A-1; Wed, 23 Oct 2019 23:51:00 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58631100551E;
	Thu, 24 Oct 2019 03:50:59 +0000 (UTC)
Received: from [10.72.12.199] (ovpn-12-199.pek2.redhat.com [10.72.12.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D91C10027AB;
	Thu, 24 Oct 2019 03:50:54 +0000 (UTC)
Subject: Re: [PATCH] virtio_ring: fix packed ring event may missing
To: "Liu, Yong" <yong.liu@intel.com>, "mst@redhat.com" <mst@redhat.com>,
	"Bie, Tiwei" <tiwei.bie@intel.com>
References: <20191021171004.18729-1-yong.liu@intel.com>
	<78d15397-984d-8679-383d-fb20dc63b449@redhat.com>
	<86228AFD5BCD8E4EBFD2B90117B5E81E633D74EF@SHSMSX103.ccr.corp.intel.com>
	<f8694d07-609b-5ba5-1960-65d763135e70@redhat.com>
	<86228AFD5BCD8E4EBFD2B90117B5E81E633DA298@SHSMSX103.ccr.corp.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b2d5ff11-9af5-40e2-e950-c4a5707676df@redhat.com>
Date: Thu, 24 Oct 2019 11:50:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <86228AFD5BCD8E4EBFD2B90117B5E81E633DA298@SHSMSX103.ccr.corp.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: oFlT1BVNPISvE4FdV2qr1A-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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

Ck9uIDIwMTkvMTAvMjQg5LiK5Y2IMTE6MjYsIExpdSwgWW9uZyB3cm90ZToKPgo+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYXNvbiBXYW5nIFttYWlsdG86amFzb3dhbmdA
cmVkaGF0LmNvbV0KPj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAyMiwgMjAxOSA5OjA2IFBNCj4+
IFRvOiBMaXUsIFlvbmcgPHlvbmcubGl1QGludGVsLmNvbT47IG1zdEByZWRoYXQuY29tOyBCaWUs
IFRpd2VpCj4+IDx0aXdlaS5iaWVAaW50ZWwuY29tPgo+PiBDYzogdmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKPj4gU3ViamVjdDogUmU6IFtQQVRDSF0gdmlydGlvX3Jp
bmc6IGZpeCBwYWNrZWQgcmluZyBldmVudCBtYXkgbWlzc2luZwo+Pgo+Pgo+PiBPbiAyMDE5LzEw
LzIyIOS4i+WNiDI6NDgsIExpdSwgWW9uZyB3cm90ZToKPj4+IEhpIEphc29uLAo+Pj4gTXkgYW5z
d2VycyBhcmUgaW5saW5lLgo+Pj4KPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4+
IEZyb206IEphc29uIFdhbmcgW21haWx0bzpqYXNvd2FuZ0ByZWRoYXQuY29tXQo+Pj4+IFNlbnQ6
IFR1ZXNkYXksIE9jdG9iZXIgMjIsIDIwMTkgMTA6NDUgQU0KPj4+PiBUbzogTGl1LCBZb25nIDx5
b25nLmxpdUBpbnRlbC5jb20+OyBtc3RAcmVkaGF0LmNvbTsgQmllLCBUaXdlaQo+Pj4+IDx0aXdl
aS5iaWVAaW50ZWwuY29tPgo+Pj4+IENjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwo+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHZpcnRpb19yaW5nOiBmaXggcGFj
a2VkIHJpbmcgZXZlbnQgbWF5IG1pc3NpbmcKPj4+Pgo+Pj4+Cj4+Pj4gT24gMjAxOS8xMC8yMiDk
uIrljYgxOjEwLCBNYXJ2aW4gTGl1IHdyb3RlOgo+Pj4+PiBXaGVuIGNhbGxiYWNrIGlzIGRlbGF5
ZWQsIHZpcnRpbyBleHBlY3QgdGhhdCB2aG9zdCB3aWxsIGtpY2sgd2hlbgo+Pj4+PiByb2xsaW5n
IG92ZXIgZXZlbnQgb2Zmc2V0LiBSZWNoZWNrIHNob3VsZCBiZSB0YWtlbiBhcyB1c2VkIGluZGV4
IG1heQo+Pj4+PiBleGNlZWQgZXZlbnQgb2Zmc2V0IGJldHdlZW4gc3RhdHVzIGNoZWNrIGFuZCBk
cml2ZXIgZXZlbnQgdXBkYXRlLgo+Pj4+Pgo+Pj4+PiBIb3dldmVyLCBpdCBpcyBwb3NzaWJsZSB0
aGF0IGZsYWdzIHdhcyBub3QgbW9kaWZpZWQgaWYgZGVzY3JpcHRvcnMgYXJlCj4+Pj4+IGNoYWlu
ZWQgb3IgaW5fb3JkZXIgZmVhdHVyZSB3YXMgbmVnb3RpYXRlZC4gU28gZmxhZ3MgYXQgZXZlbnQg
b2Zmc2V0Cj4+Pj4+IG1heSBub3QgYmUgdmFsaWQgZm9yIGRlc2NyaXB0b3IncyBzdGF0dXMgY2hl
Y2tpbmcuIEZpeCBpdCBieSB1c2luZyBsYXN0Cj4+Pj4+IHVzZWQgaW5kZXggYXMgcmVwbGFjZW1l
bnQuIFR4IHF1ZXVlIHdpbGwgYmUgc3RvcHBlZCBpZiB0aGVyZSdzIG5vdAo+Pj4+PiBlbm91Z2gg
ZnJlZWQgYnVmZmVycyBhZnRlciByZWNoZWNrLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBN
YXJ2aW4gTGl1IDx5b25nLmxpdUBpbnRlbC5jb20+Cj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4+IGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3Jp
bmcuYwo+Pj4+PiBpbmRleCBiZGMwODI0NGE2NDguLmE4MDQxZTQ1MWU5ZSAxMDA2NDQKPj4+Pj4g
LS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+Pj4+PiArKysgYi9kcml2ZXJzL3Zp
cnRpby92aXJ0aW9fcmluZy5jCj4+Pj4+IEBAIC0xNDk5LDkgKzE0OTksNiBAQCBzdGF0aWMgYm9v
bAo+Pj4+IHZpcnRxdWV1ZV9lbmFibGVfY2JfZGVsYXllZF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1
ZSAqX3ZxKQo+Pj4+PiAgICAgCQkgKiBjb3VudGVyIGZpcnN0IGJlZm9yZSB1cGRhdGluZyBldmVu
dCBmbGFncy4KPj4+Pj4gICAgIAkJICovCj4+Pj4+ICAgICAJCXZpcnRpb193bWIodnEtPndlYWtf
YmFycmllcnMpOwo+Pj4+PiAtCX0gZWxzZSB7Cj4+Pj4+IC0JCXVzZWRfaWR4ID0gdnEtPmxhc3Rf
dXNlZF9pZHg7Cj4+Pj4+IC0JCXdyYXBfY291bnRlciA9IHZxLT5wYWNrZWQudXNlZF93cmFwX2Nv
dW50ZXI7Cj4+Pj4+ICAgICAJfQo+Pj4+Pgo+Pj4+PiAgICAgCWlmICh2cS0+cGFja2VkLmV2ZW50
X2ZsYWdzX3NoYWRvdyA9PQo+PiBWUklOR19QQUNLRURfRVZFTlRfRkxBR19ESVNBQkxFKQo+Pj4+
IHsKPj4+Pj4gQEAgLTE1MTgsNyArMTUxNSw5IEBAIHN0YXRpYyBib29sCj4+Pj4gdmlydHF1ZXVl
X2VuYWJsZV9jYl9kZWxheWVkX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4+Pj4+ICAg
ICAJICovCj4+Pj4+ICAgICAJdmlydGlvX21iKHZxLT53ZWFrX2JhcnJpZXJzKTsKPj4+Pj4KPj4+
Pj4gLQlpZiAoaXNfdXNlZF9kZXNjX3BhY2tlZCh2cSwgdXNlZF9pZHgsIHdyYXBfY291bnRlcikp
IHsKPj4+Pj4gKwlpZiAoaXNfdXNlZF9kZXNjX3BhY2tlZCh2cSwKPj4+Pj4gKwkJCQl2cS0+bGFz
dF91c2VkX2lkeCwKPj4+Pj4gKwkJCQl2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyKSkgewo+
Pj4+PiAgICAgCQlFTkRfVVNFKHZxKTsKPj4+Pj4gICAgIAkJcmV0dXJuIGZhbHNlOwo+Pj4+PiAg
ICAgCX0KPj4+PiBIaSBNYXJ2aW46Cj4+Pj4KPj4+PiBUd28gcXVlc3Rpb25zOgo+Pj4+Cj4+Pj4g
MSkgRG8gd2Ugc3VwcG9ydCBJTl9PUkRFUiBpbiBrZXJuZWwgZHJpdmVyPwo+Pj4+Cj4+PiBOb3Qg
c3VwcG9ydCBieSBub3cuIEJ1dCBpc3N1ZSBzdGlsbCBjYW4gYmUgcG9zc2libGUgaWYgaW5fZGly
ZWN0IGRpc2FibGVkCj4+IGFuZCBtZWFud2hpbGUgZGVzY3MgYXJlIGNoYWluZWQuCj4+PiBEdWUg
dG8gcGFja2VkIHJpbmcgZGVzYyBzdGF0dXMgc2hvdWxkIGNoZWNrIG9uZSBieSBvbmUsIGNob3Nl
IGFyYml0cmFyeQo+PiBwb3NpdGlvbiBtYXkgY2F1c2UgaXNzdWUuCj4+Cj4+Cj4+IFJpZ2h0LCB0
aGVuIGl0J3MgYmV0dGVyIHRvIG1lbnRpb24gSU5fT1JERVIgYXMgZnV0dXJlIGZlYXR1cmVzLgo+
Pgo+Pgo+Pj4+IDIpIFNob3VsZCB3ZSBjaGVjayBJTl9PUkRFUiBpbiB0aGlzIGNhc2Ugb3RoZXJ3
aXNlIHdlIG1heSBlbmQgdXAgd2l0aAo+Pj4+IGludGVycnVwdCBzdG9ybSB3aGVuIElOX09SREVS
IGlzIG5vdCBuZWdvdGlhdGVkPwo+Pj4gSW50ZXJydXB0IG51bWJlciB3aWxsIG5vdCBpbmNyZWFz
ZSBoZXJlLCBldmVudCBvZmZzZXQgdmFsdWUgY2FsY3VsYXRlZCBhcwo+PiBiZWZvcmUuCj4+PiBI
ZXJlIGp1c3QgcmVjaGVjayB3aGV0aGVyIG5ldyB1c2VkIGRlc2NzIGlzIGVub3VnaCBmb3IgbmV4
dCBhcm91bmQgeG1pdC4KPj4+IElmIGJhY2tlbmQgd2FzIHNsb3csIG1vc3QgbGlrZWx5IFR4IHF1
ZXVlIHdpbGwgc2xlZXAgZm9yIGEgd2hpbGUgdW50aWwKPj4gdXNlZCBpbmRleCBnbyBvdmVyIGV2
ZW50IG9mZnNldC4KPj4KPj4KPj4gT2ssIGJ1dCB3aGF0IGlmIHRoZSBiYWNrZW5kIGlzIGFsbW9z
dCBhcyBmYXN0IGFzIGd1ZXN0IGRyaXZlcj8gRS5nIGluCj4+IHZpcnRpby1uZXQgd2UgaGFkOgo+
Pgo+PiAgIMKgwqDCoCBpZiAoc3EtPnZxLT5udW1fZnJlZSA8IDIrTUFYX1NLQl9GUkFHUykgewo+
PiAgIMKgwqDCoCDCoMKgwqAgbmV0aWZfc3RvcF9zdWJxdWV1ZShkZXYsIHFudW0pOwo+PiAgIMKg
wqDCoCDCoMKgwqAgaWYgKCF1c2VfbmFwaSAmJgo+PiAgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIHVu
bGlrZWx5KCF2aXJ0cXVldWVfZW5hYmxlX2NiX2RlbGF5ZWQoc3EtPnZxKSkpIHsKPj4gICDCoMKg
wqAgwqDCoMKgIMKgwqDCoCAvKiBNb3JlIGp1c3QgZ290IHVzZWQsIGZyZWUgdGhlbSB0aGVuIHJl
Y2hlY2suICovCj4+ICAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgZnJlZV9vbGRfeG1pdF9za2JzKHNx
LCBmYWxzZSk7Cj4+ICAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgaWYgKHNxLT52cS0+bnVtX2ZyZWUg
Pj0gMitNQVhfU0tCX0ZSQUdTKSB7Cj4+ICAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIG5l
dGlmX3N0YXJ0X3N1YnF1ZXVlKGRldiwgcW51bSk7Cj4+ICAgwqDCoMKgIMKgwqDCoCDCoMKgwqAg
wqDCoMKgIHZpcnRxdWV1ZV9kaXNhYmxlX2NiKHNxLT52cSk7Cj4+ICAgwqDCoMKgIMKgwqDCoCDC
oMKgwqAgfQo+PiAgIMKgwqDCoCDCoMKgwqAgfQo+PiAgIMKgwqDCoCB9Cj4+Cj4+IEkgd29ycnkg
dGhhdCB3ZSBtYXkgZW5kIHVwIHdpdGggdG9nZ2xpbmcgcXVldWUgc3RhdGUgaW4gdGhlIGNhc2UK
Pj4gKHNxLT52cS0+bnVtX2ZyZWUgaXMgbmVhciAyICsgTUFYX1NLQl9GUkFHUykuCj4+Cj4gWWVz
LCBhdCB0aGlzIHdvcnN0IGNhc2UgZWFjaCBwYWNrZXQgd2lsbCBhZGQgZXh0cmEgdHdpY2UgZXZl
bnQgZmxhZ3Mgd3JpdGUuIER1ZSB0byBiYWNrZW5kIG9ubHkgcmVhZCB0aGlzIHZhbHVlLCB0aGUg
Y29zdCB3b24ndCB0b28gbXVjaC4KCgpGb3IgZHJpdmVyLCBpdCBtZWFucyBleHRyYSBvdmVyaGVh
ZHMsIGF0b21pY3MsIGxlc3MgYmF0Y2hpbmcsIHN0YXRzIAp1cGRhdGluZyBldGMuIEZvciBiYWNr
ZW5kLCBjYWNoZWxpbmUgd2lsbCBib3VuY2UgYmV0d2VlbiB0d28gY3B1cy4KCgo+IEV2ZW4gd2Ug
Y2FuIHRyYWNrIGRvd24gY2hhaW5lZCBkZXNjcyBhbmQgZmlndXJlIG91dCB3aGV0aGVyIGV2ZW50
IG9mZnNldCBpbmRleGVkIGRlc2MgaXMgdXNlZC4gVGhlcmUncyBzdGlsbCBwb3NzaWJpbGl0eSB0
aGF0IGZsYWdzIGlzIGludmFsaWQuCj4gT25lIGNhc2UgaXMgdGhhdCBiYWNrZW5kIGNhbiBidWZm
ZXIgbXVsdGlwbGUgZGVzY3MgYnkgbm90IHVwZGF0aW5nIHRoZSBmaXJzdCBvbmUuIFdlIGNhbm5v
dCBndWFyYW50ZWUgdGhhdCBsYXRlciBmbGFncyBpcyB1c2FibGUgdW50aWwgY2hlY2sgZnJvbSB0
aGUgZmlyc3Qgb25lLgoKCkluIHRoaXMgY2FzZSwgc2luY2Ugd2UndmUgc3RvcHBlZCB0eCBxdWV1
ZSwgc28gdGhlcmUncyBubyBuZXcgYnVmZmVycyAKYWRkZWQuIEl0IGRvZXNuJ3QgbWF0dGVyIHdl
IGdldCBub3RpZmllZCB3aGVuIHRoZSAzLzQgb3IgYWxsIG9mIHRoZSAKZGVzY3JpcHRvcnMgaGFz
IGJlZW4gdXNlZC4KClRoYW5rcwoKCj4KPiBSZWdhcmRzLAo+IE1hcnZpbgo+Cj4+IEl0IGxvb2tz
IHRvIG1lIHRoZSBjb3JyZWN0IHRoaW5nIHRvIGltcGxlbWVudCBpcyB0byBjYWxjdWxhdGUgdGhl
IGhlYWQKPj4gZGVzY3JpcHRvciBvZiBhIGNoYWluIHRoYXQgc2l0cyBhdCAzLzQuCj4+Cj4+IFRo
YW5rcwo+Pgo+Pgo+Pj4gVGhhbmtzLAo+Pj4gTWFydmluCj4+Pgo+Pj4+IFRoYW5rcwo+Pj4+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
