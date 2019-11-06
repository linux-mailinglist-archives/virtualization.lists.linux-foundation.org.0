Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F127F0D56
	for <lists.virtualization@lfdr.de>; Wed,  6 Nov 2019 04:50:17 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 42469CD5;
	Wed,  6 Nov 2019 03:50:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 59B81B2F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 03:50:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 40026189
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 03:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573012204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=a+TaoYnSx8JQIw9cwMdJxIlkL0BV7vW8cxJKGh2NCEs=;
	b=e65qZuJxgcbFboxoP5at4zSeZP4PMRk1oUze6w8Uj11npq6CVHNARIg4wphwYJLXBPwen9
	hb9ySMcBG3EWwHkS1MbUGB/h3ZYTOoTmcGYdcxGu5GH7STT8QRwHOnmtRRneVQvqpJDmmZ
	yzPJtYJ1ZDGM37c/FLTOwE5woCrHzFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-408-LCO48t2kOHqlYcbL8wcx_w-1; Tue, 05 Nov 2019 22:50:00 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFF47107ACC3;
	Wed,  6 Nov 2019 03:49:55 +0000 (UTC)
Received: from [10.72.12.193] (ovpn-12-193.pek2.redhat.com [10.72.12.193])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3371C600C4;
	Wed,  6 Nov 2019 03:48:33 +0000 (UTC)
Subject: Re: [PATCH V8 3/6] mdev: introduce device specific ops
To: Cornelia Huck <cohuck@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
	<20191105093240.5135-4-jasowang@redhat.com>
	<20191105175025.1a620844.cohuck@redhat.com>
	<20191105104418.1735d800@x1.home>
	<20191105192851.40548978.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <42afbc46-ac7d-b4d7-9b4a-343b1400d2a8@redhat.com>
Date: Wed, 6 Nov 2019 11:48:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191105192851.40548978.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: LCO48t2kOHqlYcbL8wcx_w-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	parav@mellanox.com, zhihong.wang@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvMTEvNiDkuIrljYgyOjI4LCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+IE9uIFR1ZSwg
NSBOb3YgMjAxOSAxMDo0NDoxOCAtMDcwMAo+IEFsZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFt
c29uQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4+IE9uIFR1ZSwgNSBOb3YgMjAxOSAxNzo1MDoyNSAr
MDEwMAo+PiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Cj4+PiBP
biBUdWUsICA1IE5vdiAyMDE5IDE3OjMyOjM3ICswODAwCj4+PiBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPiB3cm90ZToKPj4+ICAgIAo+Pj4+IEN1cnJlbnRseSwgZXhjZXB0IGZvciB0
aGUgY3JlYXRlIGFuZCByZW1vdmUsIHRoZSByZXN0IG9mCj4+Pj4gbWRldl9wYXJlbnRfb3BzIGlz
IGRlc2lnbmVkIGZvciB2ZmlvLW1kZXYgZHJpdmVyIG9ubHkgYW5kIG1heSBub3QgaGVscAo+Pj4+
IGZvciBrZXJuZWwgbWRldiBkcml2ZXIuIFdpdGggdGhlIGhlbHAgb2YgY2xhc3MgaWQsIHRoaXMg
cGF0Y2gKPj4+PiBpbnRyb2R1Y2VzIGRldmljZSBzcGVjaWZpYyBjYWxsYmFja3MgaW5zaWRlIG1k
ZXZfZGV2aWNlCj4+Pj4gc3RydWN0dXJlLiBUaGlzIGFsbG93cyBkaWZmZXJlbnQgc2V0IG9mIGNh
bGxiYWNrIHRvIGJlIHVzZWQgYnkKPj4+PiB2ZmlvLW1kZXYgYW5kIHZpcnRpby1tZGV2Lgo+Pj4+
Cj4+Pj4gUmV2aWV3ZWQtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZAbWVsbGFub3guY29tPgo+Pj4+
IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+Pj4gLS0t
Cj4+Pj4gICAuLi4vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QgICAgICAgfCAz
NSArKysrKysrKystLS0tCj4+Pj4gICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCj4+Pj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3Qu
YyAgICAgICAgICAgICAgfCAxOCArKysrLS0tCj4+Pj4gICBkcml2ZXJzL3MzOTAvY2lvL3ZmaW9f
Y2N3X29wcy5jICAgICAgICAgICAgICAgfCAxOCArKysrLS0tCj4+Pj4gICBkcml2ZXJzL3MzOTAv
Y3J5cHRvL3ZmaW9fYXBfb3BzLmMgICAgICAgICAgICAgfCAxNCArKystLQo+Pj4+ICAgZHJpdmVy
cy92ZmlvL21kZXYvbWRldl9jb3JlLmMgICAgICAgICAgICAgICAgIHwgMjQgKysrKysrKystCj4+
Pj4gICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCAgICAgICAgICAgICAgfCAgNSAr
Kwo+Pj4+ICAgZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgICAgICAgICAgICAgIHwg
MzcgKysrKysrLS0tLS0tLQo+Pj4+ICAgaW5jbHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgNDMgKysrKy0tLS0tLS0tLS0tCj4+Pj4gICBpbmNsdWRlL2xpbnV4L21k
ZXZfdmZpb19vcHMuaCAgICAgICAgICAgICAgICAgfCA1MiArKysrKysrKysrKysrKysrKysrCj4+
Pj4gICBzYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYyAgICAgICAgICAgICAgICAgICAgfCAyMCAr
KysrLS0tCj4+Pj4gICBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMgICAgICAgICAgICAgICAgICAg
ICAgfCAyMCArKysrLS0tCj4+Pj4gICBzYW1wbGVzL3ZmaW8tbWRldi9tdHR5LmMgICAgICAgICAg
ICAgICAgICAgICAgfCAxOCArKysrLS0tCj4+Pj4gICAxMyBmaWxlcyBjaGFuZ2VkLCAyMDYgaW5z
ZXJ0aW9ucygrKSwgOTkgZGVsZXRpb25zKC0pCj4+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9saW51eC9tZGV2X3ZmaW9fb3BzLmgKPj4+PiAgICAgIAo+Pj4gKC4uLikKPj4+ICAgIAo+
Pj4+IEBAIC0xNzIsMTAgKzE2MywzNCBAQCB0aGF0IGEgZHJpdmVyIHNob3VsZCB1c2UgdG8gdW5y
ZWdpc3RlciBpdHNlbGYgd2l0aCB0aGUgbWRldiBjb3JlIGRyaXZlcjo6Cj4+Pj4gICAKPj4+PiAg
IAlleHRlcm4gdm9pZCBtZGV2X3VucmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldik7
Cj4+Pj4gICAKPj4+PiAtSXQgaXMgYWxzbyByZXF1aXJlZCB0byBzcGVjaWZ5IHRoZSBjbGFzc19p
ZCBpbiBjcmVhdGUoKSBjYWxsYmFjayB0aHJvdWdoOjoKPj4+PiArQXMgbXVsdGlwbGUgdHlwZXMg
b2YgbWVkaWF0ZWQgZGV2aWNlcyBtYXkgYmUgc3VwcG9ydGVkLCBjbGFzcyBpZCBuZWVkcwo+Pj4+
ICt0byBiZSBzcGVjaWZpZWQgaW4gdGhlIGNyZWF0ZSBjYWxsYmFjaygpLiBUaGlzIGNvdWxkIGJl
IGRvbmUKPj4+IFRoZSBicmFja2V0cyBzaG91bGQgcHJvYmFibHkgZ28gYmVoaW5kICdjcmVhdGUn
Pwo+Pj4gICAgCj4+Pj4gK2V4cGxpY2l0bHkgZm9yIHRoZSBkZXZpY2UgdGhhdCBkb2VzIG5vdCB1
c2Ugb24gbWRldiBidXMgZm9yIGl0cwo+Pj4gImZvciBkZXZpY2VzIHRoYXQgZG8gbm90IHVzZSB0
aGUgbWRldiBidXMiID8KPj4+Cj4+PiBCdXQgd2h5IHdvdWxkbid0IHRoZXk/IEkgZmVlbCBsaWtl
IEkndmUgbWlzc2VkIHNvbWUgZGlzY3Vzc2lvbiBoZXJlIDovCj4+IFRoZSBkZXZpY2Ugb3BzIHBy
b3ZpZGUgYSByb3V0ZSB0aHJvdWdoIG1kZXYtY29yZSBmb3Iga25vd24gY2FsbGJhY2tzLAo+PiB3
aGljaCBpcyBwcmltYXJpbHkgdXNlZnVsIHdoZW4gd2UgaGF2ZSAxOk4gcmVsYXRpb24gYmV0d2Vl
biBtZGV2IGJ1cwo+PiBkcml2ZXIgYW5kIHZlbmRvciBkcml2ZXJzLiAgVGhlIG9idmlvdXMgZXhh
bXBsZSBoZXJlIGlzIHZmaW8tbWRldiwKPj4gd2hlcmUgd2UgaGF2ZSBHVlQtZywgdmZpby1hcCwg
dmZpby1jY3csIE5WSURJQSBHUklELCBhbmQgdmFyaW91cyBzYW1wbGUKPj4gZHJpdmVycyBhbGwg
YWR2ZXJ0aXNpbmcgdmZpby1tZGV2IHN1cHBvcnQgdmlhIHRoZWlyIGNsYXNzIGlkLiAgSG93ZXZl
ciwKPj4gaWYgd2UgaGF2ZSBhIHRpZ2h0bHkgY291cGxlZCB2ZW5kb3IgZHJpdmVyIGFuZCBtZGV2
IGJ1cyBkcml2ZXIsIGFzIHRoZQo+PiBtbHg1IHN1cHBvcnQgdGhhdCBQYXJhdiBpcyBkZXZlbG9w
aW5nLCB0aGUgY2xhaW0gaXMgdGhhdCB0aGV5IHByZWZlcgo+PiBub3QgdG8gZXhwb3NlIGFueSBk
ZXZpY2Ugb3BzIGFuZCBpbnRlbmQgdG8gaW50ZXJhY3QgZGlyZWN0bHkgd2l0aCB0aGUKPj4gbWRl
diBkZXZpY2UuICBBdCBsZWFzdCB0aGF0J3MgbXkgdW5kZXJzdGFuZGluZy4gIFRoYW5rcywKPj4K
Pj4gQWxleAo+IEFoLCBvay4KPgo+IFNvIG1heWJlIHVzZSB0aGUgcGhyYXNpbmcgImRldmljZXMg
dGhhdCBpbnRlcmFjdCB3aXRoIHRoZSBtZGV2IGRldmljZQo+IGRpcmVjdGx5IiB2cyAiZGV2aWNl
cyB0aGF0IHVzZSBkZXZpY2Utc3BlY2lmaWMgb3BzIiBpbnN0ZWFkPwo+Cj4gTm90IGEgc3Ryb25n
IGNyaXRpcXVlLCB0aG91Z2guCgoKV2lsbCB1c2Ugd2hhdCB5b3Ugc3VnZ2VzdCBoZXJlLgoKVGhh
bmtzCgoKPgo+Pj4+ICtvcGVyYXRpb24gdGhyb3VnaDoKPj4+PiAgIAo+Pj4+ICAgCWludCBtZGV2
X3NldF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZCk7Cj4+Pj4gICAKPj4+
PiArRm9yIHRoZSBkZXZpY2UgdGhhdCB1c2VzIG9uIHRoZSBtZGV2IGJ1cyBmb3IgaXRzIG9wZXJh
dGlvbiwgdGhlCj4+Pj4gY2xhc3MKPj4+ICJGb3IgZGV2aWNlcyB0aGF0IHVzZSB0aGUgbWRldiBi
dXMuLi4iCj4+Pgo+Pj4gQnV0IHNhbWUgY29tbWVudCBhcyBhYm92ZS4KPj4+ICAgIAo+Pj4+ICtz
aG91bGQgcHJvdmlkZSBoZWxwZXIgZnVuY3Rpb24gdG8gc2V0IGNsYXNzIGlkIGFuZCBkZXZpY2UK
Pj4+PiBzcGVjaWZpYyArb3BzLiBFLmcgZm9yIHZmaW8tbWRldiBkZXZpY2VzLCB0aGUgZnVuY3Rp
b24gdG8gYmUKPj4+PiBjYWxsZWQgaXM6OiArCj4+Pj4gKwlpbnQgbWRldl9zZXRfdmZpb19vcHMo
c3RydWN0IG1kZXZfZGV2aWNlICptZGV2LAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgbWRldl92ZmlvX2RldmljZV9vcHMKPj4+PiAqdmZpb19vcHMpOyAr
Cj4+Pj4gK1RoZSBjbGFzcyBpZCAoc2V0IGJ5IHRoaXMgZnVuY3Rpb24gdG8gTURFVl9DTEFTU19J
RF9WRklPKSBpcwo+Pj4+IHVzZWQgdG8gK21hdGNoIGEgZGV2aWNlIHdpdGggYW4gbWRldiBkcml2
ZXIgdmlhIGl0cyBpZCB0YWJsZS4gVGhlCj4+Pj4gZGV2aWNlICtzcGVjaWZpYyBjYWxsYmFja3Mg
KHNwZWNpZmllZCBpbiAqdmZpb19vcHMpIGFyZQo+Pj4+IG9idGFpbmFibGUgdmlhICttZGV2X2dl
dF92ZmlvX29wcygpIChmb3IgdXNlIGJ5IHRoZSBtZGV2IGJ1cwo+Pj4+IGRyaXZlcikuIEEgdmZp
by1tZGV2ICtkZXZpY2UgKGNsYXNzIGlkIE1ERVZfQ0xBU1NfSURfVkZJTykgdXNlcwo+Pj4+IHRo
ZSBmb2xsb3dpbmcgK2RldmljZS1zcGVjaWZpYyBvcHM6Cj4+Pj4gKwo+Pj4+ICsqIG9wZW46IG9w
ZW4gY2FsbGJhY2sgb2YgdmZpbyBtZWRpYXRlZCBkZXZpY2UKPj4+PiArKiBjbG9zZTogY2xvc2Ug
Y2FsbGJhY2sgb2YgdmZpbyBtZWRpYXRlZCBkZXZpY2UKPj4+PiArKiBpb2N0bDogaW9jdGwgY2Fs
bGJhY2sgb2YgdmZpbyBtZWRpYXRlZCBkZXZpY2UKPj4+PiArKiByZWFkIDogcmVhZCBlbXVsYXRp
b24gY2FsbGJhY2sKPj4+PiArKiB3cml0ZTogd3JpdGUgZW11bGF0aW9uIGNhbGxiYWNrCj4+Pj4g
KyogbW1hcDogbW1hcCBlbXVsYXRpb24gY2FsbGJhY2sKPj4+PiArCj4+Pj4gICBNZWRpYXRlZCBE
ZXZpY2UgTWFuYWdlbWVudCBJbnRlcmZhY2UgVGhyb3VnaCBzeXNmcwo+Pj4+ICAgPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4+IE90aGVyd2lzZSwg
bG9va3MgZ29vZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
