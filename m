Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C3DE6CC6
	for <lists.virtualization@lfdr.de>; Mon, 28 Oct 2019 08:14:08 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 25E13B2F;
	Mon, 28 Oct 2019 07:14:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D8680ACD
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 07:14:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 469BE63D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 07:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572246839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=gF7SCUNNkREDqMPabWX15Cl/xUWOTTN3vml4/5CORAM=;
	b=IDbqdbrBFW6fPEdNNbt3S1V91E/yQ7jWhwRWw2lcCp/Gjxp8/R1Cwaz9/wsZ9N6Tg1ry0n
	uosGleQIzvLuhbUiOCUpcftsHj/AbzWJWWdeHRnPBnReUcI8+jKx6KhxG5UbKN3f94rMQ/
	mdRwyHTyiWzO4uYSjEEUi5AVizCetfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-43-tcVWAHiHOTGi6qxv19Hl2g-1; Mon, 28 Oct 2019 03:13:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED404800D41;
	Mon, 28 Oct 2019 07:13:54 +0000 (UTC)
Received: from [10.72.12.88] (ovpn-12-88.pek2.redhat.com [10.72.12.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84B035DA32;
	Mon, 28 Oct 2019 07:13:49 +0000 (UTC)
Subject: Re: [PATCH] virtio_ring: fix stalls for packed rings
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20191027100705.11644-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <efe3c06f-0a80-c266-c7fc-ac33901f51c7@redhat.com>
Date: Mon, 28 Oct 2019 15:13:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191027100705.11644-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: tcVWAHiHOTGi6qxv19Hl2g-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Marvin Liu <yong.liu@intel.com>, stable@vger.kernel.org,
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

Ck9uIDIwMTkvMTAvMjcg5LiL5Y2INjowOCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IEZy
b206IE1hcnZpbiBMaXUgPHlvbmcubGl1QGludGVsLmNvbT4KPgo+IFdoZW4gVklSVElPX0ZfUklO
R19FVkVOVF9JRFggaXMgbmVnb3RpYXRlZCwgdmlydGlvIGRldmljZXMgY2FuCj4gdXNlIHZpcnRx
dWV1ZV9lbmFibGVfY2JfZGVsYXllZF9wYWNrZWQgdG8gcmVkdWNlIHRoZSBudW1iZXIgb2YgZGV2
aWNlCj4gaW50ZXJydXB0cy4gIEF0IHRoZSBtb21lbnQsIHRoaXMgaXMgdGhlIGNhc2UgZm9yIHZp
cnRpby1uZXQgd2hlbiB0aGUKPiBuYXBpX3R4IG1vZHVsZSBwYXJhbWV0ZXIgaXMgc2V0IHRvIGZh
bHNlLgo+Cj4gSW4gdGhpcyBjYXNlLCB0aGUgdmlydGlvIGRyaXZlciBzZWxlY3RzIGFuIGV2ZW50
IG9mZnNldCBhbmQgZXhwZWN0cyB0aGF0Cj4gdGhlIGRldmljZSB3aWxsIHNlbmQgYSBub3RpZmlj
YXRpb24gd2hlbiByb2xsaW5nIG92ZXIgdGhlIGV2ZW50IG9mZnNldAo+IGluIHRoZSByaW5nLiAg
SG93ZXZlciwgaWYgdGhpcyByb2xsLW92ZXIgaGFwcGVucyBiZWZvcmUgdGhlIGV2ZW50Cj4gc3Vw
cHJlc3Npb24gc3RydWN0dXJlIHVwZGF0ZSwgdGhlIG5vdGlmaWNhdGlvbiB3b24ndCBiZSBzZW50
LiBUbyBhZGRyZXNzCj4gdGhpcyByYWNlIGNvbmRpdGlvbiB0aGUgZHJpdmVyIG5lZWRzIHRvIGNo
ZWNrIHdldGhlciB0aGUgZGV2aWNlIHJvbGxlZAo+IG92ZXIgdGhlIG9mZnNldCBhZnRlciB1cGRh
dGluZyB0aGUgZXZlbnQgc3VwcHJlc3Npb24gc3RydWN0dXJlLgo+Cj4gV2l0aCBWSVJUSU9fRl9S
SU5HX1BBQ0tFRCwgdGhlIHZpcnRpbyBkcml2ZXIgZGlkIHRoaXMgYnkgcmVhZGluZyB0aGUKPiBm
bGFncyBmaWVsZCBvZiB0aGUgZGVzY3JpcHRvciBhdCB0aGUgc3BlY2lmaWVkIG9mZnNldC4KPgo+
IFVuZm9ydHVuYXRlbHksIGNoZWNraW5nIGF0IHRoZSBldmVudCBvZmZzZXQgaXNuJ3QgcmVsaWFi
bGU6IGlmCj4gZGVzY3JpcHRvcnMgYXJlIGNoYWluZWQgKGUuZy4gd2hlbiBJTkRJUkVDVCBpcyBv
ZmYpIG5vdCBhbGwgZGVzY3JpcHRvcnMKPiBhcmUgb3ZlcndyaXR0ZW4gYnkgdGhlIGRldmljZSwg
c28gaXQncyBwb3NzaWJsZSB0aGF0IHRoZSBkZXZpY2Ugc2tpcHBlZAo+IHRoZSBzcGVjaWZpYyBk
ZXNjcmlwdG9yIGRyaXZlciBpcyBjaGVja2luZyB3aGVuIHdyaXRpbmcgb3V0IHVzZWQKPiBkZXNj
cmlwdG9ycy4gSWYgdGhpcyBoYXBwZW5zLCB0aGUgZHJpdmVyIHdvbid0IGRldGVjdCB0aGUgcmFj
ZSBjb25kaXRpb24KPiBhbmQgd2lsbCBpbmNvcnJlY3RseSBleHBlY3QgdGhlIGRldmljZSB0byBz
ZW5kIGEgbm90aWZpY2F0aW9uLgo+Cj4gRm9yIHZpcnRpby1uZXQsIHRoZSByZXN1bHQgd2lsbCBi
ZSBhIFRYIHF1ZXVlIHN0YWxsLCB3aXRoIHRoZQo+IHRyYW5zbWlzc2lvbiBnZXR0aW5nIGJsb2Nr
ZWQgZm9yZXZlci4KPgo+IFdpdGggdGhlIHBhY2tlZCByaW5nLCBpdCBpc24ndCBlYXN5IHRvIGZp
bmQgYSBsb2NhdGlvbiB3aGljaCBpcwo+IGd1YXJhbnRlZWQgdG8gY2hhbmdlIHVwb24gdGhlIHJv
bGwtb3ZlciwgZXhjZXB0IHRoZSBuZXh0IGRldmljZQo+IGRlc2NyaXB0b3IsIGFzIGRlc2NyaWJl
ZCBpbiB0aGUgc3BlYzoKPgo+ICAgICAgICAgIFdyaXRlcyBvZiBkZXZpY2UgYW5kIGRyaXZlciBk
ZXNjcmlwdG9ycyBjYW4gZ2VuZXJhbGx5IGJlCj4gICAgICAgICAgcmVvcmRlcmVkLCBidXQgZWFj
aCBzaWRlIChkcml2ZXIgYW5kIGRldmljZSkgYXJlIG9ubHkgcmVxdWlyZWQgdG8KPiAgICAgICAg
ICBwb2xsIChvciB0ZXN0KSBhIHNpbmdsZSBsb2NhdGlvbiBpbiBtZW1vcnk6IHRoZSBuZXh0IGRl
dmljZSBkZXNjcmlwdG9yIGFmdGVyCj4gICAgICAgICAgdGhlIG9uZSB0aGV5IHByb2Nlc3NlZCBw
cmV2aW91c2x5LCBpbiBjaXJjdWxhciBvcmRlci4KPgo+IHdoaWxlIHRoaXMgbWlnaHQgYmUgc3Vi
LW9wdGltYWwsIGxldCdzIGRvIGV4YWN0bHkgdGhpcyBmb3Igbm93Lgo+Cj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKRml4ZXM6IGY1MWY5ODI2ODJlMmEgKCJ2aXJ0aW9fcmluZzogbGV2ZXJh
Z2UgZXZlbnQgaWR4IGluIHBhY2tlZCByaW5nIikKPiBDYzogSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJ2aW4gTGl1IDx5b25nLmxpdUBpbnRlbC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4K
PiAtLS0KPgo+IFNvIHRoaXMgaXMgd2hhdCBJIGhhdmUgaW4gbXkgdHJlZSBub3cgLSB0aGlzIGlz
IGp1c3QgTWFydmluJ3MgcGF0Y2gKPiB3aXRoIGEgdHdlYWtlZCBkZXNjcmlwdGlvbi4KPgo+Cj4g
ICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIHwgNyArKystLS0tCj4gICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5j
Cj4gaW5kZXggYmRjMDgyNDRhNjQ4Li5hODA0MWU0NTFlOWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5n
LmMKPiBAQCAtMTQ5OSw5ICsxNDk5LDYgQEAgc3RhdGljIGJvb2wgdmlydHF1ZXVlX2VuYWJsZV9j
Yl9kZWxheWVkX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4gICAJCSAqIGNvdW50ZXIg
Zmlyc3QgYmVmb3JlIHVwZGF0aW5nIGV2ZW50IGZsYWdzLgo+ICAgCQkgKi8KPiAgIAkJdmlydGlv
X3dtYih2cS0+d2Vha19iYXJyaWVycyk7Cj4gLQl9IGVsc2Ugewo+IC0JCXVzZWRfaWR4ID0gdnEt
Pmxhc3RfdXNlZF9pZHg7Cj4gLQkJd3JhcF9jb3VudGVyID0gdnEtPnBhY2tlZC51c2VkX3dyYXBf
Y291bnRlcjsKPiAgIAl9Cj4gICAKPiAgIAlpZiAodnEtPnBhY2tlZC5ldmVudF9mbGFnc19zaGFk
b3cgPT0gVlJJTkdfUEFDS0VEX0VWRU5UX0ZMQUdfRElTQUJMRSkgewo+IEBAIC0xNTE4LDcgKzE1
MTUsOSBAQCBzdGF0aWMgYm9vbCB2aXJ0cXVldWVfZW5hYmxlX2NiX2RlbGF5ZWRfcGFja2VkKHN0
cnVjdCB2aXJ0cXVldWUgKl92cSkKPiAgIAkgKi8KPiAgIAl2aXJ0aW9fbWIodnEtPndlYWtfYmFy
cmllcnMpOwo+ICAgCj4gLQlpZiAoaXNfdXNlZF9kZXNjX3BhY2tlZCh2cSwgdXNlZF9pZHgsIHdy
YXBfY291bnRlcikpIHsKPiArCWlmIChpc191c2VkX2Rlc2NfcGFja2VkKHZxLAo+ICsJCQkJdnEt
Pmxhc3RfdXNlZF9pZHgsCj4gKwkJCQl2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyKSkgewo+
ICAgCQlFTkRfVVNFKHZxKTsKPiAgIAkJcmV0dXJuIGZhbHNlOwo+ICAgCX0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
